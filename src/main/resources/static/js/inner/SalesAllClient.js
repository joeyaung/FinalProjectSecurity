$(document).ready(function () {
  var table = $("#allClients").DataTable({
    ajax: "/FinalProject/inner/sales/api/v1/clients/query?stage=all",
    colReorder: false,
    columnDefs: [
      {
        targets: -1,
        data: null,
        defaultContent: "<a href='#'><i class='fas fa-link'></i></a>",
        orderable: false,
      },
    ],
  });

  $("#allClients tbody").on("click", "a", function () {
    var data = table.row($(this).parents("tr")).data();
    url = `/FinalProject/inner/sales/ClientInfo?cli=${data[6]}`;
    window.open(url, "_blank").focus();
  });

  salesMainVM.$mount("#app");
});

let salesMainVM = new Vue({
  data: {
    queryString: "",
    queryClient: [],
  },
  computed: {
    showDropDown() {
      if (this.queryString == "") {
        return false;
      } else {
        return true;
      }
    },
  },
  methods: {
    fetchQueryName(query) {
      let _this = this;
      let formData = {
        queryString: query,
      };
      $.ajax({
        url: "/FinalProject/inner/sales/api/v1/query/client",
        method: "POST",
        data: JSON.stringify(formData),
        dataType: "json",
        contentType: "application/json;charset=UTF-8",
        success: function (response) {
          if (response.status == "ok") {
            _this.queryClient = response.data;
          }
        },
        error: function (err) {
          console.log(err);
        },
      });
    },
  },
  mounted: function () {
    let _this = this;
    this.$watch("queryString", function (newValue, oldValue) {
      _this.fetchQueryName(newValue);
    });
  },
});
