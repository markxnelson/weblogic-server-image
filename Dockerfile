FROM store/oracle/weblogic:12.2.1.2
USER root
RUN yum -y install sudo 
COPY createDomain.sh /u01/oracle/createDomain.sh
COPY entrypoint.sh /u01/oracle/entrypoint.sh
ENTRYPOINT /bin/bash
