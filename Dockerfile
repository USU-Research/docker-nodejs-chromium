FROM debian:stretch-slim

RUN apt-get update && apt-get install -y xvfb chromium procps

ADD xvfb-chromium /usr/bin/xvfb-chromium
RUN ln -s /usr/bin/xvfb-chromium /usr/bin/google-chrome
RUN ln -s /usr/bin/xvfb-chromium /usr/bin/chromium-browser

RUN apt-get update && apt-get install -y curl gnupg2

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs git && npm install -g npm@6.1.0

WORKDIR /usr/src/app

CMD npm test
