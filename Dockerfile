FROM store/oracle/weblogic:12.2.1.2
USER root
RUN yum -y install sudo 
COPY createDomain.sh /u01/oracle/createDomain.sh
ENTRYPOINT /u01/oracle/createDomain.sh
