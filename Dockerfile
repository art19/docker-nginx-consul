FROM nginx:1.19.10
MAINTAINER Keith Gable <keith@art19.com>, James Jelinek <james@art19.com>

RUN DEBIAN_FRONTEND=noninteractive \
    apt-get update -qq && \
    apt-get -y install wget runit unzip && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://releases.hashicorp.com/consul-template/0.25.2/consul-template_0.25.2_linux_amd64.zip
RUN unzip -d /usr/local/bin consul-template_0.25.2_linux_amd64.zip

COPY nginx.service /etc/service/nginx/run
COPY consul-template.service /etc/service/consul-template/run

RUN mkdir /etc/consul-template && chmod +x /etc/service/nginx/run && chmod +x /etc/service/consul-template/run

CMD ["/usr/bin/runsvdir", "/etc/service"]
