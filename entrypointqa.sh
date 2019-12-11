#!/bin/bash
cd /usr/src/app/demo
bundle install
./bin/rails db:migrate
./bin/rails assets:precompile
./bin/rails server -p 3000 -e production -b 0.0.0.0