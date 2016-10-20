#!/bin/bash

## Install rvm
#gpg --keyserver hkp://keys.gnupg.net --recv-keys BF04FF17
sudo gpg --keyserver hkp://keys.gnupg.net:80 --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable

source ~/.rvm/scripts/rvm
rvm install ruby-2.1.0

## Install thingspeak
git clone https://github.com/iobridge/thingspeak.git
cd thingspeak
gem install minitest -v '4.7.5'
gem install json -v '1.8.1'
bundle install
cp config/database.yml.example config/database.yml
rake db:create
rake db:schema:load
rails server
