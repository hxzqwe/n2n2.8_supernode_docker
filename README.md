# How to use

```
git clone https://github.com/hxzqwe/n2n2.8_supernode_docker.git
cd n2n2.8_supernode_docker
docker build -t n2n_supernode:2.8 .
docker run -d --name n2n_supernode -p 9527:9527/udp n2n_supernode:2.8
```
