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

## PC0 组态软件的安装部署

### TODO

## PC1 云平台服务的安装部署

### 创建Mysql DB    
  - DB1的sql文件 待补充      
  
  - DB2的sql文件 待补充

### 下载相关软件与配置文件      
   [下载地址](https://github.com/shlhs/mingyang_cloud_docs/tree/master/01)         
   最终效果如下图所示       
   ![image](https://github.com/shlhs/mingyang_cloud_docs/blob/master/pic/pc1_ready.jpeg)
 
### 修改资源文件，supervisord_mingyang_cloud.conf
 - 修改其中Mysql的相关信息（ip port username password）
 - 修改其中redies的相关信息（ip port password）
 
### 启动运行
 - 确认9090、8098、8099 三个端口未被占用，如存在占用，请关闭相应的进程。所需效果如下：
 ```shell
 todo
 ```
 - 通过以上述b配置文件，运行supervisord即可   
```shell
supervisord -c ./supervisord_cloud_svc.conf
```

### 检查相关进程是否运行，正常情况下一共有四个相关进程（三个 java、supervisord）正在运行， 也可通过端口占用情况查看。结果如下:    
```shell
todo
```

### 检查业务是否正常
 - 服务后台，http://ip:9090/login, 可正常访问，输入正确的用户信息，可登录。
 
### FAQ
