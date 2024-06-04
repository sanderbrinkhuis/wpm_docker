#bin\bash
docker build -t is-wpm:10.15 -f DockerfileWPM .
# no cache because there could be changes in other git repo's used by wpm
docker build --no-cache -t is-run:10.15 -f DockerfileRUN .