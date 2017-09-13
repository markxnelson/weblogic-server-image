FROM store/oracle/weblogic:12.2.1.2
USER root
RUN yum -y install sudo nc tar gunzip
RUN curl -o /tmp/maven.tar.gz http://mirror.cogentco.com/pub/apache/maven/maven-3/3.5.0/binaries/apache-maven-3.5.0-bin.tar.gz
RUN tar xzvf /tmp/maven.tar.gz -C /u01/oracle
COPY createDomain.sh /u01/oracle/createDomain.sh
COPY entrypoint.sh /u01/oracle/entrypoint.sh
COPY .bashrc /root/.bashrc
ENTRYPOINT /bin/bash
