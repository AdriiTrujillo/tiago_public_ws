#include <ros/ros.h>
#include "practica_servicios/position.h"
#include <cstdlib>

int main(int argc, char **argv)
{
  ros::init(argc, argv, "move_arm_client");

  ros::NodeHandle n;
  ros::ServiceClient client = n.serviceClient<practica_servicios::position>("move_arm");
  
  //Pose de agarrar o dejar una lata
  practica_servicios::position srv;
  srv.request.x = 0.81; //1.83 //0.4
  srv.request.y = -0.3; //-4.03 no van //-0.3
  srv.request.z = 1.20; //0.82 //0.26
  srv.request.roll = 1.57; //-0.011 
  srv.request.pitch = 0.00; //1.57
  srv.request.yaw = 0.037;
  srv.response.success = false;

  if (client.call(srv))
  {
    ROS_INFO("Executed correctly");
  }
  else
  {
    ROS_ERROR("Failed to call service move_arm");
    return 1;
  }

  return 0;
}