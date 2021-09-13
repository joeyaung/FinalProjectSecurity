let resetVM = new Vue({
  el: "#app",
  data: {
    updateStatus: false,
    password: "",
  },
  methods: {
    submitPassword(event) {
      event.preventDefault();
      const queryString = window.location.search;
      const urlParams = new URLSearchParams(queryString);
      let tokenString = urlParams.get("token");
      let self = this;
      let formData = {
        password: this.password,
        token: tokenString,
      };
      $.ajax({
        url: "/FinalProject/api/v1/member/update_new_password",
        method: "POST",
        data: JSON.stringify(formData),
        dataType: "json",
        contentType: "application/json;charset=UTF-8",
        success: function (response) {
          if (response.status == "ok") {
            self.updateStatus = true;
          }
          console.log(response);
        },
      });
    },
  },
});
