# 前后端交互接口

- [基本信息](#基本信息)
- [用户状态](#用户状态)
  - [用户登陆](#用户登陆)
  - [用户注销](#用户注销)
- [信息登入](#信息登入)
  - [学院信息登入](#学院信息登入)
  - [教师信息登入](#教师信息登入)
  - [学生信息登入](#学生信息登入)
  - [课程信息登入](#课程信息登入)
  - [学生自主选课](#学生自主选课)
- [信息获取](#信息获取)
  - [学院信息获取](#学院信息获取)
  - [教师信息获取](#教师信息获取)
  - [学生信息获取](#学生信息获取)
  - [课程信息获取](#课程信息获取)
  - [学生个人信息获取](#学生个人信息获取)
  - [教师个人信息获取](#教师个人信息获取)
- [信息删除](#信息删除)
  - [班级信息删除](#班级信息删除)
  - [学生/教师信息删除](#学生教师信息删除)
  - [课程信息删除](#课程信息删除)
- [其他操作](#其他操作)
  - [欢迎路由](#欢迎路由)

## 基本信息

- 前端地址 `http://dangosky.com/dbcourse/`
- 后端地址 `https://dbcd.qfstudio.net`
- 参数形式 使用JSON格式。
  - 服务器的响应为JSON对象，顶层JSON对象总是包含“基本响应”：`msg: String`和`code: Number`字段。
  - `msg`为开发调试可能有用的信息。
  - `code`为状态码，非零状态码表示操作成功完成。状态码可能为负。
- HTTP方法 同时支持`GET`和`POST`。
- 关于token

    若API接口中提及“权限”字段，则表明该API接口仅对特定角色的用户开放。
    在使用这类接口时，需要传入在`/login`接口中取得的token参数。

## 用户状态

### 用户登陆

- 路径 `/login`
- 必选参数
  - user `String`
  - pass `String`
  - type `String` in {`"admin"`, `"teacher"`, `"student"`}
- 响应
  - token `String` 非空；登陆失败时返回空字符串`""`。
- 备注：若 `type` 为 teacher，还需返回一个标记 `identity` 表示该教师是否为教务办主任。否则可不返回 `identity`。

调用例子

- 请求参数

    ```json
    {
        "user": "dangoyears",
        "pass": "dangoyears",
        "type": "admin"
    }
    ```

- 响应

    ```json
    {
        "code": 0,
        "msg": "认证成功。",
        "token": "gFr3i1qqIAKL9HoEajSfGJRnQ3KkysLX",
        "identity": "superTeacher"
    }
    ```

### 用户注销

- 路径 `/logout`
- 必选参数
  - token `String` 在[用户登陆](#用户登陆)路由中取得的token。
- 响应 仅包含基本响应。

## 信息登入

### 学院信息登入

- 权限 `admin`
- 路径 `/write/college`
- 参数
  - college `String`
  - specialty `String`
  - grade `String`
  - class `String`
- **注意**：需要对数据是否重复进行判断

调用例子

- 发送参数

    ```json
    {
        "college": "计算机科学与网络工程学院",
        "specialty": "软件工程",
        "grade": "17",
        "class": "1"
    }
    ```

### 学生信息登入

- 权限 `admin`
- 路径 `/write/student`
- 参数
  - college `String`
  - specialty `String`
  - grade `String`
  - class `String`
  - name `String`
  - studentId `String`
  - status `String`
  - sex `String`
  - birthday `String`
  - age `String`
  - idCard `String`
  - password `String`
  - yearSystem `String`

调用例子

- 发送参数

    ```json
    {
        "college": "计算机科学与网络工程学院",
        "specialty": "软件工程",
        "grade": "17",
        "class": "1",
        "name": "xxx",
        "studentId": "1706300032",
        "status": "在读本科生",
        "sex": "男",
        "birthday": "xxxx-xx-xx",
        "age": "21",
        "idCard": "440582199708310612",
        "password": "310612",
        "yearSystem": "4"
    }
    ```

- **备注**：先查询数据库中是否已经存在该学生信息（根据学号查询），若没有则创建，已经存在的话则进行信息修改。
- **说明**：若是创建学生个人信息的话，还需要将 `studentId` 和 `password` 加入到学生登陆验证表单中。

### 教师信息登入

- 权限 `admin`
- 路径 `/write/teacher`
- 参数
  - college `String`
  - name `String`
  - jobId `String`
  - sex `String`
  - education `String`
  - graduation `String`
  - birthday `String`
  - age `String`
  - idCard `String`
  - password `String`
  - position `String`

调用例子

- 发送参数

    ```json
    {
        "college": "计算机科学与网络工程学院",
        "name": "xxx",
        "jobId": "0000000001",
        "sex": "男",
        "education": "硕士",
        "graduation": "南开大学",
        "birthday": "xxxx-xx-xx",
        "age": "xx",
        "idCard": "440582199708310612",
        "password": "310612",
        "position": "教务办主任"
    }
    ```

- **备注**：先查询数据库中是否已经存在该教师信息（根据工号查询），若没有则创建，已经存在的话则进行信息修改。
- **说明**：若是创建教师个人信息的话，还需要将 `jobId` 和 `password` 加入到教师登陆验证表单中。

### 课程信息登入

- 权限 `admin`、`teacher`
- 路径 `/write/course`
- 参数
  - name `String`,
  - id `String`,
  - credit `String`,
  - nature `String`,
  - accommodate `String`,
  - selectedSum `String`,
  - time `String`,
  - teachers `Array`,
  - courseLeader `String`,
  - address `String`
  - class `Array`,

调用例子

- 发送参数

    ```json
    {
        "name": "数据结构",
        "id": "0000000001",
        "credit": "2",
        "nature": "专业必修课",
        "accommodate": "50",
        "selectedSum": "50",
        "time": "第7-14周,第4-6节",
        "teachers": "['xxx', 'yyy']",
        "courseLeader": "yyy",
        "address": "理科南教学楼710",
        "class": "['计算机科学与网络学院-软件工程-171']"
    }
    ```

- **说明**：
  - 若任课教师 teachers 只有一名，则课程组长 courseLeader 为空。
  - 若班级 class 为空数组，说明该课程没有指定某一个班级需要上课。
  
- **备注**：
  - 若数据库中该课程编号已经存在，则修改课程信息。否则为创建课程信息。
  - 还需将该课程数据登入到每一个任课教师的信息中。具体信息见[教师个人信息的获取](#教师信息获取)。
  - 若 class 不为空，还需将该课程数据登入到班级里每一个学生的信息中。具体信息见[学生个人信息的获取](#学生信息获取)。

### 学生自主选课

- 权限 `student`
- 路径 `/register/course`
- 参数
  - classId `String`
  - college `String`
  - specialty `String`
  - grade `String`
  - class `String`
  - name `String`
  - studentId `String`
  - sex `String`
- 说明：往课程编号为`classId`的课程中插入选修了该课程的学生信息。

调用例子

- 发送参数

    ```json
    {
        "classId": "0000000001",
        "college": "计算机科学与网络学院",
        "specialty": "软件工程",
        "grade": "17",
        "class": "1",
        "name": "夏侯瑾轩",
        "studentId": "1706300000",
        "sex": "男"
    }
    ```

## 信息获取

### 学院信息获取

- 路径 `/read/college`
- 返回数据
  - college `String`
  - specialty `String`
  - grade `String`
  - class `String`
  - sum `String`
- 权限授予：`admin`、`teacher`

调用例子

- 响应

    ```json
    {
        "data": [
            {
                "college": "计算机科学与网络工程学院",
                "specialty": "软件工程",
                "grade": "17",
                "class": "1",
                "sum": "41"
            },
            {
                "college": "计算机科学与网络工程学院",
                "specialty": "软件工程",
                "grade": "18",
                "class": "4",
                "sum": "40"
            },
            {
                "college": "人文学院",
                "specialty": "汉语言文学",
                "grade": "15",
                "class": "2",
                "sum": "41"
            }
        ]
    }
    ```

### 学生信息获取

- 路径 `/read/student`
- 返回数据
  - college `String`
  - specialty `String`
  - grade `String`
  - class `String`
  - name `String`
  - studentId `String`
  - status `String`
  - sex `String`
  - birthday `String`
  - age `String`
  - idCard `String`
  - yearSystem `String`
  - schedule `Array`

调用例子

- 响应

    ```json
    {
        "data": [
            {
                "college": "计算机科学与网络工程学院",
                "specialty": "软件工程",
                "grade": "17",
                "class": "1",
                "name": "xxx",
                "studentId": "1706300032",
                "status": "在读本科",
                "sex": "男",
                "birthday": "xxxx-xx-xx",
                "age": "21",
                "idCard": "440582199708310612",
                "yearSystem": "4",
                "schedule": [
                    {
                        "name": "数据结构",
                        "id": "0000000001",
                        "credit": "2",
                        "nature": "专业必修课",
                        "accommodate": "50",
                        "selectedSum": "50",
                        "time": "第7-14周,第4-6节",
                        "teachers": "['xxx', 'yyy']",
                        "courseLeader": "yyy",
                        "address": "理科南教学楼710",
                        "class": "['计算机科学与网络学院-软件工程-171']",
                        "score": "90"
                    }
                    ...
                ]
            }
            {
                "college": "人文学院",
                "specialty": "汉语言文学",
                "grade": "18",
                "class": "1",
                "name": "xxx",
                "studentId": "1806300027",
                "status": "在读本科",
                "sex": "女",
                "birthday": "xxxx-xx-xx",
                "age": "21",
                "idCard": "440582199708310612",
                "yearSystem": "5",
                "schedule": []
            }
        ]
    }
    ```

### 教师信息获取

- 路径 `/read/teacher`
- 返回数据
  - college `String`
  - name `String`
  - jobId `String`
  - sex `String`
  - education `String`
  - graduation `String`
  - birthday `String`
  - age `String`
  - idCard `String`
  - position `String`
  - schedule `String`

调用例子

- 响应

    ```json
    {
        "data": [
            {
                "college": "计算机科学与网络工程学院",
                "name": "xxx",
                "jobId": "0000000001",
                "sex": "男",
                "education": "硕士",
                "graduation": "南开大学",
                "birthday": "xxxx-xx-xx",
                "age": "xx",
                "idCard": "440582199708310612",
                "position": "教务办主任",
                 "schedule": [
                    {
                        "name": "数据结构",
                        "id": "0000000001",
                        "credit": "2",
                        "nature": "专业必修课",
                        "accommodate": "50",
                        "selectedSum": "50",
                        "time": "第7-14周,第4-6节",
                        "teachers": "['xxx', 'yyy']",
                        "courseLeader": "yyy",
                        "address": "理科南教学楼710",
                        "class": "['计算机科学与网络学院-软件工程-171']",
                    }
                    ...
                ]
            }
            {
                "college": "人文学院",
                "name": "xxx",
                "jobId": "0000000002",
                "sex": "女",
                "education": "博士后",
                "graduation": "北京大学",
                "birthday": "xxxx-xx-xx",
                "age": "xx",
                "idCard": "440582199708310612",
                "position": "普通教师",
                "schedule": []
            }
        ]
    }
    ```

### 课程信息获取

- 路径 `/read/course`
- 返回数据
  - name `String`
  - id `String`
  - credit `String`
  - nature `String`
  - accommodate `String`
  - selectedSum `String`
  - time `String`
  - teachers `Array`
  - courseLeader `String`
  - address `String`
  - class `Array`
  - students `Array`
- 说明：`students`为选择该课程的学生，数组元素是`Object`，包含的属性有：学院、专业、班级、姓名、学号、性别。
- 权限授予：`admin`、`student`

调用例子

- 响应

    ```json
    {
        "data": [
            {
                "name": "数据结构",
                "id": "0000000001",
                "credit": "2",
                "nature": "专业必修课",
                "accommodate": "50",
                "selectedSum": "50",
                "time": "第7-14周,第4-6节",
                "teachers": "['xxx', 'yyy']",
                "courseLeader": "yyy",
                "address": "理科南教学楼710",
                "class": "['计算机科学与网络学院-软件工程-171']",
                "students": "[{}, {}]"
            }
        ]
    }
    ```

### 学生个人信息获取

- 路径 `/read/student/one`
- 请求参数 `studentId`
- 返回数据
  - college `String`
  - specialty `String`
  - grade `String`
  - class `String`
  - name `String`
  - studentId `String`
  - status `String`
  - sex `String`
  - birthday `String`
  - age `String`
  - idCard `String`
  - yearSystem `String`
  - schedule `Array`

调用例子

- 参数
    `https://dbcd.qfstudio.net/read/student/one?studentId=studentId`
- 响应

    ```json
    {
        "data": {
            "college": "计算机科学与网络工程学院",
            "specialty": "软件工程",
            "grade": "17",
            "class": "1",
            "name": "xxx",
            "studentId": "1706300032",
            "status": "在读本科",
            "sex": "男",
            "birthday": "xxxx-xx-xx",
            "age": "21",
            "idCard": "440582199708310612",
            "yearSystem": "4",
            "schedule": [
                {
                    "name": "数据结构",
                    "id": "0000000001",
                    "credit": "2",
                    "nature": "专业必修课",
                    "accommodate": "50",
                    "time": "第7-14周,第4-6节",
                    "teachers": "['xxx', 'yyy']",
                    "courseLeader": "yyy",
                    "address": "理科南教学楼710",
                    "class": "['计算机科学与网络学院-软件工程-171']",
                    "score": "90"
                }
                ...
            ]
        }
    }
    ```

### 教师个人信息获取

- 路径 `/read/teacher/one`
- 请求参数 `jobId`
- 返回数据
  - college `String`
  - name `String`
  - jobId `String`
  - sex `String`
  - education `String`
  - graduation `String`
  - birthday `String`
  - age `String`
  - idCard `String`
  - position `String`
  - schedule `String`

调用例子

- 参数
    `https://dbcd.qfstudio.net/read/teacher/one?jobId=jobId`
- 响应

    ```json
    {
        "data": {
            "college": "计算机科学与网络工程学院",
            "name": "xxx",
            "jobId": "0000000001",
            "sex": "男",
            "education": "硕士",
            "graduation": "南开大学",
            "birthday": "xxxx-xx-xx",
            "age": "xx",
            "idCard": "440582199708310612",
            "position": "教务办主任",
                "schedule": [
                    {
                        "name": "数据结构",
                        "id": "0000000001",
                        "credit": "2",
                        "nature": "专业必修课",
                        "accommodate": "50",
                        "time": "第7-14周,第4-6节",
                        "teachers": "['xxx', 'yyy']",
                        "courseLeader": "yyy",
                        "address": "理科南教学楼710",
                        "class": "['计算机科学与网络学院-软件工程-171']",
                    }
                    ...
            ]
        }
    }
    ```

## 信息删除

### 班级信息删除

- 路径 `/delete/class`
- 参数

    ```json
        {
            "college": "计算机科学与网络工程学院",
            "specialty": "软件工程",
            "grade": "17",
            "class": "1",
            "sum": "41"
        }
    ```

- **说明**：需要综合学院、专业、年级、班级等信息删除数据。
- **备注**：需要级联删去该班级中的所有学生信息。

### 学生/教师信息删除

- 路径 `/delete/both`
- 参数
  - type `String`
  - id `String`
- 说明：根据 `type` 指定要删除的用户类型（学生或教师），通过唯一的学号 / 工号来查找删除即可。
- **备注**：还需要从学生 / 教师登陆表单中删去相应的登陆账号。

调用例子

- 发送参数

    ```json
        {
            "type": "student",
            "id": "xxxxxxxxxx"
        }
    ```

### 课程信息删除

- 路径 `/delete/class`
- 参数
  - id `String`
- 说明：根据课程编号 id 来删除课程。
- **备注**：还需要从学生 / 教师的个人课表信息 schedule 中删去相应的课程。

调用例子

`https://dbcd.qfstudio.net/delete/class?id=id`

## 其他操作

### 欢迎路由

- 路径 `/`, `/welcome`
- 返回服务器的欢迎信息。
- 响应
  - ver `String` 服务器软件版本
  - doc `String` 后端文档链接
