FROM google/cloud-sdk:latest

RUN curl -s https://dl.google.com/go/go1.12.5.linux-amd64.tar.gz | tar -C /usr/local -xzf -
ENV PATH=$PATH:/usr/local/go/bin

ENV TZ=Asia/Tokyo

EXPOSE 8080
EXPOSE 8000