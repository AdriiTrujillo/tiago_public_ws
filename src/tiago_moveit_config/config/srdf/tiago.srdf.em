<?xml version="1.0" ?>
<!--This does not replace URDF, and is not an extension of URDF.
    This is a format for representing semantic information about the robot structure.
    A URDF file must exist for this robot as well, where the joints and the links that are referenced are defined
-->
<robot name="tiago">
    <!--GROUPS: Representation of a set of joints and links. This can be useful for specifying DOF to plan for, defining arms, end effectors, etc-->
    <!--LINKS: When a link is specified, the parent joint of that link (if it exists) is automatically included-->
    <!--JOINTS: When a joint is specified, the child link of that joint (which will always exist) is automatically included-->
    <!--CHAINS: When a chain is specified, all the links along the chain (including endpoints) are included in the group. Additionally, all the joints that are parents to included links are also included. This means that joints along the chain and the parent joint of the base link are included in the group-->
    <!--SUBGROUPS: Groups can also be formed by referencing to already defined group names-->
@[if has_arm]@
    <group name="arm">
        <joint name="arm_1_joint" />
        <joint name="arm_2_joint" />
        <joint name="arm_3_joint" />
        <joint name="arm_4_joint" />
        <joint name="arm_5_joint" />
        <joint name="arm_6_joint" />
        <joint name="arm_7_joint" />
        <joint name="arm_tool_joint" />
    </group>
    <group name="arm_torso">
        <joint name="torso_lift_joint" />
        <joint name="arm_1_joint" />
        <joint name="arm_2_joint" />
        <joint name="arm_3_joint" />
        <joint name="arm_4_joint" />
        <joint name="arm_5_joint" />
        <joint name="arm_6_joint" />
        <joint name="arm_7_joint" />
        <joint name="arm_tool_joint" />
    </group>
@[else]
    <group name="torso">
        <joint name="torso_lift_joint" />
    </group>
@[end if]@
@[if end_effector == 'pal-gripper']@
    <group name="gripper">
        <link name="gripper_left_finger_link" />
        <link name="gripper_right_finger_link" />
        <link name="gripper_link" />
        <joint name="gripper_left_finger_joint" />
        <joint name="gripper_right_finger_joint" />
    </group>
    <!--END EFFECTOR: Purpose: Represent information about an end effector.-->
    <end_effector name="gripper" parent_link="arm_tool_link" group="gripper" parent_group="arm_torso" />
@[end if]@

@[if end_effector == "schunk-wsg"]@
    <group name="gripper">
        <link name="gripper_left_finger_link" />
        <link name="gripper_right_finger_link" />
        <link name="gripper_link" />
        <joint name="gripper_finger_joint" />
    </group>
    <!--END EFFECTOR: Purpose: Represent information about an end effector.-->
    <end_effector name="gripper" parent_link="arm_tool_link" group="gripper" parent_group="arm_torso" />
@[end if]@

@[if end_effector == "pal-hey5"]@
    <group name="hand">
        <joint name="hand_index_joint" />
        <joint name="hand_thumb_joint" />
        <joint name="hand_mrl_joint" />
        <link name="hand_index_link" />
        <link name="hand_thumb_link" />
        <link name="hand_mrl_link" />
        <link name="hand_palm_link" />
    </group>
    <!--END EFFECTOR: Purpose: Represent information about an end effector.-->
    <end_effector name="hand" parent_link="arm_tool_link" group="hand" />
    <!--PASSIVE JOINT: Purpose: this element is used to mark joints that are not actuated-->
    <passive_joint name="hand_grasping_fixed_joint" />
    <passive_joint name="hand_index_abd_joint" />
    <passive_joint name="hand_index_flex_1_joint" />
    <passive_joint name="hand_index_flex_2_joint" />
    <passive_joint name="hand_index_flex_3_joint" />
    <passive_joint name="hand_index_virtual_1_joint" />
    <passive_joint name="hand_index_virtual_2_joint" />
    <passive_joint name="hand_index_virtual_3_joint" />
    <passive_joint name="hand_little_abd_joint" />
    <passive_joint name="hand_little_flex_1_joint" />
    <passive_joint name="hand_little_flex_2_joint" />
    <passive_joint name="hand_little_flex_3_joint" />
    <passive_joint name="hand_little_virtual_1_joint" />
    <passive_joint name="hand_little_virtual_2_joint" />
    <passive_joint name="hand_little_virtual_3_joint" />
    <passive_joint name="hand_middle_abd_joint" />
    <passive_joint name="hand_middle_flex_1_joint" />
    <passive_joint name="hand_middle_flex_2_joint" />
    <passive_joint name="hand_middle_flex_3_joint" />
    <passive_joint name="hand_middle_virtual_1_joint" />
    <passive_joint name="hand_middle_virtual_2_joint" />
    <passive_joint name="hand_middle_virtual_3_joint" />
    <passive_joint name="hand_palm_joint" />
    <passive_joint name="hand_ring_abd_joint" />
    <passive_joint name="hand_ring_flex_1_joint" />
    <passive_joint name="hand_ring_flex_2_joint" />
    <passive_joint name="hand_ring_flex_3_joint" />
    <passive_joint name="hand_ring_virtual_1_joint" />
    <passive_joint name="hand_ring_virtual_2_joint" />
    <passive_joint name="hand_ring_virtual_3_joint" />
    <passive_joint name="hand_thumb_abd_joint" />
    <passive_joint name="hand_thumb_flex_1_joint" />
    <passive_joint name="hand_thumb_flex_2_joint" />
    <passive_joint name="hand_thumb_virtual_1_joint" />
    <passive_joint name="hand_thumb_virtual_2_joint" />
@[end if]@

    <!--DISABLE COLLISIONS: By default it is assumed that any link of the robot could potentially come into collision with any other link in the robot. This tag disables collision checking between a specified pair of links. -->
    <disable_collisions link1="base_antenna_left_link" link2="base_antenna_right_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="base_cover_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="base_laser_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="base_link" reason="Adjacent" />
    <disable_collisions link1="base_antenna_left_link" link2="caster_back_left_1_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="caster_back_left_2_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="caster_back_right_1_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="caster_back_right_2_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="caster_front_left_1_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="caster_front_left_2_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="caster_front_right_1_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="caster_front_right_2_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="head_1_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="head_2_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="torso_fixed_column_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="torso_fixed_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="torso_lift_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="wheel_left_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="wheel_right_link" reason="Never" />
    <disable_collisions link1="base_antenna_right_link" link2="base_cover_link" reason="Never" />
    <disable_collisions link1="base_antenna_right_link" link2="base_laser_link" reason="Never" />
    <disable_collisions link1="base_antenna_right_link" link2="base_link" reason="Adjacent" />
    <disable_collisions link1="base_antenna_right_link" link2="caster_back_left_1_link" reason="Never" />
    <disable_collisions link1="base_antenna_right_link" link2="caster_back_left_2_link" reason="Never" />
    <disable_collisions link1="base_antenna_right_link" link2="caster_back_right_1_link" reason="Never" />
    <disable_collisions link1="base_antenna_right_link" link2="caster_back_right_2_link" reason="Never" />
    <disable_collisions link1="base_antenna_right_link" link2="caster_front_left_1_link" reason="Never" />
    <disable_collisions link1="base_antenna_right_link" link2="caster_front_left_2_link" reason="Never" />
    <disable_collisions link1="base_antenna_right_link" link2="caster_front_right_1_link" reason="Never" />
    <disable_collisions link1="base_antenna_right_link" link2="caster_front_right_2_link" reason="Never" />
    <disable_collisions link1="base_antenna_right_link" link2="head_1_link" reason="Never" />
    <disable_collisions link1="base_antenna_right_link" link2="head_2_link" reason="Never" />
    <disable_collisions link1="base_antenna_right_link" link2="torso_fixed_column_link" reason="Never" />
    <disable_collisions link1="base_antenna_right_link" link2="torso_fixed_link" reason="Never" />
    <disable_collisions link1="base_antenna_right_link" link2="torso_lift_link" reason="Never" />
    <disable_collisions link1="base_antenna_right_link" link2="wheel_left_link" reason="Never" />
    <disable_collisions link1="base_antenna_right_link" link2="wheel_right_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="base_laser_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="base_link" reason="Adjacent" />
    <disable_collisions link1="base_cover_link" link2="caster_back_left_1_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="caster_back_left_2_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="caster_back_right_1_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="caster_back_right_2_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="caster_front_left_1_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="caster_front_left_2_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="caster_front_right_1_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="caster_front_right_2_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="head_1_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="head_2_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="torso_fixed_column_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="torso_fixed_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="torso_lift_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="wheel_left_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="wheel_right_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="base_link" reason="Adjacent" />
    <disable_collisions link1="base_laser_link" link2="caster_back_left_1_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="caster_back_left_2_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="caster_back_right_1_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="caster_back_right_2_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="caster_front_left_1_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="caster_front_left_2_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="caster_front_right_1_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="caster_front_right_2_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="head_1_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="head_2_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="torso_fixed_column_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="torso_fixed_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="torso_lift_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="wheel_left_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="wheel_right_link" reason="Never" />
    <disable_collisions link1="base_link" link2="caster_back_left_1_link" reason="Adjacent" />
    <disable_collisions link1="base_link" link2="caster_back_left_2_link" reason="Never" />
    <disable_collisions link1="base_link" link2="caster_back_right_1_link" reason="Adjacent" />
    <disable_collisions link1="base_link" link2="caster_back_right_2_link" reason="Never" />
    <disable_collisions link1="base_link" link2="caster_front_left_1_link" reason="Adjacent" />
    <disable_collisions link1="base_link" link2="caster_front_left_2_link" reason="Never" />
    <disable_collisions link1="base_link" link2="caster_front_right_1_link" reason="Adjacent" />
    <disable_collisions link1="base_link" link2="caster_front_right_2_link" reason="Never" />
    <disable_collisions link1="base_link" link2="head_1_link" reason="Never" />
    <disable_collisions link1="base_link" link2="head_2_link" reason="Never" />
    <disable_collisions link1="base_link" link2="torso_fixed_column_link" reason="Adjacent" />
    <disable_collisions link1="base_link" link2="torso_fixed_link" reason="Adjacent" />
    <disable_collisions link1="base_link" link2="torso_lift_link" reason="Never" />
    <disable_collisions link1="base_link" link2="wheel_left_link" reason="Adjacent" />
    <disable_collisions link1="base_link" link2="wheel_right_link" reason="Adjacent" />
    <disable_collisions link1="base_link" link2="base_sonar_01_link" reason="Never"/>
    <disable_collisions link1="base_link" link2="base_sonar_02_link" reason="Never"/>
    <disable_collisions link1="base_link" link2="base_sonar_03_link" reason="Never"/>
    <disable_collisions link1="caster_back_left_1_link" link2="caster_back_left_2_link" reason="Adjacent" />
    <disable_collisions link1="caster_back_left_1_link" link2="caster_back_right_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="caster_back_right_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="caster_front_left_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="caster_front_left_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="caster_front_right_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="caster_front_right_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="head_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="head_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="torso_fixed_column_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="torso_fixed_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="torso_lift_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="wheel_left_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="wheel_right_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="caster_back_right_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="caster_back_right_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="caster_front_left_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="caster_front_left_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="caster_front_right_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="caster_front_right_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="head_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="head_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="torso_fixed_column_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="torso_fixed_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="torso_lift_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="wheel_left_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="wheel_right_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="caster_back_right_2_link" reason="Adjacent" />
    <disable_collisions link1="caster_back_right_1_link" link2="caster_front_left_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="caster_front_left_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="caster_front_right_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="caster_front_right_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="head_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="head_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="torso_fixed_column_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="torso_fixed_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="torso_lift_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="wheel_left_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="wheel_right_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="caster_front_left_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="caster_front_left_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="caster_front_right_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="caster_front_right_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="head_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="head_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="torso_fixed_column_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="torso_fixed_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="torso_lift_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="wheel_left_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="wheel_right_link" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="caster_front_left_2_link" reason="Adjacent" />
    <disable_collisions link1="caster_front_left_1_link" link2="caster_front_right_1_link" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="caster_front_right_2_link" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="head_1_link" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="head_2_link" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="torso_fixed_column_link" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="torso_fixed_link" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="torso_lift_link" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="wheel_left_link" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="wheel_right_link" reason="Never" />
    <disable_collisions link1="caster_front_left_2_link" link2="caster_front_right_1_link" reason="Never" />
    <disable_collisions link1="caster_front_left_2_link" link2="caster_front_right_2_link" reason="Never" />
    <disable_collisions link1="caster_front_left_2_link" link2="head_1_link" reason="Never" />
    <disable_collisions link1="caster_front_left_2_link" link2="head_2_link" reason="Never" />
    <disable_collisions link1="caster_front_left_2_link" link2="torso_fixed_column_link" reason="Never" />
    <disable_collisions link1="caster_front_left_2_link" link2="torso_fixed_link" reason="Never" />
    <disable_collisions link1="caster_front_left_2_link" link2="torso_lift_link" reason="Never" />
    <disable_collisions link1="caster_front_left_2_link" link2="wheel_left_link" reason="Never" />
    <disable_collisions link1="caster_front_left_2_link" link2="wheel_right_link" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="caster_front_right_2_link" reason="Adjacent" />
    <disable_collisions link1="caster_front_right_1_link" link2="head_1_link" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="head_2_link" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="torso_fixed_column_link" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="torso_fixed_link" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="torso_lift_link" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="wheel_left_link" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="wheel_right_link" reason="Never" />
    <disable_collisions link1="caster_front_right_2_link" link2="head_1_link" reason="Never" />
    <disable_collisions link1="caster_front_right_2_link" link2="head_2_link" reason="Never" />
    <disable_collisions link1="caster_front_right_2_link" link2="torso_fixed_column_link" reason="Never" />
    <disable_collisions link1="caster_front_right_2_link" link2="torso_fixed_link" reason="Never" />
    <disable_collisions link1="caster_front_right_2_link" link2="torso_lift_link" reason="Never" />
    <disable_collisions link1="caster_front_right_2_link" link2="wheel_left_link" reason="Never" />
    <disable_collisions link1="caster_front_right_2_link" link2="wheel_right_link" reason="Never" />
    <disable_collisions link1="head_1_link" link2="head_2_link" reason="Adjacent" />
    <disable_collisions link1="head_1_link" link2="torso_fixed_column_link" reason="Never" />
    <disable_collisions link1="head_1_link" link2="torso_fixed_link" reason="Never" />
    <disable_collisions link1="head_1_link" link2="torso_lift_link" reason="Adjacent" />
    <disable_collisions link1="head_1_link" link2="wheel_left_link" reason="Never" />
    <disable_collisions link1="head_1_link" link2="wheel_right_link" reason="Never" />
    <disable_collisions link1="head_2_link" link2="torso_fixed_column_link" reason="Never" />
    <disable_collisions link1="head_2_link" link2="torso_fixed_link" reason="Never" />
    <disable_collisions link1="head_2_link" link2="torso_lift_link" reason="Never" />
    <disable_collisions link1="head_2_link" link2="wheel_left_link" reason="Never" />
    <disable_collisions link1="head_2_link" link2="wheel_right_link" reason="Never" />
    <disable_collisions link1="torso_fixed_column_link" link2="torso_fixed_link" reason="Default" />
    <disable_collisions link1="torso_fixed_column_link" link2="torso_lift_link" reason="Default" />
    <disable_collisions link1="torso_fixed_column_link" link2="wheel_left_link" reason="Never" />
    <disable_collisions link1="torso_fixed_column_link" link2="wheel_right_link" reason="Never" />
    <disable_collisions link1="torso_fixed_link" link2="torso_lift_link" reason="Adjacent" />
    <disable_collisions link1="torso_fixed_link" link2="wheel_left_link" reason="Never" />
    <disable_collisions link1="torso_fixed_link" link2="wheel_right_link" reason="Never" />
    <disable_collisions link1="torso_lift_link" link2="wheel_left_link" reason="Never" />
    <disable_collisions link1="torso_lift_link" link2="wheel_right_link" reason="Never" />
    <disable_collisions link1="wheel_left_link" link2="wheel_right_link" reason="Never" />

    <!-- Next disables generated with: https://gist.github.com/awesomebytes/18fe75b808c4c644bd3d -->
    <!-- Disabled because they are adjacent -->
    <!-- Tree looks like:
    base_footprint (NO COLLISION)
      base_link
      base_laser_link (NO COLLISION)
      base_antenna_left_link
      base_antenna_right_link
      base_imu_link (NO COLLISION)
      wheel_right_link
      wheel_left_link
        caster_front_right_1_link (NO COLLISION)
        caster_front_right_2_link
        caster_front_left_1_link (NO COLLISION)
        caster_front_left_2_link
        caster_back_right_1_link (NO COLLISION)
        caster_back_right_2_link
        caster_back_left_1_link (NO COLLISION)
        caster_back_left_2_link
        torso_fixed_link
          torso_lift_link
            head_1_link
              head_2_link
                xtion_link (NO COLLISION)
                xtion_optical_frame (NO COLLISION)
                  xtion_depth_frame (NO COLLISION)
                  xtion_depth_optical_frame (NO COLLISION)
                  xtion_rgb_frame (NO COLLISION)
                  xtion_rgb_optical_frame (NO COLLISION)
            arm_1_link
              arm_2_link
                arm_3_link
                  arm_4_link
                    arm_5_link
                      arm_6_link
                        arm_7_link
                          arm_tool_link




      torso_fixed_column_link
    base_cover_link (NO COLLISION)

     -->
    <disable_collisions link1="base_footprint" link2="base_link" reason="Adjacent"/>
    <disable_collisions link1="base_link" link2="base_laser_link" reason="Adjacent"/>
    <disable_collisions link1="base_link" link2="base_antenna_left_link" reason="Adjacent"/>
    <disable_collisions link1="base_link" link2="base_antenna_right_link" reason="Adjacent"/>
    <disable_collisions link1="base_link" link2="base_imu_link" reason="Adjacent"/>
    <disable_collisions link1="base_link" link2="wheel_right_link" reason="Adjacent"/>
    <disable_collisions link1="base_link" link2="wheel_left_link" reason="Adjacent"/>
    <disable_collisions link1="base_link" link2="caster_front_right_1_link" reason="Adjacent"/>
    <disable_collisions link1="caster_front_right_1_link" link2="caster_front_right_2_link" reason="Adjacent"/>
    <disable_collisions link1="base_link" link2="caster_front_left_1_link" reason="Adjacent"/>
    <disable_collisions link1="caster_front_left_1_link" link2="caster_front_left_2_link" reason="Adjacent"/>
    <disable_collisions link1="base_link" link2="caster_back_right_1_link" reason="Adjacent"/>
    <disable_collisions link1="caster_back_right_1_link" link2="caster_back_right_2_link" reason="Adjacent"/>
    <disable_collisions link1="base_link" link2="caster_back_left_1_link" reason="Adjacent"/>
    <disable_collisions link1="caster_back_left_1_link" link2="caster_back_left_2_link" reason="Adjacent"/>
    <disable_collisions link1="base_link" link2="torso_fixed_link" reason="Adjacent"/>
    <disable_collisions link1="torso_fixed_link" link2="torso_lift_link" reason="Adjacent"/>
    <disable_collisions link1="torso_lift_link" link2="head_1_link" reason="Adjacent"/>
    <disable_collisions link1="head_1_link" link2="head_2_link" reason="Adjacent"/>
    <disable_collisions link1="head_2_link" link2="xtion_link" reason="Adjacent"/>
    <disable_collisions link1="xtion_link" link2="xtion_optical_frame" reason="Adjacent"/>
    <disable_collisions link1="xtion_link" link2="xtion_depth_frame" reason="Adjacent"/>
    <disable_collisions link1="xtion_depth_frame" link2="xtion_depth_optical_frame" reason="Adjacent"/>
    <disable_collisions link1="xtion_link" link2="xtion_rgb_frame" reason="Adjacent"/>
    <disable_collisions link1="xtion_rgb_frame" link2="xtion_rgb_optical_frame" reason="Adjacent"/>
    <disable_collisions link1="base_link" link2="torso_fixed_column_link" reason="Adjacent"/>
    <disable_collisions link1="base_footprint" link2="base_cover_link" reason="Adjacent"/>

    <!-- Disabled because they don't have collision mesh so they can't collide between themselves-->
    <disable_collisions link1="base_laser_link" link2="base_footprint" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="base_cover_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="base_imu_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="caster_front_right_1_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="caster_front_left_1_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="caster_back_right_1_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="caster_back_left_1_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="xtion_link" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="xtion_optical_frame" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="xtion_depth_frame" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="xtion_depth_optical_frame" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="xtion_rgb_frame" reason="Never" />
    <disable_collisions link1="base_laser_link" link2="xtion_rgb_optical_frame" reason="Never" />
    <disable_collisions link1="base_footprint" link2="base_cover_link" reason="Never" />
    <disable_collisions link1="base_footprint" link2="base_imu_link" reason="Never" />
    <disable_collisions link1="base_footprint" link2="caster_front_right_1_link" reason="Never" />
    <disable_collisions link1="base_footprint" link2="caster_front_left_1_link" reason="Never" />
    <disable_collisions link1="base_footprint" link2="caster_back_right_1_link" reason="Never" />
    <disable_collisions link1="base_footprint" link2="caster_back_left_1_link" reason="Never" />
    <disable_collisions link1="base_footprint" link2="xtion_link" reason="Never" />
    <disable_collisions link1="base_footprint" link2="xtion_optical_frame" reason="Never" />
    <disable_collisions link1="base_footprint" link2="xtion_depth_frame" reason="Never" />
    <disable_collisions link1="base_footprint" link2="xtion_depth_optical_frame" reason="Never" />
    <disable_collisions link1="base_footprint" link2="xtion_rgb_frame" reason="Never" />
    <disable_collisions link1="base_footprint" link2="xtion_rgb_optical_frame" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="base_imu_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="caster_front_right_1_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="caster_front_left_1_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="caster_back_right_1_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="caster_back_left_1_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="xtion_link" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="xtion_optical_frame" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="xtion_depth_frame" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="xtion_depth_optical_frame" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="xtion_rgb_frame" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="xtion_rgb_optical_frame" reason="Never" />
    <disable_collisions link1="base_imu_link" link2="caster_front_right_1_link" reason="Never" />
    <disable_collisions link1="base_imu_link" link2="caster_front_left_1_link" reason="Never" />
    <disable_collisions link1="base_imu_link" link2="caster_back_right_1_link" reason="Never" />
    <disable_collisions link1="base_imu_link" link2="caster_back_left_1_link" reason="Never" />
    <disable_collisions link1="base_imu_link" link2="xtion_link" reason="Never" />
    <disable_collisions link1="base_imu_link" link2="xtion_optical_frame" reason="Never" />
    <disable_collisions link1="base_imu_link" link2="xtion_depth_frame" reason="Never" />
    <disable_collisions link1="base_imu_link" link2="xtion_depth_optical_frame" reason="Never" />
    <disable_collisions link1="base_imu_link" link2="xtion_rgb_frame" reason="Never" />
    <disable_collisions link1="base_imu_link" link2="xtion_rgb_optical_frame" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="caster_front_left_1_link" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="caster_back_right_1_link" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="caster_back_left_1_link" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="xtion_link" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="xtion_optical_frame" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="xtion_depth_frame" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="xtion_depth_optical_frame" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="xtion_rgb_frame" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="xtion_rgb_optical_frame" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="caster_back_right_1_link" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="caster_back_left_1_link" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="xtion_link" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="xtion_optical_frame" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="xtion_depth_frame" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="xtion_depth_optical_frame" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="xtion_rgb_frame" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="xtion_rgb_optical_frame" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="caster_back_left_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="xtion_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="xtion_optical_frame" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="xtion_depth_frame" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="xtion_depth_optical_frame" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="xtion_rgb_frame" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="xtion_rgb_optical_frame" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="xtion_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="xtion_optical_frame" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="xtion_depth_frame" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="xtion_depth_optical_frame" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="xtion_rgb_frame" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="xtion_rgb_optical_frame" reason="Never" />
    <disable_collisions link1="xtion_link" link2="xtion_optical_frame" reason="Never" />
    <disable_collisions link1="xtion_link" link2="xtion_depth_frame" reason="Never" />
    <disable_collisions link1="xtion_link" link2="xtion_depth_optical_frame" reason="Never" />
    <disable_collisions link1="xtion_link" link2="xtion_rgb_frame" reason="Never" />
    <disable_collisions link1="xtion_link" link2="xtion_rgb_optical_frame" reason="Never" />
    <disable_collisions link1="xtion_optical_frame" link2="xtion_depth_frame" reason="Never" />
    <disable_collisions link1="xtion_optical_frame" link2="xtion_depth_optical_frame" reason="Never" />
    <disable_collisions link1="xtion_optical_frame" link2="xtion_rgb_frame" reason="Never" />
    <disable_collisions link1="xtion_optical_frame" link2="xtion_rgb_optical_frame" reason="Never" />
    <disable_collisions link1="xtion_depth_frame" link2="xtion_depth_optical_frame" reason="Never" />
    <disable_collisions link1="xtion_depth_frame" link2="xtion_rgb_frame" reason="Never" />
    <disable_collisions link1="xtion_depth_frame" link2="xtion_rgb_optical_frame" reason="Never" />
    <disable_collisions link1="xtion_depth_optical_frame" link2="xtion_rgb_frame" reason="Never" />
    <disable_collisions link1="xtion_depth_optical_frame" link2="xtion_rgb_optical_frame" reason="Never" />
    <disable_collisions link1="xtion_rgb_frame" link2="xtion_rgb_optical_frame" reason="Never" />

    <!-- Disables because the second links doesn't have collision mesh -->
    <disable_collisions link1="base_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="base_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="base_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="base_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="base_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="base_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="base_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="base_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="base_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="base_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="base_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="base_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="base_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="base_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="base_antenna_left_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="base_antenna_left_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="base_antenna_left_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="base_antenna_left_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="base_antenna_left_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="base_antenna_left_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="base_antenna_left_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="base_antenna_left_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="base_antenna_left_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="base_antenna_left_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="base_antenna_left_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="base_antenna_left_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="base_antenna_left_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="base_antenna_left_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="base_antenna_right_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="base_antenna_right_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="base_antenna_right_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="base_antenna_right_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="base_antenna_right_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="base_antenna_right_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="base_antenna_right_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="base_antenna_right_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="base_antenna_right_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="base_antenna_right_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="base_antenna_right_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="base_antenna_right_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="base_antenna_right_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="base_antenna_right_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="wheel_right_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="wheel_right_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="wheel_right_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="wheel_right_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="wheel_right_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="wheel_right_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="wheel_right_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="wheel_right_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="wheel_right_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="wheel_right_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="wheel_right_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="wheel_right_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="wheel_right_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="wheel_right_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="wheel_left_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="wheel_left_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="wheel_left_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="wheel_left_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="wheel_left_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="wheel_left_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="wheel_left_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="wheel_left_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="wheel_left_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="wheel_left_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="wheel_left_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="wheel_left_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="wheel_left_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="wheel_left_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="caster_front_right_2_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="caster_front_right_2_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="caster_front_right_2_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="caster_front_right_2_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="caster_front_right_2_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="caster_front_right_2_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="caster_front_right_2_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="caster_front_right_2_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="caster_front_right_2_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="caster_front_right_2_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="caster_front_right_2_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="caster_front_right_2_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="caster_front_right_2_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="caster_front_right_2_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="caster_front_left_2_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="caster_front_left_2_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="caster_front_left_2_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="caster_front_left_2_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="caster_front_left_2_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="caster_front_left_2_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="caster_front_left_2_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="caster_front_left_2_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="caster_front_left_2_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="caster_front_left_2_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="caster_front_left_2_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="caster_front_left_2_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="caster_front_left_2_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="caster_front_left_2_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="caster_back_right_2_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="caster_back_right_2_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="caster_back_right_2_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="caster_back_right_2_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="caster_back_right_2_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="caster_back_right_2_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="caster_back_right_2_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="caster_back_right_2_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="caster_back_right_2_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="caster_back_right_2_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="caster_back_right_2_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="caster_back_right_2_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="caster_back_right_2_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="caster_back_right_2_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="caster_back_left_2_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="caster_back_left_2_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="caster_back_left_2_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="caster_back_left_2_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="caster_back_left_2_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="caster_back_left_2_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="caster_back_left_2_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="caster_back_left_2_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="caster_back_left_2_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="caster_back_left_2_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="caster_back_left_2_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="caster_back_left_2_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="caster_back_left_2_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="caster_back_left_2_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="torso_fixed_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="torso_fixed_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="torso_fixed_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="torso_fixed_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="torso_fixed_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="torso_fixed_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="torso_fixed_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="torso_fixed_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="torso_fixed_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="torso_fixed_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="torso_fixed_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="torso_fixed_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="torso_fixed_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="torso_fixed_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="torso_fixed_column_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="torso_fixed_column_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="torso_fixed_column_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="torso_fixed_column_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="torso_fixed_column_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="torso_fixed_column_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="torso_fixed_column_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="torso_fixed_column_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="torso_fixed_column_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="torso_fixed_column_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="torso_fixed_column_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="torso_fixed_column_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="torso_fixed_column_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="torso_fixed_column_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="torso_lift_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="torso_lift_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="torso_lift_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="torso_lift_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="torso_lift_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="torso_lift_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="torso_lift_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="torso_lift_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="torso_lift_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="torso_lift_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="torso_lift_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="torso_lift_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="torso_lift_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="torso_lift_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="head_1_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="head_1_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="head_1_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="head_1_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="head_1_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="head_1_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="head_1_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="head_1_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="head_1_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="head_1_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="head_1_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="head_1_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="head_1_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="head_1_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="head_2_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="head_2_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="head_2_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="head_2_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="head_2_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="head_2_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="head_2_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="head_2_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="head_2_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="head_2_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="head_2_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="head_2_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="head_2_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="head_2_link" link2="xtion_rgb_optical_frame" reason="Never"/>

@[if has_arm]@
    <disable_collisions link1="arm_1_link" link2="arm_2_link" reason="Adjacent" />
    <disable_collisions link1="arm_1_link" link2="arm_3_link" reason="Never" />
    <disable_collisions link1="arm_1_link" link2="arm_4_link" reason="Never" />
    <disable_collisions link1="arm_1_link" link2="arm_5_link" reason="Never" />
    <disable_collisions link1="arm_1_link" link2="arm_6_link" reason="Never" />
    <disable_collisions link1="arm_1_link" link2="arm_7_link" reason="Never" />
    <disable_collisions link1="arm_1_link" link2="arm_tool_link" reason="Never" />
    <disable_collisions link1="arm_1_link" link2="base_antenna_left_link" reason="Never" />
    <disable_collisions link1="arm_1_link" link2="base_antenna_right_link" reason="Never" />
    <disable_collisions link1="arm_1_link" link2="base_cover_link" reason="Never" />
    <disable_collisions link1="arm_1_link" link2="base_laser_link" reason="Never" />
    <disable_collisions link1="arm_1_link" link2="base_link" reason="Never" />
    <disable_collisions link1="arm_1_link" link2="caster_back_left_1_link" reason="Never" />
    <disable_collisions link1="arm_1_link" link2="caster_back_left_2_link" reason="Never" />
    <disable_collisions link1="arm_1_link" link2="caster_back_right_1_link" reason="Never" />
    <disable_collisions link1="arm_1_link" link2="caster_back_right_2_link" reason="Never" />
    <disable_collisions link1="arm_1_link" link2="caster_front_left_1_link" reason="Never" />
    <disable_collisions link1="arm_1_link" link2="caster_front_left_2_link" reason="Never" />
    <disable_collisions link1="arm_1_link" link2="caster_front_right_1_link" reason="Never" />
    <disable_collisions link1="arm_1_link" link2="caster_front_right_2_link" reason="Never" />
    <disable_collisions link1="arm_1_link" link2="head_1_link" reason="Never" />
    <disable_collisions link1="arm_1_link" link2="head_2_link" reason="Never" />
    <disable_collisions link1="arm_1_link" link2="torso_fixed_column_link" reason="Default" />
    <disable_collisions link1="arm_1_link" link2="torso_fixed_link" reason="Never" />
    <disable_collisions link1="arm_1_link" link2="torso_lift_link" reason="Adjacent" />
    <disable_collisions link1="arm_1_link" link2="wheel_left_link" reason="Never" />
    <disable_collisions link1="arm_1_link" link2="wheel_right_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="arm_3_link" reason="Adjacent" />
    <disable_collisions link1="arm_2_link" link2="arm_4_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="arm_5_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="arm_6_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="arm_7_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="arm_tool_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="base_antenna_left_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="base_antenna_right_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="base_cover_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="base_laser_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="base_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="caster_back_left_1_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="caster_back_left_2_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="caster_back_right_1_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="caster_back_right_2_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="caster_front_left_1_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="caster_front_left_2_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="caster_front_right_1_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="caster_front_right_2_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="head_1_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="head_2_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="torso_fixed_column_link" reason="Default" />
    <disable_collisions link1="arm_2_link" link2="torso_fixed_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="wheel_left_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="wheel_right_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="arm_4_link" reason="Adjacent" />
    <disable_collisions link1="arm_3_link" link2="arm_5_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="arm_6_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="arm_7_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="arm_tool_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="base_antenna_left_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="base_antenna_right_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="base_cover_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="base_laser_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="base_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="caster_back_left_1_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="caster_back_left_2_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="caster_back_right_1_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="caster_back_right_2_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="caster_front_left_1_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="caster_front_left_2_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="caster_front_right_1_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="caster_front_right_2_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="head_1_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="wheel_left_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="wheel_right_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="arm_5_link" reason="Adjacent" />
    <disable_collisions link1="arm_4_link" link2="arm_6_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="arm_7_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="arm_tool_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="base_antenna_left_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="base_antenna_right_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="base_laser_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="caster_back_left_1_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="caster_back_left_2_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="caster_back_right_1_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="caster_back_right_2_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="caster_front_left_1_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="caster_front_left_2_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="caster_front_right_1_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="caster_front_right_2_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="wheel_left_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="wheel_right_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="arm_6_link" reason="Adjacent" />
    <disable_collisions link1="arm_5_link" link2="arm_7_link" reason="Default" />
    <disable_collisions link1="arm_5_link" link2="arm_tool_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="caster_back_left_1_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="caster_back_left_2_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="caster_back_right_1_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="caster_back_right_2_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="arm_7_link" reason="Adjacent" />
    <disable_collisions link1="arm_6_link" link2="arm_tool_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="caster_back_left_1_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="caster_back_left_2_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="caster_back_right_1_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="caster_back_right_2_link" reason="Never" />
    <disable_collisions link1="arm_7_link" link2="arm_tool_link" reason="Adjacent" />
    <disable_collisions link1="arm_7_link" link2="caster_back_left_1_link" reason="Never" />
    <disable_collisions link1="arm_7_link" link2="caster_back_left_2_link" reason="Never" />
    <disable_collisions link1="arm_7_link" link2="caster_back_right_1_link" reason="Never" />
    <disable_collisions link1="arm_7_link" link2="caster_back_right_2_link" reason="Never" />
    <disable_collisions link1="arm_tool_link" link2="base_antenna_left_link" reason="Never" />
    <disable_collisions link1="arm_tool_link" link2="caster_back_left_1_link" reason="Never" />
    <disable_collisions link1="arm_tool_link" link2="caster_back_left_2_link" reason="Never" />
    <disable_collisions link1="arm_tool_link" link2="caster_back_right_1_link" reason="Never" />
    <disable_collisions link1="arm_tool_link" link2="caster_back_right_2_link" reason="Never" />
    <disable_collisions link1="torso_lift_link" link2="arm_1_link" reason="Adjacent"/>
    <disable_collisions link1="arm_1_link" link2="arm_2_link" reason="Adjacent"/>
    <disable_collisions link1="arm_2_link" link2="arm_3_link" reason="Adjacent"/>
    <disable_collisions link1="arm_3_link" link2="arm_4_link" reason="Adjacent"/>
    <disable_collisions link1="arm_4_link" link2="arm_5_link" reason="Adjacent"/>
    <disable_collisions link1="arm_5_link" link2="arm_6_link" reason="Adjacent"/>
    <disable_collisions link1="arm_6_link" link2="arm_7_link" reason="Adjacent"/>
    <disable_collisions link1="arm_7_link" link2="arm_tool_link" reason="Adjacent"/>
    <disable_collisions link1="arm_1_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="arm_1_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="arm_1_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="arm_1_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="arm_1_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="arm_1_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="arm_1_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="arm_1_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="arm_1_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="arm_1_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_1_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="arm_1_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_1_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="arm_1_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_2_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="arm_2_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="arm_2_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="arm_2_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="arm_2_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="arm_2_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="arm_2_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="arm_2_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="arm_2_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="arm_2_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_2_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="arm_2_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_2_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="arm_2_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_3_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="arm_3_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="arm_3_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="arm_3_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="arm_3_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="arm_3_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="arm_3_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="arm_3_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="arm_3_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="arm_3_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_3_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="arm_3_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_3_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="arm_3_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_4_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="arm_4_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="arm_4_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="arm_4_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="arm_4_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="arm_4_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="arm_4_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="arm_4_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="arm_4_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="arm_4_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_4_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="arm_4_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_4_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="arm_4_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_5_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="arm_5_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="arm_5_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="arm_5_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="arm_5_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="arm_5_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="arm_5_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="arm_5_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="arm_5_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="arm_5_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_5_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="arm_5_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_5_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="arm_5_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_6_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="arm_6_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="arm_6_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="arm_6_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="arm_6_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="arm_6_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="arm_6_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="arm_6_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="arm_6_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="arm_6_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_6_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="arm_6_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_6_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="arm_6_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_7_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="arm_7_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="arm_7_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="arm_7_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="arm_7_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="arm_7_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="arm_7_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="arm_7_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="arm_7_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="arm_7_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_7_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="arm_7_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_7_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="arm_7_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_tool_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="arm_tool_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="arm_tool_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="arm_tool_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="arm_tool_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="arm_tool_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="arm_tool_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="arm_tool_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="arm_tool_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="arm_tool_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_tool_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="arm_tool_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="arm_tool_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="arm_tool_link" link2="xtion_rgb_optical_frame" reason="Never"/>
@[end if]@

@[if end_effector in ['pal-gripper', 'schunk-wsg']]@
    <disable_collisions link1="arm_tool_link" link2="gripper_left_finger_link" reason="Never" />
    <disable_collisions link1="arm_tool_link" link2="gripper_link" reason="Adjacent" />
    <disable_collisions link1="arm_tool_link" link2="gripper_right_finger_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="gripper_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="gripper_link" reason="Never" />
    <disable_collisions link1="gripper_left_finger_link" link2="gripper_link" reason="Adjacent" />
    <disable_collisions link1="gripper_left_finger_link" link2="gripper_right_finger_link" reason="Default" />
    <disable_collisions link1="gripper_link" link2="gripper_right_finger_link" reason="Adjacent" />
    <disable_collisions link1="arm_tool_link" link2="gripper_link" reason="Adjacent"/>
    <disable_collisions link1="gripper_link" link2="gripper_right_finger_link" reason="Adjacent"/>
    <disable_collisions link1="gripper_link" link2="gripper_left_finger_link" reason="Adjacent"/>
    <disable_collisions link1="gripper_link" link2="gripper_grasping_frame" reason="Adjacent"/>
    <disable_collisions link1="arm_1_link" link2="gripper_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="gripper_left_finger_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="gripper_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="gripper_right_finger_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="gripper_left_finger_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="gripper_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="gripper_right_finger_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="gripper_left_finger_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="gripper_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="gripper_right_finger_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="gripper_left_finger_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="gripper_link" reason="Default" />
    <disable_collisions link1="arm_5_link" link2="gripper_right_finger_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="gripper_left_finger_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="gripper_link" reason="Default" />
    <disable_collisions link1="arm_6_link" link2="gripper_right_finger_link" reason="Never" />
    <disable_collisions link1="arm_7_link" link2="gripper_left_finger_link" reason="Never" />
    <disable_collisions link1="arm_7_link" link2="gripper_link" reason="Default" />
    <disable_collisions link1="arm_7_link" link2="gripper_right_finger_link" reason="Never" />
    <disable_collisions link1="head_1_link" link2="gripper_left_finger_link" reason="Never" />
    <disable_collisions link1="head_1_link" link2="gripper_right_finger_link" reason="Never" />
    <disable_collisions link1="head_2_link" link2="gripper_left_finger_link" reason="Never" />
    <disable_collisions link1="head_2_link" link2="gripper_right_finger_link" reason="Never" />
    <disable_collisions link1="arm_tool_link" link2="gripper_grasping_frame" reason="Never"/>
    <disable_collisions link1="base_laser_link" link2="gripper_grasping_frame" reason="Never" />
    <disable_collisions link1="base_footprint" link2="gripper_grasping_frame" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="gripper_grasping_frame" reason="Never" />
    <disable_collisions link1="base_imu_link" link2="gripper_grasping_frame" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="gripper_grasping_frame" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="gripper_grasping_frame" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="gripper_grasping_frame" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="gripper_grasping_frame" reason="Never" />
    <disable_collisions link1="xtion_link" link2="gripper_grasping_frame" reason="Never" />
    <disable_collisions link1="xtion_optical_frame" link2="gripper_grasping_frame" reason="Never" />
    <disable_collisions link1="xtion_depth_frame" link2="gripper_grasping_frame" reason="Never" />
    <disable_collisions link1="xtion_depth_optical_frame" link2="gripper_grasping_frame" reason="Never" />
    <disable_collisions link1="xtion_rgb_frame" link2="gripper_grasping_frame" reason="Never" />
    <disable_collisions link1="xtion_rgb_optical_frame" link2="gripper_grasping_frame" reason="Never" />
    <disable_collisions link1="base_link" link2="gripper_grasping_frame" reason="Never"/>
    <disable_collisions link1="base_antenna_left_link" link2="gripper_grasping_frame" reason="Never"/>
    <disable_collisions link1="base_antenna_right_link" link2="gripper_grasping_frame" reason="Never"/>
    <disable_collisions link1="wheel_right_link" link2="gripper_grasping_frame" reason="Never"/>
    <disable_collisions link1="wheel_left_link" link2="gripper_grasping_frame" reason="Never"/>
    <disable_collisions link1="caster_front_right_2_link" link2="gripper_grasping_frame" reason="Never"/>
    <disable_collisions link1="caster_front_left_2_link" link2="gripper_grasping_frame" reason="Never"/>
    <disable_collisions link1="caster_back_right_2_link" link2="gripper_grasping_frame" reason="Never"/>
    <disable_collisions link1="caster_back_left_2_link" link2="gripper_grasping_frame" reason="Never"/>
    <disable_collisions link1="torso_fixed_link" link2="gripper_grasping_frame" reason="Never"/>
    <disable_collisions link1="torso_fixed_column_link" link2="gripper_grasping_frame" reason="Never"/>
    <disable_collisions link1="torso_lift_link" link2="gripper_grasping_frame" reason="Never"/>
    <disable_collisions link1="head_1_link" link2="gripper_grasping_frame" reason="Never"/>
    <disable_collisions link1="head_2_link" link2="gripper_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_1_link" link2="gripper_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_2_link" link2="gripper_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_3_link" link2="gripper_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_4_link" link2="gripper_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_5_link" link2="gripper_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_6_link" link2="gripper_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_7_link" link2="gripper_grasping_frame" reason="Never"/>
    <disable_collisions link1="gripper_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="gripper_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="gripper_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="gripper_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="gripper_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="gripper_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="gripper_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="gripper_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="gripper_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="gripper_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="gripper_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="gripper_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="gripper_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="gripper_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="gripper_link" link2="gripper_grasping_frame" reason="Never"/>
    <disable_collisions link1="gripper_right_finger_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="gripper_right_finger_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="gripper_right_finger_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="gripper_right_finger_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="gripper_right_finger_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="gripper_right_finger_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="gripper_right_finger_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="gripper_right_finger_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="gripper_right_finger_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="gripper_right_finger_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="gripper_right_finger_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="gripper_right_finger_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="gripper_right_finger_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="gripper_right_finger_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="gripper_right_finger_link" link2="gripper_grasping_frame" reason="Never"/>
    <disable_collisions link1="gripper_left_finger_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="gripper_left_finger_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="gripper_left_finger_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="gripper_left_finger_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="gripper_left_finger_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="gripper_left_finger_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="gripper_left_finger_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="gripper_left_finger_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="gripper_left_finger_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="gripper_left_finger_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="gripper_left_finger_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="gripper_left_finger_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="gripper_left_finger_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="gripper_left_finger_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="gripper_left_finger_link" link2="gripper_grasping_frame" reason="Never"/>
@[end if]@

@[if end_effector == "pal-hey5"]@
    <disable_collisions link1="arm_1_link" link2="hand_index_link" reason="Never" />
    <disable_collisions link1="arm_1_link" link2="hand_little_abd_link" reason="Never" />
    <disable_collisions link1="arm_1_link" link2="hand_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_1_link" link2="hand_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_1_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_1_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="arm_1_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="arm_1_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_1_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_1_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_1_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_1_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_1_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="arm_1_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_1_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="arm_1_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_1_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="hand_index_abd_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="hand_index_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="hand_index_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="hand_index_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="hand_index_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="hand_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="hand_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="hand_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="hand_little_abd_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="hand_little_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="hand_little_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="hand_little_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="hand_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="hand_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="hand_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="hand_middle_abd_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="hand_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="hand_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="hand_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_2_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="hand_index_abd_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="hand_index_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="hand_index_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="hand_index_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="hand_index_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="hand_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="hand_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="hand_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="hand_little_abd_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="hand_little_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="hand_little_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="hand_little_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="hand_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="hand_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="hand_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="hand_middle_abd_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="hand_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="hand_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="hand_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="hand_safety_box" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_3_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="hand_index_abd_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="hand_index_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="hand_index_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="hand_index_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="hand_index_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="hand_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="hand_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="hand_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="hand_little_abd_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="hand_little_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="hand_little_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="hand_little_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="hand_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="hand_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="hand_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="hand_middle_abd_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="hand_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="hand_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="hand_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_4_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="hand_index_abd_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="hand_index_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="hand_index_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="hand_index_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="hand_index_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="hand_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="hand_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="hand_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="hand_little_abd_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="hand_little_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="hand_little_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="hand_little_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="hand_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="hand_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="hand_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="hand_middle_abd_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="hand_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="hand_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="hand_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_5_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="hand_index_abd_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="hand_index_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="hand_index_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="hand_index_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="hand_index_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="hand_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="hand_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="hand_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="hand_little_abd_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="hand_little_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="hand_little_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="hand_little_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="hand_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="hand_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="hand_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="hand_middle_abd_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="hand_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="hand_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="hand_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="hand_safety_box" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_6_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_7_link" link2="hand_index_abd_link" reason="Never" />
    <disable_collisions link1="arm_7_link" link2="hand_index_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_7_link" link2="hand_index_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_7_link" link2="hand_index_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_7_link" link2="hand_index_link" reason="Default" />
    <disable_collisions link1="arm_7_link" link2="hand_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_7_link" link2="hand_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_7_link" link2="hand_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_7_link" link2="hand_little_abd_link" reason="Never" />
    <disable_collisions link1="arm_7_link" link2="hand_little_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_7_link" link2="hand_little_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_7_link" link2="hand_little_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_7_link" link2="hand_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_7_link" link2="hand_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_7_link" link2="hand_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_7_link" link2="hand_middle_abd_link" reason="Never" />
    <disable_collisions link1="arm_7_link" link2="hand_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_7_link" link2="hand_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_7_link" link2="hand_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_7_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_7_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_7_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_7_link" link2="hand_mrl_link" reason="Default" />
    <disable_collisions link1="arm_7_link" link2="hand_palm_link" reason="Default" />
    <disable_collisions link1="arm_7_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="arm_7_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_7_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_7_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_7_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_7_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_7_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_7_link" link2="hand_safety_box" reason="Default" />
    <disable_collisions link1="arm_7_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="arm_7_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_7_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_7_link" link2="hand_thumb_link" reason="Default" />
    <disable_collisions link1="arm_7_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_7_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_tool_link" link2="hand_index_abd_link" reason="Never" />
    <disable_collisions link1="arm_tool_link" link2="hand_index_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_tool_link" link2="hand_index_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_tool_link" link2="hand_index_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_tool_link" link2="hand_index_link" reason="Default" />
    <disable_collisions link1="arm_tool_link" link2="hand_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_tool_link" link2="hand_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_tool_link" link2="hand_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_tool_link" link2="hand_little_abd_link" reason="Never" />
    <disable_collisions link1="arm_tool_link" link2="hand_little_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_tool_link" link2="hand_little_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_tool_link" link2="hand_little_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_tool_link" link2="hand_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_tool_link" link2="hand_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_tool_link" link2="hand_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_tool_link" link2="hand_middle_abd_link" reason="Never" />
    <disable_collisions link1="arm_tool_link" link2="hand_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_tool_link" link2="hand_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_tool_link" link2="hand_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_tool_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_tool_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_tool_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_tool_link" link2="hand_mrl_link" reason="Default" />
    <disable_collisions link1="arm_tool_link" link2="hand_palm_link" reason="Adjacent" />
    <disable_collisions link1="arm_tool_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="arm_tool_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_tool_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_tool_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="arm_tool_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_tool_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_tool_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="arm_tool_link" link2="hand_safety_box" reason="Adjacent" />
    <disable_collisions link1="arm_tool_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="arm_tool_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="arm_tool_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="arm_tool_link" link2="hand_thumb_link" reason="Default" />
    <disable_collisions link1="arm_tool_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="arm_tool_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="hand_index_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="hand_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="hand_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="base_antenna_left_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_index_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_little_abd_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_little_flex_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_little_flex_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_little_flex_3_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_middle_abd_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_index_flex_3_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_index_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_little_flex_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_little_flex_3_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_left_2_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_index_abd_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_index_flex_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_index_flex_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_index_flex_3_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_index_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_little_abd_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_little_flex_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_little_flex_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_little_flex_3_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_middle_abd_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_index_abd_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_index_flex_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_index_flex_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_index_flex_3_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_index_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_little_abd_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_little_flex_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_little_flex_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_little_flex_3_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_middle_abd_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="caster_back_right_2_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="hand_index_link" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="caster_front_left_2_link" link2="hand_index_link" reason="Never" />
    <disable_collisions link1="caster_front_left_2_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="caster_front_left_2_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="hand_index_link" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="caster_front_right_2_link" link2="hand_index_link" reason="Never" />
    <disable_collisions link1="caster_front_right_2_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="caster_front_right_2_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_index_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_index_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_index_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_index_virtual_1_link" reason="Adjacent" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_palm_link" reason="Adjacent" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_safety_box" reason="Default" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_index_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_index_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_index_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_index_virtual_1_link" reason="Adjacent" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_index_virtual_2_link" reason="Adjacent" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_safety_box" reason="Default" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_index_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_index_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_index_virtual_2_link" reason="Adjacent" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_index_virtual_3_link" reason="Adjacent" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_safety_box" reason="Default" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_index_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_index_virtual_3_link" reason="Adjacent" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_safety_box" reason="Default" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_mrl_link" reason="Default" />
    <disable_collisions link1="hand_index_link" link2="hand_palm_link" reason="Adjacent" />
    <disable_collisions link1="hand_index_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_safety_box" reason="Default" />
    <disable_collisions link1="hand_index_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_thumb_link" reason="Default" />
    <disable_collisions link1="hand_index_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_palm_link" reason="Default" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_safety_box" reason="Default" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_safety_box" reason="Default" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_safety_box" reason="Default" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_little_virtual_1_link" reason="Adjacent" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_palm_link" reason="Adjacent" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_safety_box" reason="Default" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_little_virtual_1_link" reason="Adjacent" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_little_virtual_2_link" reason="Adjacent" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_safety_box" reason="Default" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_little_virtual_2_link" reason="Adjacent" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_little_virtual_3_link" reason="Adjacent" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_safety_box" reason="Default" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_little_virtual_3_link" reason="Adjacent" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_safety_box" reason="Default" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_palm_link" reason="Default" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_safety_box" reason="Default" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_safety_box" reason="Default" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_safety_box" reason="Default" />
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_abd_link" link2="hand_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_abd_link" link2="hand_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_abd_link" link2="hand_middle_virtual_1_link" reason="Adjacent" />
    <disable_collisions link1="hand_middle_abd_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_abd_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_middle_abd_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_middle_abd_link" link2="hand_palm_link" reason="Adjacent" />
    <disable_collisions link1="hand_middle_abd_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_abd_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_middle_abd_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_middle_abd_link" link2="hand_safety_box" reason="Default" />
    <disable_collisions link1="hand_middle_abd_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_middle_abd_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_abd_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_abd_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_middle_abd_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_abd_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_1_link" link2="hand_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_1_link" link2="hand_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_1_link" link2="hand_middle_virtual_1_link" reason="Adjacent" />
    <disable_collisions link1="hand_middle_flex_1_link" link2="hand_middle_virtual_2_link" reason="Adjacent" />
    <disable_collisions link1="hand_middle_flex_1_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_1_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_1_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_1_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_1_link" link2="hand_safety_box" reason="Default" />
    <disable_collisions link1="hand_middle_flex_1_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_1_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_1_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_1_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_1_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_1_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_2_link" link2="hand_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_2_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_2_link" link2="hand_middle_virtual_2_link" reason="Adjacent" />
    <disable_collisions link1="hand_middle_flex_2_link" link2="hand_middle_virtual_3_link" reason="Adjacent" />
    <disable_collisions link1="hand_middle_flex_2_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_2_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_2_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_2_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_2_link" link2="hand_safety_box" reason="Default" />
    <disable_collisions link1="hand_middle_flex_2_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_2_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_2_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_2_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_2_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_3_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_3_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_3_link" link2="hand_middle_virtual_3_link" reason="Adjacent" />
    <disable_collisions link1="hand_middle_flex_3_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_3_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_3_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_3_link" link2="hand_safety_box" reason="Default" />
    <disable_collisions link1="hand_middle_flex_3_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_3_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_3_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_1_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_1_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_1_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_1_link" link2="hand_palm_link" reason="Default" />
    <disable_collisions link1="hand_middle_virtual_1_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_1_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_1_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_1_link" link2="hand_safety_box" reason="Default" />
    <disable_collisions link1="hand_middle_virtual_1_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_1_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_1_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_1_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_1_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_1_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_2_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_2_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_2_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_2_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_2_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_2_link" link2="hand_safety_box" reason="Default" />
    <disable_collisions link1="hand_middle_virtual_2_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_2_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_2_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_2_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_2_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_2_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_3_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_3_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_3_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_3_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_3_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_3_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_3_link" link2="hand_safety_box" reason="Default" />
    <disable_collisions link1="hand_middle_virtual_3_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_3_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_3_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_3_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_3_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_mrl_link" link2="hand_palm_link" reason="Adjacent" />
    <disable_collisions link1="hand_mrl_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_mrl_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_mrl_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_mrl_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_mrl_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_mrl_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_mrl_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_mrl_link" link2="hand_safety_box" reason="Default" />
    <disable_collisions link1="hand_mrl_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_mrl_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_mrl_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_mrl_link" link2="hand_thumb_link" reason="Default" />
    <disable_collisions link1="hand_mrl_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_mrl_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_palm_link" link2="hand_ring_abd_link" reason="Adjacent" />
    <disable_collisions link1="hand_palm_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_palm_link" link2="hand_ring_virtual_1_link" reason="Default" />
    <disable_collisions link1="hand_palm_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_palm_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_palm_link" link2="hand_safety_box" reason="Default" />
    <disable_collisions link1="hand_palm_link" link2="hand_thumb_abd_link" reason="Adjacent" />
    <disable_collisions link1="hand_palm_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_palm_link" link2="hand_thumb_link" reason="Adjacent" />
    <disable_collisions link1="hand_palm_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_palm_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_ring_abd_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_ring_abd_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_ring_abd_link" link2="hand_ring_virtual_1_link" reason="Adjacent" />
    <disable_collisions link1="hand_ring_abd_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_ring_abd_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_ring_abd_link" link2="hand_safety_box" reason="Default" />
    <disable_collisions link1="hand_ring_abd_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_ring_abd_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_ring_abd_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_ring_abd_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_ring_abd_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_ring_abd_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_1_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_1_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_1_link" link2="hand_ring_virtual_1_link" reason="Adjacent" />
    <disable_collisions link1="hand_ring_flex_1_link" link2="hand_ring_virtual_2_link" reason="Adjacent" />
    <disable_collisions link1="hand_ring_flex_1_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_1_link" link2="hand_safety_box" reason="Default" />
    <disable_collisions link1="hand_ring_flex_1_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_1_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_1_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_1_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_1_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_1_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_2_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_2_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_2_link" link2="hand_ring_virtual_2_link" reason="Adjacent" />
    <disable_collisions link1="hand_ring_flex_2_link" link2="hand_ring_virtual_3_link" reason="Adjacent" />
    <disable_collisions link1="hand_ring_flex_2_link" link2="hand_safety_box" reason="Default" />
    <disable_collisions link1="hand_ring_flex_2_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_2_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_2_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_2_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_2_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_2_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_3_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_3_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_3_link" link2="hand_ring_virtual_3_link" reason="Adjacent" />
    <disable_collisions link1="hand_ring_flex_3_link" link2="hand_safety_box" reason="Default" />
    <disable_collisions link1="hand_ring_flex_3_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_3_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_3_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_3_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_3_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_1_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_1_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_1_link" link2="hand_safety_box" reason="Default" />
    <disable_collisions link1="hand_ring_virtual_1_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_1_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_1_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_1_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_1_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_1_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_2_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_2_link" link2="hand_safety_box" reason="Default" />
    <disable_collisions link1="hand_ring_virtual_2_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_2_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_2_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_2_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_2_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_2_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_3_link" link2="hand_safety_box" reason="Default" />
    <disable_collisions link1="hand_ring_virtual_3_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_3_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_3_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_3_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_3_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_3_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_safety_box" link2="hand_thumb_abd_link" reason="Default" />
    <disable_collisions link1="hand_safety_box" link2="hand_thumb_flex_1_link" reason="Default" />
    <disable_collisions link1="hand_safety_box" link2="hand_thumb_flex_2_link" reason="Default" />
    <disable_collisions link1="hand_safety_box" link2="hand_thumb_link" reason="Default" />
    <disable_collisions link1="hand_safety_box" link2="hand_thumb_virtual_1_link" reason="Default" />
    <disable_collisions link1="hand_safety_box" link2="hand_thumb_virtual_2_link" reason="Default" />
    <disable_collisions link1="hand_thumb_abd_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_thumb_abd_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_thumb_abd_link" link2="hand_thumb_virtual_1_link" reason="Adjacent" />
    <disable_collisions link1="hand_thumb_abd_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_thumb_flex_1_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_thumb_flex_1_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_thumb_flex_1_link" link2="hand_thumb_virtual_1_link" reason="Adjacent" />
    <disable_collisions link1="hand_thumb_flex_1_link" link2="hand_thumb_virtual_2_link" reason="Adjacent" />
    <disable_collisions link1="hand_thumb_flex_2_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_thumb_flex_2_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_thumb_flex_2_link" link2="hand_thumb_virtual_2_link" reason="Adjacent" />
    <disable_collisions link1="hand_thumb_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_thumb_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_thumb_virtual_1_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="arm_tool_link" link2="hand_palm_link" reason="Adjacent"/>
    <disable_collisions link1="hand_palm_link" link2="hand_thumb_link" reason="Adjacent"/>
    <disable_collisions link1="hand_palm_link" link2="hand_index_link" reason="Adjacent"/>
    <disable_collisions link1="hand_palm_link" link2="hand_mrl_link" reason="Adjacent"/>
    <disable_collisions link1="hand_palm_link" link2="hand_thumb_abd_link" reason="Adjacent"/>
    <disable_collisions link1="hand_thumb_abd_link" link2="hand_thumb_virtual_1_link" reason="Adjacent"/>
    <disable_collisions link1="hand_thumb_virtual_1_link" link2="hand_thumb_flex_1_link" reason="Adjacent"/>
    <disable_collisions link1="hand_thumb_flex_1_link" link2="hand_thumb_virtual_2_link" reason="Adjacent"/>
    <disable_collisions link1="hand_thumb_virtual_2_link" link2="hand_thumb_flex_2_link" reason="Adjacent"/>
    <disable_collisions link1="hand_palm_link" link2="hand_index_abd_link" reason="Adjacent"/>
    <disable_collisions link1="hand_index_abd_link" link2="hand_index_virtual_1_link" reason="Adjacent"/>
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_index_flex_1_link" reason="Adjacent"/>
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_index_virtual_2_link" reason="Adjacent"/>
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_index_flex_2_link" reason="Adjacent"/>
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_index_virtual_3_link" reason="Adjacent"/>
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_index_flex_3_link" reason="Adjacent"/>
    <disable_collisions link1="hand_palm_link" link2="hand_middle_abd_link" reason="Adjacent"/>
    <disable_collisions link1="hand_middle_abd_link" link2="hand_middle_virtual_1_link" reason="Adjacent"/>
    <disable_collisions link1="hand_middle_virtual_1_link" link2="hand_middle_flex_1_link" reason="Adjacent"/>
    <disable_collisions link1="hand_middle_flex_1_link" link2="hand_middle_virtual_2_link" reason="Adjacent"/>
    <disable_collisions link1="hand_middle_virtual_2_link" link2="hand_middle_flex_2_link" reason="Adjacent"/>
    <disable_collisions link1="hand_middle_flex_2_link" link2="hand_middle_virtual_3_link" reason="Adjacent"/>
    <disable_collisions link1="hand_middle_virtual_3_link" link2="hand_middle_flex_3_link" reason="Adjacent"/>
    <disable_collisions link1="hand_palm_link" link2="hand_ring_abd_link" reason="Adjacent"/>
    <disable_collisions link1="hand_ring_abd_link" link2="hand_ring_virtual_1_link" reason="Adjacent"/>
    <disable_collisions link1="hand_ring_virtual_1_link" link2="hand_ring_flex_1_link" reason="Adjacent"/>
    <disable_collisions link1="hand_ring_flex_1_link" link2="hand_ring_virtual_2_link" reason="Adjacent"/>
    <disable_collisions link1="hand_ring_virtual_2_link" link2="hand_ring_flex_2_link" reason="Adjacent"/>
    <disable_collisions link1="hand_ring_flex_2_link" link2="hand_ring_virtual_3_link" reason="Adjacent"/>
    <disable_collisions link1="hand_ring_virtual_3_link" link2="hand_ring_flex_3_link" reason="Adjacent"/>
    <disable_collisions link1="hand_palm_link" link2="hand_little_abd_link" reason="Adjacent"/>
    <disable_collisions link1="hand_little_abd_link" link2="hand_little_virtual_1_link" reason="Adjacent"/>
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_little_flex_1_link" reason="Adjacent"/>
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_little_virtual_2_link" reason="Adjacent"/>
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_little_flex_2_link" reason="Adjacent"/>
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_little_virtual_3_link" reason="Adjacent"/>
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_little_flex_3_link" reason="Adjacent"/>
    <disable_collisions link1="hand_palm_link" link2="hand_grasping_frame" reason="Adjacent"/>
    <disable_collisions link1="arm_tool_link" link2="hand_safety_box" reason="Adjacent"/>
    <disable_collisions link1="base_laser_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="base_footprint" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="base_cover_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="base_imu_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="caster_front_right_1_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="caster_front_left_1_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="caster_back_right_1_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="caster_back_left_1_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="xtion_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="xtion_optical_frame" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="xtion_depth_frame" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="xtion_depth_optical_frame" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="xtion_rgb_frame" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="xtion_rgb_optical_frame" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="base_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="base_antenna_left_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="base_antenna_right_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="wheel_right_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="wheel_left_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="caster_front_right_2_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="caster_front_left_2_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="caster_back_right_2_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="caster_back_left_2_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="torso_fixed_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="torso_fixed_column_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="torso_lift_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="head_1_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="head_2_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_1_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_2_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_3_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_4_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_5_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_6_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_7_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="arm_tool_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_palm_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_palm_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_palm_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_palm_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_palm_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_palm_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_palm_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_palm_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_palm_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_palm_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_palm_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_palm_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_palm_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_palm_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_palm_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_thumb_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_thumb_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_thumb_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_thumb_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_thumb_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_thumb_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_thumb_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_index_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_index_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_index_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_index_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_index_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_index_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_index_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_index_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_index_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_index_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_index_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_index_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_index_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_index_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_index_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_mrl_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_mrl_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_mrl_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_mrl_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_mrl_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_mrl_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_mrl_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_mrl_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_mrl_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_mrl_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_mrl_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_mrl_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_mrl_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_mrl_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_mrl_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_thumb_abd_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_abd_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_thumb_abd_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_abd_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_abd_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_abd_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_abd_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_abd_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_abd_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_abd_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_thumb_abd_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_thumb_abd_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_thumb_abd_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_thumb_abd_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_thumb_abd_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_thumb_virtual_1_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_virtual_1_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_thumb_virtual_1_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_virtual_1_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_virtual_1_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_virtual_1_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_virtual_1_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_virtual_1_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_virtual_1_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_virtual_1_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_thumb_virtual_1_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_thumb_virtual_1_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_thumb_virtual_1_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_thumb_virtual_1_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_thumb_virtual_1_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_thumb_flex_1_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_flex_1_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_thumb_flex_1_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_flex_1_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_flex_1_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_flex_1_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_flex_1_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_flex_1_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_flex_1_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_flex_1_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_thumb_flex_1_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_thumb_flex_1_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_thumb_flex_1_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_thumb_flex_1_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_thumb_flex_1_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_thumb_virtual_2_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_virtual_2_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_thumb_virtual_2_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_virtual_2_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_virtual_2_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_virtual_2_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_virtual_2_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_virtual_2_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_virtual_2_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_virtual_2_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_thumb_virtual_2_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_thumb_virtual_2_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_thumb_virtual_2_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_thumb_virtual_2_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_thumb_virtual_2_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_thumb_flex_2_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_flex_2_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_thumb_flex_2_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_flex_2_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_flex_2_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_flex_2_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_flex_2_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_flex_2_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_flex_2_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_thumb_flex_2_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_thumb_flex_2_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_thumb_flex_2_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_thumb_flex_2_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_thumb_flex_2_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_thumb_flex_2_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_index_abd_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_index_abd_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_index_abd_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_index_abd_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_index_abd_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_index_abd_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_index_abd_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_index_abd_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_index_abd_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_index_abd_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_index_abd_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_index_abd_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_index_abd_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_index_abd_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_index_abd_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_1_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_1_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_1_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_1_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_1_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_1_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_1_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_1_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_1_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_1_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_1_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_1_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_1_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_1_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_index_flex_1_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_index_flex_1_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_index_flex_1_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_index_flex_1_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_index_flex_1_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_index_flex_1_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_index_flex_1_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_index_flex_1_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_index_flex_1_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_index_flex_1_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_index_flex_1_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_index_flex_1_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_index_flex_1_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_index_flex_1_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_2_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_2_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_2_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_2_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_2_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_2_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_2_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_2_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_2_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_2_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_2_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_2_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_2_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_2_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_index_flex_2_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_index_flex_2_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_index_flex_2_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_index_flex_2_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_index_flex_2_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_index_flex_2_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_index_flex_2_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_index_flex_2_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_index_flex_2_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_index_flex_2_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_index_flex_2_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_index_flex_2_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_index_flex_2_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_index_flex_2_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_3_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_3_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_3_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_3_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_3_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_3_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_3_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_3_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_3_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_3_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_3_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_3_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_3_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_3_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_index_flex_3_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_index_flex_3_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_index_flex_3_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_index_flex_3_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_index_flex_3_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_index_flex_3_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_index_flex_3_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_index_flex_3_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_index_flex_3_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_index_flex_3_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_index_flex_3_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_index_flex_3_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_index_flex_3_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_index_flex_3_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_middle_abd_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_middle_abd_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_middle_abd_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_middle_abd_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_middle_abd_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_middle_abd_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_middle_abd_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_middle_abd_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_middle_abd_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_middle_abd_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_middle_abd_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_middle_abd_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_middle_abd_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_middle_abd_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_middle_abd_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_1_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_1_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_1_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_1_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_1_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_1_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_1_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_1_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_1_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_1_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_1_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_1_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_1_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_1_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_1_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_1_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_1_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_1_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_1_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_1_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_1_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_1_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_1_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_1_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_1_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_1_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_1_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_1_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_1_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_1_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_2_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_2_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_2_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_2_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_2_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_2_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_2_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_2_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_2_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_2_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_2_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_2_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_2_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_2_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_2_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_2_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_2_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_2_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_2_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_2_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_2_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_2_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_2_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_2_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_2_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_2_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_2_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_2_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_2_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_2_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_3_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_3_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_3_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_3_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_3_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_3_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_3_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_3_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_3_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_3_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_3_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_3_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_3_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_3_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_middle_virtual_3_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_3_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_3_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_3_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_3_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_3_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_3_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_3_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_3_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_3_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_3_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_3_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_3_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_3_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_3_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_middle_flex_3_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_ring_abd_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_ring_abd_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_ring_abd_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_ring_abd_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_ring_abd_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_ring_abd_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_ring_abd_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_ring_abd_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_ring_abd_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_ring_abd_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_ring_abd_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_ring_abd_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_ring_abd_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_ring_abd_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_ring_abd_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_1_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_1_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_1_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_1_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_1_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_1_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_1_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_1_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_1_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_1_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_1_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_1_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_1_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_1_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_1_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_1_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_1_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_1_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_1_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_1_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_1_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_1_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_1_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_1_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_1_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_1_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_1_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_1_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_1_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_1_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_2_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_2_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_2_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_2_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_2_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_2_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_2_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_2_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_2_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_2_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_2_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_2_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_2_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_2_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_2_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_2_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_2_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_2_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_2_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_2_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_2_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_2_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_2_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_2_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_2_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_2_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_2_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_2_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_2_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_2_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_3_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_3_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_3_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_3_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_3_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_3_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_3_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_3_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_3_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_3_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_3_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_3_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_3_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_3_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_ring_virtual_3_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_3_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_3_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_3_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_3_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_3_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_3_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_3_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_3_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_3_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_3_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_3_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_3_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_3_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_3_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_ring_flex_3_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_little_abd_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_little_abd_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_little_abd_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_little_abd_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_little_abd_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_little_abd_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_little_abd_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_little_abd_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_little_abd_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_little_abd_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_little_abd_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_little_abd_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_little_abd_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_little_abd_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_little_abd_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_1_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_1_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_1_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_1_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_1_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_1_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_1_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_1_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_1_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_1_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_1_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_1_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_1_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_1_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_little_flex_1_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_little_flex_1_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_little_flex_1_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_little_flex_1_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_little_flex_1_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_little_flex_1_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_little_flex_1_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_little_flex_1_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_little_flex_1_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_little_flex_1_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_little_flex_1_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_little_flex_1_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_little_flex_1_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_little_flex_1_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_2_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_2_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_2_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_2_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_2_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_2_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_2_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_2_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_2_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_2_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_2_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_2_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_2_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_2_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_little_flex_2_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_little_flex_2_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_little_flex_2_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_little_flex_2_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_little_flex_2_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_little_flex_2_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_little_flex_2_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_little_flex_2_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_little_flex_2_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_little_flex_2_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_little_flex_2_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_little_flex_2_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_little_flex_2_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_little_flex_2_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_3_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_3_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_3_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_3_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_3_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_3_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_3_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_3_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_3_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_3_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_3_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_3_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_3_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_3_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_little_flex_3_link" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_little_flex_3_link" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_little_flex_3_link" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_little_flex_3_link" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_little_flex_3_link" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_little_flex_3_link" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_little_flex_3_link" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_little_flex_3_link" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_little_flex_3_link" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_little_flex_3_link" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_little_flex_3_link" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_little_flex_3_link" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_little_flex_3_link" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_little_flex_3_link" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_safety_box" link2="base_laser_link" reason="Never"/>
    <disable_collisions link1="hand_safety_box" link2="base_footprint" reason="Never"/>
    <disable_collisions link1="hand_safety_box" link2="base_cover_link" reason="Never"/>
    <disable_collisions link1="hand_safety_box" link2="base_imu_link" reason="Never"/>
    <disable_collisions link1="hand_safety_box" link2="caster_front_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_safety_box" link2="caster_front_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_safety_box" link2="caster_back_right_1_link" reason="Never"/>
    <disable_collisions link1="hand_safety_box" link2="caster_back_left_1_link" reason="Never"/>
    <disable_collisions link1="hand_safety_box" link2="xtion_link" reason="Never"/>
    <disable_collisions link1="hand_safety_box" link2="xtion_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_safety_box" link2="xtion_depth_frame" reason="Never"/>
    <disable_collisions link1="hand_safety_box" link2="xtion_depth_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_safety_box" link2="xtion_rgb_frame" reason="Never"/>
    <disable_collisions link1="hand_safety_box" link2="xtion_rgb_optical_frame" reason="Never"/>
    <disable_collisions link1="hand_safety_box" link2="hand_grasping_frame" reason="Never"/>
    <disable_collisions link1="hand_index_abd_link" link2="hand_index_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_index_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_index_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_index_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_safety_box" reason="Never" />
    <disable_collisions link1="hand_index_abd_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_index_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_index_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_index_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_safety_box" reason="Never" />
    <disable_collisions link1="hand_index_flex_1_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_index_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_index_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_safety_box" reason="Never" />
    <disable_collisions link1="hand_index_flex_2_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_index_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_safety_box" reason="Never" />
    <disable_collisions link1="hand_index_flex_3_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_safety_box" reason="Never" />
    <disable_collisions link1="hand_index_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_safety_box" reason="Never" />
    <disable_collisions link1="hand_index_virtual_1_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_safety_box" reason="Never" />
    <disable_collisions link1="hand_index_virtual_2_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_little_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_safety_box" reason="Never" />
    <disable_collisions link1="hand_index_virtual_3_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_little_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_safety_box" reason="Never" />
    <disable_collisions link1="hand_little_abd_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_little_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_safety_box" reason="Never" />
    <disable_collisions link1="hand_little_flex_1_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_little_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_safety_box" reason="Never" />
    <disable_collisions link1="hand_little_flex_2_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_safety_box" reason="Never" />
    <disable_collisions link1="hand_little_flex_3_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_safety_box" reason="Never" />
    <disable_collisions link1="hand_little_virtual_1_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_safety_box" reason="Never" />
    <disable_collisions link1="hand_little_virtual_2_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_middle_abd_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_safety_box" reason="Never" />
    <disable_collisions link1="hand_little_virtual_3_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_middle_abd_link" link2="hand_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_abd_link" link2="hand_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_abd_link" link2="hand_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_middle_abd_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_abd_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_abd_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_middle_abd_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_middle_abd_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_middle_abd_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_abd_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_abd_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_middle_abd_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_abd_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_abd_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_middle_abd_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_middle_abd_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_abd_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_abd_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_middle_abd_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_abd_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_abd_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_middle_abd_link" link2="hand_safety_box" reason="Never" />
    <disable_collisions link1="hand_middle_abd_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_1_link" link2="hand_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_1_link" link2="hand_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_1_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_1_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_1_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_1_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_1_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_1_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_1_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_1_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_1_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_1_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_1_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_1_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_1_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_1_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_1_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_1_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_1_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_1_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_middle_flex_1_link" link2="hand_safety_box" reason="Never" />
    <disable_collisions link1="hand_middle_flex_1_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_2_link" link2="hand_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_2_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_2_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_2_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_2_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_2_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_2_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_2_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_2_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_2_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_2_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_2_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_2_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_2_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_2_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_2_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_2_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_2_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_2_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_middle_flex_2_link" link2="hand_safety_box" reason="Never" />
    <disable_collisions link1="hand_middle_flex_2_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_3_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_3_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_3_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_3_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_3_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_3_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_3_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_3_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_3_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_3_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_3_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_3_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_3_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_3_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_3_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_3_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_3_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_flex_3_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_middle_flex_3_link" link2="hand_safety_box" reason="Never" />
    <disable_collisions link1="hand_middle_flex_3_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_1_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_1_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_1_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_1_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_1_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_1_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_1_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_1_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_1_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_1_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_1_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_1_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_1_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_1_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_1_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_1_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_1_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_1_link" link2="hand_safety_box" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_1_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_2_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_2_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_2_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_2_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_2_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_2_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_2_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_2_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_2_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_2_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_2_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_2_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_2_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_2_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_2_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_2_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_2_link" link2="hand_safety_box" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_2_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_3_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_3_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_3_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_3_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_3_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_3_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_3_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_3_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_3_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_3_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_3_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_3_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_3_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_3_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_3_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_3_link" link2="hand_safety_box" reason="Never" />
    <disable_collisions link1="hand_middle_virtual_3_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_mrl_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="hand_mrl_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_mrl_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_mrl_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_mrl_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_mrl_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_mrl_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_mrl_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_mrl_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_mrl_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_mrl_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_mrl_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_mrl_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_mrl_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_mrl_link" link2="hand_safety_box" reason="Never" />
    <disable_collisions link1="hand_mrl_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_ring_abd_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_ring_abd_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_ring_abd_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_ring_abd_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_ring_abd_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_ring_abd_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_ring_abd_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_ring_abd_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_ring_abd_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_ring_abd_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_ring_abd_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_ring_abd_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_ring_abd_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_ring_abd_link" link2="hand_safety_box" reason="Never" />
    <disable_collisions link1="hand_ring_abd_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_1_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_1_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_1_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_1_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_1_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_1_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_1_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_1_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_1_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_1_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_1_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_1_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_ring_flex_1_link" link2="hand_safety_box" reason="Never" />
    <disable_collisions link1="hand_ring_flex_1_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_2_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_2_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_2_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_2_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_2_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_2_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_2_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_2_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_2_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_2_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_2_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_ring_flex_2_link" link2="hand_safety_box" reason="Never" />
    <disable_collisions link1="hand_ring_flex_2_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_3_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_3_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_3_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_3_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_3_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_3_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_3_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_3_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_3_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_ring_flex_3_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_ring_flex_3_link" link2="hand_safety_box" reason="Never" />
    <disable_collisions link1="hand_ring_flex_3_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_1_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_1_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_1_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_1_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_1_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_1_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_1_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_1_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_1_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_1_link" link2="hand_safety_box" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_1_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_2_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_2_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_2_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_2_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_2_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_2_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_2_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_2_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_2_link" link2="hand_safety_box" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_2_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_3_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_3_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_3_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_3_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_3_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_3_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_3_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_3_link" link2="hand_safety_box" reason="Never" />
    <disable_collisions link1="hand_ring_virtual_3_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_thumb_abd_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="hand_thumb_abd_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_thumb_abd_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_thumb_abd_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_thumb_abd_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_thumb_abd_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_thumb_abd_link" link2="hand_safety_box" reason="Never" />
    <disable_collisions link1="hand_thumb_abd_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_thumb_flex_1_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="hand_thumb_flex_1_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_thumb_flex_1_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_thumb_flex_1_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_thumb_flex_1_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_thumb_flex_1_link" link2="hand_safety_box" reason="Never" />
    <disable_collisions link1="hand_thumb_flex_1_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_thumb_flex_2_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="hand_thumb_flex_2_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_thumb_flex_2_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_thumb_flex_2_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_thumb_flex_2_link" link2="hand_safety_box" reason="Never" />
    <disable_collisions link1="hand_thumb_flex_2_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_thumb_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="hand_thumb_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_thumb_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_thumb_link" link2="hand_safety_box" reason="Never" />
    <disable_collisions link1="hand_thumb_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_thumb_virtual_1_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="hand_thumb_virtual_1_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_thumb_virtual_1_link" link2="hand_safety_box" reason="Never" />
    <disable_collisions link1="hand_thumb_virtual_1_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_thumb_virtual_2_link" link2="hand_grasping_frame" reason="Never" />
    <disable_collisions link1="hand_thumb_virtual_2_link" link2="hand_safety_box" reason="Never" />
    <disable_collisions link1="hand_thumb_virtual_2_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_grasping_frame" link2="hand_safety_box" reason="Never" />
    <disable_collisions link1="hand_grasping_frame" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="hand_safety_box" link2="hand_palm_link" reason="Never" />
@[end if]@

@[if ft_sensor == "schunk-ft"]@
    @[if end_effector in ['pal-gripper', 'schunk-wsg']]@
    <!-- FT link disable collisions -->
    <disable_collisions link1="wrist_ft_link" link2="wrist_ft_tool_link" reason="Adjacent" />
    <disable_collisions link1="wrist_ft_link" link2="gripper_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="gripper_right_finger_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="gripper_left_finger_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="arm_5_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="arm_6_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="arm_7_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="arm_tool_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="gripper_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="gripper_right_finger_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="gripper_left_finger_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="arm_5_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="arm_6_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="arm_7_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="arm_tool_link" reason="Never" />
    @[end if]@
@[end if]@

@[if ft_sensor == "schunk-ft"]@
    @[if end_effector == "pal-hey5"]@
    <!-- Disable collisions with FT sensor -->
    <disable_collisions link1="wrist_ft_link" link2="arm_tool_link" reason="Adjacent" />
    <disable_collisions link1="wrist_ft_link" link2="wrist_ft_tool_link" reason="Adjacent" />
    <disable_collisions link1="wrist_ft_link" link2="arm_5_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="arm_6_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="arm_7_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="arm_tool_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="hand_safety_box" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="hand_palm_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="hand_palm_link" reason="Adjacent" />
    <disable_collisions link1="wrist_ft_tool_link" link2="arm_5_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="arm_6_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="arm_7_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="arm_tool_link" reason="Never" />


    <!-- Disable collisions with FT sensor and hand -->

    <disable_collisions link1="wrist_ft_tool_link" link2="hand_index_abd_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="hand_index_flex_1_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="hand_index_flex_2_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="hand_index_flex_3_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="hand_index_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="hand_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="hand_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="hand_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="hand_little_abd_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="hand_little_flex_1_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="hand_little_flex_2_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="hand_little_flex_3_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="hand_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="hand_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="hand_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="hand_middle_abd_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="hand_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="hand_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="hand_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="wrist_ft_tool_link" link2="hand_safety_box" reason="Never" />

    <disable_collisions link1="wrist_ft_link" link2="hand_index_abd_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="hand_index_flex_1_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="hand_index_flex_2_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="hand_index_flex_3_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="hand_index_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="hand_index_virtual_1_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="hand_index_virtual_2_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="hand_index_virtual_3_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="hand_little_abd_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="hand_little_flex_1_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="hand_little_flex_2_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="hand_little_flex_3_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="hand_little_virtual_1_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="hand_little_virtual_2_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="hand_little_virtual_3_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="hand_middle_abd_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="hand_middle_flex_1_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="hand_middle_flex_2_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="hand_middle_flex_3_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="hand_middle_virtual_1_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="hand_middle_virtual_2_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="hand_middle_virtual_3_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="hand_mrl_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="hand_ring_abd_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="hand_ring_flex_1_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="hand_ring_flex_2_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="hand_ring_flex_3_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="hand_ring_virtual_1_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="hand_ring_virtual_2_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="hand_ring_virtual_3_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="hand_thumb_abd_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="hand_thumb_flex_1_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="hand_thumb_flex_2_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="hand_thumb_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="hand_thumb_virtual_1_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="hand_thumb_virtual_2_link" reason="Never" />
    <disable_collisions link1="wrist_ft_link" link2="hand_safety_box" reason="Never" />
    @[end if]@
@[end if]@


</robot>
