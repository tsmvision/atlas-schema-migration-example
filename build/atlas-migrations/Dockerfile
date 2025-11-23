FROM ubuntu:latest

WORKDIR /app

COPY migrations migrations
COPY atlas.hcl .
COPY migration-script.sh .

RUN chmod +x ./migration-script.sh

# install atlas
RUN apt-get update -y \
    && apt-get upgrade -y  \
    && apt-get install curl -y  \
    && apt-get install postgresql-client -y \
    && curl -sSf https://atlasgo.sh | sh -s -- -y

#CMD ["migrate", "apply"]
ENTRYPOINT ["tail", "-f", "/dev/null"]
#ENTRYPOINT ["./migration-script.sh"]
#CMD ["/bin/sh", "-c", "while :; do sleep 3600; done"]
