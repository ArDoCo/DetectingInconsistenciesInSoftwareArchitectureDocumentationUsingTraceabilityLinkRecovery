FROM ubuntu:22.04
RUN apt-get update && apt-get install openjdk-17-jdk python3.10 maven vim nano curl -y
WORKDIR /eval
COPY . .
