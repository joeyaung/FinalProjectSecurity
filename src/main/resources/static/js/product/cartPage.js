let cartVM = new Vue({
  el: "#app",
  data: {
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
    addToCart(index) {
      let selectCartItem = this.cartItem[index];
      let self = this;
      $.ajax({
        url: `/FinalProject/api/v1/cart/add_to_cart/${selectCartItem.product.id}`,
        type: "POST",
        dataType: "text",
        success: function (res) {
          if (res == "ok") {
            selectCartItem.quantityInCart += 1;
          } else {
            console.log(res);
          }
        },
      });
    },
    removeFromCart(index) {
      let selectProduct = this.cartItem[index];
      let self = this;
      $.ajax({
        url: `/FinalProject/api/v1/cart/remove_to_cart/${selectProduct.id}`,
        type: "POST",
        dataType: "text",
        success: function (res) {
          if (res == "ok") {
            selectProduct.quantityInCart -= 1;
            if (selectProduct.quantityInCart == 0) {
              self.cartItem.splice(index, 1);
            }
          } else {
            console.log(res);
          }
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
    cart_item_total_cost() {
      let total = 0;
      for (let i = 0; i < this.cartItem.length; i++) {
        total +=
          this.cartItem[i].quantityInCart * this.cartItem[i].product.curPrice;
      }
      return total;
    },
  },
  mounted: function () {
    this.fetchMemberCartItem();
  },
});
