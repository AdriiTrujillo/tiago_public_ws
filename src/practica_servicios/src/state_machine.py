#!/usr/bin/env python
# -*- coding: utf-8 -*-
import rospy
import smach
import smach_ros
import numpy as np
import actionlib
import sys
import math
from geometry_msgs.msg import Pose
from geometry_msgs.msg import Twist
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from gazebo_ros_link_attacher.srv import Attach, AttachRequest, AttachResponse
from play_motion_msgs.msg import PlayMotionAction, PlayMotionGoal
from practica_servicios.srv import position
from practica_servicios.srv import geograsp, geograspRequest, geograspResponse
from std_srvs.srv import Empty
from sensor_msgs.msg import JointState

# https://stackoverflow.com/questions/53033620/how-to-convert-euler-angles-to-quaternions-and-get-the-same-euler-angles-back-fr
def euler_to_quaternion(roll, pitch, yaw):

        qx = np.sin(roll/2) * np.cos(pitch/2) * np.cos(yaw/2) - np.cos(roll/2) * np.sin(pitch/2) * np.sin(yaw/2)
        qy = np.cos(roll/2) * np.sin(pitch/2) * np.cos(yaw/2) + np.sin(roll/2) * np.cos(pitch/2) * np.sin(yaw/2)
        qz = np.cos(roll/2) * np.cos(pitch/2) * np.sin(yaw/2) - np.sin(roll/2) * np.sin(pitch/2) * np.cos(yaw/2)
        qw = np.cos(roll/2) * np.cos(pitch/2) * np.cos(yaw/2) + np.sin(roll/2) * np.sin(pitch/2) * np.sin(yaw/2)

        return [qx, qy, qz, qw]

# Leer un caracter del terminal sin tener que presionar enter
# https://stackoverflow.com/questions/510357/how-to-read-a-single-character-from-the-user
class _Getch:
    """Gets a single character from standard input.  Does not echo to the
screen."""
    def __init__(self):
        try:
            self.impl = _GetchWindows()
        except ImportError:
            self.impl = _GetchUnix()

    def __call__(self): return self.impl()


class _GetchUnix:
    def __init__(self):
        import tty, sys

    def __call__(self):
        import sys, tty, termios
        fd = sys.stdin.fileno()
        old_settings = termios.tcgetattr(fd)
        try:
            tty.setraw(sys.stdin.fileno())
            ch = sys.stdin.read(1)
        finally:
            termios.tcsetattr(fd, termios.TCSADRAIN, old_settings)
        return ch


class _GetchWindows:
    def __init__(self):
        import msvcrt

    def __call__(self):
        import msvcrt
        return msvcrt.getch()

# Guarda la mesa actual
mesa_actual = 0
# Posiciones a las que el robot tiene que ir para cada mesa
posiciones_mesas = \
[ \
        [-0.08, -10.5,  math.pi], \
        [ 0.19, -14.6,  math.pi], \
        [ 0.18, -10.45, 0.0], \
        [ 0.47, -14.52, 0.0] \
]

def attach_lata():
        attach_srv = rospy.ServiceProxy('/link_attacher_node/attach', Attach)
        attach_srv.wait_for_service()

        rospy.loginfo("Attaching hand and beer")
        req = AttachRequest()
        req.model_name_1 = "tiago"
        req.link_name_1 = "arm_7_link"
        req.model_name_2 = "beer"
        req.link_name_2 = "link"

        attach_srv.call(req)

# Elimina el octomap existente
def clear_octomap():
        clear_octo = rospy.ServiceProxy("/clear_octomap", Empty)
        clear_octo.wait_for_service()
        clear_octo.call()

def detach_lata():
        attach_srv = rospy.ServiceProxy('/link_attacher_node/detach', Attach)
        attach_srv.wait_for_service()

        rospy.loginfo("Detaching hand and beer")
        req = AttachRequest()
        req.model_name_1 = "tiago"
        req.link_name_1 = "arm_7_link"
        req.model_name_2 = "beer"
        req.link_name_2 = "link"

        attach_srv.call(req)

def prepare_octomap():

        rospy.loginfo("Preparing Octomap ...")
        client = actionlib.SimpleActionClient("play_motion", PlayMotionAction)
        client.wait_for_server()


        rospy.wait_for_message("joint_states", JointState)
        rospy.sleep(1.0)

        rospy.loginfo("Looking arround ...")
        goal = PlayMotionGoal()
        goal.motion_name = 'head_look_around'
        goal.skip_planning = False

        client.send_goal(goal)
        client.wait_for_result(rospy.Duration(10.0))
        rospy.loginfo("Creating Octomap ...")
        rospy.sleep(5.5) # en la simulación es como un 1 min o así
        rospy.loginfo("Octomap created")

rospy.init_node('tiago_waiter_state_machine')

class MoveArmClient:
    def __init__(self):
        self.client =  rospy.ServiceProxy('move_arm', position)
        # Esperamos hasta que el servicio 'move_arm' esté activo`

    def moveTo(self, x, y, z, roll, pitch, yaw, frame):

        success = self.client(x, y, z, roll, pitch, yaw, frame)

        if success:
            rospy.loginfo("Executed correctly")
        else:
            rospy.loginfo("Not executed")

        return success


# Cliente para mover el brazo del robot Tiago
arm_client = MoveArmClient()

# Uso de la acción move_base en ROS para moverse a un punto determinado
# En ROS una acción es como una petición de un "cliente" a un "servidor"
# En este caso este código es el cliente y el servidor es ROS
# (en concreto el nodo de ROS 'move_base')
class MoveBaseClient:
    def __init__(self):
        self.client =  actionlib.SimpleActionClient('move_base',MoveBaseAction)
        # Esperamos hasta que el nodo 'move_base' esté activo`
        self.client.wait_for_server()

    def moveTo(self, x, y, theta):
        # Un MoveBaseGoal es un punto objetivo al que nos queremos mover
        goal = MoveBaseGoal()
        # Sistema de referencia que estamos usando
        goal.target_pose.header.frame_id = "map"
        goal.target_pose.pose.position.x = x   
        goal.target_pose.pose.position.y = y
        # La orientación es un quaternion. Tenemos que fijar alguno de sus componentes
        rot = euler_to_quaternion(0.0, 0.0, theta)
        goal.target_pose.pose.orientation.z = rot[2]
        goal.target_pose.pose.orientation.w = rot[3]

        # Enviamos el goal 
        self.client.send_goal(goal)
        # Esperamos que el robot llegue al punto
        result = self.client.wait_for_result()
        if not result:
            rospy.logerr("No se ha podido ejecutar la acción!!")
        else:
            return self.client.get_result()


# Cliente para mover al robot Tiago por el mapa
mb_client = MoveBaseClient()

class IrALata(smach.State):
    """Estado que lleva el robot Tiago desde donde esté en el mapa a la
    lata de cerveza que está en la encimera."""
    def __init__(self):
        smach.State.__init__(self, outcomes=['fallo_ir_a_lata','lata_enfrente'])
        self.counter = 0

    def execute(self, userdata):
        rospy.loginfo('Yendo a por la lata...')
        ok = mb_client.moveTo(0.69, 0.50, math.pi/2+math.pi/4)
        if not ok:
            return 'fallo_ir_a_lata'
        else:
            return 'lata_enfrente'

class CogerLata(smach.State):
    """Se tiene la lata en la encimera de enfrente, y con MoveIt se genera
    una trayectoria para cogerlo, teniendo en cuenta los obstáculos"""

    def __init__(self):
        smach.State.__init__(self, outcomes=['fallo_coger_lata', 'lata_cogida'])
        self.geograsp_service = rospy.ServiceProxy('cloud_processor/geograsp_service', geograsp)
        self.pub = rospy.Publisher('/mobile_base_controller/cmd_vel', Twist, queue_size=10)

    def execute(self, userdata):
        rospy.sleep(1.0)
        rospy.loginfo('Intentando coger la lata...')
        fallo = False
        try:
                print('Calculando el grasping óptimo')
                self.geograsp_service.wait_for_service()
                req = geograspRequest()
                pose = self.geograsp_service.call(req)
                
        except rospy.ServiceException as e:
                fallo = True
                print('El servicio de geograsp ha fallado')
                        
        #diferencia entre el sistema de refencia de la herramienta y el TCP = 0.12963
        prepare_octomap()
        try:
                arm_client.moveTo(pose.p.position.x, pose.p.position.y, 0.24, \
                                0.0, -1.57, 0.00, \
                                "xtion_rgb_optical_frame")
        except rospy.ServiceException as e:
                rospy.loginfo('No se ha podido planificar la trayectoria al punto dado por geograsp, se va a ir a un punto por defecto en su lugar')
                success = arm_client.moveTo(-0.03, 0.03, 0.25, 0.0, -1.57, 0.0, "xtion_rgb_optical_frame")
                if not success:
                        fallo = True

        if not fallo:
                # Acercarse a la lata
                twist = Twist()
                twist.linear.x = 0.28
                self.pub.publish(twist)
                rospy.sleep(0.2)
                self.pub.publish(twist)
                rospy.sleep(0.2)
                self.pub.publish(twist)

                rospy.sleep(2)
                attach_lata()

                # Alejarse de la lata
                ok = mb_client.moveTo(0.69, 0.50, -math.pi/2)

                rospy.sleep(1)

                return 'lata_cogida'
        else:
            return 'fallo_coger_lata'

class IrAMesa(smach.State):
    """Una vez cogida la lata, se lleva al robot a una mesa la cual se
    conoce su posición
    """

    def __init__(self):
        smach.State.__init__(self, outcomes=['fallo_ir_a_mesa', 'en_mesa'])

    def execute(self, userdata):
        rospy.loginfo('Yendo a la mesa para servir...')
        #Quitamos la lata de la vista del tiago
        arm_client.moveTo(0.30, -0.35, 0.45, 1.57, 0.00, 0.037, "base_footprint")
        rospy.sleep(1.0)
        # arm_client.moveTo(0.65, -0.15, 1.25, 1.57, 0.00, 0.037) #Punto random por ahora

        # TODO falta lo de carlos. Lleva el robot a la mesa, a una distancia suficiente para que se vea el aruco
        # ok = mb_client.moveTo(0.57, -14.6, math.pi)
        # if not ok:
            # return 'fallo_ir_a_mesa'
        # else:
            # TODO leer aruco y tal
            
        # Acercar el robot a la mesa
        ok = mb_client.moveTo(posiciones_mesas[mesa_actual][0], \
                              posiciones_mesas[mesa_actual][1], \
                              posiciones_mesas[mesa_actual][2])
        if not ok:
                return 'fallo_ir_a_mesa'
        else:
                return 'en_mesa'


class DejarLata(smach.State):
    """Se deja la lata en la mesa de los clientes"""
    def __init__(self):
        smach.State.__init__(self, outcomes=['fallo_dejar_lata', 'lata_dejada'])

    def execute(self, userdata):
        rospy.loginfo('Sirviendo la cerveza...')

        # Elimina el octomap anterior
        clear_octomap()
        # Crea el nuevo octomap
        prepare_octomap()
        # rospy.sleep(1.0)
        arm_client.moveTo(0.30, -0.60, 0.90, 1.57, 0.00, 0.00, "base_footprint")
        arm_client.moveTo(0.81, -0.3, 1.20, 1.57, 0.00, 0.0, "base_footprint") #Punto random
        arm_client.moveTo(0.81, -0.3, 1.20, -1.57, 0.00, 0.0, "base_footprint")
        detach_lata()

        if True:
            # return 'fallo_dejar_lata'
            return 'lata_dejada'
        else:
            return 'lata_dejada'

class VolverACasa(smach.State):
    """El robot vuelve a su posición inicial predefinida"""
    def __init__(self):
        smach.State.__init__(self, outcomes=['fallo_volver_a_casa', 'en_casa'])

    def execute(self, userdata):
        #Quitamos el propio brazo de la vista del tiago
        arm_client.moveTo(0.30, -0.40, 0.50, 1.57, 0.00, 0.037, "base_footprint")
        rospy.sleep(1.0)
        rospy.loginfo('Volviendo a casa...')
        ok = mb_client.moveTo(0.0, 0.0, math.pi/2)
        if not ok:
            return 'fallo_volver_a_casa'
        else:
            return 'en_casa'

class InteraccionHumanoMaquina(smach.State):
        """El humano elige a que mesa llevar la siguiente lata de cerveza"""
        def __init__(self):
                smach.State.__init__(self, outcomes=['mesa_elegida', 'salir_del_programa'])

        def execute(self, userdata):
                # Mostramos el menú de posibles acciones
                print(chr(27) + "[2J")                    # Limpia la terminal
                print("-------- TIAGO WAITER ---------")
                print("Acciones:")
                print(" [1]: Ir a la mesa 1")
                print(" [2]: Ir a la mesa 2")
                print(" [3]: Ir a la mesa 3")
                print(" [4]: Ir a la mesa 4")
                print(" [q]: Salir de la aplicación")
                getch = _Getch()

                # Esperar a la entrada del usuario
                while True:
                        char = getch()
                        if char in ['1', '2', '3', '4']:
                                mesa_actual = int(char)-1    # Tiene que estar entre 0 y 3
                                return 'mesa_elegida'
                        elif char == 'q':
                                return 'salir_del_programa'

def main():

    # Se crea la máquina de estados SMACH
    sm = smach.StateMachine(outcomes=['FALLO', 'OK'])

    with sm:
        # Se añaden los estados a la máquina de estados, así como sus relaciones
        smach.StateMachine.add('HMI', InteraccionHumanoMaquina(),
                               transitions={'mesa_elegida':'IrALata',
                                            'salir_del_programa':'OK'})
        smach.StateMachine.add('IrALata', IrALata(), 
                               transitions={'fallo_ir_a_lata':'FALLO', 
                                            'lata_enfrente':'CogerLata'})
        smach.StateMachine.add('CogerLata', CogerLata(), 
                               transitions={'fallo_coger_lata':'FALLO',
                                            'lata_cogida':'IrAMesa'})
        smach.StateMachine.add('IrAMesa', IrAMesa(),
                               transitions={'fallo_ir_a_mesa':'FALLO',
                                            'en_mesa':'DejarLata'})
        smach.StateMachine.add('DejarLata', DejarLata(),
                               transitions={'fallo_dejar_lata':'FALLO',
                                            'lata_dejada':'VolverACasa'})
        smach.StateMachine.add('VolverACasa', VolverACasa(),
                               transitions={'fallo_volver_a_casa':'FALLO',
                                            'en_casa':'HMI'})

    # Se crea el servidor para visualizar la máquina de estados
    sis = smach_ros.IntrospectionServer('server_name', sm, '/SM_ROOT')
    sis.start()

    # Se ejecuta el plan SMACH
    outcome = sm.execute()

    rospy.spin()
    sis.stop()

if __name__ == '__main__':
    main()
