let accountVM = new Vue({
  el: "#app",
  data: {
    orders: [
      {
        order_id: "0004",
        order_details: [
          {
            imgPath: "/FinalProject/images/products/audi-jacket-black.png",
            name: "男仕夾克外套",
            quantity: 2,
            price_per_unit: 1750,
          },
        ],
        totalAmount: 87800,
        update_time: "2021-09-03",
        showMore: false,
        order_limit: 3,
      },
    ],
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
    toggleOrderShowMore(event, index) {
      event.preventDefault();
      let targetOrder = this.orders[index];

      if (targetOrder.showMore) {
        targetOrder.order_limit = 3;
      } else {
        targetOrder.order_limit = targetOrder.order_details.length;
      }
      targetOrder.showMore = !targetOrder.showMore;
    },
    fetchMemberOrder() {
      let self = this;
      $.ajax({
        url: "/FinalProject/account/api/v1/order",
        method: "get",
        dataType: "json",
        success: function (res) {
          let fetchedOrders = [];
          for (let i = 0; i < res.length; i++) {
            let curOrder = res[i];
            let newOrder = {};
            newOrder.order_id = curOrder.id;
            newOrder.totalAmount = curOrder.totalAmount;
            newOrder.update_time = curOrder.createDate.slice(0, 10);
            newOrder.showMore = false;
            newOrder.order_limit = 3;
            newOrder.order_details = [];
            for (let j = 0; j < curOrder.orderDetail.length; j++) {
              let curDetail = curOrder.orderDetail[j];
              let newDetail = {};
              newDetail.imgPath = curDetail.product.imgPath;
              newDetail.name = curDetail.product.name;
              newDetail.quantity = curDetail.quantity;
              newDetail.price_per_unit = curDetail.pricePerUnit;
              newOrder.order_details.push(newDetail);
            }
            fetchedOrders.push(newOrder);
          }
          self.orders = fetchedOrders;
        },
        error: function (err) {
          console.log(err);
        },
      });
    },
  },
  mounted: function () {
    this.fetchMemberOrder();
  },
});
