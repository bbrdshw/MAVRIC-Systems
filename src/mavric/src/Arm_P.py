#!/usr/bin/env python
# Input node. Receives commands from the base station and publishes them in the
# arm ROS command format
#
# Topics:
#   ShoulderRot - The desired motion of the shoulder rotation motor
#   ShoulderPitch - The desired motion of the shoulder pitch motor
#   ElbowPitch - The desired motion of the elbow pitch motor
#   WristRot - The desired motion of the shoulder rotation motor
#   WristRot - The desired motion of the wrist rotation motor
#   WristPitch - The desired motion of the wrist pitch motor
# The ranges for the signals is -100,100 coresponding to the motor controllers' extremum.

import rospy
from std_msgs.msg import Float64
from mavric.msg import Arm

import time

import socket
from threading import *

data = 'stop'
serversocket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
serversocket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

host = ""
port = 10001

print(host)
print(port)

def talker():
    #Arm commands update one joint at a time, so we need one topic per joint
    pub_shoulder_r = rospy.Publisher("ShoulderRot", Float64, queue_size=10)
    pub_shoulder_p = rospy.Publisher("ShoulderPitch", Float64, queue_size=10)
    
    pub_elbow_p = rospy.Publisher("ElbowPitch", Float64, queue_size=10)
    
    pub_wrist_r = rospy.Publisher("WristRot", Float64, queue_size=10)
    pub_wrist_p = rospy.Publisher("WristPitch", Float64, queue_size=10)
    
    pub_claw_a = rospy.Publisher("ClawActuation", Float64, queue_size=10)
    
    rospy.init_node('ARP')

    serversocket.bind((host, port))
    serversocket.listen(1)

    rospy.loginfo('server started')

    while not rospy.is_shutdown():
        connection, address = serversocket.accept()
        data = connection.recv(1024).decode()

        rospy.loginfo(data)

        if(data[0] == 'A'):
            # Arm Command
            parameters = data[2:].strip().split(',')
            rospy.loginfo(parameters)
            cmd = float(parameters[0])
            
            if data[1] == 'R':
                pub_shoulder_r.publish(cmd)
            
            elif data[1] == 'L':
                pub_shoulder_p.publish(cmd)
            
            elif data[1] == 'E':
                pub_elbow_p.publish(cmd)
            
            
        elif(data[0] == 'C'):
            # Claw Command
            parameters = data[2:].strip().split(',')
            rospy.loginfo(parameters)
            cmd = float(parameters[0])
            
            if data[1] == 'R':
                pub_wrist_r.publish(cmd)
            
            elif data[1] == 'P':
                pub_wrist_p.publish(cmd)
            
            elif data[1] == 'C':
                pub_claw_a.publish(cmd)
            
        connection.close()
    serversocket.close()

if __name__ == '__main__':
    try:
        talker()
    except rospy.ROSInterruptException:
        pass
