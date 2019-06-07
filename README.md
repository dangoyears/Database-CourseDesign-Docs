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

## 其他操作

- 必选参数
  - token
