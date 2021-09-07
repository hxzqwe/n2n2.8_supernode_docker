FROM alpine:3.13.6
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories
RUN apk add --no-cache git bash autoconf automake gcc make musl-dev pkgconfig linux-headers
WORKDIR /opt
RUN git clone https://github.com/ntop/n2n.git -b 2.8-stable
WORKDIR /opt/n2n
RUN ./autogen.sh && ./configure && make && make install

FROM alpine:3.13.6
COPY --from=0 /usr/sbin/supernode /usr/sbin
COPY --from=0 /usr/sbin/edge /usr/sbin
CMD ["/usr/sbin/supernode","-l","9527"]
