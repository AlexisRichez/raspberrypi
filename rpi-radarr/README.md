## Build docker image
```bash
docker build -t rpi-radarr .
```
## Run docker image on port 7878
```bash
docker run --restart always -d -p 7878:7878 rpi-radarr
```

## Run container in a shell
```bash
docker run -it rpi-radarr sh
```
