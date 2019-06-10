# 前后端交互接口
- [基本信息](#基本信息)
- [登陆](#用户登陆)
- [信息登入](#信息登入)
    - [学院信息登入](#学院信息登入)
    - [学生信息登入](#学生信息登入)
- [信息获取](#信息获取)
    - [学院信息获取](#学院信息获取)
- [信息删除](#信息删除)
    - [班级信息删除](#班级信息删除)
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
- 注意：需要对数据是否重复进行判断

调用例子

- 发送参数

    ```json
    {
        "college": "计算机科学与网络工程学院",
        "specialty": "软件工程",
        "grade": "17",
        "class": "1",
        "name": "XXX",
        "studentId": "1706300032",
        "status": "在读本科",
        "sex": "男",
        "birthday": "Sun Sep 06 1998 00:00:00 GMT+0800 (中国标准时间)",
        "age": "21
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
        }]
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

## 其他操作

- 必选参数
  - token
