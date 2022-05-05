# RuoYi-Vue-PostgreSQL

[![jaywcjlove/sb](https://jaywcjlove.github.io/sb/lang/chinese.svg)](README-zh.md)

[English](README.md) | [中文](README-zh.md)

## 平台简介

若依是一套全部开源的快速开发平台，毫无保留给个人及企业免费使用。

1. 主要工作是融合两个版本（Ruoyi-vue 和 Ruoyi-PostgreSQL）融合在一起。
2. 前端采用Vue、Element UI。
3. 后端采用Spring Boot、Spring Security、Redis & Jwt。
4. 权限认证使用Jwt，支持多终端认证系统。
5. 支持加载动态权限菜单，多方式轻松权限控制。
6. 高效率开发，使用代码生成器可以一键生成前后端代码。
7. 提供了单应用版本[RuoYi-Vue-fast](https://github.com/yangzongzhuan/RuoYi-Vue-fast)，Oracle版本[RuoYi-Vue-Oracle](https://github.com/yangzongzhuan/RuoYi-Vue-Oracle)，保持同步更新。
8. 不分离版本，请移步[RuoYi](https://gitee.com/y_project/RuoYi)，微服务版本，请移步[RuoYi-Cloud](https://gitee.com/y_project/RuoYi-Cloud)

特别鸣谢：[element](https://github.com/ElemeFE/element)，[vue-element-admin](https://github.com/PanJiaChen/vue-element-admin)，[eladmin-web](https://github.com/elunez/eladmin-web)。

## 如何运行本项目

### 后端项目启动准备

首先设置数据库连接，打开application-postgresql.yml文件

`ruoyi-admin/src/main/resources/application-postgresql.yml`

更改url，username，password，其他不用动即可。

然后打开sql文件

`sql/ry_postgresql-final.sql`和`sql/quartz_postgresql.sql`

执行文件即可。

接下来，启动项目，后端就已经启动完成了。

### 前端项目启动准备

进入`ruoyi-ui`文件夹

先后运行

```powershell
npm install
```

```powershell
npm run dev
```

前端项目以开发模式启动完毕！

## 内置功能

1.  用户管理：用户是系统操作者，该功能主要完成系统用户配置。
2.  部门管理：配置系统组织机构（公司、部门、小组），树结构展现支持数据权限。
3.  岗位管理：配置系统用户所属担任职务。
4.  菜单管理：配置系统菜单，操作权限，按钮权限标识等。
5.  角色管理：角色菜单权限分配、设置角色按机构进行数据范围权限划分。
6.  字典管理：对系统中经常使用的一些较为固定的数据进行维护。
7.  参数管理：对系统动态配置常用参数。
8.  通知公告：系统通知公告信息发布维护。
9.  操作日志：系统正常操作日志记录和查询；系统异常信息日志记录和查询。
10. 登录日志：系统登录日志记录查询包含登录异常。
11. 在线用户：当前系统中活跃用户状态监控。
12. 定时任务：在线（添加、修改、删除)任务调度包含执行结果日志。
13. 代码生成：前后端代码的生成（java、html、xml、sql）支持CRUD下载 。
14. 系统接口：根据业务代码自动生成相关的api接口文档。
15. 服务监控：监视当前系统CPU、内存、磁盘、堆栈等相关信息。
16. 缓存监控：对系统的缓存信息查询，命令统计等。
17. 在线构建器：拖动表单元素生成相应的HTML代码。
18. 连接池监视：监视当前系统数据库连接池状态，可进行分析SQL找出系统性能瓶颈。

## 项目由来

因为在个人项目开发中，需要使用到前后端和postgresql这项数据库技术，于是特此花了一周时间，解决掉未存在的情况。项目合并过程尚遇到许许多多细微的bug，不愿后来者再步我后尘，遂开源此项目，就是这样。

JUST-NetClub-CheverJohn