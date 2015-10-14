# Docker file
FROM errordeveloper/oracle-jre

# Prepare the package
RUN curl --location   --retry 3 --insecure https://github.com/gearpump/gearpump/releases/download/0.6.1.4/gearpump-pack-2.11.5-0.6.1.4.zip -o tmp.zip && unzip -q tmp.zip && rm tmp.zip && chmod +x gearpump-pack-2.11.5-0.6.1.4/bin/*

EXPOSE 8090

ENTRYPOINT gearpump-pack-2.11.5-0.6.1.4/bin/local & gearpump-pack-2.11.5-0.6.1.4/bin/services



