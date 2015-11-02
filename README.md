#gearpump-docker
Single node Gearpump Cluster in Docker container.
 
## Usage
Start Gearpump Cluster in foreground. If you press `CTRL+C`, the cluster will be killed.
```
# Gearpump Dashboard is served at 
#  http://127.0.0.1:8090
docker run -t -p 8090:8090 --name gearpump gearpump/gearpump
```
Note that if you want to start Gearpump in background, add `-d` after `docker run`.


## Dock Installation for CentOS 6
There is a way to install Docker on CentOS 6.
```
# yum install -y centos-release-xen
# echo includepkgs=kernel kernel-firmware >> /etc/yum.repos.d/CentOS-Xen.repo
# yum update -y kernel
# reboot
# wget -qO- https://get.docker.com/ | sh
# service docker start
```

## Using Docker behind Firewall
If your working environment is behind a firewall. You need specify proxy for `yum`, `wget` and `docker`.

### yum ###
```
echo proxy=http://your_proxy_host:your_proxy_port >> /etc/yum.repos.d/CentOS-Xen.repo
```

### wget ###
```
echo http_proxy=http://your_proxy_host:your_proxy_port >> /etc/wgetrc
echo https_proxy=http://your_proxy_host:your_proxy_port >> /etc/wgetrc
```

### docker ###
For CentOS 6
```
echo HTTP_PROXY=http://your_proxy_host:your_proxy_port >> /etc/sysconfig/docker
echo HTTPS_PROXY=http://your_proxy_host:your_proxy_port >> /etc/sysconfig/docker
```
For CentOS 7 (systemd)
```
mkdir /etc/systemd/system/docker.service.d
echo [Service] > /etc/systemd/system/docker.service.d/http-proxy.conf
echo Environment="HTTP_PROXY=http://your_proxy_host:your_proxy_port" >> /etc/systemd/system/docker.service.d/http-proxy.conf
echo Environment="HTTPS_PROXY=http://your_proxy_host:your_proxy_port" >> /etc/systemd/system/docker.service.d/http-proxy.conf
systemctl daemon-reload
systemctl restart docker
```

