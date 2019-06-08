# 前后端交互接口

## 基本信息

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
        "grade": "17级",
        "class": "1班"
    }
    ```

- 说明：若 `specialtyName` 和 `className` 为空则代表只创建学院，若 `className` 为空则代表只创建专业。

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
            "grade": "17级",
            "class": "1班",
            "sum": "41"
        },
        {
            "college": "计算机科学与网络工程学院",
            "specialty": "软件工程",
            "grade": "18级",
            "class": "4班",
            "sum": "40"
        },
        {
            "college": "人文学院",
            "specialty": "汉语言文学",
            "grade": "15级",
            "class": "2班",
            "sum": "41"
        }]
    }
    ```

## 其他操作

- 必选参数
  - token
