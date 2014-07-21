FROM ubuntu
MAINTAINER Mario Mainz

# install Java 7 runtime and HTTPS transport
RUN apt-get update
RUN apt-get install -y apt-transport-https openjdk-7-jre-headless

# add Docker repository key to local keychain, add repository to sources list and install docker
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
RUN sudo sh -c "echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
RUN apt-get update
RUN apt-get install -y lxc-docker

# download Jenkins .war-file
ADD http://mirrors.jenkins-ci.org/war/latest/jenkins.war /opt/jenkins.war
RUN chmod 644 /opt/jenkins.war

# set Jenkins home
ENV JENKINS_HOME /jenkins

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/opt/jenkins.war"]
