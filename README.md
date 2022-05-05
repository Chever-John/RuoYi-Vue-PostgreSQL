[![jaywcjlove/sb](https://jaywcjlove.github.io/sb/lang/chinese.svg)](README-zh.md)

[English](README.md) | [中文](README-zh.md)

## Description

Ruoyi is a set of open-source rapid development platforms, without reservation to individuals and enterprises for free use.

### Major features

1. The main work was integrating the two versions (Ruoyi-vue and Ruoyi-PostgreSQL).
2. Front-end using Vue, Element UI.
3. The backend uses Spring Boot, Spring Security, Redis & Jwt.
4. Permission authentication using Jwt, supporting multi-terminal authentication system.
5. Support loading dynamic permission menu, multi-mode easy permission control.
6. Inefficient development, the code generator can generate front and back-end code in one click.
7. Single application version [RuoYi-Vue-fast](https://github.com/yangzongzhuan/RuoYi-Vue-fast), Oracle version [RuoYi-Vue-Oracle](https://github.com/ yangzongzhuan/RuoYi-Vue-Oracle) to keep synchronized and updated.
8. For the non-separated version, please move to [RuoYi](https://gitee.com/y_project/RuoYi), and for the microservice version, please proceed to [RuoYi-Cloud.](https://gitee.com/y_project/RuoYi-Cloud)

Special thanks to [element](https://github.com/ElemeFE/element)，[vue-element-admin](https://github.com/PanJiaChen/vue-element-admin)， and [eladmin-web](https://github.com/elunez/eladmin-web)。

## How to run this project

### Back-end project start-up preparation

First, set up the database connection, and open the `application-postgresql.yml` file.

`ruoyi-admin/src/main/resources/application-postgresql.yml`.

Change the URL, username, password, and nothing else.

Then open the SQL file.

`sql/ry_postgresql-final.sql`和`sql/quartz_postgresql.sql`

Just execute the file.

Next, start the project, and the backend has been created and completed.

### Front-end project start-up preparation

Go to the `ruoyi-ui` folder.

Run the following commands in succession:

```powershell
npm install
```

```powershell
npm run dev
```

The front-end project is launched in development mode!

## Built-in functions

1.  User management: the user is the system operator; this function mainly completes the system user configuration.
2. Department Management: Configure the system organization (company, department, group), and the tree structure supports data authority.
3. Position management: configure the system users belong to hold positions. 4.
4. Menu management: configure the system menu, operation privileges, button privilege identification, etc.
5. Role management: role menu permission assignment, set the organization's role of data scope authority.
6. Dictionary management: maintenance of some more static data often used in the system.
7. Parameter management: Dynamic configuration of standard parameters for the system.
8. Notification: System notification announcement information release maintenance.
9. Operation log: system average operation log record and query; system abnormal information log record and query.
10. Login log: system login log records and queries include login exceptions.
11. Online users: monitoring the status of active users in the current system.
12. Timed tasks: online (add, modify, delete) task scheduling, including execution result logs.
13. code generation: front and back-end code generation (java, html, xml, sql) support CRUD download .
14. System interface: automatically generate relevant api interface documents according to the business code.
15. Service monitoring: monitor the current system CPU, memory, disk, stack, and other related information.
16. Cache monitoring: query the cache information of the system, command statistics, etc.
17. Online builder: drag and drop form elements to generate the corresponding HTML code.
18. Connection pool monitoring: monitor the current system database connection pool status and analyze SQL to find out the system performance bottleneck.



## Project Origin

Because in the development of personal projects, the need to use the front and back end and PostgreSQL this database technology took a week to solve the non-existent situation. The project merging process still encountered a lot of subtle bugs; I do not want to follow in my footsteps, so open source this project, that's it.

JUST-NetClub-CheverJohn