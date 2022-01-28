#version da imagem base
FROM ubuntu:22.04
# Install pre-requisitos
RUN apt-get clean 
RUN apt-get update

ENV TZ=America/Sao_Paulo 
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get -y --fix-missing upgrade
RUN apt-get install -y wget apt-transport-https git npm

#Install required packages (for insomnia installation)
RUN apt-get install -y libcurl4-gnutls-dev libfontconfig1-dev libgtk-3-0 libxss1 libgtkextra-dev libgconf2-dev libnss3 libasound2 libxtst-dev

# Install insomnia
RUN npm i -g insomnia-inso

# Install Safira
RUN npm install -g node-gyp
RUN npm install -g @vfipaas/safira-cli

#instalação do java

RUN apt-get install openjdk-17-jre -y

