#home-webserver Docker版的内网穿透

##用途
利用ssh建立反向代理，将任意一台电脑（比如树莓派）的TCP端口映射到公网上。
# 注意
 - **本项目主要使用灵雀云Docker，因为每月有29元代金券，流量0.8元/GB，相当于30G每月的免费流量。具体计费方式请移步灵雀云查看，或者采用其他云计算。**
 - **带宽大小取决于你的内网上下行带宽，目前北京联通家用光线一般是上行5M=600KB、下行就是你的下载速度**
 - 不支持UDP

## 用法
 - docker的80端口映射到本地nginx，就是网站服务器，搭建blog、owncloud（自己的网盘）
 - docker映射到本地ssh，就可以在任意地方管理自己家的电脑。
 - ……更多用法期待您的发现

###将自己的公玥保存到服务器上
创建服务时，设置ENV的PUBLIC_KEY变量为你自己的公玥

###树莓派执行命令
```shell
ssh -C -R \*:80:127.0.0.1:80 -o TCPKeepAlive=yes -o ServerAliveInterval=120 -o ServerAliveCountMax=5 root@[docker domain] -p [docker ssh port]
```

###利用autossh保持连接
```shell
sudo apt-get install autossh -y
autossh -M 5678 root@domain -p port -R \*:80:127.0.0.1:80 -C -N -o TCPKeepAlive=yes -o ServerAliveInterval=120 -o ServerAliveCountMax=5
```

###利用supervisor自动重启

```shell
sudo apt-get install supervisor -y
sudo vim /etc/supervisor/conf.d/sshtunnel.conf

[program:sshtunnel]
command=autossh -M 5678 root@domain -p port -R \*:80:127.0.0.1:80 -C -N -o TCPKeepAlive=yes -o ServerAliveInterval=120 -o ServerAliveCountMax=5
numprocs=1
autostart=true
autorestart=true
user=username
```
