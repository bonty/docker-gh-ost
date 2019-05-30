FROM frolvlad/alpine-glibc:latest

ENV VERSION=1.0.48
ENV BUILD_DATE=20190214020851
ENV CHECKSUM=8d0a518064c5803e1d5e8676031e5a5b5b180e67700d476e19eaf68e4a4a583a

RUN apk add --update curl openssh tar \
 && curl -L https://github.com/github/gh-ost/releases/download/v${VERSION}/gh-ost-binary-linux-${BUILD_DATE}.tar.gz > gh-ost-binary-linux-${BUILD_DATE}.tar.gz \
 && echo "${CHECKSUM}  gh-ost-binary-linux-${BUILD_DATE}.tar.gz" > gh-ost-checksum \
 && sha256sum -cs gh-ost-checksum \
 && tar zxf gh-ost-binary-linux-${BUILD_DATE}.tar.gz -C /bin \
 && rm -f gh-ost-binary-linux-${BUILD_DATE}.tar.gz

ENTRYPOINT ["/bin/gh-ost"]
