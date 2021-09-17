let adminDashboardVM = new Vue({
  el: "#app",
  data: {
    topCard: {
      totalEmployee: 80,
      totalClients: 200,
      totalProfits: 400000,
      efficientClient: 42,
    },
    clientStageChartRawData: {
      data: {
        labels: [
          "NEW",
          "ATTEMPT_TO_ENGAGE",
          "ENGAGED",
          "TEST_DRIVE",
          "FOLLOW_UP",
          "LONG_TERM",
          "ORDERED",
          "CLOSED_LOST",
        ],
        datasets: [
          {
            data: [55, 30, 15, 12, 43, 54, 12, 23],
            backgroundColor: [
              "#546de5",
              "#f5cd79",
              "#f19066",
              "#c44569",
              "#574b90",
              "#f8a5c2",
              "#e66767",
              "#596275",
            ],
            hoverBackgroundColor: [
              "#546de5",
              "#f5cd79",
              "#f19066",
              "#c44569",
              "#574b90",
              "#f8a5c2",
              "#e66767",
              "#596275",
            ],
            hoverBorderColor: "rgba(234, 236, 244, 1)",
          },
        ],
      },
    },
    topSalesProducts: [],
  },
  components: {
    clientstagechart: {
      props: ["datafromroot"],
      template: "<canvas id='clientStageChart'></canvas>",
      mounted: function () {
        (Chart.defaults.global.defaultFontFamily = "Nunito"),
          '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
        Chart.defaults.global.defaultFontColor = "#858796";
        var ctx = document.getElementById("clientStageChart");
        this.chartObject = new Chart(ctx, {
          type: "doughnut",
          data: this.datafromroot,
          options: {
            maintainAspectRatio: false,
            tooltips: {
              backgroundColor: "rgb(255,255,255)",
              bodyFontColor: "#858796",
              borderColor: "#dddfeb",
              borderWidth: 1,
              xPadding: 15,
              yPadding: 15,
              displayColors: false,
              caretPadding: 10,
            },
            legend: {
              display: false,
            },
            cutoutPercentage: 80,
          },
        });
      },
    },
  },
  computed: {
    totalProfitsFormated() {
      let profits = this.topCard.totalProfits;
      var formatter = new Intl.NumberFormat("en-US", {
        style: "currency",
        currency: "USD",
        minimumFractionDigits: 0,
      });
      return formatter.format(profits);
    },
    maxSaleProducts() {
      let data = this.topSalesProducts;
      let max = -1;
      for (let i = 0; i < data.length; i++) {
        if (data[i].quantity > max) {
          max = data[i].quantity;
        }
      }

      return max;
    },
  },
  methods: {
    number_format(number, decimals, dec_point, thousands_sep) {
      // *     example: number_format(1234.56, 2, ',', ' ');
      // *     return: '1 234,56'
      number = (number + "").replace(",", "").replace(" ", "");
      var n = !isFinite(+number) ? 0 : +number,
        prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
        sep = typeof thousands_sep === "undefined" ? "," : thousands_sep,
        dec = typeof dec_point === "undefined" ? "." : dec_point,
        s = "",
        toFixedFix = function (n, prec) {
          var k = Math.pow(10, prec);
          return "" + Math.round(n * k) / k;
        };
      // Fix for IE parseFloat(0.55).toFixed(0) = 0;
      s = (prec ? toFixedFix(n, prec) : "" + Math.round(n)).split(".");
      if (s[0].length > 3) {
        s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
      }
      if ((s[1] || "").length < prec) {
        s[1] = s[1] || "";
        s[1] += new Array(prec - s[1].length + 1).join("0");
      }
      return s.join(dec);
    },
    fetchTopCard() {
      let _this = this;
      $.ajax({
        url: `/FinalProject/inner/admin/api/v1/dashboard/topcard`,
        dataType: "json",
        method: "GET",
        success: function (res) {
          if (res.status == "ok") {
            _this.topCard.totalEmployee = res.totalEmployee;
            _this.topCard.totalClients = res.totalClients;
            _this.topCard.totalProfits = res.totalProfits;
            _this.topCard.efficientClient = res.efficientClient;
          } else {
            console.log(res.err);
          }
        },
        error: function (err) {
          console.log(err);
        },
      });
    },
    fetchClientStage() {
      let _this = this;
      $.ajax({
        url: `/FinalProject/inner/admin/api/v1/dashboard/client_stage`,
        method: "GET",
        dataType: "json",
        success: function (response) {
          if (response.status == "ok") {
            _this.clientStageChartRawData.data.datasets[0].data = response.data;
          } else {
            console.log(response.error);
          }
        },
        error: function (error) {
          console.log(error);
        },
      });
    },
    fetchTopSalesItem() {
      let _this = this;
      $.ajax({
        url: `/FinalProject/inner/admin/api/v1/dashboard/top_sale_products`,
        method: "GET",
        dataType: "json",
        success: function (response) {
          if (response.status == "ok") {
            _this.topSalesProducts = response.data;
          }
        },
        error: function (error) {
          console.log(error);
        },
      });
    },
    computedWidth(product) {
      let quantity = product.quantity;
      let result = {
        width: "20%",
      };
      let max = this.maxSaleProducts;

      let percent = (quantity / max).toFixed(2) * 100;

      let percentString = percent + "%";
      result.width = percentString;
      return result;
    },
  },
  beforeMount: function () {
    this.fetchTopCard();
    this.fetchClientStage();
    this.fetchTopSalesItem();
  },
});
