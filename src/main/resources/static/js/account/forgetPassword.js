let forgetPasswordVM = new Vue({
  el: "#app",
  data: {
    email: "",
    error_node: {
      show: false,
      msg: "查無此用戶, 請重新輸入",
    },
    tokenStatus: false,
  },
  computed: {
    encodingEmail() {
      let newEmail = "";
      let length = this.email.length;
      let indexOfAt = this.email.indexOf("@");
      let encodingLength = Math.round(indexOfAt / 2);
      newEmail = newEmail + this.email.substring(0, encodingLength);
      for (let i = 0; i < indexOfAt - encodingLength; i++) {
        newEmail = newEmail + "*";
      }
      newEmail = newEmail + this.email.substring(indexOfAt);
      return newEmail;
    },
  },
  methods: {
    submit(event) {
      event.preventDefault();
      let formData = {
        username: this.email,
      };
      let self = this;
      $.ajax({
        url: "/FinalProject/api/v1/member/reset_password",
        data: JSON.stringify(formData),
        dataType: "json",
        contentType: "application/json;charset=UTF-8",
        method: "POST",
        success: function (response) {
          console.log(response);
          if (response.status == "MEMBER_NOT_FOUND") {
            self.error_node.show = true;
            self.error_node.msg = "查無此用戶, 請重新輸入";
          }
          if (response.status == "fail") {
            self.error_node.show = true;
            self.error_node.msg = "發生不明錯誤, 請在嘗試一次";
          }
          if (response.status == "ok") {
            self.error_node.show = false;
            self.tokenStatus = true;
          }
        },
        error: function (error) {
          console.log(error);
        },
      });
    },
  },
});
