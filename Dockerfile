FROM jpetazzo/dind
MAINTAINER Mario Mainz

# install Java 7 runtime and HTTPS transport
RUN apt-get update
RUN apt-get install -y openjdk-7-jre-headless

# download Jenkins .war-file
ADD jenkins.war /opt/jenkins.war
RUN chmod 644 /opt/jenkins.war

# set Jenkins home
ENV JENKINS_HOME /jenkins

EXPOSE 8080
ENV PORT 2375
ENV DOCKER_HOST tcp://127.0.0.1:2375
ADD startup.sh startup.sh
CMD ["./startup.sh"]
