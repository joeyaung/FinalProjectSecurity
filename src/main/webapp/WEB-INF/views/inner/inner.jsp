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

    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.6.7/vue.js"
      integrity="sha512-y/+zR8ZRJXvRWVRuhPbjSpGNIv2yG9hePHeWYEb5RPcciLwlyG0ZGd6JsiT9+sFtTON9FrDs+07ZzepwatYX1Q=="
      crossorigin="anonymous"
    ></script>
    <style>
      * {
        margin: 0%;
        padding: 0%;
      }

      body {
        background-image: url(./images/14.jpg);
        background-repeat: no-repeat;
        background-size: 100% auto;
        background-position: center top;
        background-attachment: fixed;
      }

      .img-logo {
        position: fixed;
        top: 10px;
        left: 10px;
        width: 120px;
      }

      .form-container {
        /* border: 1px solid blue; */
        box-shadow: rgb(38, 57, 77) 0px 20px 30px -10px;
        width: 250px;
        position: fixed;
        left: 50%;
        top: 25%;
        transform: translate(-50%, 0);
        background-color: #dfe4ea;
        border-radius: 15px;
        padding: 30px;
      }

      .form-container h1 {
        font-weight: inherit;
        margin-bottom: 10px;
      }

      .lab-input-container {
        /* margin-top: 20px; */
        /* border: 1px solid red; */
        text-align: center;
        padding-top: 10px;
      }

      .lab-input-container label {
        float: left;
        margin-left: 10px;
        font-size: 13px;
        padding-left: 10px;
      }

      .lab-input-container input {
        /* text-align: center; */
        /* text-indent: 10px; */
        margin-top: 10px;
        border-radius: 20px;
        border: none;
        height: 30px;
        width: 90%;
      }

      .lab-input-container input:hover {
        margin-top: 10px;
        border-radius: 20px;
        border: none;
        height: 30px;
        width: 90%;
        background-color: #f7f7f7;
      }

      .lab-input-container input:focus {
        margin-top: 10px;
        outline: none;
        border-radius: 20px;
        border: none;
        height: 30px;
        width: 90%;
        background-color: #f7f7f7;
      }

      #input-submit {
        position: relative;
        text-align: center;
        margin-top: 10px;
        border-radius: 20px;
        border: none;
        height: 30px;
        width: 90%;
        color: #f1f2f6;
        background-color: #2f3542;
      }

      #input-submit:hover {
        margin-top: 10px;
        border-radius: 20px;
        border: none;
        height: 30px;
        width: 90%;
        color: #f1f2f6;
        background-color: #15171b;
        cursor: pointer;
      }

      .href-forget-passwd {
        /* border: 1px solid green; */
        align-items: center;
        text-align: center;
        padding-top: 10px;
      }

      .href-forget-passwd a {
        color: #5352ed;
        text-decoration: none;
        font-size: 13px;
      }

      .href-forget-passwd a:hover {
        color: #5352ed;
        text-decoration: underline;
        font-size: 13px;
      }

      .href-forget-passwd a:visited {
        color: #5352ed;
        text-decoration: none;
        font-size: 13px;
      }

      .form-input-box {
        text-indent: 10px;
      }
    </style>
  </head>

  <body>
    <a href="./"
      ><img class="img-logo" src="./images/audi-logo.png" alt="logo"
    /></a>
    <div class="form-container" id="app">
      <h1 @click="autocomplete($event)">登入</h1>
      <form action="login" method="POST">
        <input
          type="text"
          name="userType"
          value="employee"
          style="display: none"
        /><br />
        <div class="lab-input-container">
          <label for="clientemail">電子郵件地址 </label><br />
          <input
            type="email"
            class="form-input-box"
            name="username"
            v-model="username"
          /><br />
        </div>
        <div class="lab-input-container">
          <label for="passwd">密碼 </label><br />
          <input
            type="password"
            name="password"
            class="form-input-box"
            v-model="password"
          /><br />
        </div>
        <div class="lab-input-container">
          <input id="input-submit" type="submit" value="送出" /><br />
        </div>
      </form>
    </div>
    <script>
      let loginInnerVM = new Vue({
      	el: "#app",
      	data:{
      		username: "",
      		password:"",
      		counter = 0,
      		timer = null,
      	},
      	methods: {
      		autocomplete(event){
      			var self = this
                this.counter++
                if(this.counter == 1) {
                    this.timer = setTimeout(function() {
                        // DO NOTHING BUT RESET IN CASE THERES JUST ONE CLICK
						this.username = "admin@demo.com";
						this.password = "asd";
                        self.counter = 0
                    }, 500);  // increase delay as you like
                }else{
                    clearTimeout(this.timer);
                    this.username = "admin@demo.com";
					this.password = "asd";
                    self.counter = 0
                    self.counter = 0;
                }
      		},
      	}
      })
    </script>
  </body>
</html>
