#bin\bash
aws s3 cp s3://dmg-shared-temp/wpm/customapp.properties .
docker build -t is-wpm:10.15 -f DockerfileWPM .
# no cache because there could be changes in other git repo's used by wpm
docker build --build-arg="SAG_TOKEN=${SAG_TOKEN}" --no-cache -t is-run:10.15 -f DockerfileRUN .