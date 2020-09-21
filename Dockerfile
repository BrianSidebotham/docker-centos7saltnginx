FROM centos/systemd

WORKDIR /root

ADD ./build.sh /

RUN /build.sh 3001

# Run systemd init system as PID1
CMD [ "/sbin/init" ]
