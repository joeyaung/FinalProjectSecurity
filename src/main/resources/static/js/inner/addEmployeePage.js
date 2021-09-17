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
    submitAddEmployee(e) {
      this.isSending = true;
      e.preventDefault();
      let self = this.employeeInput;
      let _this = this;
      let formData = {
        fullName: self.fullName,
        username: self.email,
        phone: self.phone,
        title: self.title,
        manager: self.manager,
        department: self.department,
        location: self.location,
        salary: self.salary,
      };

      let url = "/FinalProject/inner/admin/api/v1/employee/create";

      $.ajax({
        url: url,
        method: "POST",
        data: JSON.stringify(formData),
        contentType: "application/json; charset=UTF-8",
        dataType: "json",
        success: function (response) {
          _this.isSending = false;
          _this.employeeInput = {
            department: "",
            email: "",
            fullName: "",
            location: "",
            manager: "",
            phone: "",
            salary: "",
            title: "",
          };
          alert("新增員工成功! 請員工至信箱收取密碼信");
        },
        error: function (error) {
          console.log(error);
        },
      });
    },
    autocomplete() {
      let newData = {
        department: "SALES",
        email: "joe120106@gmail.com",
        fullName: "羅大佑",
        location: "TAIPEI",
        manager: "1",
        phone: "0917922177",
        salary: "45000",
        title: "CES",
      };
      this.employeeInput = newData;
    },
  },
});
