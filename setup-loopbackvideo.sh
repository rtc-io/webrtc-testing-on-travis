#!/usr/bin/env bash
sudo apt-get install -y v4l2loopback-dkms

# yes "\n" | sudo add-apt-repository -y ppa:gstreamer-developers/ppa
# sudo apt-get update --fix-missing
# sudo apt-get install -y gstreamer1.0-tools gstreamer1.0-libav gstreamer1.0-plugins-good libvpx1 libopus0

# # compile the v4l loopback driver
# git clone https://github.com/umlaeute/v4l2loopback.git
# cd v4l2loopback
# make && sudo make install

# # install vido
# mkdir -p vido
# curl -s https://codeload.github.com/g2p/vido/tar.gz/v0.3.2 | tar -xz --strip-components=1 --directory vido

# # ensure the loopback video device is loaded
# sudo modprobe v4l2loopback

# # note new video device to use below
# ls -ld /dev/video*

# # create a fake video source
# gst-launch-1.0 videotestsrc pattern=smpte100 ! v4l2sink device=/dev/video0 &