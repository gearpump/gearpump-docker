# Docker file
FROM errordeveloper/oracle-jre

# Prepare the package
RUN curl --location   --retry 3 --insecure https://github.com/gearpump/gearpump/releases/download/0.7.5/gearpump-2.11-0.7.5.zip -o tmp.zip && unzip -q tmp.zip && rm tmp.zip && chmod +x gearpump-2.11-0.7.5/bin/*

ADD gear.conf gearpump-2.11-0.7.5/conf/gear.conf

EXPOSE 3000

EXPOSE 8090

ENTRYPOINT gearpump-2.11-0.7.5/bin/local -workernum 1 & gearpump-2.11-0.7.5/bin/services
