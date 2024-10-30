FROM alpine

MAINTAINER alpine_sshd

RUN echo "http://mirrors.aliyun.com/alpine/latest-stable/main/" > /etc/apk/repositories
RUN echo "http://mirrors.aliyun.com/alpine/latest-stable/community/" >> /etc/apk/repositories
RUN apk update
RUN apk add --no-cache openssh tzdata
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN sed -i "s/#\?PermitRootLogin.*/PermitRootLogin yes/g" /etc/ssh/sshd_config
RUN sed -i "s/#\?AllowAgentForwarding.*/AllowAgentForwarding yes/g" /etc/ssh/sshd_config
RUN sed -i "s/#\?AllowTcpForwarding.*/AllowTcpForwarding yes/g" /etc/ssh/sshd_config
RUN sed -i "s/#\?GatewayPorts.*/GatewayPorts yes/g" /etc/ssh/sshd_config
RUN sed -i "s/#\?PermitTunnel.*/PermitTunnel yes/g" /etc/ssh/sshd_config

RUN ssh-keygen -t dsa -P "" -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -t rsa -P "" -f /etc/ssh/ssh_host_rsa_key
RUN ssh-keygen -t ecdsa -P "" -f /etc/ssh/ssh_host_ecdsa_key
RUN ssh-keygen -t ed25519 -P "" -f /etc/ssh/ssh_host_ed25519_key

RUN mkdir ~/.ssh
RUN echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCPhV+VAUKWWGrS5+D+K4iUMBZfJRewxTBTqZwXHe4ZsMLEnq1wH+D08toAECSKiiiq7mKSoRhk/WKZ6j7c85e4sV/syMFOI00bxqysdUixugz9zzcAF30OXyNNzT/9dUVLKgqpfn6GZV93yo4T6qrWmII4Rk/Q1FJHzPdojzbiOiC/Xflv8zlFmPUtTr+UtTiSnYyNs9JLv6rZF95tMcYjVRndmbCNf21k9LQiQ1vlNUPR4n29gVPx88inCuRwmY7jXBTX2J96cA4Nrujv6GpDwzHGL1uhIEH/2LCYCqqOvbf31fP74xZYL/LYy98zFtK6Ny7mKPoy8hNCj8o6zInx 1" >> ~/.ssh/authorized_keys

RUN echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDhtDtW9/xbsTn2fg5pF8EO6GF4m5EtQ7AMVnD0g8vjE5X65XaFg1cmBkhRkuw0oVn6jgdIpnp9/Lpv+NRmTcBlVQlWxC1RXRzio7CWLgdz5uG6IT3akvTWwXzDdoCq9yqY7Zz3/Tp5acQXtIvi37uM5Ibdw7pm25zxPR7iQN0jf+asp78z7tBQ+CkbC+jOeBGXDt9jgL8NPgkJT+uCwlYQCnqM9nNIlnph+utUqm/FyNkQlouQJ8Pc3qd8l2Ae5+yS02TlOcG6mqTxp4sb2TorfMmASmsWHLdirB2WUiN5Jj8m+GmmOIH6kwR/moDgpFTS92FsB/7GTl59rrz7t/fTbSMkRCAsJ9uMwtMU0vB9sjQxjPWNMsQVytLl/Dl20vqdFRN+sXDMtxH6L+/FhFzOHaXtafZzmez71NNhX1GoS4zh6SKHOeIQZzWsWuBA63JSPPAwgDCP4/aidtxy3Qe+QKWcc+1W/GadsRN63z2dsN1BcQQ+eTQ58UKQ4mvELms= 2" >> ~/.ssh/authorized_keys

EXPOSE 22
EXPOSE 20000
EXPOSE 20001
EXPOSE 20002
EXPOSE 20003
EXPOSE 20004
EXPOSE 20005
EXPOSE 20006 
EXPOSE 20007 
EXPOSE 20010


CMD ["/usr/sbin/sshd", "-D"]
