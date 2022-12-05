FROM alpine:3.15.6
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories
RUN apk add --no-cache git bash autoconf automake gcc make musl-dev pkgconfig linux-headers
WORKDIR /opt
RUN git clone https://github.com/ntop/n2n.git -b 3.0
WORKDIR /opt/n2n
RUN ./autogen.sh && ./configure && make && make install

FROM alpine:3.15.6
COPY --from=0 /usr/sbin/supernode /usr/sbin
COPY --from=0 /usr/sbin/edge /usr/sbin
CMD ["supernode","-p","9527","-f"]
