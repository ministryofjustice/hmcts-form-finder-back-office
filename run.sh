#!/bin/bash

cd ${APP_HOME:-/rails}

case ${DOCKER_STATE} in
migrate)
    echo "running migrate"
    bundle exec rake db:migrate
    ;;
seed)
    echo "running seed"
    bundle exec rake db:migrate && \
    bundle exec rake db:seed
    ;;
vagrant)
    echo "running vagrant"
    bundle exec rake db:create
    bundle exec rake db:migrate
    bundle exec rake db:seed
    ;;
create)
    echo "running create"
    bundle exec rake db:create && \
    bundle exec rake db:migrate && \
    bundle exec rake db:seed
    ;;
setup)
    echo 'running setup'
    bundle exec rake db:setup
    ;;
esac
bundle exec puma -p $APP_PORT -C ./config/puma.rb
