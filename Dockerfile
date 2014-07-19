FROM ubuntu
MAINTAINER Mario Mainz

# install Java runtime
RUN apt-get update
RUN apt-get install -y openjdk-7-jre-headless

# download Jenkins .war-file
ADD http://mirrors.jenkins-ci.org/war/latest/jenkins.war /opt/jenkins.war
RUN chmod 644 /opt/jenkins.war

# set Jenkins home
ENV JENKINS_HOME /jenkins

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/opt/jenkins.war"]
