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

## Prior Art

None of this would have been possible without the docs and code listed below:

- [Automated testing in Travis CI for WebRTC](http://lynckia.com/licode/travis-webrtc.html)

- `.travis-setup.sh` from the [web-animations-js](https://github.com/web-animations/web-animations-js) project

- Travis docs on [GUI and Headless Browsers](http://docs.travis-ci.com/user/gui-and-headless-browsers/)