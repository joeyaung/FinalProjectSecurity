let orderPageVM = new Vue({
  el: "#app",
  data: {
    backend_order_info: {},
    shipping_info: {},
    isSendingCancel: false,
  },
  computed: {
    shippingFullAddress() {
      let fullAddress = "";
      if (this.shipping_info.postalCode != null) {
        fullAddress += this.shipping_info.postalCode;
        fullAddress += " ";
      }
      if (this.shipping_info.addressArea1 != null) {
        fullAddress += this.shipping_info.addressArea1;
      }
      if (this.shipping_info.addressArea2 != null) {
        fullAddress += this.shipping_info.addressArea2;
      }
      if (this.shipping_info.addressArea3 != null) {
        fullAddress += this.shipping_info.addressArea3;
      }
      if (this.shipping_info.addressLine1 != null) {
        fullAddress += this.shipping_info.addressLine1;
      }
      if (this.shipping_info.addressLine2 != null) {
        fullAddress += this.shipping_info.addressLine2;
      }
      if (this.shipping_info.addressLine3 != null) {
        fullAddress += this.shipping_info.addressLine3;
      }
      return fullAddress;
    },
  },
  methods: {
    fetchBackendOrderInfo() {
      let self = this;
      let order_id = window.location.href.substring(
        window.location.href.lastIndexOf("/") + 1
      );

      $.ajax({
        url: `/FinalProject/inner/admin/api/v1/order/${order_id}`,
        method: "GET",
        dataType: "json",
        success: function (response) {
          self.backend_order_info = response.backendOrderInfo;
          self.shipping_info = response.shippingInfo;
          self.$watch(
            "backend_order_info.stage",
            function (newValue, oldValue) {
              let yes = confirm(`確定將訂單狀態改為${newValue}嗎?`);
              if (!yes) {
                self.backend_order_info.stage = oldValue;
                return;
              }
              if (newValue == "訂單已取消") {
                self.cancelOrderAJAX();
              } else {
                let updateStatus = self.updateStageAJAX(newValue);
                if (!updateStatus) {
                  return;
                }
              }
              self.backend_order_info.stage = newValue;
            },
            { deep: true }
          );
        },
        error: function (err) {
          console.log(err);
        },
      });
    },
    dollorFormat(total) {
      var formatter = new Intl.NumberFormat("en-US", {
        style: "currency",
        currency: "USD",
        minimumFractionDigits: 0,
        maximumFractionDigits: 0,
      });

      return formatter.format(total);
    },
    changeStage() {
      let stage = this.backend_order_info.stage;
      if (stage == "準備中") {
        $("#stageProgressBar").css("width", "33%");
      }
      if (stage == "已出貨") {
        $("#stageProgressBar").css("width", "66%");
      }
      if (stage == "完成訂單") {
        $("#stageProgressBar").css("width", "100%");
      }
    },
    cancelOrder() {
      this.backend_order_info.stage = "訂單已取消";
    },
    updateStageAJAX(newStage) {
      let data = {
        stage: newStage,
      };
      let order_id = window.location.href.substring(
        window.location.href.lastIndexOf("/") + 1
      );
      let updateStatus = false;

      $.ajax({
        url: `/FinalProject/inner/admin/api/v1/order/${order_id}`,
        method: "PUT",
        data: JSON.stringify(data),
        dataType: "json",
        contentType: "application/json; charset=UTF-8",
        success: function (response) {
          let result = response.status;
          if (result == "fail") {
            updateStatus = false;
          } else {
            updateStatus = true;
          }
        },
        error: function (error) {
          console.log(error);
          updateStatus = false;
        },
      });

      return updateStatus;
    },
    cancelOrderAJAX() {
      let order_id = this.backend_order_info.id;
      let self = this;
      this.isSendingCancel = true;
      $.ajax({
        url: `/FinalProject/api/v1/order/cancel/${order_id}`,
        method: "POST",
        dataType: "json",
        success: function (response) {
          if (response.status == "ok") {
            self.isSendingCancel = false;
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
  },
  beforeMount: function () {
    this.fetchBackendOrderInfo();
  },
});
