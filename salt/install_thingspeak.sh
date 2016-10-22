#!/bin/bash
set -x
## Install rvm
gpg --keyserver hkp://keys.gnupg.net:80 --recv-keys BF04FF17
gpg --keyserver hkp://keys.gnupg.net:80 --recv-keys D39DC0E3


## Install thingspeak
bundle install
/srv/salt/patch_zentest.sh
#bundel install
cp config/database.yml.example config/database.yml
rake db:create
rake db:schema:load
#rails server
