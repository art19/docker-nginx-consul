[![Build Status](https://travis-ci.org/art19/docker-nginx-consul.svg?branch=master)](https://travis-ci.org/art19/docker-nginx-consul)
[![Docker Stars](https://img.shields.io/docker/stars/art19/nginx-consul.svg)](https://hub.docker.com/r/art19/nginx-consul/)
[![Docker Pulls](https://img.shields.io/docker/pulls/art19/nginx-consul.svg)](https://hub.docker.com/r/art19/nginx-consul/)

# Supported tags and respective Dockerfile links

- [`latest`](https://github.com/art19/docker-nginx-consul/blob/master/Dockerfile), [`1.11.9_0.14.0`](https://github.com/art19/docker-nginx-consul/blob/1.11.9_0.14.0/Dockerfile)
- [`stable`](https://github.com/art19/docker-nginx-consul/blob/stable/Dockerfile), [`1.10.0_0.14.0`](https://github.com/art19/docker-nginx-consul/blob/1.10.0_0.14.0/Dockerfile)

# Nginx with Consul Template

This Docker image follows official Nginx image extended with Consul Template to allow to refresh configuration based on the changes in Consul repository

# How-to

Create your data volume image and place required configuration files based on the following matrix:

* /etc/nginx/conf.d -> nginx configuration
* /etc/consul-template/conf -> Consul Template configurations taken and merged alphabetically - https://github.com/hashicorp/consul-template
* /etc/consul-template/templates -> a good place to situate your templates defined in the configuration

# Run

```
docker run --rm --volumes-from=yourdata-image -ti art19/nginx-consul
```
