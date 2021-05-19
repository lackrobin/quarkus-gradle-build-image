FROM gradle:6.8.3-jdk11

run apt-get update
run apt-get install docker.io -y

run docker --version


