let productEditVM = new Vue({
  el: "#app",
  data: {
    id: "",
    product: {
      id: "",
      name: "",
      curPrice: "",
      originalPrice: "",
      imgPath: "",
      quantityInStock: "",
      tagInput: "",
      tags: [],
      onSale: false,
      show: {
        name: true,
        curPrice: true,
        originalPrice: true,
        quantityInStock: true,
        tagInput: false,
      },
    },
    image_file: null,
  },
  methods: {
    toggleShow(type) {
      switch (type) {
        case "name":
          this.product.show.name = !this.product.show.name;
          break;
        case "quantityInStock":
          this.product.show.quantityInStock =
            !this.product.show.quantityInStock;
          break;
        case "originalPrice":
          this.product.show.originalPrice = !this.product.show.originalPrice;
          break;
        case "curPrice":
          this.product.show.curPrice = !this.product.show.curPrice;
          break;
        case "onSale":
          this.product.onSale = !this.product.onSale;
          break;
      }
    },
    addTag() {
      this.product.tags.push(this.product.tagInput);
      this.product.tagInput = "";
    },
    removeTag(index) {
      this.product.tags.splice(index, 1);
      this.updateProduct();
    },
    dollarFormat(data) {
      var formatter = new Intl.NumberFormat("en-US", {
        style: "currency",
        currency: "USD",
        minimumFractionDigits: 0,
        maximumFractionDigits: 0,
      });

      return formatter.format(data);
    },
    imageFocus() {
      $("#imageFileInput").click();
    },
    fileChange(event) {
      this.image_file = event.target.files[0];
      this.updateProductImage();
    },
    updateProduct() {
      let data = {
        name: this.product.name,
        quantityInStock: parseInt(this.product.quantityInStock),
        originalPrice: parseInt(this.product.originalPrice),
        onSale: this.product.onSale,
        curPrice: parseInt(this.product.curPrice),
        tags: this.product.tags,
        imgPath: this.product.imgPath,
      };
      let self = this;
      $.ajax({
        url: `/FinalProject/inner/admin/api/v1/product/${self.id}`,
        method: "PUT",
        dataType: "json",
        data: JSON.stringify(data),
        contentType: "application/json;charset=UTF-8",
        success: function (response) {
          console.log(response);
        },
      });
    },
    updateProductImage() {
      let formData = new FormData();
      formData.append("file", this.image_file);
      let self = this;
      $.ajax({
        url: `/FinalProject/inner/admin/api/v1/product/image/${self.id}`,
        method: "PUT",
        dataType: "text",
        processData: false,
        contentType: false,
        data: formData,
        success: function (response) {
          if (response == "ok") {
            self.product.imgPath =
              self.product.imgPath + "?t=" + new Date().getTime();
          }
        },
      });
    },
  },
  beforeMount: function () {
    let path = window.location.pathname;
    let product_id = path.substring(path.lastIndexOf("/") + 1);
    let self = this;

    $.ajax({
      url: `/FinalProject/api/v1/product/${product_id}`,
      method: "GET",
      dataType: "json",
      success: function (response) {
        self.id = response.id;
        self.product.id = response.id;
        self.product.name = response.name;
        self.product.curPrice = response.curPrice;
        self.product.originalPrice = response.originalPrice;
        self.product.imgPath = response.imgPath;
        self.product.quantityInStock = response.quantityInStock;
        self.product.tagInput = "";
        self.product.tags = response.tags;
        self.product.onSale = response.onSale;
        self.product.show = {
          name: true,
          name: true,
          curPrice: true,
          originalPrice: true,
          quantityInStock: true,
          tagInput: false,
        };
      },
    });
  },
});
