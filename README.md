# CSE469 Robotics ROS

처음 실행 후
`~/.bashrc` 파일을 열어서 다음 변수의 값에서 localhost를 host ip로 수정해야 합니다.
```
source /opt/ros/noetic/setup.bash     source /root/catkin_ws/devel/setup.bash     export ROS_MASTER_URI=http://localhost:11311     export ROS_HOSTNAME=localhost
```
예를 들어:
```
source /opt/ros/noetic/setup.bash     source /root/catkin_ws/devel/setup.bash     export ROS_MASTER_URI=http://192.168.0.43:11311     export ROS_HOSTNAME=192.168.0.43
```

**주의** Docker container가 아닌 docker image를 실행하는 host pc의 ip입니다