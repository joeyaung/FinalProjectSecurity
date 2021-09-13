let productPageVM = new Vue({
  el: "#app",
  data: {
    products: [],
    cartItem: [],
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
  },
  computed: {
    cart_item_total_quantity() {
      let total = 0;
      for (let i = 0; i < this.cartItem.length; i++) {
        total += this.cartItem[i].quantityInCart;
      }
      return total;
    },
  },
  mounted: function () {
    this.fetchAllProductsData();
    this.fetchMemberCartItem();
  },
});
