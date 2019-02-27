FROM ubuntu
MAINTAINER anonymous
RUN apt-get update && apt-get install -y tor nmap proxychains
ENTRYPOINT service tor start && bash
