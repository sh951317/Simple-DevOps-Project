FROM eip-dev-ats-asia/is:micro

MAINTAINER francis.oregas.ext

#COPY Packages
COPY ./assets/IS/Packages/ ${SAG_HOME}/IntegrationServer/packages/


#COPY ./application.properties ${SAG_HOME}/IntegrationServer/
#COPY ./assets/IS/lib/jars/custom/util400.jar ${SAG_HOME}/IntegrationServer/lib/jars/custom/
COPY ./assets/IS/config/Caching/*.* ${SAG_HOME}/IntegrationServer/config/Caching/
COPY ./assets/IS/config/acls/*.* ${SAG_HOME}/IntegrationServer/config/
#COPY ./assets/IS/config/jdbc/function/ISCoreAudit.xml ${SAG_HOME}/IntegrationServer/config/jdbc/function/
COPY ./assets/IS/config/policy/ConsumerForTimeStampUserName.xml ${SAG_HOME}/IntegrationServer/config/policy/

RUN mkdir -p ${SAG_HOME}/IntegrationServer/config/aif/dependencies
COPY ./assets/IS/config/aif/dependencies/*.* ${SAG_HOME}/IntegrationServer/config/aif/dependencies/


RUN chgrp -R 0 ${SAG_HOME} && chmod -R g=u ${SAG_HOME}
