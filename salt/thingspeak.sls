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
    - require:
      - 'https://github.com/iobridge/thingspeak.git'
