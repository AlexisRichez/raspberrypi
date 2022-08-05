# Fetch base image
FROM debian:stretch
# Update packages
RUN apt-get update && apt-get upgrade -y && apt-get install -yqq curl gnupg gnupg2 gnupg1 

# Install Mono
RUN apt-get update -q
RUN apt-get -y -q install wget
RUN wget http://download.mono-project.com/repo/xamarin.gpg
RUN apt-key add xamarin.gpg
RUN rm xamarin.gpg
RUN echo "deb http://download.mono-project.com/repo/debian wheezy main" > /etc/apt/sources.list.d/mono-xamarin.list
RUN apt-get update -q
RUN apt-get -y -q install mono-complete

# Install Radarr
RUN mkdir /opt/downloaders
RUN useradd -d /opt/downloaders dluser
RUN curl -sL "https://radarr.servarr.com/v1/update/nightly/updatefile?os=linux&runtime=netcore&arch=arm64" -o /tmp/Radarr.tgz
RUN tar xvzf /tmp/Radarr.tgz -C /opt/downloaders/
RUN mv /opt/downloaders/Radarr /opt/downloaders/radarr
RUN chown -R dluser:dluser /opt/downloaders/sonarr
COPY radarr.service /etc/systemd/system/radarr.service
RUN systemctl enable radarr.service
