FROM alpine:latest

ENV VERSION=1.0.47
ENV BUILD_DATE=20181016015113
ENV CHECKSUM=1b00a14d5b358efd210d5371d63d5c84f3ce35717fbb2c15a24b7248b2dede95

RUN apk add --update curl openssh tar \
 && curl -L https://github.com/github/gh-ost/releases/download/v${VERSION}/gh-ost-binary-linux-${BUILD_DATE}.tar.gz > gh-ost-binary-linux-${BUILD_DATE}.tar.gz \
 && echo "${CHECKSUM}  gh-ost-binary-linux-${BUILD_DATE}.tar.gz" > gh-ost-checksum \
 && sha256sum -cs gh-ost-checksum \
 && tar zxf gh-ost-binary-linux-${BUILD_DATE}.tar.gz -C /bin \
 && rm -f gh-ost-binary-linux-${BUILD_DATE}.tar.gz

ENTRYPOINT ["/bin/gh-ost"]
