FROM debian:latest

RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y wget

ENTRYPOINT [ "wget" ]

CMD [ "https://en.wikipedia.org/wiki/Kubernetes", "-P", "/data" ]