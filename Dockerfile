FROM nginx:1.17.3
MAINTAINER Keith Gable <keith@art19.com>, James Jelinek <james@art19.com>

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update -qq && \
    apt-get -y install wget runit unzip && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://releases.hashicorp.com/consul-template/0.21.0/consul-template_0.21.0_linux_amd64.zip
RUN unzip -d /usr/local/bin consul-template_0.21.0_linux_amd64.zip

COPY nginx.service /etc/service/nginx/run
COPY consul-template.service /etc/service/consul-template/run

RUN mkdir /etc/consul-template && chmod +x /etc/service/nginx/run && chmod +x /etc/service/consul-template/run

CMD ["/usr/bin/runsvdir", "/etc/service"]
