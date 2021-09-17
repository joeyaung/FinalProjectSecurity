let accountVM = new Vue({
  el: "#app",
  data: {
    orders: [
      {
        order_id: "",
        order_stage: "",
        isSub: false,
        order_details: [
          {
            imgPath: "",
            name: "",
            quantity: 0,
            price_per_unit: 0,
          },
        ],
        totalAmount: 0,
        update_time: "",
        showMore: false,
        order_limit: 3,
        showAction: false,
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
            newOrder.order_stage = curOrder.stage;
            newOrder.totalAmount = curOrder.totalAmount;
            newOrder.update_time = curOrder.createDate.slice(0, 10);
            newOrder.showMore = false;
            newOrder.isSub = curOrder.sub;
            newOrder.order_limit = 3;
            newOrder.showAction = false;
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
    cancelOrder(index) {
      let self = this;
      let order_id = this.orders[index].order_id;

      $.ajax({
        url: `/FinalProject/api/v1/order/cancel/${order_id}`,
        method: "POST",
        dataType: "json",
        success: function (response) {
          if (response.status == "ok") {
            self.orders[index].order_stage = "訂單已取消";
          }
          if (response.status == "fail") {
            console.log("ERROR: Refund Fail.");
          }
        },
        error: function (error) {
          console.log(error);
        },
      });
    },
    changeSubStatus(index, status) {
      let order_id = this.orders[index].order_id;

      let sendResult = this.changeSubStatusAJAX(status, order_id);

      this.orders[index].isSub = status;
    },
    toggleShowAction(index, event) {
      event.preventDefault();
      this.orders[index].showAction = !this.orders[index].showAction;
    },
    changeSubStatusAJAX(status, id) {
      let formData = {
        newStatus: status,
      };
      let order_id = id;
      let ajaxResult = false;
      $.ajax({
        url: `/FinalProject/api/v1/order/sub/${order_id}`,
        data: JSON.stringify(formData),
        method: "POST",
        dataType: "json",
        contentType: "application/json;charset=UTF-8",
        success: function (response) {
          if (response.status == "ok") {
            ajaxResult = true;
          }
        },
        error: function (err) {
          console.log(err);
        },
      });
      return ajaxResult;
    },
  },
  mounted: function () {
    this.fetchMemberOrder();
  },
});
