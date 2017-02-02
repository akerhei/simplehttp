FROM ubuntu

RUN apt-get update && apt-get install -y \
    vim \
    python \
    curl && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 3000

RUN groupadd -r webapp \
  && useradd -r -g webapp webapp

VOLUME /webapp

ADD webapp/ /webapp/
RUN chown -R webapp:webapp /webapp

USER webapp
WORKDIR /webapp/
CMD ["python", "httpserver.py"]
