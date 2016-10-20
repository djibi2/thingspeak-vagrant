thingspeak-deps:
  pkg.installed:
  - pkgs:
    - build-essential
    - mysql-server
    - mysql-client
    - libmysqlclient-dev
    - libxml2-dev
    - libxslt-dev
    - git-core
    - curl
    - ruby
    - ruby-bundler
    - git
    - ruby-dev
    - rails

install_minitest:
  gem.installed:
    - name: minitest
    - version: '4.7.5'

install_json:
  gem.installed:
    - name: json
    - version: 1.8.1

https://github.com/iobridge/thingspeak.git:
  git.latest:
    - target: /home/vagrant/repos/thingspeak
    - user: vagrant
    - require:
      - thingspeak-deps

thinkspeak-install:
  cmd.script:
    - source: salt://install_thingspeak.sh
    - cwd: /home/vagrant/repos/thingspeak
    - user: vagrant
    - loglevel: debug
    - require:
      - 'https://github.com/iobridge/thingspeak.git'
      - install_minitest
      - install_json
