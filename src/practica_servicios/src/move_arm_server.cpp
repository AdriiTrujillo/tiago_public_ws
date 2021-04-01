// ROS headers
#include <ros/ros.h>
// MoveIt! headers
#include <moveit/move_group_interface/move_group_interface.h>
#include <tf/transform_broadcaster.h>
// Std C++ headers
#include <string>
#include <vector>
#include <map>
#include "practica_servicios/position.h"
#include <iostream>

bool move(practica_servicios::position::Request  &req, practica_servicios::position::Response &res){

  geometry_msgs::PoseStamped goal_pose;
  goal_pose.header.frame_id = req.frame;
  goal_pose.pose.position.x = float(req.x);
  goal_pose.pose.position.y = float(req.y);
  goal_pose.pose.position.z = float(req.z);
  goal_pose.pose.orientation = tf::createQuaternionMsgFromRollPitchYaw(double(req.roll), double(req.pitch), double(req.yaw));

  std::vector<std::string> torso_arm_joint_names;
  //select group of joints
  moveit::planning_interface::MoveGroupInterface group_arm_torso("arm_torso");
  //choose your preferred planner
  group_arm_torso.setPlannerId("SBLkConfigDefault");
  group_arm_torso.setPoseReferenceFrame(req.frame);
  group_arm_torso.setPoseTarget(goal_pose);

  ROS_INFO_STREAM("Planning to move " <<
                  group_arm_torso.getEndEffectorLink() << " to a target pose expressed in " <<
                  group_arm_torso.getPlanningFrame());

  group_arm_torso.setStartStateToCurrentState();
  group_arm_torso.setMaxVelocityScalingFactor(1.0);

  moveit::planning_interface::MoveGroupInterface::Plan my_plan;
  //set maximum time to find a plan
  group_arm_torso.setPlanningTime(5.0);
  res.success = bool(group_arm_torso.plan(my_plan));

  if ( !res.success )
    throw std::runtime_error("No plan found");

  ROS_INFO_STREAM("Plan found in " << my_plan.planning_time_ << " seconds");

  // Execute the plan
  ros::Time start = ros::Time::now();


  moveit::planning_interface::MoveItErrorCode e = group_arm_torso.move();
  if (!bool(e))
    throw std::runtime_error("Error executing plan");

  ROS_INFO_STREAM("Motion duration: " << (ros::Time::now() - start).toSec());

    return res.success;
}


int main(int argc, char **argv)
{
  ros::init(argc, argv, "move_arm_sever");
  
  ros::AsyncSpinner spinner(2);
  spinner.start();

  ros::NodeHandle n;
  ros::ServiceServer service = n.advertiseService("move_arm", move);
  ROS_INFO("Ready move tiago's arm");

  // ros::spin();
  ros::waitForShutdown();

  return 0;
}
