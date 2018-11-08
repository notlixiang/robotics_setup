#!/bin/bash


# source: https://gist.github.com/phatblat/1713458
# Save script's current directory
DIR=$(pwd)

# /bin/bash
set -e
set -u
set -x

##########################
# ROS Kinetic Kame Setup #
##########################
# To find available packages, use:
#
#     apt-cache search ros-kinetic
#
# On mac see:
#
#     https://github.com/mikepurvis/ros-install-osx/

. /etc/lsb-release # get ubuntu version number

# only install
if [ "$DISTRIB_RELEASE" = "16.04" ]; then
    # source: http://wiki.ros.org/kinetic/Installation/Ubuntu
    sudo sh -c '. /etc/lsb-release && echo "deb http://mirrors.ustc.edu.cn/ros/ubuntu/ $DISTRIB_CODENAME main" > /etc/apt/sources.list.d/ros-latest.list'
    sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

    sudo apt-get update
    sudo apt-get install ros-kinetic-desktop-full
    
    sudo rosdep init
    rosdep update
    # sudo apt-get install python-rosinstall

    # sudo apt-get install python-catkin-tools libgflags-dev

    # If using bash:
    #
    echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
    source ~/.bashrc
    sudo apt-get install python-rosinstall python-rosinstall-generator python-wstool build-essential
    #
    #

    # Add ros setup to zshrc if it isn't already present
    # LINE="source /opt/ros/kinetic/setup.zsh"
    # FILE=~/.zshrc
    # grep -q "$LINE" "$FILE" || echo "$LINE" >> "$FILE"
fi



cd $DIR

