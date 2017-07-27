# mingyang_cloud_docs

明阳云平台，云端服务 

## How to deploy

### 环境准备
 - Linux系统的PC或服务器, 推荐使用Ubuntu14.04:    
```Bash
root@iZ28yy5kssxZ:~# lsb_release -a 
No LSB modules are available.
Distributor ID:	Ubuntu
Description:	Ubuntu 14.04.4 LTS
Release:	14.04
Codename:	trusty
```
 - 安装java运行环境(1.8)，结果如下:    
```shell
root@iZ28yy5kssxZ:~# java -version
java version "1.8.0_101"
Java(TM) SE Runtime Environment (build 1.8.0_101-b13)
Java HotSpot(TM) 64-Bit Server VM (build 25.101-b13, mixed mode)
```

 - 安装进程管理工具[Supervisor](http://www.supervisord.org), 版本不低于3.3.1, 结果如下:   
```shell
root@iZ28yy5kssxZ:~# supervisord --version
3.3.1
```
 - 准备Mysql Service，也可直接使用已有; 创建相应DB及其TABLE；以在此台机器上，可连接到数据库为结果。可以直接运行sql附件文件（simufiled_stru），具体[sql](https://github.com/shlhs/wuxi_simufiled_docs/blob/master/sql_back/simufiled_stru.sql)如下：  
  
 
###准备资源文件, 具体文件见[附件](https://github.com/shlhs/wuxi_simufiled_docs/blob/master/deploy_config)
 - 服务运行软件包，simufiled-svc-1.0.0.jar (./ 目录下)
 - 图片存取服务配置，[thumbor.conf](https://github.com/shlhs/wuxi_simufiled_docs/blob/master/deploy_config/thumbor/thumbor.conf) (./thumbor 目录下)
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

###启动运行    
通过以上述b配置文件，运行supervisord即可     
```shell
supervisord -c ./supervisord_thumber_websvc.conf
```

###检查相关进程是否运行，正常情况下一共有三个相关进程（java、thumbor、supervisord）正在运行，结果如下:    
```shell
root@iZ28yy5kssxZ:~# ps -ef | grep thum
root      1515     1  0 Nov13 ?        00:01:20 /usr/bin/python /usr/local/bin/supervisord -c ./supervisord_thumber_websvc.conf
root      1516  1515  0 Nov13 ?        00:00:00 /usr/bin/python /usr/local/bin/thumbor --port=8888 --conf=/home/simufiled/thumbor/thumbor.conf
root     29966 29940  0 23:15 pts/5    00:00:00 grep --color=auto thum
root@iZ28yy5kssxZ:~# ps -ef | grep simufiled-svc
root      1517  1515  0 Nov13 ?        00:06:02 java -jar /home/simufiled/simufiled-svc-1.0.0.jar --server.port=8090 --spring.datasource.url=jdbc:mysql://127.0.0.1:3306/simufiled --spring.datasource.username=root --
```

###检查业务是否正常
 - 服务后台，http://ip:port/login, 可正常访问，输入正确的用户信息，可登录；输入错误的用户信息，则返回401认证失败。
 
### FAQ
