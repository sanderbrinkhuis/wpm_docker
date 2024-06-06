#bin\bash

# login to sag repo
# echo <password> | docker login --password-stdin --username sander-brinkhuis-inqdo-com sagcr.azurecr.io
# export SAG_TOKEN=<token> in ~/.bashrc 
# source ~/.bashrc
echo $SAG_TOKEN
# using rancher solves an emulation issue on Mac M3 for linux/amd64
docker context use rancher-desktop

docker build -t is-wpm:10.15 -f DockerfileWPM . --platform=linux/amd64
# no cache because there could be changes in other git repo's used by wpm
docker build --build-arg="SAG_TOKEN=${SAG_TOKEN}" --no-cache -t is-run:10.15 -f DockerfileRUN . --platform=linux/amd64

# docker run -d --name is -p 5556:5555 -v /Users/lennertbrinkhuis/WmGits/wpm_docker/customapp.properties:/opt/data/customapp.properties -e SAG_IS_CONFIG_PROPERTIES=/opt/data/customapp.properties is-run:10.15
