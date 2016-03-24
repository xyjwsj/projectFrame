# ProjectFrame

- 此共享项目主要是为了开发项目时前期的一些框架的搭建，方便在开发时候能更好、更快的搭建结构清晰易于操作的目录结构

### 项目目录结构介绍：

  - AppDelegate目录
    > 此目录主要放置程序的入口函数及基本代码
    - AppDelegate.h
    - AppDelegate.m
    - main.m

  - General目录
    - Category 此目录主要放置类扩展
    - Component 此目录主要放置UI通用组件，如：picker等
    - UI 此目录主要放置通用UI

  - Helpers目录（待优化）
    - BAL 业务访问层
    - DLL 数据访问层
    - Util 工具类

  - HttpApi目录

    > 主要时Http网络层开发－－作为单独模块主要是可以进行Http层移植问题

  - Models目录为数据模型层
    - BusinessDB 业务层模型
    - CustomeDB 自定义数据模型
    - DatabaseDB 数据库表数据模型
    - NetworkDB 网络数据模型

  - Module app模块目录
    > 此目录下按照应用进行模块划分，主要是controller

  - Resources 资源目录
    > 主要放置界面图片资源、stroyboard、xib和plist等一些其他的配置文件

  - Sections 目录
   > 主要放置一些特效组件，和General（基本的组件，功能性的）中的组件不一样。

  - Vendors 目录为第三方库目录
  - Cocoapods 为第三方库管理项目，和Vendors只需用一个就行


###### 这只是个人对项目目录结构的一些总结，希望大家多提意见和建议
