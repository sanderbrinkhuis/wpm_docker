#bin\bash
# login to sag repo
# echo <password> | docker login --password-stdin --username sander-brinkhuis-inqdo-com sagcr.azurecr.io

cd /mnt/sag/repos/wpm_docker/
aws s3 cp s3://dmg-shared-temp/wpm/customapp.properties .
docker build -t iswpm:10.15 -f DockerfileWPM .
# no cache because there could be changes in other git repo's used by wpm
docker build --build-arg="SAG_TOKEN=${SAG_TOKEN}" --no-cache -t isrun:10.15 -f DockerfileRUN .



# docker run -d --name is -p 5556:5555 -v /mnt/sag/repos/wpm_docker/customapp.properties:/opt/data/customapp.properties -e SAG_IS_CONFIG_PROPERTIES=/opt/data/customapp.properties is-run:10.15
