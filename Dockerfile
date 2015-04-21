# Pull base image.
FROM google/dart

MAINTAINER Victor Gonzalez <victor+dockerfile@tok3n.com>

# dockerfile/python
# Install Python.
RUN \
  apt-get update && \
  apt-get install -y python python-dev python-pip python-virtualenv && \
  rm -rf /var/lib/apt/lists/*

# dockerfile/nodejs
# Install Node.js
RUN \
  cd /tmp && \
  apt-get update && \
  apt-get install -y wget && \
  wget http://nodejs.org/dist/node-latest.tar.gz && \
  tar xvzf node-latest.tar.gz && \
  rm -f node-latest.tar.gz && \
  cd node-v* && \
  ./configure && \
  CXX="g++ -Wno-unused-local-typedefs" make && \
  CXX="g++ -Wno-unused-local-typedefs" make install && \
  cd /tmp && \
  rm -rf /tmp/node-v* && \
  npm install -g npm && \
  printf '\n# Node.js\nexport PATH="node_modules/.bin:$PATH"' >> /root/.bashrc

# dockerfile/nodejs-bower-grunt
# Install Bower & Grunt
RUN npm install -g bower grunt-cli

# dockerfile/nodejs-bower-grunt
# Install Ruby.
RUN \
  apt-get update && \
  apt-get install -y ruby ruby-dev && \
  gem install bundler && \
  rm -rf /var/lib/apt/lists/*

# Compiler specific
RUN \
  # Change policy for rsync (http://askubuntu.com/questions/365911/why-the-services-do-not-start-at-installation)
  echo $'#!/bin/sh\nexit 0' > /usr/sbin/policy-rc.d && \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends rsync curl

# Define working directory.
WORKDIR /data/Cloud_Main/Modules/default

# Define default command.
CMD ["bash"]