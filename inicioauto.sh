#!/bin/bash

# variables

cd /home/sisa/PROYECTOS/SISA11/

rvm use ruby-3.0.0

RAILS_ENV=development
rails s -b 0.0.0.0 -p 3000

#@reboot /bin/bash -l -c 'cd /home/sisa/PROYECTOS/SISA11 && rails s -b 0.0.0.0 -p 3000
