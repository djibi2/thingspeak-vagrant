#!/bin/bash

#Fix invalid version fromat in ZenTest
sudo sed -i  s'/"< 3.0, >= 1.8"/"< 3.0"," >= 1.8"/g' /var/lib/gems/1.9.1/specifications/ZenTest-4.11.0.gemspec
