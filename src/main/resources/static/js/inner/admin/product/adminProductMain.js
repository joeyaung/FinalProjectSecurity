var productTable = Object;

$(document).ready(function () {
  productTable = $("#productsTable").DataTable({
    language: {
      info: "正在顯示 _START_ 到 _END_ 筆商品(總共為 _TOTAL_筆)",
      lengthMenu: "顯示 _MENU_ 筆資料",
      search: "搜尋:",
      paginate: {
        first: "首筆",
        last: "最後",
        next: "下一頁",
        previous: "前一頁",
      },
    },
    lengthMenu: [5, 10, 25, 50],
    search: {
      return: true,
    },
    ajax: {
      url: "/FinalProject/api/v1/product",
      dataSrc: "",
    },
    columns: [
      { data: "id", width: "10%" },
      { data: "imgPath", orderable: false },
      { data: "name" },
      { data: "originalPrice" },
      { data: "quantityInStock" },
      { data: "onSale" },
      { data: "curPrice" },
      { data: "tags", visible: false, searchable: true },
    ],
    columnDefs: [
      {
        targets: 1,
        data: "imgPath",
        render: function (data, type, row, meta) {
          return '<img src="' + data + '" width="100px">';
        },
      },
      {
        targets: 2,
        data: "name",
        render: function (data, type, row, meta) {
          return `<a href="/FinalProject/inner/admin/products/edit/${row.id}"> ${row.name} </a>`;
        },
      },
      {
        targets: 3,
        data: "originalPrice",
        render: function (data, type, row, meta) {
          var formatter = new Intl.NumberFormat("en-US", {
            style: "currency",
            currency: "USD",

            maximumFractionDigits: 0,
          });

          return formatter.format(data);
        },
      },
      {
        targets: 5,
        data: "onSale",
        render: function (data, type, row, meta) {
          if (data == true) {
            return "是";
          } else {
            return "-";
          }
        },
      },
      {
        targets: 6,
        data: "curPrice",
        render: function (data, type, row, meta) {
          var formatter = new Intl.NumberFormat("en-US", {
            style: "currency",
            currency: "USD",

            maximumFractionDigits: 0,
          });

          return formatter.format(data);
        },
      },
    ],
  });
});

Vue.component("modal", {
  template: "#modal-template",
});

let productMainVM = new Vue({
  el: "#app",
  data: {
    newProductModule: {
      showModal: false,
      selectedImage: null,
      formData: {
        name: "Men's shirt",
        image_path: "",
        origin_price: "200",
        quantity_in_stock: "10",
        isOnSale: false,
        sale_price: "",
        tagsInput: "",
        tags: ["Men"],
      },
    },
  },
  methods: {
    toggleIsOnSale() {
      this.newProductModule.formData.isOnSale =
        !this.newProductModule.formData.isOnSale;
    },
    onTagsEnter() {
      this.newProductModule.formData.tags.push(
        this.newProductModule.formData.tagsInput
      );
      this.newProductModule.formData.tagsInput = "";
    },
    removeTag(index) {
      this.newProductModule.formData.tags.splice(index, 1);
    },
    focusFileInput() {
      $("#imageFileInput").click();
    },
    imageChoosen(event) {
      this.newProductModule.formData.image_path = event.target.files[0].name;
      this.newProductModule.selectedImage = event.target.files[0];
    },
    imageFileCheck(event) {
      let file = event.target.files[0];
      if (file.type == "image/png" || file.type == "image/jpeg") {
        return;
      } else {
        event.target.value = "";
        alert("請上傳圖片檔案 ( PNG or JPEG )");
      }
    },
    showNewProductModal() {
      this.newProductModule.showModal = true;
    },
    hideNewProductModal() {
      this.newProductModule.showModal = false;
    },
    submitImage(id) {
      let formData = new FormData();
      formData.append("file", this.newProductModule.selectedImage);
      let self = this;
      $.ajax({
        url: "/FinalProject/api/v1/product/create/image/" + id,
        method: "POST",
        dataType: "text",
        processData: false,
        contentType: false,
        data: formData,
        success: function (res) {
          if (res == "ok") {
            self.newProductModule.showModal = false;
            self.newProductModule.formData = {
              name: "",
              image_path: "",
              origin_price: "",
              quantity_in_stock: "",
              isOnSale: false,
              sale_price: "",
              tagsInput: "",
              tags: [],
            };
            alert(`Product id: ${id} created!`);
            productTable.ajax.reload();
          } else {
            alert(res);
          }
        },
      });
    },
    submitProductInfo() {
      return $.ajax({
        url: "/FinalProject/api/v1/product/create",
        method: "POST",
        contentType: "application/json; charset=UTF-8",
        dataType: "text",
        data: JSON.stringify(this.newProductModule.formData),
      });
    },
    submitProductForm() {
      let self = this;
      $.when(this.submitProductInfo()).done(function (productId) {
        self.submitImage(productId);
      });
    },
  },
});
