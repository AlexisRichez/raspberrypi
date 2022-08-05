# Fetch base image
FROM debian:stretch
# Update packages
RUN apt-get update && apt-get upgrade -y && apt-get install -yqq curl

# Install Mono
RUN apt install apt-transport-https dirmngr gnupg ca-certificates
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb https://download.mono-project.com/repo/debian stable-buster main" | sudo tee /etc/apt/sources.list.d/mono-official-stable.list
RUN apt update
RUN apt install mono-complete -y

# Install Radarr
RUN mkdir /opt/downloaders
RUN useradd -d /opt/downloaders dluser
RUN curl -sL "https://radarr.servarr.com/v1/update/nightly/updatefile?os=linux&runtime=netcore&arch=arm64" -o /tmp/Radarr.tgz
RUN tar xvzf /tmp/Radarr.tgz -C /opt/downloaders/
RUN mv /opt/downloaders/Radarr /opt/downloaders/radarr
RUN chown -R dluser:dluser /opt/downloaders/sonarr
COPY radarr.service /etc/systemd/system/radarr.service
RUN systemctl enable radarr.service
