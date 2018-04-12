FROM rhel7

#Inclusion de herramientas JAVA
RUN yum -y remove java
RUN yum install -y java-1.7.0-openjdk-devel
RUN yum clean all

#RUN echo "JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:jre/bin/java::")" | tee -a /etc/profile
#RUN echo "JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk-1.7.0.75-2.5.4.2.el7_0.x86_64/" >> /etc/profile
#RUN source /etc/profile

#Inclusion de herramientas MAVEN

ADD ./Maven/3.0.3/apache-maven-3.0.3-bin.tar.gz /opt/
#RUN tar -zxvf /opt/apache-maven-3.0.3-bin.tar.gz
#RUN mv apache-maven-3.0.3 /opt
RUN chown -R jenkins:jenkins /opt/apache-maven-3.0.3
RUN ln -s /opt/apache-maven-3.0.3 /opt/apache-maven
RUN ln -s /opt/apache-maven-3.0.3/bin/mvn /usr/local/bin/mvn
ADD ./Maven/3.0.3/settings.xml /opt/apache-maven/conf/settings.xml
#RUN echo "PATH=$PATH:/opt/apache-maven/bin" >> $HOME/.bashrc
ENV JAVA_HOME="/usr/lib/jvm/java-1.7.0-openjdk-1.7.0.75-2.5.4.2.el7_0.x86_64/"
ENV MAVEN_HOME="/opt/apache-maven/"
ENV SCRIPTS_DEVOPS="/home/jenkins/scripts/DEVOPS/"
ENV SCRIPTS_CI="/home/jenkins/scripts/CI/"
ENV SCRIPTS_SQA="/home/jenkins/scripts/SQA/"
ENV JH="/home/jenkins/jenkins_home/"

#Configuracion Git
RUN git config --global user.name "Jenkins Slave"
RUN git config --global user.email jenkins_slave@integration.com

#Inclusion de scripts de ejecucion
ADD ./scripts /home/jenkins/scripts
ADD ./slave.jar /home/jenkins/
RUN chmod 755 -R /home/jenkins/scripts/*
RUN chown -R jenkins:jenkins /home/jenkins/*
RUN ssh-keygen -A

#Inclusion de path a usuario jenkins
RUN su jenkins
#RUN echo "PATH=$PATH:/opt/apache-maven/bin" >> $HOME/.bashrc
ENV JAVA_HOME="/usr/lib/jvm/java-1.7.0-openjdk-1.7.0.75-2.5.4.2.el7_0.x86_64/"
ENV MAVEN_HOME="/opt/apache-maven/"
ENV SCRIPTS_DEVOPS="/home/jenkins/scripts/DEVOPS/"
ENV SCRIPTS_CI="/home/jenkins/scripts/CI/"
ENV SCRIPTS_SQA="/home/jenkins/scripts/SQA/"
ENV JH="/home/jenkins/jenkins_home/"
RUN exit

RUN java -jar slave.jar -jnlpUrl http://192.168.2.127:8080/computer/jenkins-slave/slave-agent.jnlp -secret 05d9f81216df782f70cef38ff2ae25030c18188c27a36e6cea138ab3b6b14048 &
