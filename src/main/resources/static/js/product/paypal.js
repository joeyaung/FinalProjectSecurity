paypal
  .Buttons({
    createOrder: function (data, actions) {
      // This function sets up the details of the transaction, including the amount and line item details.
      return actions.order.create({
        intent: "CAPTURE",
        payer: {
          email_address: "sb-jfosw7471462@personal.example.com",
        },
        purchase_units: [
          {
            amount: {
              currency_code: "TWD",
              value: ""+cartVM.cart_item_total_cost,
            },
          },
        ],
      });
    },

    onApprove: function (data, actions) {
      return actions.order.capture().then(function (details) {
        let data = {
          id: details.id
        }
        $.ajax({
          url:"/FinalProject/api/v1/paypal/create_order",
          method: "POST",
          data: JSON.stringify(data),
          contentType:"application/json;charset-UTF-8",
          dataType: "json",
          success: function(res){
            alert(`訂單建立成功! Order Id: ${res.order_id}; Paypal_Order_id: ${res.paypal_id}`);
            window.location = "/FinalProject/account";
          }

        });
      });
    },

    onCancel: function (data) {
      console.log("Payment canceled.");
    },

    onError: function (err) {
      // window.location.reload();
    },
  })
  .render("#paypal-button-container");
