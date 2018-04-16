FROM xva_slave

RUN java -jar slave.jar -jnlpUrl http://192.168.2.127:8080/computer/jenkins-slave/slave-agent.jnlp -secret 05d9f81216df782f70cef38ff2ae25030c18188c27a36e6cea138ab3b6b14048 &
