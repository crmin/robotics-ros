# CSE469 Robotics ROS

처음 실행 후
`~/.bashrc` 파일을 열어서 다음 변수의 값에서 localhost를 host ip로 수정해야 합니다.
```
export ROS_MASTER_URI=http://localhost:11311
export ROS_HOSTNAME=localhost
``

**주의** Docker container가 아닌 docker image를 실행하는 host pc의 ip입니다