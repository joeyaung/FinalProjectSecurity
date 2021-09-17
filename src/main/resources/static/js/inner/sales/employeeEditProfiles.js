let addEmpVM = new Vue({
  el: "#app",
  data: {
    employeeInput: {
      fullName: "",
      email: "",
      phone: "",
      title: "",
      manager: "",
      department: "",
      location: "",
      salary: "",
    },
    isSending: false,
  },
  methods: {
    fetchProfileData() {
      let _this = this;

      $.ajax({
        url: `/FinalProject/inner/sales/api/v1/profile`,
        method: "GET",
        dataType: "json",
        success: function (response) {
          if (response.status == "ok") {
            _this.employeeInput = response.data;
            _this.employeeInput.password = "";
          } else {
            console.log(response.error);
          }
        },
        error: function (error) {
          console.log(error);
        },
      });
    },
    submitUpdateProfile(event) {
      this.isSending = true;
      event.preventDefault();
      let _this = this;
      let formData = this.employeeInput;
      $.ajax({
        url: `/FinalProject/inner/sales/api/v1/profile`,
        method: "PUT",
        dataType: "json",
        contentType: "application/json;charset=UTF-8",
        data: JSON.stringify(formData),
        success: function (response) {
          alert(response.status);
          _this.isSending = false;
        },
        error: function (error) {
          console.log(error);
          _this.isSending = false;
        },
      });
    },
  },
  beforeMount: function () {
    this.fetchProfileData();
  },
});
