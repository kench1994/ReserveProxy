FROM index.alauda.cn/alauda/ubuntu:latest
MAINTAINER kench	kench_tt@189.cn

EXPOSE 80 22

ADD sources.list /etc/apt/sources.list

ENV PUBLIC_KEY "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCy1a/22Joo17Mw1ZVnVaXBhe2t3rKm75wt2gqpkTakDgBHzh0+ZtUjnnvzXRDRSpcnAXo88tXG6PAyLo5bOec6bGwjbtgQWb6f9G8gAaua2jyBUwsQMO7UFyZXykUahZVDuuadtIPMLfxhpemWNQpFsNCIcKq0L6gQaaJXqCamTn5K1B9XB0eiZDz6VAGY9sKoK+8QEd61dvJtY9ZhZKKGm5RaTWEqkHSFfBl6nnjBCaYUMX4t10uNyFG2gr0qDffT+SpTjdFiNXVjvXtlvsq1SEwwvP81KtY7ky1d63RWc9ITj4DnMuWjvjkFOs/bP3GxIOjxvCloGbwpqMiv1E5n kench@hp"

RUN apt -qqq update && \
apt -qqqy upgrade && \
apt -qqqy install openssh-server && \
echo "GatewayPorts yes" >> /etc/ssh/sshd_config && \
service ssh restart && \
mkdir -p $HOME/.ssh/ && \
echo $PUBLIC_KEY > $HOME/.ssh/authorized_keys
