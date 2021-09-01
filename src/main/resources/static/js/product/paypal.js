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
              value: "100",
              items: [
                {
                  name: "男仕圓領T恤(白色)",
                  unit_amount: {
                    currency_code: "TWD",
                    value: "50",
                  },
                  quantity: "2",
                },
              ],
            },
          },
        ],
      });
    },

    onApprove: function (data, actions) {
      return actions.order.capture().then(function (details) {
        console.log(details);
        alert("Success!");
      });
    },

    onCancel: function (data) {
      console.log("Payment canceled.");
    },

    onError: function (err) {
      window.location.reload();
    },
  })
  .render("#paypal-button-container");
