FROM ubuntu:16.04

RUN sed -i 's+http://archive.ubuntu.com/ubuntu/+http://mirrors.aliyun.com/ubuntu/+g' /etc/apt/sources.list
RUN sed -i 's+deb http://security.ubuntu.com/ubuntu/+#deb http://security.ubuntu.com/ubuntu/+g' /etc/apt/sources.list
RUN apt-get update && apt-get install -y autoconf automake gcc make pkg-config git
WORKDIR /usr/local/src/
RUN git clone https://github.com/ntop/n2n.git -b 2.8-stable
WORKDIR /usr/local/src/n2n
RUN ./autogen.sh && ./configure && make && make install

FROM ubuntu:16.04
COPY --from=0 /usr/sbin/supernode /usr/sbin
COPY --from=0 /usr/sbin/edge /usr/sbin
CMD ["/usr/sbin/supernode","-l","9527"]
