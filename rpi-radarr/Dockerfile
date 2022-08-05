# Fetch base image
FROM mono:latest
# Update packages
RUN apt-get update && apt-get upgrade -y && apt-get install -yqq curl

# Install Radarr
RUN mkdir /opt/downloaders
RUN useradd -d /opt/downloaders dluser
RUN curl -sL "https://radarr.servarr.com/v1/update/nightly/updatefile?os=linux&runtime=netcore&arch=arm64" -o /tmp/Radarr.tgz
RUN tar xvzf /tmp/Radarr.tgz -C /opt/downloaders/
RUN mv /opt/downloaders/Radarr /opt/downloaders/radarr
RUN chown -R dluser:dluser /opt/downloaders/sonarr
COPY radarr.service /etc/systemd/system/radarr.service
RUN systemctl enable radarr.service
