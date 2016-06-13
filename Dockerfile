FROM index.alauda.cn/alauda/ubuntu:latest
MAINTAINER kench	kench_tt@189.cn

EXPOSE 80 22

ADD sources.list /etc/apt/sources.list

ENV PUBLIC_KEY "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCljsCV9pQQNqhwGuVlzjPD1SN2F4z/mJ3+m5QTu5JzPBAvKk4gtQ0/NXXFb0UIAFipE/sRmea4iJsWi4YCWeWwup/qqPz/rC9bkROu4cfcbb3FRYPYZo5pXKe5MbyuMAm0/epesez+auP9/C/R7Hwj8Z7Ufym5jf5EMFEFVM6PaBxmpzotq+LkGjigPxA5Dc8sFKPhoq/nZBwa0UuJyorjnnEs++9q5fjCaheVy7fYqoapJBwkLgRJDHd1LKxnprd7vmEsJ6HA0R0At8DClU4CyF0oFtfvUZKfMjEH7d2ZS+Yvmcxep3DR+yNmjikHSQePNlYH2Edyth+ScgWmRSyr OpenShift-Key"

RUN apt -qqq update && \
apt -qqqy upgrade && \
apt -qqqy install openssh-server && \
echo "GatewayPorts yes" >> /etc/ssh/sshd_config && \
service ssh restart && \
mkdir -p $HOME/.ssh/ && \
echo $PUBLIC_KEY > $HOME/.ssh/authorized_keys