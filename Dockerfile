FROM ubuntu:latest

RUN apt-get update && apt-get install -y apache2
RUN apt-get update && apt-get install -y wget gnupg2
RUN wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | apt-key add -
RUN sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
RUN apt-get update && apt-get install -y jenkins

EXPOSE 80
EXPOSE 8080

CMD service apache2 start && service jenkins start
