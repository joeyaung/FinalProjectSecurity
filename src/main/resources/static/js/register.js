let registerVM = new Vue({
  el: "#app",
  data: {
    fullName: "",
    username: "",
    password: "",
    phone: "",
    city: "",
    town: "",
    fullAddress: "",
  },
  methods: {
    checkIsEmailExits(email) {
      let imageNode = $("#label-email > img");
      let spanNode = $(".lab-input-container > span");
      imageNode.remove();
      spanNode.remove();
      let url = "/FinalProject/api/v1/member/isExits/" + email;

      $.ajax({
        url: url,
        method: "GET",
        dataType: "json",
        success: function (response) {
          if (response.status == "USERNAME_OK") {
            let errNode = document.createElement("span");
            errNode.innerText = "此電子郵件已被使用過, 請嘗試別的信箱";
            errNode.style.color = "#ff4757";
            $("#clientInputEmail").css("border", "1px solid #ff4757");
            $("#emailBlock").append(errNode);
            $("#input-submit").attr("disabled", "true");
          } else {
            $("#clientInputEmail").css("border", "1px solid #2ed573");
            let correctNode = document.createElement("img");
            correctNode.setAttribute("src", "./images/correct.png");
            correctNode.style.width = "15px";
            $("#label-email").append(correctNode);
            $("#input-submit").removeAttr("disabled");
          }
        },
      });
    },
    submitRegiser(e) {
      e.preventDefault();
      let data = {
        fullName: this.fullName,
        username: this.username,
        password: this.password,
        phone: this.phone,
        city: this.city,
        town: this.town,
        fullAddress: this.fullAddress,
      };
      $.ajax({
        url: "/FinalProject/api/v1/member/create",
        method: "POST",
        data: JSON.stringify(data),
        dataType: "text",
        contentType: "application/json; charset=utf-8",
        success: function (res) {
          confirm("註冊成功! 按下確定將為您導回登入頁面");
          window.location = "/FinalProject/login";
        },
        error: function (err) {
          console.log(err);
        },
      });
    },
    autoComplete() {
      this.fullName = "游聿民";
      this.username = "joe120106@gmail.com";
      this.password = "password";
      this.phone = "0917922177";
      this.city = "桃園市";
      this.town = "中壢區";
      this.fullAddress = "中大路300號";
    },
  },
  mounted: function () {
    this.$watch("username", function (newValue, oldValue) {
      this.checkIsEmailExits(newValue);
    }),
      { deep: true };
  },
});
