FROM jenkins/jenkins:2.486-jdk17
USER root
ENV JENKINS_HOME /var/jenkins_home
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
ENV TZ Asia/Shanghai
ENV JENKINS_ADMIN_ID admin
ENV JENKINS_ADMIN_PASSWORD admin123

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
#RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt

COPY casc.yaml /usr/local/jenkins-casc.yaml
ENV CASC_JENKINS_CONFIG /usr/local/jenkins-casc.yaml

RUN echo "  StrictHostKeyChecking no" >> /etc/ssh/ssh_config
