let productPageVM = new Vue({
  el: "#app",
  data: {
    products: [],
    cartItem: [],
    sortMethod: "",
    displayTags: [],
    queryString: "",
  },
  methods: {
    dollorFormated(price) {
      var formatter = new Intl.NumberFormat("en-US", {
        style: "currency",
        currency: "TWD",
        minimumFractionDigits: 0,
      });
      return formatter.format(price);
    },
    addToCart(index, event) {
      event.preventDefault();
      let selectProduct = this.products[index];
      let self = this;
      $.ajax({
        url: `/FinalProject/api/v1/cart/add_to_cart/${selectProduct.id}`,
        type: "POST",
        dataType: "text",
        success: function (res) {
          if (res == "unauthorized") {
            window.location = "/FinalProject/login";
            return;
          }
          if (res == "ok") {
            self.fetchMemberCartItem();
          } else {
            console.log(res);
          }
        },
      });
    },
    fetchAllProductsData() {
      let self = this;
      $.ajax({
        url: "/FinalProject/api/v1/product",
        type: "GET",
        dataType: "json",
        success: function (res) {
          for (let i = 0; i < res.length; i++) {
            var newProduct = {};
            newProduct.id = res[i].id;
            newProduct.name = res[i].name;
            newProduct.isOnSale = res[i].onSale;
            newProduct.curPrice = res[i].curPrice;
            newProduct.originPrice = res[i].originalPrice;
            newProduct.imgPath = res[i].imgPath;
            self.products.push(newProduct);
          }
        },
        error: function () {
          console.log("Fetch products data failed.");
        },
      });
    },
    fetchMemberCartItem() {
      let self = this;
      $.ajax({
        url: "/FinalProject/api/v1/cart/member",
        type: "GET",
        dataType: "json",
        success: function (res) {
          self.cartItem = res;
        },
      });
    },
    mergeLowToHigh(left, right) {
      var result = [];
      while (left.length > 0 && right.length > 0) {
        if (left[0].curPrice < right[0].curPrice) {
          result.push(left.shift());
        } else {
          result.push(right.shift());
        }
      }
      return result.concat(left, right);
    },
    mergeHighToLow(left, right) {
      var result = [];
      while (left.length > 0 && right.length > 0) {
        if (left[0].curPrice > right[0].curPrice) {
          result.push(left.shift());
        } else {
          result.push(right.shift());
        }
      }
      return result.concat(left, right);
    },
    mergeSort(arr, type) {
      if (arr.length <= 1) {
        return arr;
      }
      var middle = Math.floor(arr.length / 2);
      var left = arr.slice(0, middle);
      var right = arr.slice(middle);
      if (type == "greater") {
        return this.mergeLowToHigh(
          this.mergeSort(left, type),
          this.mergeSort(right, type)
        );
      } else {
        return this.mergeHighToLow(
          this.mergeSort(left, type),
          this.mergeSort(right, type)
        );
      }
    },
  },
  computed: {
    cart_item_total_quantity() {
      let total = 0;
      for (let i = 0; i < this.cartItem.length; i++) {
        total += this.cartItem[i].quantityInCart;
      }
      return total;
    },
    displayCartItem() {
      let query = this.queryString;
      let sortMethod = this.sortMethod;

      let displayTags = this.displayTags;
      let rowData = this.products;

      // 先排序
      return this.mergeSort(rowData, sortMethod);
    },
  },
  mounted: function () {
    this.fetchAllProductsData();
    this.fetchMemberCartItem();
  },
});
