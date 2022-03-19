FROM ubuntu:20.04

RUN rm /bin/sh && ln -s /bin/bash /bin/sh  # Change default to shell to bash

WORKDIR /root/

RUN apt update
RUN apt -y upgrade

# 2) Install some software on remote pc
RUN apt -y install vim net-tools openssh-server curl

# for apt-key add
RUN apt -y install gnupg

# 3) Setup Network -> using .env file

# 4) Update Ubuntu Software
RUN apt update
RUN apt -y upgrade

# Copy install commands
COPY 1_install_ros.sh /root/1_install_ros.sh
COPY 2_install_turtlebot.sh /root/2_install_turtlebot.sh
COPY 3_clone_turtlebot.sh /root/3_clone_turtlebot.sh
COPY 4_make.sh /root/4_make.sh

RUN chmod 755 /root/1_install_ros.sh
RUN chmod 755 /root/2_install_turtlebot.sh
RUN chmod 755 /root/3_clone_turtlebot.sh
RUN chmod 755 /root/4_make.sh

# 5) Install ROS 1
# @@@ move to 1_install_ros.sh @@@
# RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
# RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -
# RUN apt update
# RUN apt -y install ros-noetic-desktop-full

# # RUN source /opt/ros/noetic/setup.bash
# RUN bash /opt/ros/noetic/setup.bash
# RUN echo "source /opt/ros/noetic/setup.bash" >> /root/.bashrc
# # RUN source /root/.bashrc

# RUN apt -y install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
# RUN apt -y install python3-rosdep
# RUN rosdep init
# RUN rosdep update

# # 6) Install TurtleBot 3 ROS 1 package & 7) Create workspace and download turtlebot 3 package
# RUN wget https://raw.githubusercontent.com/ROBOTIS-GIT/robotis_tools/master/install_ros_noetic.sh
# RUN chmod 755 ./install_ros_noetic.sh
# RUN bash ./install_ros_noetic.sh

# RUN apt -y install ros-noetic-joy ros-noetic-teleop-twist-joy \
#   ros-noetic-teleop-twist-keyboard ros-noetic-laser-proc \
#   ros-noetic-rgbd-launch ros-noetic-rosserial-arduino \
#   ros-noetic-rosserial-python ros-noetic-rosserial-client \
#   ros-noetic-rosserial-msgs ros-noetic-amcl ros-noetic-map-server \
#   ros-noetic-move-base ros-noetic-urdf ros-noetic-xacro \
#   ros-noetic-compressed-image-transport ros-noetic-rqt* ros-noetic-rviz \
#   ros-noetic-gmapping ros-noetic-navigation ros-noetic-interactive-markers

# RUN apt -y install ros-noetic-dynamixel-sdk ros-noetic-turtlebot3-msgs ros-noetic-turtlebot3

# RUN apt update
# RUN apt -y upgrade
# RUN apt -y autoremove

# RUN mkdir -p /root/catkin_ws/src
# @@@ move to 1_install_ros.sh @@@
RUN /root/1_install_ros.sh
WORKDIR /root/catkin_ws/
# @@@ move to 2_install_turtlebot.sh @@@
# # RUN echo ${PATH}
# RUN export PATH=/opt/ros/noetic/bin:${PATH}
# RUN export PYTHONPATH=/opt/ros/noetic/lib/python3/dist-packages
# # RUN catkin_make
# RUN /opt/ros/noetic/bin/catkin_make

# # 8) Set ROS_MASTER_URI and ROS_HOSTNAME in .bashrc
# RUN echo "source /opt/ros/noetic/setup.bash \
#     source /root/catkin_ws/devel/setup.bash \
#     export ROS_MASTER_URI=http://${IP_OF_REMOTE_PC}:11311 \
#     export ROS_HOSTNAME=${IP_OF_REMOTE_PC}" >> /root/.bashrc

# # RUN source /root/.bashrc
# RUN bash /opt/ros/noetic/setup.bash
# RUN bash /root/catkin_ws/devel/setup.bash
# RUN export ROS_MASTER_URI=http://${IP_OF_REMOTE_PC}:11311
# RUN export ROS_HOSTNAME=${IP_OF_REMOTE_PC}
# @@@ move to 2_install_turtlebot.sh @@@
RUN /root/2_install_turtlebot.sh

WORKDIR /root/catkin_ws/src/
# @@@ move to 3_clone_turtlebot.sh @@@
# # 9) Download turtlebot3 package
# WORKDIR /root/catkin_ws/src/
# RUN git clone https://github.com/ROBOTIS-GIT/turtlebot3_msgs.git
# RUN git clone https://github.com/ROBOTIS-GIT/turtlebot3.git
# @@@ move to 3_clone_turtlebot.sh @@@
RUN /root/3_clone_turtlebot.sh
WORKDIR /root/catkin_ws/

# @@@ move to 4_make.sh @@@
# RUN catkin_make
# RUN /opt/ros/noetic/bin/catkin_make
# @@@ move to 4_make.sh @@@
# RUN /root/4_make.sh

# 10) open ~/.bashrc and add the following to the end
RUN echo "export TURTLEBOT3_MODEL=waffle_pi" >> /root/.bashrc
# RUN source /root/.bashrc

WORKDIR /root/

ENTRYPOINT tail -f /dev/null


# /opt/ros/noetic/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
# /opt/ros/noetic/bin:/usr/local/sbin:/usr/local/bin:/usr/sb

# /opt/ros/noetic/lib/python3/dist-packages