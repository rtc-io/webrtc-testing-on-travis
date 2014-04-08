# Testing WebRTC

This is a set of scripts designed to help you get up and running testing WebRTC applications on [travis](http://travis-ci.org). The scripts themselves are designed to be fetched during a travis `before_install` process and used to prepare your environment.

## Usage

First, create a `.travis.yml` folder in your project that looks similar to the followng:

```yaml
language: node_js
node_js:
- 0.10

env:
  matrix:
    - BROWSER=chrome  BVER=stable
    - BROWSER=chrome  BVER=beta
    - BROWSER=chrome  BVER=unstable
    - BROWSER=firefox BVER=stable
    - BROWSER=firefox BVER=beta
    - BROWSER=firefox BVER=aurora

before_install:
  - mkdir -p .travis
  - curl -s https://codeload.github.com/DamonOehlman/webrtc-testing-on-travis/tar.gz/master | tar -xz --strip-components=1 --directory .travis
  - ./.travis/setup.sh
  - export DISPLAY=:99.0
  - sh -e /etc/init.d/xvfb start
```

The most interesting part of the configuration file above is definitely the [`before_install`](http://docs.travis-ci.com/user/build-configuration/#before_install) section which defines a number of commands that will be executed in the TRAVIS environment prior to running the language appropriate `install` command.

The commands above are used to pull down the contents of this repository into a `.travis` within the travis build environment.  Once this is completed, the `./travis/setup.sh` command is run which will knows how to provision a browser based on a `BROWSER` (specifying the browser name) and `BVER` which defines the version to test.  This script is an only very slightly modified version of the [.travis-setup.sh](https://github.com/web-animations/web-animations-js/blob/master/.travis-setup.sh) script written by [@mithro](https://github.com/mithro).

## Prior Art

None of this would have been possible without the docs and code listed below:

- [Automated testing in Travis CI for WebRTC](http://lynckia.com/licode/travis-webrtc.html)

- `.travis-setup.sh` from the [web-animations-js](https://github.com/web-animations/web-animations-js) project

- Travis docs on [GUI and Headless Browsers](http://docs.travis-ci.com/user/gui-and-headless-browsers/)