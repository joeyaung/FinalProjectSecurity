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
  },
  methods: {
    submitAddEmployee(e) {
      e.preventDefault();
      let self = this.employeeInput;
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
          console.log(response.id);
          let redirectPath = `/FinalProject/inner/emp?q=${response.id}`;
          confirm("新增員工成功! 將為你導向員工資訊");
          window.location = redirectPath;
        },
        error: function (error) {
          console.log(error);
        },
      });
    },
  },
});
