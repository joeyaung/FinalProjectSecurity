<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-TW">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>忘記密碼</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@100;400;700&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="/FinalProject/css/account/forgetPassword.css"
    />
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.6.7/vue.js"
      integrity="sha512-y/+zR8ZRJXvRWVRuhPbjSpGNIv2yG9hePHeWYEb5RPcciLwlyG0ZGd6JsiT9+sFtTON9FrDs+07ZzepwatYX1Q=="
      crossorigin="anonymous"
    ></script>
  </head>

  <body>
    <a href="./"
      ><img class="img-logo" src="./images/audi-logo.png" alt="logo"
    /></a>
    <div id="app">
      <div class="form-container" v-show="!tokenStatus">
        <h1 @click="autoComplete">忘記密碼?</h1>
        <form id="login-form">
          <div class="lab-input-container">
            <div class="lab-input-container" id="emailBlock">
              <label for="username">請輸入您註冊的電子郵件 </label><br />
              <input
                type="email"
                name="username"
                class="input-field"
                id="clientInputEmail"
                v-model="email"
              /><br />
              <div class="error-msg-container" v-show="error_node.show">
                <span> {{ error_node.msg }} </span>
              </div>
            </div>

            <div class="lab-input-container">
              <input
                id="input-submit"
                type="submit"
                value="送出"
                @click="submit($event)"
                v-show="!isSend"
              /><br />
            </div>
            <div class="loading-container" v-if="isSend">
              <img
                src="/FinalProject/images/loading.gif"
                class="loading-gif"
                alt=""
              />
            </div>
          </div>
        </form>
      </div>
      <div class="form-container" v-show="tokenStatus">
        <div class="p-container">
          <span> 驗證信已寄至</span>
          <span> {{ encodingEmail }},</span>
          <span>請至您的信箱收信 </span>
        </div>
      </div>
    </div>
    <script src="/FinalProject/js/jquery-3.6.0.js"></script>
    <script src="/FinalProject/js/account/forgetPassword.js"></script>
  </body>
</html>
