FROM ubuntu

RUN apt-get update && apt-get install -y \
    vim \
    python \
    curl && \
    rm -rf /var/lib/apt/lists/*

EXPOSE 3000

ADD webapp/ /webapp/
WORKDIR /webapp/
CMD ["python", "httpserver.py"]

