#!/usr/bin/env bash
yes "\n" | sudo add-apt-repository -y ppa:gstreamer-developers/ppa
sudo apt-get update --fix-missing
sudo apt-get install gstreamer1.0 gst-plugins-good1.0 libvpx opus

# compile the v4l loopback driver
git clone https://github.com/umlaeute/v4l2loopback.git
cd v4l2loopback
make && sudo make install

# ensure the loopback video device is loaded
sudo modprobe v4l2loopback

# note new video device to use below
ls -ld /dev/video*

# create a fake video source
gst-launch-1.0 videotestsrc pattern=smpte100 ! v4l2sink device=/dev/video0 &