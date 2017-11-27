FROM arm32v7/debian

MAINTAINER Ondřej Záruba <info@zaruba-ondrej.cz> (https://zaruba-ondrej.cz)

# Alpine arm has problem with glibc
RUN apt-get update && apt-get -y install glibc-source findutils

#ENV GLIBC_VERSION "2.26-r0"

#RUN apk --no-cache add ca-certificates wget device-mapper findutils && \
#    #apk --no-cache add zfs --repository http://dl-3.alpinelinux.org/alpine/edge/main/ && \
#    apk --no-cache add thin-provisioning-tools --repository http://dl-3.alpinelinux.org/alpine/edge/main/ && \
#    wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master/sgerrand.rsa.pub && \
#    wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk && \
#    wget https://github.com/andyshinn/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-bin-${GLIBC_VERSION}.apk && \
#    apk add glibc-${GLIBC_VERSION}.apk glibc-bin-${GLIBC_VERSION}.apk && \
#    /usr/glibc-compat/sbin/ldconfig /lib /usr/glibc-compat/lib && \
#    echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf && \
#    rm -rf /var/cache/apk/*

# Grab cadvisor from the staging directory.
ADD cadvisor /usr/bin/cadvisor

EXPOSE 8080
ENTRYPOINT ["/usr/bin/cadvisor", "-logtostderr"]
