# mingyang_cloud_docs

明阳云平台，云端服务 

## How to deploy

### 环境准备
 - Window系统的PC或服务器一台（named PC0）。操作系统：Windows Server 2008/2012 64位，硬件 2核/8G/40G或更高配置
 
 - Linux Ubuntu14.04系统的PC或服务器一台（named PC1）, CPU至少>4核，内存>4G, 硬盘>40G:    
```Bash
root@iZ28yy5kssxZ:~# lsb_release -a 
No LSB modules are available.
Distributor ID:	Ubuntu
Description:	Ubuntu 14.04.4 LTS
Release:	14.04
Codename:	trusty
```
 - PC1上安装java运行环境(1.8)，结果如下:    
```shell
root@iZ28yy5kssxZ:~# java -version
java version "1.8.0_101"
Java(TM) SE Runtime Environment (build 1.8.0_101-b13)
Java HotSpot(TM) 64-Bit Server VM (build 25.101-b13, mixed mode)
```

 - PC1上安装进程管理工具[Supervisor](http://www.supervisord.org), 版本不低于3.3.1, 结果如下:   
```shell
root@iZ28yy5kssxZ:~# supervisord --version
3.3.1
```
 - PC1上安装Mysql Service(5.6.33)
 
 - PC1上安装Redis(3.2.3)
  
 
### 准备资源文件(待完善), 具体文件见[附件](https://github.com/shlhs/wuxi_simufiled_docs/blob/master/deploy_config)
 - 服务运行软件包，simufiled-svc-1.0.0.jar (./ 目录下)
 - 服务启动配置文件 [supervisord_thumber_websvc.conf](https://github.com/shlhs/wuxi_simufiled_docs/blob/master/deploy_config/supervisord_thumber_websvc.conf) (./ 目录下)，需根据实际情况修改，simufiled-svc-1.0.0.jar所在位置、服务启动参数（数据库信息、对外端口等）、log存储路径:     
  ***/home/simufiled/ 需根据实际进行替换;***      
  ***thumbor --port=8888 --conf=/home/simufiled/thumbor/thumbor.conf 根据需要修改图片存取服务的端口与配置文件所在位置;***                    
  ***java -jar 根据实际情况调整 数据库信息，后台用户管理系统usermanager.url等信息***          
  根据需要调整其他次要信息，例如log路径等，进一步信息可参考[Supervisor](http://www.supervisord.org)      
```ini
[supervisord]
logfile = /home/simufiled/logs/supervisord.log
logfile_maxbytes = 50MB
logfile_backups=10
loglevel = info
pidfile = /home/simufiled/supervisord.pid
user = root

[program:thumbor]
command=thumbor --port=8888 --conf=/home/simufiled/thumbor/thumbor.conf
process_name=thumbor8888
numprocs=1
user=root
directory=/home/simufiled/thumbor/
autostart=true
autorestart=true
startretries=3
stopsignal=TERM
stdout_logfile=/home/simufiled/thumbor/logs/thumbor8888.stdout.log
stdout_logfile_maxbytes=1MB
stdout_logfile_backups=10
stderr_logfile=/home/simufiled/thumbor/logs/thumbor8888.stderr.log
stderr_logfile_maxbytes=1MB
stderr_logfile_backups=10

[program:wuxiwebsvc]
command=java -jar /home/simufiled/simufiled-svc-1.0.0.jar --server.port=8090 --spring.datasource.url=jdbc:mysql://127.0.0.1:3306/simufiled --spring.datasource.username=root --spring.datasource.password=xxxx --usermanager.url=http://114.215.90.83:8082/viot/api/
process_name=wuxiwebsvc
numprocs=1
user=root
directory=/home/simufiled/websvc/
autostart=true
autorestart=true
startretries=3
stopsignal=TERM
stdout_logfile=/home/simufiled/websvc/logs/websvc.stdout.log
stdout_logfile_maxbytes=1MB
stdout_logfile_backups=10
stderr_logfile=/home/simufiled/websvc/logs/wensvc.stderr.log
stderr_logfile_maxbytes=1MB
```

### 启动运行    
通过以上述b配置文件，运行supervisord即可     
```shell
supervisord -c ./supervisord_cloud_svc.conf
```

### 检查相关进程是否运行(待完善)，正常情况下一共有三个相关进程（java、thumbor、supervisord）正在运行，结果如下:    
```shell

```

### 检查业务是否正常(待完善)
 - 服务后台，http://ip:port/login, 可正常访问，输入正确的用户信息，可登录；输入错误的用户信息，则返回401认证失败。
 
### FAQ
