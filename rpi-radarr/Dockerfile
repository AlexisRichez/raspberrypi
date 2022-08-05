# Fetch base image
FROM debian:buster-slim
# Update packages
RUN apt-get update && apt-get upgrade -y && apt-get install -yqq curl systemd dirmngr gnupg apt-transport-https ca-certificates


RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN sh -c 'echo "deb https://download.mono-project.com/repo/debian stable-buster main" > /etc/apt/sources.list.d/mono-official-stable.list'
RUN apt-get update
RUN apt-get install -yqq mono-complete 

# Install Radarr
RUN mkdir /opt/downloaders
RUN useradd -d /opt/downloaders dluser
RUN curl -sL "http://radarr.servarr.com/v1/update/master/updatefile?os=linux&runtime=netcore&arch=x64" -o /tmp/Radarr.tgz
RUN tar xvzf /tmp/Radarr.tgz -C /opt/downloaders/
RUN mv /opt/downloaders/Radarr /opt/downloaders/radarr
RUN chown -R dluser:dluser /opt/downloaders/radarr
#COPY radarr.service /etc/systemd/system/radarr.service
