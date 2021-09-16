let loginVM = new Vue({
  el: "#app",
  data: {
    member: {
      username: "",
      password: "",
      isValidate: false,
    },
    error_node: {
      show: false,
      msg: "",
    },
  },
  methods: {
    isEmailExits(email) {
      let urlAPI = `/FinalProject/api/v1/member/isExits/${email}`;
      let self = this;
      $.ajax({
        url: urlAPI,
        method: "GET",
        dataType: "json",
        success: function (response) {
          console.log(response);
          if (response.status == "USERNAME_OK") {
            self.member.isValidate = true;
            self.error_node.show = false;
            self.error_node.msg = "";
          }
          if (response.status == "USERNAME_NOT_EXITS") {
            self.member.isValidate = false;
            self.error_node.show = true;
            self.error_node.msg = "此用戶並不存在";
          }
        },
      });
    },
    registerRouter(event) {
      event.preventDefault();
      window.location = "http://localhost:8080/FinalProject/register";
    },
    autocomplete() {
      this.member.username = "joe120106@gmail.com";
      this.member.password = "password";
    },
    autocompleteMember() {
      this.member.username = "member@demo.com";
      this.member.password = "password";
    },
  },
  mounted: function () {
    this.$watch("member.username", function (newValue, oldValue) {
      this.isEmailExits(newValue);
    }),
      { deep: true };
  },


});

