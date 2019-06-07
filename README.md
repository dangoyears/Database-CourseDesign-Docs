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

- 路径 `/imformation/college`
- 参数
    - collegeName `String`
    - specialtyName `String`
    - className `String`

调用例子

- 发送参数

    ```json
    {
        "collegeName": "12345",
        "specialtyName": "软件工程",
        "className": "1班"
    }
    ```

- 说明： 若 `specialtyName` 和 `className` 为空则代表只创建学院，若 `className` 为空则代表只创建专业。

## 其他操作

- 必选参数
  - token
