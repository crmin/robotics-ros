# # 5) Install ROS 1
# sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
# curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -
# apt update
# apt -y install ros-noetic-desktop-full

# source /opt/ros/noetic/setup.bash
# echo "source /opt/ros/noetic/setup.bash" >> /root/.bashrc
# source /root/.bashrc

# apt -y install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
# apt -y install python3-rosdep
# rosdep init
# rosdep update

# # 6) Install TurtleBot 3 ROS 1 package & 7) Create workspace and download turtlebot 3 package
# wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_noetic.sh
# chmod 755 ./install_ros_noetic.sh
# bash ./install_ros_noetic.sh

# apt -y install ros-noetic-joy ros-noetic-teleop-twist-joy \
#   ros-noetic-teleop-twist-keyboard ros-noetic-laser-proc \
#   ros-noetic-rgbd-launch ros-noetic-rosserial-arduino \
#   ros-noetic-rosserial-python ros-noetic-rosserial-client \
#   ros-noetic-rosserial-msgs ros-noetic-amcl ros-noetic-map-server \
#   ros-noetic-move-base ros-noetic-urdf ros-noetic-xacro \
#   ros-noetic-compressed-image-transport ros-noetic-rqt* ros-noetic-rviz \
#   ros-noetic-gmapping ros-noetic-navigation ros-noetic-interactive-markers

# apt -y install ros-noetic-dynamixel-sdk ros-noetic-turtlebot3-msgs ros-noetic-turtlebot3

# apt update
# apt -y upgrade
# apt -y autoremove

# mkdir -p /root/catkin_ws/src
# WORKDIR /root/catkin_ws/
# export PATH=/opt/ros/noetic/bin:${PATH}
# export PYTHONPATH=/opt/ros/noetic/lib/python3/dist-packages
# catkin_make
catkin_make

# 8) Set ROS_MASTER_URI and ROS_HOSTNAME in .bashrc
echo "source /opt/ros/noetic/setup.bash \
    source /root/catkin_ws/devel/setup.bash \
    export ROS_MASTER_URI=http://${IP_OF_REMOTE_PC}:11311 \
    export ROS_HOSTNAME=${IP_OF_REMOTE_PC}" >> /root/.bashrc

# source /root/.bashrc
bash /opt/ros/noetic/setup.bash
bash /root/catkin_ws/devel/setup.bash
export ROS_MASTER_URI=http://${IP_OF_REMOTE_PC}:11311
export ROS_HOSTNAME=${IP_OF_REMOTE_PC}