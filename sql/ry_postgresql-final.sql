-- ----------------------------
-- 1、部门表
-- ----------------------------

drop table if exists  sys_dept;

create table sys_dept (
   dept_id              BIGSERIAL not null,
   parent_id            BIGINT                 null default 0,
   ancestors            VARCHAR(50)          null,
   dept_name            VARCHAR(30)          null default '',
   order_num            INT4                 null default '0',
   leader               VARCHAR(20)          null default '',
   phone                VARCHAR(20)          null default '',
   email                VARCHAR(20)          null default '',
   status               CHAR(1)              null default '0',
   del_flag             CHAR(1)              null default '0',
   create_by            VARCHAR(64)          null default '',
   create_time          TIMESTAMP                 null,
   update_by            VARCHAR(64)          null default '',
   update_time          TIMESTAMP                 null,
   constraint PK_SYS_DEPT primary key (dept_id)
);
alter sequence if exists sys_dept_dept_id_seq restart with 200 cache 20;

comment on table sys_dept is '部门表';
comment on column sys_dept.dept_id is '部门id';
comment on column sys_dept.parent_id is '父部门id';
comment on column sys_dept.ancestors    is '祖级列表';
comment on column sys_dept.dept_name is '部门名称';
comment on column sys_dept.order_num is '显示顺序';
comment on column sys_dept.leader is '负责人';
comment on column sys_dept.phone is '联系电话';
comment on column sys_dept.email is '邮箱';
comment on column sys_dept.status is '部门状态:0正常,1停用';
comment on column sys_dept.del_flag     is '删除标志（0代表存在 2代表删除）';
comment on column sys_dept.create_by is '创建者';
comment on column sys_dept.create_time is '创建时间';
comment on column sys_dept.update_by is '更新者';
comment on column sys_dept.update_time is '更新时间';

-- ----------------------------
-- 1.1 初始化-部门表数据
-- ----------------------------
insert into sys_dept values(100,  0,   '0',          '江苏科技大学',   0, '江某人', '15888888888', 'mr8god@hotmail.com', '0', '0', 'admin', now(), '', null);
insert into sys_dept values(101,  100, '0,100',      '张家港校区', 1, '江某人', '15888888888', 'mr8god@hotmail.com', '0', '0', 'admin', now(), '', null);
insert into sys_dept values(102,  100, '0,100',      '苏州理工学院', 2, '江某人', '15888888888', 'mr8god@hotmail.com', '0', '0', 'admin', now(), '', null);
insert into sys_dept values(103,  101, '0,100,101',  '电气与信息工程学院',   1, '江某人', '15888888888', 'mr8god@hotmail.com', '0', '0', 'admin',now(), '', null);
insert into sys_dept values(104,  101, '0,100,101',  '商学院',   2, '江某人', '15888888888', 'mr8god@hotmail.com', '0', '0', 'admin',now(), '', null);
insert into sys_dept values(105,  101, '0,100,101',  '公共与教育学院',   3, '江某人', '15888888888', 'mr8god@hotmail.com', '0', '0', 'admin',now(), '', null);
insert into sys_dept values(106,  101, '0,100,101',  '冶金与材料学院',   4, '江某人', '15888888888', 'mr8god@hotmail.com', '0', '0', 'admin',now(), '', null);
insert into sys_dept values(107,  101, '0,100,101',  '机械与动力工程学院',   5, '江某人', '15888888888', 'mr8god@hotmail.com', '0', '0', 'admin',now(), '', null);
insert into sys_dept values(108,  102, '0,100,102',  '电气与信息工程学院',   1, '江某人', '15888888888', 'mr8god@hotmail.com', '0', '0', 'admin',now(), '', null);
insert into sys_dept values(109,  102, '0,100,102',  '商学院',   2, '江某人', '15888888888', 'mr8god@hotmail.com', '0', '0', 'admin',now(), '', null);




-- ----------------------------
-- 2、用户信息表
-- ----------------------------
drop table if exists sys_user;

create table sys_user (
   user_id              BIGSERIAL not null,
   dept_id              BIGINT                 null default NULL,
   user_name           VARCHAR(30)          null default '',
   nick_name            VARCHAR(30)          null default '',
   user_type            VARCHAR(2)           null default '00',
   email                VARCHAR(100)         null default '',
   phonenumber          VARCHAR(20)          null default '',
   sex                  CHAR(1)              null default '0',
   avatar               VARCHAR(100)         null,
   password             VARCHAR(100)         null default '',
   salt                 VARCHAR(100)         null default '',
   status               CHAR(1)              null default '0',
   del_flag             CHAR(1)              null default '0',
   login_ip             VARCHAR(50)          null default '',
   login_date           TIMESTAMP				 null,
   pwd_update_date      TIMESTAMP				 null,
   create_by            VARCHAR(64)          null default '',
   create_time          TIMESTAMP                 null,
   update_by            VARCHAR(64)          null default '',
   update_time          TIMESTAMP                 null,
   remark               VARCHAR(500)         null,
   constraint PK_SYS_USER primary key (user_id)
);

alter sequence if exists sys_user_user_id_seq restart with 100 cache 20;

comment on table sys_user is '用户信息表';
comment on column sys_user.user_id is '用户ID';
comment on column sys_user.dept_id is '部门ID';
comment on column sys_user.user_name is '登录账号';
comment on column sys_user.nick_name is '用户昵称';
comment on column sys_user.user_type is '类型:Y默认用户,N非默认用户';
comment on column sys_user.email is '用户邮箱';
comment on column sys_user.phonenumber is '手机号码';
comment on column sys_user.sex          is '用户性别（0男 1女 2未知）';
comment on column sys_user.avatar       is '头像路径';
comment on column sys_user.password is '密码';
comment on column sys_user.salt is '盐加密';
comment on column sys_user.status is '帐号状态:0正常,1禁用';
comment on column sys_user.del_flag is '拒绝登录描述';
comment on column sys_user.login_ip     is '最后登录IP';
comment on column sys_user.login_date   is '最后登录时间';
comment on column sys_user.pwd_update_date   is '密码最后更新时间';
comment on column sys_user.create_by is '创建者';
comment on column sys_user.create_time is '创建时间';
comment on column sys_user.update_by is '更新者';
comment on column sys_user.update_time is '更新时间';
comment on column sys_user.remark       is '备注';

-- ----------------------------
-- 初始化-用户信息表数据
-- ----------------------------
insert into sys_user values(1,  103, 'admin', 'admin', '00', 'Mr8god@hotmail.com', '17696748602', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '111111', '0', '0', '127.0.0.1', now(),now(), 'admin', now(), '', null, '管理员');
insert into sys_user values(2,  100, 'JCW', '江晨炜', '00', '17696748622@163.com', '17696748622', '0', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0615a7', '0', '0', '172.23.128.1', now(),now(), 'admin', now(), '', null, '叛逆的超级学生，主要做的事情就是冲他丫的');


-- ----------------------------
-- 3、岗位信息表
-- ----------------------------
drop table if exists sys_post;
create table sys_post (
   post_id              BIGSERIAL not null,
   post_code            VARCHAR(64)          not null,
   post_name            VARCHAR(100)         not null,
   post_sort            INT4                 not null,
   status               CHAR(1)              not null,
   create_by            VARCHAR(64)          null default '',
   create_time          TIMESTAMP                 null,
   update_by            VARCHAR(64)          null default '',
   update_time          TIMESTAMP                 null,
   remark               VARCHAR(500)         null default '',
   constraint PK_SYS_POST primary key (post_id)
);
alter sequence if exists sys_post_post_id_seq restart with 10 cache 20;

comment on table sys_post is '岗位信息表';
comment on column sys_post.post_id is '岗位ID';
comment on column sys_post.post_code is '岗位编码';
comment on column sys_post.post_name is '岗位名称';
comment on column sys_post.post_sort is '显示顺序';
comment on column sys_post.status is '状态（0正常 1停用）';
comment on column sys_post.create_by is '创建者';
comment on column sys_post.create_time is '创建时间';
comment on column sys_post.update_by is '更新者';
comment on column sys_post.update_time is '更新时间';
comment on column sys_post.remark is '备注';

-- ----------------------------
-- 初始化-岗位信息表数据
-- ----------------------------
insert into sys_post values(1, 'SuperAdmin',  '超级管理员',    1, '0', 'admin', now(), '', now(), '');
insert into sys_post values(2, 'smt',  '学生管理科老师',    2, '0', 'admin', now(), '', now(), '');
insert into sys_post values(3, 'sct',  '二级学团老师',    3, '0', 'admin', now(), '', now(), '');
insert into sys_post values(4, 'ct',  '班导师',    4, '0', 'admin', now(), '', now(), '');
insert into sys_post values(5, 'stu',  '学生用户',    5, '0', 'admin', now(), '', now(), '');
insert into sys_post values(6, 'pndcjstu',  '叛逆的超级学生用户',    6, '0', 'admin', now(), '', now(), '');

-- ----------------------------
-- 4、角色信息表
-- ----------------------------
drop table if exists sys_role;
create table sys_role (
   role_id              BIGSERIAL not null,
   role_name            VARCHAR(30)          not null,
   role_key             VARCHAR(100)         not null,
   role_sort            INT4                 null,
   data_scope           CHAR(1)              default '1',
   menu_check_strictly  BOOLEAN             default '1',
   dept_check_strictly  BOOLEAN             default '1',
   status               CHAR(1)              null default '0',
   del_flag             CHAR(1)              null default '0',
   create_by            VARCHAR(64)          null default '',
   create_time          TIMESTAMP            null,
   update_by            VARCHAR(64)          null default '',
   update_time          TIMESTAMP            null,
   remark               VARCHAR(500)         null default '',
   constraint PK_SYS_ROLE primary key (role_id)
);
alter sequence if exists sys_role_role_id_seq restart with 100 cache 20;
comment on table sys_role is '角色信息表';
comment on column sys_role.role_id is '角色ID';
comment on column sys_role.role_name is '角色名称';
comment on column sys_role.role_key is '角色权限字符串';
comment on column sys_role.role_sort is '显示顺序';
comment on column sys_role.data_scope   is '数据范围（1：全部数据权限 2：自定数据权限）';
comment on column sys_role.status       is '角色状态（0正常 1停用）';
comment on column sys_role.del_flag     is '删除标志（0代表存在 2代表删除）';
comment on column sys_role.create_by is '创建者';
comment on column sys_role.create_time is '创建时间';
comment on column sys_role.update_by is '更新者'; 
comment on column sys_role.update_time is '更新时间';
comment on column sys_role.remark is '备注';
-- ----------------------------
-- 初始化-角色信息表数据
-- ----------------------------
insert into sys_role values('1', '超级管理员',        'admin',                1, 1, '1', '1', '0', '0', 'admin', now(), '', null, '超级管理员');
insert into sys_role values('2', '超级暴民江某人',     'angry',                2, 2, '1', '1', '0', '0', 'admin', now(), '', null, '普通角色');
insert into sys_role values('3', '学生管理科老师',     'stu-man-teacher',      3, 2, '1', '1', '0', '0', 'admin', now(), '', null, '普通角色');
insert into sys_role values('4', '二级学团老师',       'sed-club-teacher',     4, 2, '1', '1', '0', '0', 'admin', now(), '', null, '普通角色');
insert into sys_role values('5', '班导师',            'class-tutor',         5, 2, '1', '1', '0', '0', 'admin', now(), '', null, '普通角色');
insert into sys_role values('6', '学生',             'student',              6, 2, '1', '1', '0', '0', 'admin', now(), '', null, '普通角色');



-- ----------------------------
-- 5、菜单权限表
-- ----------------------------
drop table if exists sys_menu;
create table sys_menu (
   menu_id              BIGSERIAL            not null,
   menu_name            VARCHAR(50)          not null,
   parent_id            BIGINT               null default 0,
   order_num            INT4                 null default NULL,
   path                 VARCHAR(200)         null default '',
   component            VARCHAR(255)          null default '',
   is_frame             INT                  null default 1,
   is_cache             INT                  null default 0,
   menu_type            CHAR(1)              null default '',   
   visible              INT              null default 0,
   status               int2             null default 0,
   perms                VARCHAR(100)         null default '',
   icon                 VARCHAR(100)         null default '',
   create_by            VARCHAR(64)          null default '',
   create_time          TIMESTAMP            null,
   update_by            VARCHAR(64)          null default '',
   update_time          TIMESTAMP            null,
   remark               VARCHAR(500)         null default '',
   constraint PK_SYS_MENU primary key (menu_id)
);
alter sequence if exists sys_menu_menu_id_seq restart with 2000 cache 20;

comment on table sys_menu is '菜单权限表';
comment on column sys_menu.menu_id is '菜单ID';
comment on column sys_menu.menu_name is '菜单名称';
comment on column sys_menu.parent_id is '父菜单ID';
comment on column sys_menu.order_num is '显示顺序';
comment on column sys_menu.path is '请求地址';
comment on column sys_menu.component       is '打开方式（menuItem页签 menuBlank新窗口）';
comment on column sys_menu.is_frame is '是否为外链（0是 1否）';
comment on column sys_menu.is_cache is '是否缓存（0缓存 1不缓存）';
comment on column sys_menu.menu_type is '类型:M目录,C菜单,F按钮';
comment on column sys_menu.visible is '菜单状态:0显示,1隐藏';
comment on column sys_menu.status is '菜单状态（0正常 1停用）';
comment on column sys_menu.perms is '权限标识';
comment on column sys_menu.icon is '菜单图标';
comment on column sys_menu.create_by is '创建者';
comment on column sys_menu.create_time is '创建时间';
comment on column sys_menu.update_by is '更新者';
comment on column sys_menu.update_time is '更新时间';
comment on column sys_menu.remark is '备注';

-- ----------------------------
-- 初始化-菜单信息表数据
-- ----------------------------
-- 一级菜单
insert into sys_menu values('1', '系统管理', '0', '1', 'system',                '',          1, 0,  'M',0, 0,'', 'system',              'admin', now(), '', null, '系统管理目录');
insert into sys_menu values('2', '系统监控', '0', '2', 'monitor',                '',          1, 0,  'M',0, 0,'', 'monitor',             'admin', now(), '', null, '系统监控目录');
insert into sys_menu values('3', '系统工具', '0', '3', 'tool',                '',          1, 0,  'M',0, 0,'', 'tool',                'admin', now(), '', null, '系统工具目录');
insert into sys_menu values('4', '江某人官网', '0', '4', 'http://ruoyi.vip', 'menuBlank', 0, 0,  'C',0, 0,'', 'guide',          'admin', now(), '', null, '江某人官网地址');
-- 二级菜单
insert into sys_menu values('100',  '用户管理', '1', '1', 'user',          'system/user/index', 1, 0,  'C', 0, 0, 'system:user:view',         'user',                'admin', now(), '', null, '用户管理菜单');
insert into sys_menu values('101',  '角色管理', '1', '2', 'role',          'system/role/index', 1, 0,  'C', 0, 0, 'system:role:view',         'peoples',             'admin', now(), '', null, '角色管理菜单');
insert into sys_menu values('102',  '菜单管理', '1', '3', 'menu',          'system/menu/index', 1, 0,  'C', 0, 0, 'system:menu:view',         'tree-table',          'admin', now(), '', null, '菜单管理菜单');
insert into sys_menu values('103',  '部门管理', '1', '4', 'dept',          'system/dept/index', 1, 0,  'C', 0, 0, 'system:dept:view',         'tree',                'admin', now(), '', null, '部门管理菜单');
insert into sys_menu values('104',  '岗位管理', '1', '5', 'post',          'system/post/index', 1, 0,  'C', 0, 0, 'system:post:view',         'post',                'admin', now(), '', null, '岗位管理菜单');
insert into sys_menu values('105',  '字典管理', '1', '6', 'dict',          'system/dict/index', 1, 0,  'C', 0, 0, 'system:dict:view',         'dict',                'admin', now(), '', null, '字典管理菜单');
insert into sys_menu values('106',  '参数设置', '1', '7', 'config',        'system/config/index', 1, 0,  'C', 0, 0, 'system:config:view',       'edit',                'admin', now(), '', null, '参数设置菜单');
insert into sys_menu values('107',  '通知公告', '1', '8', 'notice',        'system/notice/index', 1, 0,  'C', 0, 0, 'system:notice:view',       'message',             'admin', now(), '', null, '通知公告菜单');
insert into sys_menu values('108',  '日志管理', '1', '9', 'log',                     '', 1, 0,  'M', 0, 0, '',                         'log',                      'admin', now(), '', null, '日志管理菜单');
insert into sys_menu values('109',  '在线用户', '2', '1', 'online',       'monitor/online/index', 1, 0,  'C', 0, 0, 'monitor:online:view',      'online',              'admin', now(), '', null, '在线用户菜单');
insert into sys_menu values('110',  '定时任务', '2', '2', 'job',          'monitor/job/index', 1, 0,  'C', 0, 0, 'monitor:job:view',         'job',                 'admin', now(), '', null, '定时任务菜单');
insert into sys_menu values('111',  '数据监控', '2', '3', 'druid',         'monitor/druid/index', 1, 0,  'C', 0, 0, 'monitor:data:view',        'druid',               'admin', now(), '', null, '数据监控菜单');
insert into sys_menu values('112',  '服务监控', '2', '4', 'server',       'monitor/server/index', 1, 0,  'C', 0, 0, 'monitor:server:view',      'server',              'admin', now(), '', null, '服务监控菜单');
insert into sys_menu values('113',  '缓存监控', '2', '5', 'cache',          'monitor/cache/index', 1, 0,  'C', '0',  '0', 'monitor:cache:list',      'redis',                 'admin', now(), '', null, '缓存监控菜单');
insert into sys_menu values('114',  '表单构建', '3', '1', 'build',           'tool/build/index', 1, 0,  'C', 0, 0, 'tool:build:view',          'build',               'admin', now(), '', null, '表单构建菜单');
insert into sys_menu values('115',  '代码生成', '3', '2', 'gen',             'tool/gen/index', 1, 0,  'C', 0, 0, 'tool:gen:view',            'code',                'admin', now(), '', null, '代码生成菜单');
insert into sys_menu values('116',  '系统接口', '3', '3', 'swagger',        'tool/swagger/index', 1, 0,  'C', 0, 0, 'tool:swagger:view',        'swagger',             'admin', now(), '', null, '系统接口菜单');
-- 三级菜单
insert into sys_menu values('500',  '操作日志', '108', '1', 'operlog',    'monitor/operlog/index', 1, 0,  'C', 0, 0, 'monitor:operlog:view',     'form',  'admin', now(), '', null, '操作日志菜单');
insert into sys_menu values('501',  '登录日志', '108', '2', 'logininfor', 'monitor/logininfor/index', 1, 0,  'C', 0, 0, 'monitor:logininfor:view',  'logininfor',  'admin', now(), '', null, '登录日志菜单');
-- 用户管理按钮
insert into sys_menu values('1000', '用户查询', '100', '1',  '#', '',  1, 0, 'F', 0, 0, 'system:user:list',        '#', 'admin', now(), '', null, '');
insert into sys_menu values('1001', '用户新增', '100', '2',  '#', '',  1, 0, 'F', 0, 0, 'system:user:add',         '#', 'admin', now(), '', null, '');
insert into sys_menu values('1002', '用户修改', '100', '3',  '#', '',  1, 0, 'F', 0, 0, 'system:user:edit',        '#', 'admin', now(), '', null, '');
insert into sys_menu values('1003', '用户删除', '100', '4',  '#', '',  1, 0, 'F', 0, 0, 'system:user:remove',      '#', 'admin', now(), '', null, '');
insert into sys_menu values('1004', '用户导出', '100', '5',  '#', '',  1, 0, 'F', 0, 0, 'system:user:export',      '#', 'admin', now(), '', null, '');
insert into sys_menu values('1005', '用户导入', '100', '6',  '#', '',  1, 0, 'F', 0, 0, 'system:user:import',      '#', 'admin', now(), '', null, '');
insert into sys_menu values('1006', '重置密码', '100', '7',  '#', '',  1, 0, 'F', 0, 0, 'system:user:resetPwd',    '#', 'admin', now(), '', null, '');
-- 角色管理按钮
insert into sys_menu values('1007', '角色查询', '101', '1',  '#', '',  1, 0, 'F', 0, 0, 'system:role:list',        '#', 'admin', now(), '', null, '');
insert into sys_menu values('1008', '角色新增', '101', '2',  '#', '',  1, 0, 'F', 0, 0, 'system:role:add',         '#', 'admin', now(), '', null, '');
insert into sys_menu values('1009', '角色修改', '101', '3',  '#', '',  1, 0, 'F', 0, 0, 'system:role:edit',        '#', 'admin', now(), '', null, '');
insert into sys_menu values('1010', '角色删除', '101', '4',  '#', '',  1, 0, 'F', 0, 0, 'system:role:remove',      '#', 'admin', now(), '', null, '');
insert into sys_menu values('1011', '角色导出', '101', '5',  '#', '',  1, 0, 'F', 0, 0, 'system:role:export',      '#', 'admin', now(), '', null, '');
-- 菜单管理按钮
insert into sys_menu values('1012', '菜单查询', '102', '1',  '#', '',  1, 0, 'F', 0, 0, 'system:menu:list',        '#', 'admin', now(), '', null, '');
insert into sys_menu values('1013', '菜单新增', '102', '2',  '#', '',  1, 0, 'F', 0, 0, 'system:menu:add',         '#', 'admin', now(), '', null, '');
insert into sys_menu values('1014', '菜单修改', '102', '3',  '#', '',  1, 0, 'F', 0, 0, 'system:menu:edit',        '#', 'admin', now(), '', null, '');
insert into sys_menu values('1015', '菜单删除', '102', '4',  '#', '',  1, 0, 'F', 0, 0, 'system:menu:remove',      '#', 'admin', now(), '', null, '');
-- 部门管理按钮
insert into sys_menu values('1016', '部门查询', '103', '1',  '#', '',  1, 0, 'F', 0, 0, 'system:dept:list',        '#', 'admin', now(), '', null, '');
insert into sys_menu values('1017', '部门新增', '103', '2',  '#', '',  1, 0, 'F', 0, 0, 'system:dept:add',         '#', 'admin', now(), '', null, '');
insert into sys_menu values('1018', '部门修改', '103', '3',  '#', '',  1, 0, 'F', 0, 0, 'system:dept:edit',        '#', 'admin', now(), '', null, '');
insert into sys_menu values('1019', '部门删除', '103', '4',  '#', '',  1, 0, 'F', 0, 0, 'system:dept:remove',      '#', 'admin', now(), '', null, '');
-- 岗位管理按钮
insert into sys_menu values('1020', '岗位查询', '104', '1',  '#', '',  1, 0, 'F', 0, 0, 'system:post:list',        '#', 'admin', now(), '', null, '');
insert into sys_menu values('1021', '岗位新增', '104', '2',  '#', '',  1, 0, 'F', 0, 0, 'system:post:add',         '#', 'admin', now(), '', null, '');
insert into sys_menu values('1022', '岗位修改', '104', '3',  '#', '',  1, 0, 'F', 0, 0, 'system:post:edit',        '#', 'admin', now(), '', null, '');
insert into sys_menu values('1023', '岗位删除', '104', '4',  '#', '',  1, 0, 'F', 0, 0, 'system:post:remove',      '#', 'admin', now(), '', null, '');
insert into sys_menu values('1024', '岗位导出', '104', '5',  '#', '',  1, 0, 'F', 0, 0, 'system:post:export',      '#', 'admin', now(), '', null, '');
-- 字典管理按钮
insert into sys_menu values('1025', '字典查询', '105', '1', '#', '',  1, 0, 'F', 0, 0, 'system:dict:list',         '#', 'admin', now(), '', null, '');
insert into sys_menu values('1026', '字典新增', '105', '2', '#', '',  1, 0, 'F', 0, 0, 'system:dict:add',          '#', 'admin', now(), '', null, '');
insert into sys_menu values('1027', '字典修改', '105', '3', '#', '',  1, 0, 'F', 0, 0, 'system:dict:edit',         '#', 'admin', now(), '', null, '');
insert into sys_menu values('1028', '字典删除', '105', '4', '#', '',  1, 0, 'F', 0, 0, 'system:dict:remove',       '#', 'admin', now(), '', null, '');
insert into sys_menu values('1029', '字典导出', '105', '5', '#', '',  1, 0, 'F', 0, 0, 'system:dict:export',       '#', 'admin', now(), '', null, '');
-- 参数设置按钮
insert into sys_menu values('1030', '参数查询', '106', '1', '#', '',  1, 0, 'F', 0, 0, 'system:config:list',      '#', 'admin', now(), '', null, '');
insert into sys_menu values('1031', '参数新增', '106', '2', '#', '',  1, 0, 'F', 0, 0, 'system:config:add',       '#', 'admin', now(), '', null, '');
insert into sys_menu values('1032', '参数修改', '106', '3', '#', '',  1, 0, 'F', 0, 0, 'system:config:edit',      '#', 'admin', now(), '', null, '');
insert into sys_menu values('1033', '参数删除', '106', '4', '#', '',  1, 0, 'F', 0, 0, 'system:config:remove',    '#', 'admin', now(), '', null, '');
insert into sys_menu values('1034', '参数导出', '106', '5', '#', '',  1, 0, 'F', 0, 0, 'system:config:export',    '#', 'admin', now(), '', null, '');
-- 通知公告按钮
insert into sys_menu values('1035', '公告查询', '107', '1', '#', '',  1, 0, 'F', 0, 0, 'system:notice:list',      '#', 'admin', now(), '', null, '');
insert into sys_menu values('1036', '公告新增', '107', '2', '#', '',  1, 0, 'F', 0, 0, 'system:notice:add',       '#', 'admin', now(), '', null, '');
insert into sys_menu values('1037', '公告修改', '107', '3', '#', '',  1, 0, 'F', 0, 0, 'system:notice:edit',      '#', 'admin', now(), '', null, '');
insert into sys_menu values('1038', '公告删除', '107', '4', '#', '',  1, 0, 'F', 0, 0, 'system:notice:remove',    '#', 'admin', now(), '', null, '');
-- 操作日志按钮
insert into sys_menu values('1039', '操作查询', '500', '1', '#', '',  1, 0, 'F', 0, 0, 'monitor:operlog:list',    '#', 'admin', now(), '', null, '');
insert into sys_menu values('1040', '操作删除', '500', '2', '#', '',  1, 0, 'F', 0, 0, 'monitor:operlog:remove',  '#', 'admin', now(), '', null, '');
insert into sys_menu values('1041', '详细信息', '500', '3', '#', '',  1, 0, 'F', 0, 0, 'monitor:operlog:detail',  '#', 'admin', now(), '', null, '');
insert into sys_menu values('1042', '日志导出', '500', '4', '#', '',  1, 0, 'F', 0, 0, 'monitor:operlog:export',  '#', 'admin', now(), '', null, '');
-- 登录日志按钮
insert into sys_menu values('1043', '登录查询', '501', '1', '#', '',  1, 0, 'F', 0, 0, 'monitor:logininfor:list',         '#', 'admin', now(), '', null, '');
insert into sys_menu values('1044', '登录删除', '501', '2', '#', '',  1, 0, 'F', 0, 0, 'monitor:logininfor:remove',       '#', 'admin', now(), '', null, '');
insert into sys_menu values('1045', '日志导出', '501', '3', '#', '',  1, 0, 'F', 0, 0, 'monitor:logininfor:export',       '#', 'admin', now(), '', null, '');
insert into sys_menu values('1046', '账户解锁', '501', '4', '#', '',  1, 0, 'F', 0, 0, 'monitor:logininfor:unlock',       '#', 'admin', now(), '', null, '');
-- 在线用户按钮
insert into sys_menu values('1047', '在线查询', '109', '1', '#', '',  1, 0, 'F', 0, 0, 'monitor:online:list',             '#', 'admin', now(), '', null, '');
insert into sys_menu values('1048', '批量强退', '109', '2', '#', '',  1, 0, 'F', 0, 0, 'monitor:online:batchForceLogout', '#', 'admin', now(), '', null, '');
insert into sys_menu values('1049', '单条强退', '109', '3', '#', '',  1, 0, 'F', 0, 0, 'monitor:online:forceLogout',      '#', 'admin', now(), '', null, '');
-- 定时任务按钮
insert into sys_menu values('1050', '任务查询', '110', '1', '#', '',  1, 0, 'F', 0, 0, 'monitor:job:list',                '#', 'admin', now(), '', null, '');
insert into sys_menu values('1051', '任务新增', '110', '2', '#', '',  1, 0, 'F', 0, 0, 'monitor:job:add',                 '#', 'admin', now(), '', null, '');
insert into sys_menu values('1052', '任务修改', '110', '3', '#', '',  1, 0, 'F', 0, 0, 'monitor:job:edit',                '#', 'admin', now(), '', null, '');
insert into sys_menu values('1053', '任务删除', '110', '4', '#', '',  1, 0, 'F', 0, 0, 'monitor:job:remove',              '#', 'admin', now(), '', null, '');
insert into sys_menu values('1054', '状态修改', '110', '5', '#', '',  1, 0, 'F', 0, 0, 'monitor:job:changeStatus',        '#', 'admin', now(), '', null, '');
insert into sys_menu values('1055', '任务详细', '110', '6', '#', '',  1, 0, 'F', 0, 0, 'monitor:job:detail',              '#', 'admin', now(), '', null, '');
insert into sys_menu values('1056', '任务导出', '110', '7', '#', '',  1, 0, 'F', 0, 0, 'monitor:job:export',              '#', 'admin', now(), '', null, '');
-- 代码生成按钮
insert into sys_menu values('1057', '生成查询', '114', '1', '#', '',  1, 0, 'F', 0, 0, 'tool:gen:list',     '#', 'admin', now(), '', null, '');
insert into sys_menu values('1058', '生成修改', '114', '2', '#', '',  1, 0, 'F', 0, 0, 'tool:gen:edit',     '#', 'admin', now(), '', null, '');
insert into sys_menu values('1059', '生成删除', '114', '3', '#', '',  1, 0, 'F', 0, 0, 'tool:gen:remove',   '#', 'admin', now(), '', null, '');
insert into sys_menu values('1060', '预览代码', '114', '4', '#', '',  1, 0, 'F', 0, 0, 'tool:gen:preview',  '#', 'admin', now(), '', null, '');
insert into sys_menu values('1061', '生成代码', '114', '5', '#', '',  1, 0, 'F', 0, 0, 'tool:gen:code',     '#', 'admin', now(), '', null, '');

-- ----------------------------
-- 6、用户和角色关联表  用户N-1角色
-- ----------------------------
drop table if exists sys_user_role;
create table sys_user_role (
   user_id              BIGINT                 not null,
   role_id              BIGINT                 not null,
   constraint PK_SYS_USER_ROLE primary key (user_id, role_id)
);

comment on table sys_user_role is '用户和角色关联表';
comment on column sys_user_role.user_id is '用户ID';
comment on column sys_user_role.role_id is '角色ID';

-- ----------------------------
-- 初始化-用户和角色关联表数据
-- ----------------------------
insert into sys_user_role values ('1', '1');
insert into sys_user_role values ('2', '2');


-- ----------------------------
-- 7、角色和菜单关联表  角色1-N菜单
-- ----------------------------
drop table if exists sys_role_menu;
create table sys_role_menu (
   role_id              BIGINT                 not null,
   menu_id              BIGINT                 not null,
   constraint PK_SYS_ROLE_MENU primary key (role_id, menu_id)
);

comment on table sys_role_menu is '角色和菜单关联表';
comment on column sys_role_menu.role_id is '角色ID';
comment on column sys_role_menu.menu_id is '菜单ID';

-- ----------------------------
-- 初始化-角色和菜单关联表数据
-- ----------------------------
insert into sys_role_menu values ('2', '1');
insert into sys_role_menu values ('2', '2');
insert into sys_role_menu values ('2', '3');
insert into sys_role_menu values ('2', '4');
insert into sys_role_menu values ('2', '100');
insert into sys_role_menu values ('2', '101');
insert into sys_role_menu values ('2', '102');
insert into sys_role_menu values ('2', '103');
insert into sys_role_menu values ('2', '104');
insert into sys_role_menu values ('2', '105');
insert into sys_role_menu values ('2', '106');
insert into sys_role_menu values ('2', '107');
insert into sys_role_menu values ('2', '108');
insert into sys_role_menu values ('2', '109');
insert into sys_role_menu values ('2', '110');
insert into sys_role_menu values ('2', '111');
insert into sys_role_menu values ('2', '112');
insert into sys_role_menu values ('2', '113');
insert into sys_role_menu values ('2', '114');
insert into sys_role_menu values ('2', '115');
insert into sys_role_menu values ('2', '500');
insert into sys_role_menu values ('2', '501');
insert into sys_role_menu values ('2', '1000');
insert into sys_role_menu values ('2', '1001');
insert into sys_role_menu values ('2', '1002');
insert into sys_role_menu values ('2', '1003');
insert into sys_role_menu values ('2', '1004');
insert into sys_role_menu values ('2', '1005');
insert into sys_role_menu values ('2', '1006');
insert into sys_role_menu values ('2', '1007');
insert into sys_role_menu values ('2', '1008');
insert into sys_role_menu values ('2', '1009');
insert into sys_role_menu values ('2', '1010');
insert into sys_role_menu values ('2', '1011');
insert into sys_role_menu values ('2', '1012');
insert into sys_role_menu values ('2', '1013');
insert into sys_role_menu values ('2', '1014');
insert into sys_role_menu values ('2', '1015');
insert into sys_role_menu values ('2', '1016');
insert into sys_role_menu values ('2', '1017');
insert into sys_role_menu values ('2', '1018');
insert into sys_role_menu values ('2', '1019');
insert into sys_role_menu values ('2', '1020');
insert into sys_role_menu values ('2', '1021');
insert into sys_role_menu values ('2', '1022');
insert into sys_role_menu values ('2', '1023');
insert into sys_role_menu values ('2', '1024');
insert into sys_role_menu values ('2', '1025');
insert into sys_role_menu values ('2', '1026');
insert into sys_role_menu values ('2', '1027');
insert into sys_role_menu values ('2', '1028');
insert into sys_role_menu values ('2', '1029');
insert into sys_role_menu values ('2', '1030');
insert into sys_role_menu values ('2', '1031');
insert into sys_role_menu values ('2', '1032');
insert into sys_role_menu values ('2', '1033');
insert into sys_role_menu values ('2', '1034');
insert into sys_role_menu values ('2', '1035');
insert into sys_role_menu values ('2', '1036');
insert into sys_role_menu values ('2', '1037');
insert into sys_role_menu values ('2', '1038');
insert into sys_role_menu values ('2', '1039');
insert into sys_role_menu values ('2', '1040');
insert into sys_role_menu values ('2', '1041');
insert into sys_role_menu values ('2', '1042');
insert into sys_role_menu values ('2', '1043');
insert into sys_role_menu values ('2', '1044');
insert into sys_role_menu values ('2', '1045');
insert into sys_role_menu values ('2', '1046');
insert into sys_role_menu values ('2', '1047');
insert into sys_role_menu values ('2', '1048');
insert into sys_role_menu values ('2', '1049');
insert into sys_role_menu values ('2', '1050');
insert into sys_role_menu values ('2', '1051');
insert into sys_role_menu values ('2', '1052');
insert into sys_role_menu values ('2', '1053');
insert into sys_role_menu values ('2', '1054');
insert into sys_role_menu values ('2', '1055');
insert into sys_role_menu values ('2', '1056');
insert into sys_role_menu values ('2', '1057');
insert into sys_role_menu values ('2', '1058');
insert into sys_role_menu values ('2', '1059');
insert into sys_role_menu values ('2', '1060');
insert into sys_role_menu values ('2', '1061');

-- ----------------------------
-- 8、角色和部门关联表  角色1-N部门
-- ----------------------------
drop table if exists sys_role_dept;

create table sys_role_dept (
   role_id              BIGINT                 not null,
   dept_id              BIGINT                 not null,
   constraint PK_SYS_ROLE_DEPT primary key (role_id, dept_id)
);

comment on table sys_role_dept is '角色和部门关联表';
comment on column sys_role_dept.role_id is '用户ID';
comment on column sys_role_dept.dept_id is '岗位ID';

-- ----------------------------
-- 初始化-角色和部门关联表数据
-- ----------------------------
insert into sys_role_dept values ('2', '100');
insert into sys_role_dept values ('2', '101');
insert into sys_role_dept values ('2', '105');

-- ----------------------------
-- 9、用户与岗位关联表  用户1-N岗位
-- ----------------------------
drop table if exists sys_user_post;
create table sys_user_post (
   user_id              BIGINT                 not null,
   post_id              BIGINT                 not null,
   constraint PK_SYS_USER_POST primary key (user_id, post_id)
);

comment on table sys_user_post is '用户与岗位关联表';
comment on column sys_user_post.user_id is '用户ID';
comment on column sys_user_post.post_id is '岗位ID';

-- ----------------------------
-- 初始化-用户与岗位关联表数据
-- ----------------------------
insert into sys_user_post values ('1', '1');
insert into sys_user_post values ('2', '2');

-- ----------------------------
-- 10、操作日志记录
-- ----------------------------
drop table if exists sys_oper_log;
create table sys_oper_log (
   oper_id              BIGSERIAL not null,
   title                VARCHAR(50)          null default '',
   business_type        INT4                 null default 0,
   method               VARCHAR(100)         null default '',
   request_method       VARCHAR(10)     	 null default '',
   operator_type        INT4                 null default 0,
   oper_name            VARCHAR(50)          null default '',
   dept_name            VARCHAR(50)          null default '',
   oper_url             VARCHAR(255)         null default '',
   oper_ip              VARCHAR(30)          null default '',
   oper_location        VARCHAR(255)   	     null default '',
   oper_param           VARCHAR(2000)        null default '',
   json_result          VARCHAR(2000)        null default '',
   status               CHAR(1)                 null default '0',
   error_msg            VARCHAR(2000)        null default '',
   oper_time            TIMESTAMP            null,
   constraint PK_SYS_OPER_LOG primary key (oper_id)
);
alter sequence if exists sys_oper_log_oper_id_seq restart with 100 cache 20;

comment on table sys_oper_log is '操作日志记录';
comment on column sys_oper_log.oper_id is '日志主键';
comment on column sys_oper_log.title is '模块标题';
comment on column sys_oper_log.business_type is '业务类型（0其它 1新增 2修改 3删除）';
comment on column sys_oper_log.method is '方法名称';
comment on column sys_oper_log.request_method is '请求方式';
comment on column sys_oper_log.operator_type is '操作类别（0其它 1后台用户 2手机端用户）';
comment on column sys_oper_log.oper_name is '登录账号';
comment on column sys_oper_log.dept_name is '部门名称';
comment on column sys_oper_log.oper_url is '请求URL';
comment on column sys_oper_log.oper_ip is '主机地址';
comment on column sys_oper_log.oper_location  is '操作地点';
comment on column sys_oper_log.oper_param is '请求参数';
comment on column sys_oper_log.json_result    is '返回参数';
comment on column sys_oper_log.status is '操作状态（0正常 1异常）';
comment on column sys_oper_log.error_msg is '错误消息';
comment on column sys_oper_log.oper_time is '操作时间';


-- ----------------------------
-- 11、字典类型表
-- ----------------------------
drop table if exists  sys_dict_type;
create table sys_dict_type (
   dict_id              BIGSERIAL not null,
   dict_name            VARCHAR(100)         null default '',
   dict_type            VARCHAR(100)         null default '' unique,
   status               CHAR(1)              null default '0',
   create_by            VARCHAR(64)          null default '',
   create_time          TIMESTAMP                 null,
   update_by            VARCHAR(64)          null default '',
   update_time          TIMESTAMP                 null,
   remark               VARCHAR(500)         null default '',  
   constraint PK_SYS_DICT_TYPE primary key (dict_id)
);

alter sequence if exists sys_dict_type_dict_id_seq restart with 100 cache 20;

comment on table sys_dict_type is '字典类型表';
comment on column sys_dict_type.dict_id is '字典主键';
comment on column sys_dict_type.dict_name is '字典名称';
comment on column sys_dict_type.dict_type is '字典类型';
comment on column sys_dict_type.status is '状态（0正常 1禁用）';
comment on column sys_dict_type.create_by is '创建者';
comment on column sys_dict_type.create_time is '创建时间';
comment on column sys_dict_type.update_by is '更新者';
comment on column sys_dict_type.update_time is '更新时间';
comment on column sys_dict_type.remark is '备注';


insert into sys_dict_type values(1,  '用户性别', 'sys_user_sex',        '0', 'admin', now(), '', null, '用户性别列表');
insert into sys_dict_type values(2,  '菜单状态', 'sys_show_hide',       '0', 'admin', now(), '', null, '菜单状态列表');
insert into sys_dict_type values(3,  '系统开关', 'sys_normal_disable',  '0', 'admin', now(), '', null, '系统开关列表');
insert into sys_dict_type values(4,  '任务状态', 'sys_job_status',      '0', 'admin', now(), '', null, '任务状态列表');
insert into sys_dict_type values(5,  '任务分组', 'sys_job_group',       '0', 'admin', now(), '', null, '任务分组列表');
insert into sys_dict_type values(6,  '系统是否', 'sys_yes_no',          '0', 'admin', now(), '', null, '系统是否列表');
insert into sys_dict_type values(7,  '通知类型', 'sys_notice_type',     '0', 'admin', now(), '', null, '通知类型列表');
insert into sys_dict_type values(8,  '通知状态', 'sys_notice_status',   '0', 'admin', now(), '', null, '通知状态列表');
insert into sys_dict_type values(9,  '操作类型', 'sys_oper_type',       '0', 'admin', now(), '', null, '操作类型列表');
insert into sys_dict_type values(10, '系统状态', 'sys_common_status',   '0', 'admin', now(), '', null, '登录状态列表');

-- ----------------------------
-- 12、字典数据表
-- ----------------------------
drop table if exists  sys_dict_data;
create table sys_dict_data (
   dict_code            BIGSERIAL not null,
   dict_sort            INT4                 null default 0,
   dict_label           VARCHAR(100)         null default '',
   dict_value           VARCHAR(100)         null default '',
   dict_type            VARCHAR(100)         null default '',
   css_class            VARCHAR(100)         null,
   list_class           VARCHAR(100)         null,
   is_default           CHAR(1)              null,
   status               CHAR(1)              null default '0',
   create_by            VARCHAR(64)          null default '',
   create_time          TIMESTAMP                 null,
   update_by            VARCHAR(64)          null default '',
   update_time          TIMESTAMP                 null,
   remark               VARCHAR(500)         null default '',
   constraint PK_SYS_DICT_DATA primary key (dict_code)
);
alter sequence if exists sys_dict_data_dict_code_seq restart with 100 cache 20;

comment on table sys_dict_data is '字典数据表';
comment on column sys_dict_data.dict_code is '字典编码'; 
comment on column sys_dict_data.dict_sort is '字典排序';
comment on column sys_dict_data.dict_label is '字典标签';
comment on column sys_dict_data.dict_value is '字典键值';
comment on column sys_dict_data.dict_type is '字典类型';
comment on column sys_dict_data.css_class     is '样式属性（其他样式扩展）';
comment on column sys_dict_data.list_class    is '表格回显样式';
comment on column sys_dict_data.is_default    is '是否默认（Y是 N否）';
comment on column sys_dict_data.status is  '状态（0正常 1禁用）';
comment on column sys_dict_data.create_by is '创建者';
comment on column sys_dict_data.create_time is '创建时间';
comment on column sys_dict_data.update_by is '更新者';
comment on column sys_dict_data.update_time is '更新时间';
comment on column sys_dict_data.remark is '备注';

insert into sys_dict_data values(1,  1,  '男',       '0',       'sys_user_sex',        '',   '',        'Y', '0', 'admin', now(), '', null, '性别男');
insert into sys_dict_data values(2,  2,  '女',       '1',       'sys_user_sex',        '',   '',        'N', '0', 'admin', now(), '', null, '性别女');
insert into sys_dict_data values(3,  3,  '未知',     '2',       'sys_user_sex',        '',   '',        'N', '0', 'admin', now(), '', null, '性别未知');
insert into sys_dict_data values(4,  1,  '显示',     '0',       'sys_show_hide',       '',   'primary', 'Y', '0', 'admin', now(), '', null, '显示菜单');
insert into sys_dict_data values(5,  2,  '隐藏',     '1',       'sys_show_hide',       '',   'danger',  'N', '0', 'admin', now(), '', null, '隐藏菜单');
insert into sys_dict_data values(6,  1,  '正常',     '0',       'sys_normal_disable',  '',   'primary', 'Y', '0', 'admin', now(), '', null, '正常状态');
insert into sys_dict_data values(7,  2,  '停用',     '1',       'sys_normal_disable',  '',   'danger',  'N', '0', 'admin', now(), '', null, '停用状态');
insert into sys_dict_data values(8,  1,  '正常',     '0',       'sys_job_status',      '',   'primary', 'Y', '0', 'admin', now(), '', null, '正常状态');
insert into sys_dict_data values(9,  2,  '暂停',     '1',       'sys_job_status',      '',   'danger',  'N', '0', 'admin', now(), '', null, '停用状态');
insert into sys_dict_data values(10, 1,  '默认',     'DEFAULT', 'sys_job_group',       '',   '',        'Y', '0', 'admin', now(), '', null, '默认分组');
insert into sys_dict_data values(11, 2,  '系统',     'SYSTEM',  'sys_job_group',       '',   '',        'N', '0', 'admin', now(), '', null, '系统分组');
insert into sys_dict_data values(12, 1,  '是',       'Y',       'sys_yes_no',          '',   'primary', 'Y', '0', 'admin', now(), '', null, '系统默认是');
insert into sys_dict_data values(13, 2,  '否',       'N',       'sys_yes_no',          '',   'danger',  'N', '0', 'admin', now(), '', null, '系统默认否');
insert into sys_dict_data values(14, 1,  '通知',     '1',       'sys_notice_type',     '',   'warning', 'Y', '0', 'admin', now(), '', null, '通知');
insert into sys_dict_data values(15, 2,  '公告',     '2',       'sys_notice_type',     '',   'success', 'N', '0', 'admin', now(), '', null, '公告');
insert into sys_dict_data values(16, 1,  '正常',     '0',       'sys_notice_status',   '',   'primary', 'Y', '0', 'admin', now(), '', null, '正常状态');
insert into sys_dict_data values(17, 2,  '关闭',     '1',       'sys_notice_status',   '',   'danger',  'N', '0', 'admin', now(), '', null, '关闭状态');
insert into sys_dict_data values(18, 99, '其他',     '0',       'sys_oper_type',       '',   'info',    'N', '0', 'admin', now(), '', null, '其他操作');
insert into sys_dict_data values(19, 1,  '新增',     '1',       'sys_oper_type',       '',   'info',    'N', '0', 'admin', now(), '', null, '新增操作');
insert into sys_dict_data values(20, 2,  '修改',     '2',       'sys_oper_type',       '',   'info',    'N', '0', 'admin', now(), '', null, '修改操作');
insert into sys_dict_data values(21, 3,  '删除',     '3',       'sys_oper_type',       '',   'danger',  'N', '0', 'admin', now(), '', null, '删除操作');
insert into sys_dict_data values(22, 4,  '授权',     '4',       'sys_oper_type',       '',   'primary', 'N', '0', 'admin', now(), '', null, '授权操作');
insert into sys_dict_data values(23, 5,  '导出',     '5',       'sys_oper_type',       '',   'warning', 'N', '0', 'admin', now(), '', null, '导出操作');
insert into sys_dict_data values(24, 6,  '导入',     '6',       'sys_oper_type',       '',   'warning', 'N', '0', 'admin', now(), '', null, '导入操作');
insert into sys_dict_data values(25, 7,  '强退',     '7',       'sys_oper_type',       '',   'danger',  'N', '0', 'admin', now(), '', null, '强退操作');
insert into sys_dict_data values(26, 8,  '生成代码', '8',       'sys_oper_type',       '',   'warning', 'N', '0', 'admin', now(), '', null, '生成操作');
insert into sys_dict_data values(27, 9,  '清空数据', '9',       'sys_oper_type',       '',   'danger',  'N', '0', 'admin', now(), '', null, '清空操作');
insert into sys_dict_data values(28, 1,  '成功',     '0',       'sys_common_status',   '',   'primary', 'N', '0', 'admin', now(), '', null, '正常状态');
insert into sys_dict_data values(29, 2,  '失败',     '1',       'sys_common_status',   '',   'danger',  'N', '0', 'admin', now(), '', null, '停用状态');

-- ----------------------------
-- 13、参数配置表
-- ----------------------------
drop table if exists  sys_config;
create table sys_config (
   config_id            BIGSERIAL not null,
   config_name          VARCHAR(100)         null default '0',
   config_key           VARCHAR(100)         null default '',
   config_value         VARCHAR(100)         null default '',
   config_type          CHAR(1)              null default '',
   create_by            VARCHAR(64)          null default '',
   create_time          TIMESTAMP                 null,
   update_by            VARCHAR(64)          null default '',
   update_time          TIMESTAMP                 null,
   remark               VARCHAR(500)         null default '',
   constraint PK_SYS_CONFIG primary key (config_id)
);
alter sequence if exists sys_config_config_id_seq restart with 100 cache 20;
comment on table sys_config is '参数配置表';

comment on column sys_config.config_id is '字典编码';

comment on column sys_config.config_name is '字典排序';

comment on column sys_config.config_key is '字典标签';

comment on column sys_config.config_value is '字典键值';

comment on column sys_config.config_type is '字典类型';

comment on column sys_config.create_by is '创建者';

comment on column sys_config.create_time is '创建时间';

comment on column sys_config.update_by is '更新者';

comment on column sys_config.update_time is '更新时间';

comment on column sys_config.remark is '备注';


insert into sys_config values(1, '主框架页-默认皮肤样式名称',     'sys.index.skinName',       'skin-blue',     'Y', 'admin', now(), '', null, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
insert into sys_config values(2, '用户管理-账号初始密码',         'sys.user.initPassword',    '123456',        'Y', 'admin', now(), '', null, '初始化密码 123456');
insert into sys_config values(3, '主框架页-侧边栏主题',           'sys.index.sideTheme',      'theme-dark',    'Y', 'admin', now(), '', null, '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
insert into sys_config values(4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false',         'Y', 'admin', now(), '', null, '是否开启注册用户功能');
insert into sys_config values(5, '用户管理-密码字符范围',         'sys.account.chrtype',              '0',             'Y', 'admin', now(), '', null, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');
insert into sys_config values(6, '用户管理-初始密码修改策略',     'sys.account.initPasswordModify',   '0',             'Y', 'admin', now(), '', null, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
insert into sys_config values(7, '用户管理-账号密码更新周期',     'sys.account.passwordValidateDays', '0',             'Y', 'admin', now(), '', null, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
insert into sys_config values(8, '主框架页-菜单导航显示风格',     'sys.index.menuStyle',              'default',       'Y', 'admin', now(), '', null, '菜单导航显示风格（default为左侧导航菜单，topnav为顶部导航菜单）');
insert into sys_config values(9, '主框架页-是否开启页脚',         'sys.index.ignoreFooter',           'true',          'Y', 'admin', now(), '', null, '是否开启底部页脚显示（true显示，false隐藏）');

-- ----------------------------
-- 14、系统访问记录
-- ----------------------------
drop table if exists sys_logininfor;
create table sys_logininfor (
   info_id              BIGSERIAL            not null,
   user_name           VARCHAR(50)           null default '',
   ipaddr               VARCHAR(50)          null default '',
   login_location       VARCHAR(255)         null,
   browser              VARCHAR(50)          null default '',
   os                   VARCHAR(50)          null default '',
   status               CHAR(1)              null default '0',
   msg                  VARCHAR(255)         null default '',
   login_time           TIMESTAMP                 null,
   constraint PK_SYS_LOGININFOR primary key (info_id)
);

alter sequence if exists sys_logininfor_info_id_seq restart with 100  cache 20;

comment on table sys_logininfor is '系统访问记录';
comment on column sys_logininfor.info_id is '访问ID';
comment on column sys_logininfor.user_name is '登录账号';
comment on column sys_logininfor.ipaddr is '登录IP地址';
comment on column sys_logininfor.browser is '浏览器类型';
comment on column sys_logininfor.login_location is '登录地点';
comment on column sys_logininfor.os is '操作系统';
comment on column sys_logininfor.status is '登录状态 0成功 1失败';
comment on column sys_logininfor.msg is '提示消息';
comment on column sys_logininfor.login_time is '访问时间';

-- ----------------------------
-- 15、在线用户记录
-- ----------------------------
drop table if exists sys_user_online;
create table sys_user_online (
   sessionId            VARCHAR(50)          not null default '',
   user_name           VARCHAR(50)          null default '',
   dept_name            VARCHAR(50)          null default '',
   ipaddr               VARCHAR(50)          null default '',
   login_location       VARCHAR(255)         null,
   browser              VARCHAR(50)          null default '',
   os                   VARCHAR(50)          null default '',
   status               VARCHAR(10)          null default '',
   start_timestamp      TIMESTAMP                 null,
   last_access_time     TIMESTAMP                 null,
   expire_time          INT4                 null default 0,
   constraint PK_SYS_USER_ONLINE primary key (sessionId)
);

comment on table sys_user_online is '在线用户记录';
comment on column sys_user_online.sessionId is '用户会话id';
comment on column sys_user_online.user_name is '登录账号';
comment on column sys_user_online.dept_name is '部门名称';
comment on column sys_user_online.ipaddr is '登录IP地址';
comment on column sys_user_online.login_location    is '登录地点';
comment on column sys_user_online.browser is '浏览器类型';
comment on column sys_user_online.os is '操作系统';
comment on column sys_user_online.status is '在线状态on_line在线off_line离线';
comment on column sys_user_online.start_timestamp is 'session创建时间';
comment on column sys_user_online.last_access_time is 'session最后访问时间';
comment on column sys_user_online.expire_time is '超时时间，单位为分钟';

-- ----------------------------
-- 16、定时任务调度表
-- ----------------------------
drop table if exists  sys_job;

create table sys_job (
   job_id               BIGSERIAL not null,
   job_name             VARCHAR(64)          not null default '',
   job_group            VARCHAR(64)          not null default '',
   invoke_target        VARCHAR(500)         not null ,   
   cron_expression      VARCHAR(255)         null default '',
   misfire_policy       VARCHAR(20)   		 null default '3',
   concurrent           CHAR(1)        	     null default '1',
   status               CHAR(1)              null default '0',
   create_by            VARCHAR(64)          null default '',
   create_time          TIMESTAMP                 null,
   update_by            VARCHAR(64)          null default '',
   update_time          TIMESTAMP                 null,
   remark               VARCHAR(500)         null default '',
   constraint PK_SYS_JOB primary key (job_id, job_name, job_group)
);

alter sequence if exists sys_job_job_id_seq restart with 100 cache 20;

comment on table  sys_job                   is '定时任务调度表';
comment on column sys_job.job_id            is '任务主键';
comment on column sys_job.job_name          is '任务名称';
comment on column sys_job.job_group         is '任务组名';
comment on column sys_job.invoke_target     is '调用目标字符串';
comment on column sys_job.cron_expression   is 'cron执行表达式';
comment on column sys_job.misfire_policy    is '计划执行错误策略（1立即执行 2执行一次 3放弃执行）';
comment on column sys_job.concurrent        is '是否并发执行（0允许 1禁止）';
comment on column sys_job.status            is '状态（0正常 1暂停）';
comment on column sys_job.create_by         is '创建者';
comment on column sys_job.create_time       is '创建时间';
comment on column sys_job.update_by         is '更新者';
comment on column sys_job.update_time       is '更新时间';
comment on column sys_job.remark            is '备注信息';

insert into sys_job values(1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams',        '0/10 * * * * ?', '3', '1', '1', 'admin', now(), '', null, '');
insert into sys_job values(2, '系统默认（有参）', 'DEFAULT', E'ryTask.ryParams(\'ry\')',  '0/15 * * * * ?', '3', '1', '1', 'admin', now(), '', null, '');
insert into sys_job values(3, '系统默认（多参）', 'DEFAULT', E'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)',  '0/20 * * * * ?', '3', '1', '1', 'admin', now(), '', null, '');

-- ----------------------------
-- 17、定时任务调度日志表
-- ----------------------------
drop table if exists sys_job_log;
create table sys_job_log (
   job_log_id           BIGSERIAL not null,
   job_name             VARCHAR(64)          not null,
   job_group            VARCHAR(64)          not null,
   invoke_target        VARCHAR(500)    	 not null ,  
   job_message          VARCHAR(500)         null,
   status               CHAR(1)          default '0',      
   exception_info       VARCHAR(2000)                null,
   create_time          TIMESTAMP                 null,
   constraint PK_SYS_JOB_LOG primary key (job_log_id)
);
alter sequence if exists sys_job_log_job_log_id_seq  cache 20;

comment on table  sys_job_log                   is '定时任务调度日志表';
comment on column sys_job_log.job_log_id        is '日志主键';
comment on column sys_job_log.job_name          is '任务名称';
comment on column sys_job_log.job_group         is '任务组名';
comment on column sys_job_log.invoke_target     is '调用目标字符串';
comment on column sys_job_log.job_message       is '日志信息';
comment on column sys_job_log.status            is '执行状态（0正常 1失败）';
comment on column sys_job_log.exception_info    is '异常信息';
comment on column sys_job_log.create_time       is '创建时间';


-- ----------------------------
-- 18、通知公告表
-- ----------------------------
drop table if exists sys_notice;

create table sys_notice (
   notice_id            BIGSERIAL not null,
   notice_title         VARCHAR(50)          not null,
   notice_type          CHAR(2)              not null,
   notice_content       VARCHAR(2000)        null,
   status               CHAR(1)              null default '0',
   create_by            VARCHAR(64)          null default '',
   create_time          TIMESTAMP            null,
   update_by            VARCHAR(64)          null default '',
   update_time          TIMESTAMP            null,
   remark               VARCHAR(255)         null,
   constraint PK_SYS_NOTICE primary key (notice_id)
);
alter sequence if exists sys_notice_notice_id_seq restart with 10 cache 20;
comment on table  sys_notice                   is '通知公告表';
comment on column sys_notice.notice_id         is '公告主键';
comment on column sys_notice.notice_title      is '公告标题';
comment on column sys_notice.notice_type       is '公告类型（1通知 2公告）';
comment on column sys_notice.notice_content    is '公告内容';
comment on column sys_notice.status            is '公告状态（0正常 1关闭）';
comment on column sys_notice.create_by         is '创建者';
comment on column sys_notice.create_time       is '创建时间';
comment on column sys_notice.update_by         is '更新者';
comment on column sys_notice.update_time       is '更新时间';
comment on column sys_notice.remark            is '备注';

-- ----------------------------
-- 初始化-公告信息表数据
-- ----------------------------
insert into sys_notice values('1', '温馨提醒：2018-07-01 江某人新版本发布啦', '2', '新版本内容', '0', 'admin', now(), '', null, '管理员');
insert into sys_notice values('2', '维护通知：2018-07-01 江某人系统凌晨维护', '1', '维护内容',   '0', 'admin', now(), '', null, '管理员');


-- ----------------------------
-- 19、代码生成业务表
-- ----------------------------
drop table if exists gen_table;
create table gen_table (
  table_id           BIGSERIAL       not null,
  table_name         VARCHAR(200)    default '',
  table_comment      VARCHAR(500)    default '',
  sub_table_name     VARCHAR(64)      default null,
  sub_table_fk_name  VARCHAR(64)      default null,
  class_name         VARCHAR(100)    default '',
  tpl_category       VARCHAR(200)    default 'crud',
  package_name       VARCHAR(100),
  module_name        VARCHAR(30),
  business_name      VARCHAR(30),
  function_name      VARCHAR(50),
  function_author    VARCHAR(50),
  gen_type           CHAR(1)          default '0',
  gen_path           VARCHAR(200)    default '/',
  options            VARCHAR(1000),
  create_by          VARCHAR(64)     default '',
  create_time        TIMESTAMP,
  update_by          VARCHAR(64)     default '',
  update_time        TIMESTAMP,
  remark             VARCHAR(500)    default null
);

alter sequence if exists gen_table_table_id_seq  cache 20;

comment on table  gen_table                          is '代码生成业务表';
comment on column gen_table.table_id                 is '编号';
comment on column gen_table.table_name               is '表名称';
comment on column gen_table.table_comment            is '表描述';
comment on column gen_table.sub_table_name           is '关联子表的表名';
comment on column gen_table.sub_table_fk_name        is '子表关联的外键名';
comment on column gen_table.class_name               is '实体类名称';
comment on column gen_table.tpl_category             is '使用的模板（crud单表操作 tree树表操作 sub主子表操作）';
comment on column gen_table.package_name             is '生成包路径';
comment on column gen_table.module_name              is '生成模块名';
comment on column gen_table.business_name            is '生成业务名';
comment on column gen_table.function_name            is '生成功能名';
comment on column gen_table.function_author          is '生成功能作者';
comment on column gen_table.gen_type                 is '生成代码方式（0zip压缩包 1自定义路径）';
comment on column gen_table.gen_path                 is '生成路径（不填默认项目路径）';
comment on column gen_table.options                  is '其它生成选项';
comment on column gen_table.create_by                is '创建者';
comment on column gen_table.create_time              is '创建时间';
comment on column gen_table.update_by                is '更新者';
comment on column gen_table.update_time              is '更新时间';
comment on column gen_table.remark                   is '备注';


-- ----------------------------
-- 20、代码生成业务表字段
-- ----------------------------
drop table if exists gen_table_column;
create table gen_table_column (
  column_id          BIGSERIAL      not null,
  table_id           VARCHAR(64),
  column_name        VARCHAR(200),
  column_comment     VARCHAR(500),
  column_type        VARCHAR(100),
  java_type          VARCHAR(500),
  java_field         VARCHAR(200),
  is_pk              CHAR(1),
  is_increment       CHAR(1),
  is_required        CHAR(1),
  is_insert          CHAR(1),
  is_edit            CHAR(1),
  is_list            CHAR(1),
  is_query           CHAR(1),
  query_type         VARCHAR(200)    default 'EQ',
  html_type          VARCHAR(200),
  dict_type          VARCHAR(200)    default '',
  sort               INT4,
  create_by          VARCHAR(64)     default '',
  create_time        TIMESTAMP ,
  update_by          VARCHAR(64)     default '',
  update_time        TIMESTAMP
);

alter sequence if exists gen_table_column_column_id_seq  cache 20;

comment on table  gen_table_column                   is '代码生成业务表字段';
comment on column gen_table_column.column_id         is '编号';
comment on column gen_table_column.table_id          is '归属表编号';
comment on column gen_table_column.column_name       is '列名称';
comment on column gen_table_column.column_comment    is '列描述';
comment on column gen_table_column.column_type       is '列类型';
comment on column gen_table_column.java_type         is 'JAVA类型';
comment on column gen_table_column.java_field        is 'JAVA字段名';
comment on column gen_table_column.is_pk             is '是否主键（1是）';
comment on column gen_table_column.is_increment      is '是否自增（1是）';
comment on column gen_table_column.is_required       is '是否必填（1是）';
comment on column gen_table_column.is_insert         is '是否为插入字段（1是）';
comment on column gen_table_column.is_edit           is '是否编辑字段（1是）';
comment on column gen_table_column.is_list           is '是否列表字段（1是）';
comment on column gen_table_column.is_query          is '是否查询字段（1是）';
comment on column gen_table_column.query_type        is '查询方式（等于、不等于、大于、小于、范围）';
comment on column gen_table_column.html_type         is '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）';
comment on column gen_table_column.dict_type         is '字典类型';
comment on column gen_table_column.sort              is '排序';
comment on column gen_table_column.create_by         is '创建者';
comment on column gen_table_column.create_time       is '创建时间';
comment on column gen_table_column.update_by         is '更新者';
comment on column gen_table_column.update_time       is '更新时间';



-- ----------------------------
-- 函数 ，代替mysql的find_in_set
-- 例如： select * from sys_dept where FIND_IN_SET (101,ancestors) <> 0
-- mysql可接受0或其它number做为where 条件，postgresql只接受表达式做为where 条件 需要明确定义 表达式true  false
-- ----------------------------
-- CREATE OR REPLACE FUNCTION generate_subscripts(anyarray, int)
-- RETURNS SETOF int AS $$
-- SELECT generate_series(array_lower($1,$2), array_upper($1,$2))
-- $$ LANGUAGE sql;


-- CREATE OR REPLACE FUNCTION find_in_set(str text, strlist text)
-- RETURNS int AS $$
-- SELECT i
--    FROM generate_subscripts(string_to_array($2,','),1) g(i)
--   WHERE (string_to_array($2, ','))[i] = $1
--   UNION ALL
--   SELECT 0
--   LIMIT 1
-- $$ LANGUAGE sql STRICT;

CREATE OR REPLACE FUNCTION find_in_set(BIGINT,VARCHAR)
RETURNS BOOLEAN
AS $BODY$
DECLARE
  STR ALIAS FOR $1;
  STRS ALIAS FOR $2;
  POS INTEGER;
  STATUS BOOLEAN;
BEGIN
	SELECT POSITION( ','||STR||',' IN ','||STRS||',') INTO POS;
	IF POS > 0 THEN
	  STATUS = TRUE;
	ELSE
	  STATUS = FALSE;
	END IF;
	RETURN STATUS;
END;
$BODY$ LANGUAGE PLPGSQL;

---用户处理自动生成时的差异

CREATE OR REPLACE view view_self_table_columns
as select
	table_catalog ,
	table_schema ,
	table_name ,
	ordinal_position as sort,
	column_name ,
	data_type as TypeName,
	(case
		when (is_nullable = 'no' and contype !='p' ) then '1'
		else null
	end) as is_required,
	(case
		when contype = 'p' then '1'
		else '0'
	end) as is_pk,
	coalesce(character_maximum_length, numeric_precision,-1) as Length,	
	numeric_scale as scale,
	case
		is_nullable when 'NO' then 0
		else 1
	end as canNull,
	column_default as defaultval,
	case
		when position('nextval' in column_default)>0 then 1
		else 0
	end as IsIdentity,	
	(case
		when position('nextval' in column_default)>0 then 1
		else 0
	end) as is_increment,
	c.DeText as column_comment,
	c.typname as column_type,
	c.contype,
	ordinal_position
from
	information_schema.columns
	left join (select
		datname,pg_get_userbyid(relowner) AS tableowner,nspname,relname,attname, description as DeText,typname,pg_cons.contype
	from
		pg_class 
	left join pg_attribute pg_attr on
		pg_attr.attrelid = pg_class.oid
	left join pg_description pg_desc on
		pg_desc.objoid = pg_attr.attrelid
		and pg_desc.objsubid = pg_attr.attnum
	left join pg_namespace pg_ns on 
		pg_ns."oid" = pg_class.relnamespace
	left join pg_database on relowner = datdba 
	left join pg_type on pg_attr.atttypid = pg_type."oid" 
	left join (select pg_con.*,unnest(conkey) conkey_new from pg_constraint pg_con)  pg_cons on 
		pg_attr.attrelid = pg_class.oid
		and pg_attr.attnum = pg_cons.conkey_new and pg_cons.conrelid = pg_class.oid
	where
		pg_attr.attnum>0
		and pg_attr.attrelid = pg_class.oid		
		) c
	on table_catalog = datname  and table_schema = nspname and table_name = relname and column_name = attname;
--where
--	table_schema = 'public'
--	and table_name = 'sys_user_role'
--order by ordinal_position asc



CREATE OR REPLACE view view_self_table 
as select 
	    datname as table_catalog,
	    pg_get_userbyid(relowner) AS tableowner,
	    nspname as table_schema,		
		relname as table_name,
		cast(obj_description(relfilenode,'pg_class') as varchar) as table_comment ,
		now() create_time,
		now() update_time
from pg_class c
left join pg_namespace pg_ns on 
		pg_ns."oid" = c.relnamespace
left join pg_database on relowner = datdba 
where relname in (select tablename from pg_tables)