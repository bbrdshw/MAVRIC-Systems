#!/usr/bin/env python
# Drivetrain control, listens to messages on the Drive_Train topic and splits them into commands for each wheel.
# May eventually add features like smarter turning.

# Ramping:
#   The ramping is set to use a different ramping rate for accellerating and decellerating. This allows the rover to have increased safety by stopping faster, while still protecting it a little from malicious/careless operators.

# Paremeters:
#   ~<Left|Right>_<Front|Middle|Back>/Scale - The scale of the given wheel, -1 to reverse the direction.
#   ~Range - The range of speed for the system. Defaults to 0.4, use to change how fast the rover will go at +- 100% on the Drive_Train topic input.
#   ~ramp_rate_up - the rate the control signal accelerates
#   ~ramp_rate_down - the rate the control signal deccelerates

# Topics:
#   Drive_Train - Subscription: Listens for input from the user to set the wheels. This may not be directly passed to to wheels due to ramping or smart turning.

import rospy
from std_msgs.msg import Float64
from std_srvs.srv import SetBool
from mavric.msg import Drivetrain
import time

output_topics = []
left_target = 0
right_target = 0

suspension_protection = True

# Takes in throttles as percents in the range [-1.0, +1.0]
#     LF, LM, LB, RF, RM, RB
def set_outputs(LF, LM, LB, RF, RM, RB):
        output_topics[0].publish(LF*Scale*LF_Dir)
        output_topics[1].publish(LM*Scale*LM_Dir)
        output_topics[2].publish(LB*Scale*LB_Dir)
        output_topics[3].publish(RF*Scale*RF_Dir)
        output_topics[4].publish(RM*Scale*RM_Dir)
        output_topics[5].publish(RB*Scale*RB_Dir)

def change_protection(req):
        global suspension_protection
        suspension_protection = req.data
        return (True, 'Success')

def callback(data):
        global left_target
        global right_target

        if (data.left > 100):
                data.left = 100
        if (data.left < -100):
                data.left = -100

        if (data.right > 100):
                data.right = 100
        if (data.right < -100):
                data.right = -100

        if suspension_protection and (data.left*data.right < 0):
                data.left = 0
                data.right = 0

        #get left and right side drive powers
        left_target  = data.left/100.
        right_target = data.right/100.


def rampVal(current, target, ramp_amount_up, ramp_amount_down):
        if (current == target):
                return current;
        if current >= 0 and target > 0:
                if current < target:
                        current = current + min(ramp_amount_up, target-current)
                else:
                        current = current - min(ramp_amount_down, current-target)
        elif current > 0 and target <= 0:
                current = current - min(ramp_amount_down, current-target)
        elif current <= 0 and target < 0:
                if current > target:
                        current = current - min(ramp_amount_up, current-target)
                else:
                        current = current + min(ramp_amount_down, target-current)
        elif current < 0 and target >= 0:
                current = current + min(ramp_amount_down, target-current)
        else:
                print("case missed" + str(current) + "->" + str(target))
                current = target;
        return current
        
def listener():
        global Scale
        global LF_Dir
        global LM_Dir
        global LB_Dir
        global RF_Dir
        global RM_Dir
        global RB_Dir

        rospy.init_node('DTS')
        rospy.Subscriber("Drive_Train", Drivetrain, callback, queue_size=10)

        output_topics.append(rospy.Publisher("LeftFront", Float64, queue_size=10, latch=True))
        output_topics.append(rospy.Publisher("LeftMiddle", Float64, queue_size=10, latch=True))
        output_topics.append(rospy.Publisher("LeftBack", Float64, queue_size=10, latch=True))

        output_topics.append(rospy.Publisher("RightFront", Float64, queue_size=10, latch=True))
        output_topics.append(rospy.Publisher("RightMiddle", Float64, queue_size=10, latch=True))
        output_topics.append(rospy.Publisher("RightBack", Float64, queue_size=10, latch=True))

        rospy.Service('SetProtection', SetBool, change_protection)

        Scale = rospy.get_param("~Range", 0.4)
        LF_Dir = rospy.get_param("~Left_Front/Scale", 1)
        LM_Dir = rospy.get_param("~Left_Middle/Scale", 1)
        LB_Dir = rospy.get_param("~Left_Back/Scale", 1)
        RF_Dir = rospy.get_param("~Right_Front/Scale", 1) * -1
        RM_Dir = rospy.get_param("~Right_Middle/Scale", 1) * -1
        RB_Dir = rospy.get_param("~Right_Back/Scale", 1) * -1
        ramp_rate_up = rospy.get_param("~ramp_rate_up", 0.5)/20
        ramp_rate_down = rospy.get_param("~ramp_rate_down", 0.5)/20
        set_outputs(0, 0, 0, 0, 0, 0)
        r = rospy.Rate(20)
        left = 0
        right = 0
        
        while not rospy.is_shutdown():
                if (left != left_target or right != right_target):
                        left = rampVal(left, left_target, ramp_rate_up, ramp_rate_down)
                        right = rampVal(right, right_target, ramp_rate_up, ramp_rate_down)
                        set_outputs(left, left, left, right, right, right)
                        
                r.sleep()
                
if __name__ == '__main__':
    listener()
