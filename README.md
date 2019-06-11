# 前后端交互接口
- [基本信息](#基本信息)
- [登陆](#用户登陆)
- [信息登入](#信息登入)
  - [学院信息登入](#学院信息登入)
  - [教师信息登入](#教师信息登入)
  - [学生信息登入](#学生信息登入)
  - [信息获取](#信息获取)
- [学院信息获取](#学院信息获取)
- [教师信息获取](#教师信息获取)
- [学生信息获取](#学生信息获取)
- [信息删除](#信息删除)
  - [班级信息删除](#班级信息删除)
  - [学生/教师信息删除](#学生/教师信息删除)
- [其他操作](#其他操作)

## 基本信息

- 前端地址 `http://dangosky.com/dbcourse/`
- 后端地址 `https://dbcd.qfstudio.net`
- ~~服务器端的响应均包含statusCode `Number`和statusText `String`字段。~~（正在调试）

## 用户登陆

- 路径 `/login`
- 必选参数
  - user `String`
  - pass `String`
  - type `String` in {`"admin"`, `"teacher"`, `"student"`}
- 响应
  - token `String`

调用例子

- 请求参数

    ```json
    {
        "user": "17063000xx",
        "pass": "dangoyears",
        "type": "admin"
    }
    ```

- 响应

    ```json
    {
        "statusCode": 0,
        "statusText": "成功。",
        "token": "07c08e27826abde6eacef0ffbc9686a030647c33",
    }
    ```

## 信息登入

### 学院信息登入
- 方式 `post`
- 路径 `/write/college`
- 参数
  - college `String`
  - specialty `String`
  - grade `String`
  - class `String`
- 注意：需要对数据是否重复进行判断

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
- 方式 `post`
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
        "status": "在读本科",
        "sex": "男",
        "birthday": "xxxx-xx-xx",
        "age": "21",
        "idCard": "440582199708310612",
        "password": "310612"
    }
    ```
- **备注**：先查询数据库中是否已经存在该学生信息（根据学号查询），若没有则创建，已经存在的话则进行信息修改。
- **说明**：若是创建学生个人信息的话，还需要将 `studentId` 和 `password` 加入到学生登陆验证表单中。

### 教师信息登入
- 方式 `post`
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
        "password": "310612"
    }
    ```
- **备注**：先查询数据库中是否已经存在该教师信息（根据工号查询），若没有则创建，已经存在的话则进行信息修改。
- **说明**：若是创建教师个人信息的话，还需要将 `jobId` 和 `password` 加入到教师登陆验证表单中。

## 信息获取

### 学院信息获取

- 路径 `/read/college`
- 返回数据
  - college `String`
  - specialty `String`
  - grade `String`
  - class `String`
  - sum `String`

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
            }
        ]
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
- 说明：需要综合学院、专业、年级、班级等信息删除数据。

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


## 其他操作

- 必选参数
  - token
