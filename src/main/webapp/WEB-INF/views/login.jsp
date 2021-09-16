<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-TW">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>登入</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC:wght@100;400;700&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="./css/login.css" />
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
    <div class="form-container" id="app">
      <h1 @click="autocomplete">登入</h1>
      <form action="login" method="POST" id="login-form">
        <input
          type="text"
          name="userType"
          value="member"
          style="display: none"
        /><br />
        <div class="lab-input-container">
          <div class="lab-input-container" id="emailBlock">
            <label for="username">電子郵件地址 </label><br />
            <input
              type="email"
              name="username"
              class="input-field"
              id="clientInputEmail"
              v-model="member.username"
              @change="isEmailExits"
              :class="{ 'error-username-input': error_node.show }"
            /><br />
            <div class="errorNode">
              <span v-show="error_node.show">
                {{ error_node.msg }}
              </span>
            </div>
          </div>
          <div class="lab-input-container">
            <label for="password">密碼 </label><br />
            <input
              type="password"
              name="password"
              class="input-field"
              id="clientInputPasswd"
              autocomplete="on"
              v-model="member.password"
            /><br />
          </div>
          <div class="lab-input-container">
            <input id="input-submit" type="submit" value="送出" /><br />
          </div>
          <div class="href-forget-passwd">
            <a href="/FinalProject/forget_password">忘記密碼?</a>
          </div>

          <hr class="line-hr" />
          <div class="register-container">
            <a href="/FinalProject/register"
              ><button class="btn-register" @click="registerRouter($event)">
                註冊帳戶
              </button></a
            ><br />
            <span @click="autocompleteMember">一鍵登入</span>
          </div>
        </div>
      </form>
    </div>
    <script src="/FinalProject/js/jquery-3.6.0.js"></script>
    <script src="/FinalProject/js/login.js"></script>
  </body>

</html>

