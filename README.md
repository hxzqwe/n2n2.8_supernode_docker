# N2N v2.8 Docker Image (Image based on Alpine)
## About the project

This Docker image can be found in my [Docker Hub repository](https://hub.docker.com/r/hxzqwe/n2n). 

## How to use

### Setup up a supernode

```sh
git clone https://github.com/hxzqwe/n2n_v2.8_docker.git
cd n2n_v2.8_docker
docker build -t n2n:2.8 .
docker run -d --name n2n_supernode -p 9527:9527/udp n2n:2.8
```

### Setup up a edge

```sh
git clone https://github.com/hxzqwe/n2n_v2.8_docker.git
cd n2n_v2.8_docker
docker build -t n2n:2.8 .
docker run -d --privileged --net=host --name edge n2n:2.8 /usr/sbin/edge -c mynetwork -k mysecretpass -a 192.168.100.2 -l supernode.ntop.org:9527 -f
```
