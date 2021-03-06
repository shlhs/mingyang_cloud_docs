# mingyang_cloud_docs

明阳云平台，云端服务 

## 环境准备
 - Window系统的PC或服务器一台（named PC0）。操作系统：Windows Server 2008/2012 64位，硬件 2核/8G/40G或更高配置
 
 - Linux Ubuntu14.04系统的PC或服务器一台（named PC1）, CPU至少>4核，内存>8G, 硬盘>200G:    
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
 
 - PC1上安装apache2 server（2.2+）
 
![image](https://github.com/shlhs/mingyang_cloud_docs/blob/master/pic/deployment.jpg)

## PC0 数据采集服务软件的安装部署

### 下载采集服务文件
   [下载地址](https://github.com/shlhs/mingyang_cloud_docs/tree/master/01/collector)       

### 采集服务安装配置
数据采集服务软件collector为免安装，一台PC上可以运行多个采集服务软件（需要处于不同的目录下）。启动采集服务软件Kuaikong.exe后，点击工具条上的“设置”按钮“来配置工程管理器的Redis和Mysql连接信息。如下图：
![image](https://github.com/shlhs/mingyang_cloud_docs/blob/master/pic/collector.jpg)

### 采集服务的使用参见：
https://github.com/shlhs/mingyang_cloud_docs/blob/master/01/Collector/%E9%87%87%E9%9B%86%E5%99%A8%E8%BD%AF%E4%BB%B6%E4%BD%BF%E7%94%A8%E8%AF%B4%E6%98%8E.doc

## PC1 云平台服务的安装部署

### 创建Mysql DB    
  - DB1的[sql文件](https://github.com/shlhs/mingyang_cloud_docs/blob/master/02-2/inti_sql/lhs_cloud_init_02.sql)      
  
  - DB2的[sql文件](https://github.com/shlhs/mingyang_cloud_docs/blob/master/02-2/inti_sql/lhs_cloud_init_02.sql)

### 下载相关软件与配置文件      
   [下载地址](https://github.com/shlhs/mingyang_cloud_docs/tree/master/02-2)         
   最终效果如下图所示       
   ![image](https://github.com/shlhs/mingyang_cloud_docs/blob/master/pic/pc1_ready.jpeg)
 
### 修改资源文件，supervisord_mingyang_cloud.conf
 - 修改其中Mysql的相关信息（ip port username password）
 - 修改其中redies的相关信息（ip port password）
 
### 启动运行
 - 确认9090、8098、8099 三个端口未被占用，如存在占用，请关闭相应的进程。所需效果如下：
 ```shell
root@iZ28yy5kssxZ:/home/mingyang-lhs-cloud# netstat -ap | grep 9090
root@iZ28yy5kssxZ:/home/mingyang-lhs-cloud# netstat -ap | grep 8098
root@iZ28yy5kssxZ:/home/mingyang-lhs-cloud# netstat -ap | grep 8099
root@iZ28yy5kssxZ:/home/mingyang-lhs-cloud#
 ```
 - 通过以上述b配置文件，运行supervisord即可   
```shell
supervisord -c ./supervisord_mingyang_cloud.conf
```

### 停止运行
 - 杀掉启动的supervisord进程： ps -ef | grep superv , 查看supervisord的进程号(eg， 4035)         
    kill 4035(需要等一会，直到supervisord进程 不存在)
    

### 检查相关进程是否运行，正常情况下一共有五个相关进程（三个 java、supervisord、nodejs）正在运行， 也可通过端口占用情况查看。结果如下:    
```shell
root@iZ28yy5kssxZ:/home/mingyang-lhs-cloud# netstat -ap | grep 8099
tcp        0      0 *:8099                  *:*                     LISTEN      24073/java
root@iZ28yy5kssxZ:/home/mingyang-lhs-cloud# netstat -ap | grep 8098
tcp        0      0 *:8098                  *:*                     LISTEN      24075/java
root@iZ28yy5kssxZ:/home/mingyang-lhs-cloud# netstat -ap | grep 9090
tcp        0      0 *:9090                  *:*                     LISTEN      24074/java
root@iZ28yy5kssxZ:/home/mingyang-lhs-cloud#
```

### 部署cloud-map服务
 - 安装好apache服务器，并通过修改配置文件httpd.conf配置好监听端口。apache默认的监听端口时80，配置文件中描述为Listen 80，将其修改为Listen 9095
 - 将发布的cloud-map目录下的文件拷贝到apache服务器的${DocumentRoot}目录下
 --  ${DocumentRoot}目录是在httd.conf中指定的，可根据自己的需要修改，参考下面的例子：
 ```
   Define SRVROOT "/var/www"
   ServerRoot "${SRVROOT}"
   DocumentRoot "${SRVROOT}/htdocs"
```
 - 修改${DocumentRoot}/script/common/urls.js中的general_url的值，指向后台服务的url(如:http://192.168.1.100:8099/v1)
 - 启动apache服务器，访问http://服务器地址:端口号/manager.html ，测试服务是否已经启动完毕

### 检查业务是否正常
 - 服务后台，http://ip:9090, 可正常访问，输入正确的用户信息，可登录。
 
 
### <font color=red >注意事项</font>

1. 设置Mysql允许远程链接（初始默认是不允许的，如果不设置 服务没发访问数据库，登录不了）         
   设置bind-address = 0.0.0.0         
   设置 privileges        
   可[参考](http://blog.csdn.net/hunauchenym/article/details/6933038)
   
2. 设置redis允许远程链接（ 初始默认是不允许的）       
   设置bind-address = 0.0.0.0
 
### FAQ
 1. 启动redis            
 到redis所在目录（下载时保存的），执行 ./redis-server xxx.conf, 更多方式[参照](http://www.cnblogs.com/pqchao/p/6549510.html)
 
#### 
