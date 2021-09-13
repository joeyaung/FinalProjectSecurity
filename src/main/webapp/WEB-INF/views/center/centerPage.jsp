<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html lang="zh-TW">

  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>展示中心</title>

    <!-- Google Map API -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <!-- jquery安裝 -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <!-- Vue安裝 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.6.7/vue.js"></script>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/template.js"></script>
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

    <link rel="icon" type="image/x-icon" href="/FinalProject/images/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
    <link
      href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
      rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/FinalProject/css/index.css" rel="stylesheet" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <style>
      .product_li {
        list-style-type: none;
        text-align: left;
      }

      #map {
        height: 500px;
        width: 100%;
      }
    </style>
  </head>

  <body id="page-top">
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top navbar-shrink" id="mainNav">
      <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="/FinalProject/"><img src="/FinalProject/images/audi-logo.png" alt="logo" /></a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse"
          data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
          aria-label="Toggle navigation">
          Menu
          <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ms-auto">
            <li class="nav-item">
              <a class="nav-link" href="/FinalProject/TestDrive">試駕體驗</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/FinalProject/News">最新消息</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#signup">了解車型</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#signup">活動</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/FinalProject/ProductPage">精品商城</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#signup">展示中心</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/FinalProject/account">會員專區</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <!-- 以上不要動 -->
    <!-- 這裡開始加你們的東西 -->



    <!-- Header-->
    <header class="bg-dark py-5">
      <div class="container px-4 px-lg-5 my-5">
        <div class="text-center text-white">
          <h1 class="display-4 fw-bolder">展示中心</h1>
          <p class="lead fw-normal text-white-50 mb-0"> </p>
        </div>
      </div>
    </header>



    <!-- Section-->
    <section class="py-5" id="app">
      <div class="container px-4 px-lg-5 mt-5">
        <div class="row">
          <div class="col-4">
            <div class="container" style="height:1000px; overflow-y: scroll">
              <div class="row">
                <div class="col-12" v-for="(item, index) in centers">
                  <div class="card h-100">
                    <div class="card-body p-4">
                      <div class="text-center">
                        <!-- Product name-->
                        <h3 class="fw-bolder product-title">{{ item.centerName }}</h3>
                        <li class="product_li">地址:{{ item.centerAddress }}</li>
                        <li class="product_li">連絡電話:{{ item.centerPhone }}</li>
                        <li class="product_li">E-mail:{{ item.centerEmail }}</li>
                        <li class="product_li">{{ item.curdistance_text }}</li>
                        <li class="product_li">{{ item.curdistance_time }}</li>


                        <a
                          :href="'http://localhost:8080/FinalProject/center/location?centerId='+ item.centerId">Link</a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-8">

            <section class="row">
              <div class="col google-map">
                <button type="button" class="btn btn-info" @click="getCurrent">我與展示中心的距離</button>
              </div>
            </section>
            <hr>
            <div id="map"></div>
          </div>
        </div>

      </div>
      </div>
    </section>



    <!-- 以下不要動 -->
    <!-- Footer-->
    <footer class="footer bg-black small text-center text-white-50">
      <div class="container px-4 px-lg-5">
        Copyright &copy; 資策會第五組專題報告 2021
      </div>
    </footer>


  </body>


  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBYfh8-A26ni-AEF58RvN30Xg1B1_wx3kg" async></script>
  <!-- <script src="js/productall.js"></script> -->
  <script>
    let productVM = new Vue({
      el: "#app",
      data: {
        centers: [],  //所有展示中心的點
        map: null,
      },
      computed: {
        locations() { //各個展示中心的位置
          let locs = [];
          for (let i = 0; i < this.centers.length; i++) {
            let curLocation = [];
            curLocation.push(this.centers[i].centerName);
            curLocation.push(this.centers[i].centerLatitude);
            curLocation.push(this.centers[i].centerLongitude);
            locs.push(curLocation);
          }
          return locs;
        },
      },
      mounted: function () {
        var self = this;
        $.ajax({
          url: "/FinalProject/getAllCneter",
          method: "GET",
          success: function (res) {
            self.centers = res;
            self.initMap();
          },
          error: function () {
            console.log("Fail");
          },
        });
      },
      methods: {
        // init google map
        initMap() {
          let taiwan_center = {  // 預設顯示的位置
            lat: 23.97565, // 經度
            lng: 120.9738819 // 緯度
          };
          // 建立地圖
          this.map = new google.maps.Map(document.getElementById('map'), {
            center: taiwan_center, // 地圖顯示的中心點
            zoom: 7.5, // 1-20，數字愈大，地圖愈細：1是世界地圖，20就會到街道
            mapTypeId: 'roadmap'  //街道模式
          });

          // 放置marker
          var marker1;  //marker1:每個展示中心的位置
          var marker2;  //marker2:web抓的現在位置

          //marker1:每個展示中心的位置
          for (let i = 0; i < this.locations.length; i++) {
            marker1 = new google.maps.Marker({
              position: new google.maps.LatLng(this.locations[i][1], this.locations[i][2]),
              map: this.map,
              title: this.locations[i][0],
              icon: 'https://i.imgur.com/Z1H7jQI.jpg',
              animation: google.maps.Animation.DROP,
            });
          };

          //marker2:web抓的現在位置
          navigator.geolocation.getCurrentPosition((position) => {
            var curlat = position.coords.latitude;
            var curlng = position.coords.longitude;
            marker2 = new google.maps.Marker({
              position: new google.maps.LatLng(curlat, curlng),
              map: this.map,
              animation: google.maps.Animation.BOUNCE,
              zIndex: 1, //重疊狀況下排在第x順位
            });
          });
        },

        // 使用者與其他地區的距離
        getCurrent() {
          const _this = this;
          console.log(_this)

          // 先確認使用者裝置能不能抓地點
          if (navigator.geolocation) {
            function success(position) {
              alert('定位成功');
              console.log(position)

              // 將目前所在地設成比較的點
              let originPosition = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);

              // 把要計算的點存成陣列
              let destinations = [];
              Array.prototype.forEach.call(_this.centers, c => {
                destinations.push(new google.maps.LatLng(c.centerLatitude, c.centerLongitude));
              });

              // 所在位置跟各點的距離
              const service = new google.maps.DistanceMatrixService();
              service.getDistanceMatrix({
                origins: [originPosition],  //必填！！！起始點
                destinations: destinations,  //必填！！！目的地
                travelMode: 'DRIVING', // 交通方式：BICYCLING(自行車)、DRIVING(開車，預設)、TRANSIT(大眾運輸)、WALKING(走路)
                unitSystem: google.maps.UnitSystem.METRIC, // 單位 METRIC(公里，預設)、IMPERIAL(哩)
                avoidHighways: true, // 是否避開高速公路
                avoidTolls: true // 是否避開收費路線
              }, callback);
              function callback(response, status) {
                var curdistance = ''
                var curdistance_text = ''
                var curdistance_time = ''
                for (let i = 0, len = _this.centers.length; i < len; i++) {
                  _this.centers[i].curdistance = response.rows[0].elements[i].distance.value;
                  _this.centers[i].curdistance_text = response.rows[0].elements[i].distance.text;
                  _this.centers[i].curdistance_time = response.rows[0].elements[i].duration.text;
                }

                // 按距離重排順序
                _this.centers = _this.centers.sort((a, b) => {
                  return a.curdistance > b.curdistance ? 1 : -1;
                });
              }
            }

            function error() {
              alert('無法取得你的位置');
            }
            // 跟使用者拿所在位置的權限
            navigator.geolocation.getCurrentPosition(success, error);
          }

        },

      },
    });
  </script>
  </body>

  </html>