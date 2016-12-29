FROM ruby:2.3.1

# install socat to proxy SSH traffic for private repos
RUN apt-get update && apt-get install -y socat apt-transport-https && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && rm -fr *Release* *Sources* *Packages* && \
    truncate -s 0 /var/log/*log

# Throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1
# Don't use any gems installed into the system. This makes the gem tree standalone
RUN bundle config --global disable_shared_gems 1

# Add Githubs public keys into known_hosts
RUN mkdir $HOME/.ssh && touch /root/.ssh/known_hosts && ssh-keyscan github.com >> /root/.ssh/known_hosts

# https://github.com/ministryofjustice/docker-templates/issues/37
# UTF 8 issue during bundle install
ENV LC_ALL C.UTF-8

# Add application user
ENV APPUSER moj
RUN adduser $APPUSER --home /usr/src/app --shell /bin/bash --disabled-password --gecos ""


# SSH proxy settings
ENV SSH_AUTH_SOCK /tmp/ssh-auth
ENV SSH_AUTH_PROXY_PORT 1234

RUN mkdir -p /usr/src/app
RUN bundle config --global without test:development
WORKDIR /usr/src/app

ONBUILD COPY Gemfile /usr/src/app/
ONBUILD COPY Gemfile.lock /usr/src/app/

# Hack to install private gems
ONBUILD RUN socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork TCP4:$(ip route|awk '/default/ {print $3}'):$SSH_AUTH_PROXY_PORT & bundle install

ONBUILD COPY . /usr/src/app
ONBUILD RUN mkdir -p /usr/src/app/public/assets

CMD ["bundle", "exec"]