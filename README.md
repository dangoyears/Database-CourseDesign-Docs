# 前后端交互接口

## 基本信息

- 后端地址 `https://dbcd.qfstudio.net`

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
        "token": "07c08e27826abde6eacef0ffbc9686a030647c33"
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
- 需要对数据是否重复进行判断

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
    [
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
