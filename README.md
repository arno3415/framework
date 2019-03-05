# WGoa2.0

## 1.项目介绍
WGoa2.0

## 2.软件架构
软件架构说明

1. wgoa-parent

    > 管理所有jar以及版本信息
    
2. wgoa-utils
    > 管理所有公共信息以及常用公共方法
3. wgoa-repository
    > 数据访问，数据库表映射
4. wgoa-business
    > 业务逻辑
5. wgoa-redis
    > redis缓存，常用字典数据、用户登录状态数据
6. wgoa-upload
    > 文件上传
7. wgoa-quartz
    > 定时任务，定期执行各种任务
8. wgoa-manager
    > 管理后台接口
9. wgoa-mobile
    > 移动端接口
10. wgoa-chat
    > 即时通讯，socketIO
11. wg-generator
    > 代码生成器

## 3.版本说明

1. 模块化
2. 代码生成器 (wg-generator)
3. 自动填充插入更新数据 (wgoa-repository)
4. 多数据源、读写分离 (wgoa-repository)
5. redis缓存 (wgoa-redis)
6. shiro安全认证 (wgoa-manager)
7. 防止xss攻击 (wgoa-manager)
8. swagger API (wgoa-manager,wgoa-upload)
    <dependency>
    
        运行后演示地址：(http://xxx/swagger-ui.html)
        
    </dependency>
9. FTP、七牛、阿里云、腾讯云文件上传 (wgoa-upload)
10. 重写MybatisPlus的EntityWarpper，利用MyEntityWarpper进行sql条件语句封装
            
        MyEntityWrapper<T> myEntityWrapper = new MyEntityWrapper<>();
        myEntityWrapper.eq("id",id);
        myEntityWrapper.like("name",id);
        myEntityWrapper.or("type",type);
                
11. [apollo](#7分布式配置文件管理)分布式配置文件(wgoa-manager)
12. [xxl-job](#6分布式调度任务说明)定时任务调度(wgoa-quartz)
13. [CAT监控](#5cat监控使用说明)(wgoa-manager,wgoa-repository,wgoa-business)(代码侵入)
14. [SkyWalking监控](#8skywalking监控)(字节码注入，链路追踪，非代码侵入)
 
## 4.代码管理使用说明
 - master主分支、生产分支。
 - develop稳定分支、测试分支。
 - dev_xxx个人分支。

1. 建立个人分支，以dev_命名方式
2. 代码拉取  == develop 
3. 代码提交  == dev_xxx
4. 个人代码合并  == dev_xxx 合并至 develop
5. 测试develop
6. 测试通过合并  == develop 合并至 master （管理员权限）

## 5.CAT监控使用说明
##### CAT服务器安装 JDK版本1.7、1.8
1. 下载源码：
- git clone https://github.com/dianping/cat.git
- cd cat
- git checkout mvn-repo

    > - 下载cat jar包

- cp -R * ~/.m2/repository

    > - 将分支mvn-repo下的jar包复制到本机maven仓库

- git checkout master

    > - 获取主分支源码

- mvn clean install -DskipTests
    
2. 部署步骤
    - mvn cat:install
        <dependency>
    
            安装过程中，会提示输入mysql的连接地址，输入格式严格按 jdbc:mysql://127.0.0.1:3306 这种格式来
            后面不要加一些额外参数，然后输入用户名、密码(该用户要有创建database的权限)，之后会自动在mysql中创建cat数据库，然后创建一堆表。
        
        </dependency>
3. 启动服务端
    - cd cat-home
    - mvn jetty:run  //启动cat服务
    
##### 如出现以下错误：No plugin found for prefix 'cat' in the current project and in the plugin groups
##### 请按照以下操作进行部署
1. 安装tomcat
2. 进入cat-home\target,将cat-alpha-3.0.0.war 更名为cat.war,复制到tomcat目录webapps\
3. 将本项目中的catConfig.rar解压到tomcat所处盘符根目录。如：tomcat位置为：d:\tomcat 则解压到d:\
4. 修改解压文件中data\appdatas\cat的client.xml、dataSources.xml、server.xml

    > - 根据自己实际配置设置客户端ip端口、数据库、服务器ip端口

- 启动tomcat，访问地址：http://localhost:8080/cat。

    > - 初始账号密码：admin/admin

##### 简单粗暴方式
- 数据库执行catSql.sql文件，生成cat数据库
- 使用项目根目录cat.war直接部署
- 解压项目根目录catConfig.rar到tomcat安装盘符
- 修改解压文件中data\appdatas\cat的client.xml、dataSources.xml、server.xml

    > - 根据自己实际配置设置客户端ip端口、数据库、服务器ip端口

- 启动tomcat，访问地址：http://localhost:8080/cat。

    > - 初始账号密码：admin/admin

[CAT参考示例](http://www.voidcn.com/article/p-kmqoeeuh-bao.html)
##### CAT客户端使用
1. pom.xml导入client
    <dependency>
    
        <dependency>
            <groupId>com.dianping.cat</groupId>
            <artifactId>cat-client</artifactId>
            <version>3.0.0</version><!--根据自己打包的版本号进行修改-->
        </dependency>
        
    </dependency>
2. resources下面添加文件夹META-INF，添加文件app.properties
3. app.properties文件加入app.name=wg-manager
4. [aop监控method参考](https://www.jianshu.com/p/42d7f972ce72)
5. [其他监控参考](https://blog.csdn.net/weter_drop/article/details/83349651)

## 6.分布式调度任务说明
##### 2.0.2-SNAPSHOT版本，请按照以下操作
1. 下载源码:
    - xxl-job [任务调度平台](https://github.com/xuxueli/xxl-job)
    - xxl-registry [服务注册中心](https://github.com/xuxueli/xxl-registry)
    - xxl-rpc [服务框架XXL-RPC](https://github.com/xuxueli/xxl-rpc)
2. 分别构建xxl-registry和xxl-rpc
    - mvn clean install
3. 修改xxl-job中xxl-job-admin项目的配置文件application.properties
    <dependency>
    
        server.port=8888  ##项目端口
        server.context-path=/   ##访问路径
        
        spring.datasource.url=jdbc:mysql://192.168.50.42:3307/xxl-job?Unicode=true&characterEncoding=UTF-8
        spring.datasource.username=root
        spring.datasource.password=sxlfybb
        spring.datasource.driver-class-name=com.mysql.jdbc.Driver
        xxl.job.login.username=admin  ##登录账号
        xxl.job.login.password=123456   ##登录密码
        
    </dependency>
4. 执行tables_xxl_job.sql
5. 启动xxl-job-admin项目

[调度任务官方文档](http://www.xuxueli.com/xxl-job/#/?id=%E3%80%8A%E5%88%86%E5%B8%83%E5%BC%8F%E4%BB%BB%E5%8A%A1%E8%B0%83%E5%BA%A6%E5%B9%B3%E5%8F%B0xxl-job%E3%80%8B)

## 7.分布式配置文件管理
- [Quick start操作后台](https://github.com/ctripcorp/apollo/wiki/Quick-Start)
- 创建数据库

    > - Apollo服务端共需要两个数据库：ApolloPortalDB和ApolloConfigDB，我们把数据库、表的创建和样例数据都分别准备了sql文件，只需要导入数据库即可。
    > - sql脚本目录 sql/apolloportaldb.sql,sql/apolloconfigdb.sql
    
- 配置数据库连接信息，编辑demo.sh
- ./demo.sh start   

##### 应用端接入
-Denv=DEV -Dapp.id=wg-framework -Ddev_meta=http://192.168.50.120:8080 -Dapollo.cluster=TEST
 > - app.id:唯一标识，服务端配置
 > - dev_meta:eureka注册服务中心地址
 > - apollo.cluster:Namespace，服务端配置

[apollo官方文档](https://github.com/ctripcorp/apollo)

## 8.SkyWalking监控
1. 采用Elasticsearch-6.x版本
    - elasticsearch.yml配置
    
        <dependency>
        
            cluster.name: CollectorDBCluster
            http.cors.enabled: true
            http.cors.allow-origin: "*"
            network.host: 0.0.0.0
            thread_pool.bulk.queue_size: 1000
        
        </dependency>
    - 运行elasticsearch.bat
    - 安装[elasticsearch-head](https://www.jianshu.com/p/e3f7bf6277f9)用于监控Elasticsearch
2. 运行oap-server  server-starter模块
3. apm-webapp模块application.yml增加配置collector.ribbon.ReadTimeout: 10000
4. 运行模块配置jvm参数：-javaagent:D:\Program Files\work\project\code\incubator-skywalking\skywalking-agent\skywalking-agent.jar
5. 运行apm-webapp模块

## git操作步骤

- git config --global user.name "Arno"
- git config --global user.email "arno9967@google.com"
- git init
- git remote add origin url
- git add .
- git commit -m "Initial commit"
- git push -u origin master