# carla_ros_bridge_docker

## Introduction
This is a Dockerfile to use [CARLA ROS bridge](https://github.com/carla-simulator/ros-bridge) on Docker container.

## Requirements
* NVIDIA graphics driver
* Docker
* nvidia-docker2

## Preparation
### Download CARLA Simulator
Please download the CARLA Simulator and addtional map file from <https://github.com/carla-simulator/carla/releases/tag/0.9.6>.  
And, please put CARLA Simulator in the same directory as the Dockerfile.  
This time, I used the following package.

- `CARLA_0.9.6.tar.gz`
- `Town06_0.9.6.tar.gz`
- `Town07_0.9.6.tar.gz`

### Build Docker image
```shell
$ docker build -t carla:0.9.6 -f Dockerfile.melodic .
```

### Create Docker container
```shell
$ ./launch_container.sh
```

## Usage
### Launch CARLA Simulator
Please launch CARLA Simulator by the following command.

```shell
$ cd CARLA_0.9.6
$ ./CarlaUE4.sh -windowed -ResX=160 -ResY=120
```

### Set the configuration of CARLA Simulator
```shell
$ cd CARLA_0.9.6/PythonAPI
$ python util/config.py -m Town03 --fps 10
```

### Launch CARLA ROS bridge
```shell
$ roslaunch carla_ros_bridge carla_ros_bridge_with_example_ego_vehicle.launch vehicle_filter:='vehicle.toyota.prius*'
```
