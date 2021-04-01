#!/usr/bin/env python
# -*- coding: utf-8 -*-

import rospy
from practica_servicios.srv import position, positionRequest

if __name__ == "__main__":

    rospy.init_node("move_arm_client")

    client =  rospy.ServiceProxy('move_arm', position)
    # Esperamos hasta que el servicio 'move_arm' esté activo`
    rospy.wait_for_service('move_arm')

    # success = client(0.30, -0.40, 0.50, 1.57, 0.00, 0.037, "base_footprint")
    # success = client(0.30, -0.50, 0.80, 1.57, 0.00, 0.00, "base_footprint")
    success = client(0.81, -0.3, 1.10, 1.57, 0.00, 0.0,"base_footprint")
    # success = client(0.75-0.05, -0.25, 1.25, 1.57, 0.00, 0.037)
    # success = client(0.015, 0.03, 0.31, 0.0, -1.57, 0.0, "xtion_rgb_optical_frame")


    # ESTE FUNCIONA
    # success = client(-0.03, 0.03, 0.25, 0.0, -1.57, 0.0, "xtion_rgb_optical_frame")


    if success:
        rospy.loginfo("Executed correctly")
    else:
        rospy.loginfo("Not executed")


