<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html lang="zh-TW">

  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>展示中心</title>
    <link rel="icon" type="image/x-icon" href="/FinalProject/images/favicon.png?v=2" />

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
      .center_li {
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
              <a class="nav-link" href="/FinalProject/Events">活動</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/FinalProject/products">精品商城</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/FinalProject/center">展示中心</a>
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
    <header class="bg-dark"
      style="background-image: url('/FinalProject/images/center/top_background.jpg'); background-size:cover" ;>
      <div class="container py-5 px-lg-5 my-5">
        <div class="text-center text-white">
          <h1 class="display-1 fw-bolder" style="font-size: 60px;">展示中心</h1>
          <!-- <p class="lead fw-normal text-white-50 mb-0"> </p> -->
        </div>
      </div>
    </header>

    <!-- Section-->
    <section id="app">
      <div class="container px-4 px-lg-5 mt-5">
        <div class="row">
          <div class="col-4">
            <div class="container" style="height:1000px; overflow-y: scroll">
              <div class="row">
                <div class="col-12" v-for="(item, index) in centers">
                  <div class="card h-100">
                    <div class="card-body p-4">
                      <div class="text-center">
                        <!-- Center name-->
                        <button type="button" class="btn btn-outline-danger" style="font-size:16px;font-weight:bold;"
                          @click="openInfoWindows(item.centerName)">{{ item.centerName }}</button>
                        <li class="center_li" style="text-align: center;font-size:15px;font-weight:bold;">{{
                          item.centerAddress }}</li>
                        <li class="center_li" style="text-align:center;font-size:16px;font-weight:bold;">{{
                          item.curdistance_text }}</li>
                        <li class="center_li" style="text-align:center;font-size:16px;font-weight:bold;">{{
                          item.curdistance_time }}</li>
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
                <button type="button" class="btn btn-info" style="text-align:center;font-size:16px;font-weight:bold;"
                  @click="getCurrent">我與展示中心的距離</button>
              </div>
            </section>
            <hr>
            <div id="map"></div>
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

  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBYfh8-A26ni-AEF58RvN30Xg1B1_wx3kg&language=zh-TW"
    async></script>
  <script>
    let centerVM = new Vue({
      el: "#app",
      data: {
        centers: [],  //所有展示中心的點
        map: null,
        markers: [], // 存入每一個marker上的info windows
        infoWindows: [],
      },

      computed: {
        locations() { //各個展示中心的位置
          let locs = [];
          for (let i = 0; i < this.centers.length; i++) {
            let curLocation = [];
            curLocation.push(this.centers[i].centerName);
            curLocation.push(this.centers[i].centerLatitude);
            curLocation.push(this.centers[i].centerLongitude);
            curLocation.push(this.centers[i].centerId);
            curLocation.push(this.centers[i].centerAddress);
            curLocation.push(this.centers[i].centerEmail);
            curLocation.push(this.centers[i].centerOpentime);
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

          //marker1:每個展示中心的位置
          for (let i = 0; i < this.locations.length; i++) {
            let marker1 = new google.maps.Marker({
              position: new google.maps.LatLng(this.locations[i][1], this.locations[i][2]),
              map: this.map,
              title: this.locations[i][0],
              icon: 'https://i.imgur.com/Z1H7jQI.jpg',
              animation: google.maps.Animation.DROP,
            });

            // info window
            var contentinfo = "<h5>" + this.locations[i][0]
              + "</h5> <li class='center_li'>地址:"
              + this.locations[i][4] + "</li><li class='center_li'>連絡電話:"
              + this.locations[i][5] + "</li><li class='center_li'>營業時間:"
              + this.locations[i][6] + "</li>"
              + "<a style='font-weight: bold;' href=\"http://localhost:8080/FinalProject/center/location?centerId=" + this.locations[i][3] + "\" target='_blank' rel = 'noreferrer noopener'  >詳細介紹</a>";
            let infowindow = new google.maps.InfoWindow({  //每個點上都放上資訊視窗
              content: contentinfo,
              title: this.locations[i][0],
            });
            

            // 監聽 marker click 事件
            marker1.addListener('click', function (e) {  //每個都要監聽,按下click產生事件,事件內容為在這個map點到marker就打開資訊視窗
              infowindow.open(this.map, marker1);
              // this.map.setZoom(10)  //點擊該marker後就放大到10
            });
            this.markers.push(marker1);
            this.infoWindows.push(infowindow);
            
          };
        },

        // 由外部按鈕開啟info windows
        openInfoWindows(centerTitle) {
          let resultMarker = Object;
          let resultInfo = Object;
          for (let i = 0; i < this.markers.length; i++) {
            if (this.markers[i].title == centerTitle) {
              resultMarker = this.markers[i];
            }
          }

          this.map.setZoom(11);
          this.map.panTo(resultMarker.position);

          for (let j = 0; j < this.infoWindows.length; j++) {
            if (this.infoWindows[j].title == centerTitle) {
              resultInfo = this.infoWindows[j];
            }
          }
          resultInfo.open(this.map, resultMarker);
        },

        // 使用者與其他地區的距離
        getCurrent() {
          const _this = this;

          // 先確認使用者裝置能不能抓地點
          if (navigator.geolocation) {
            function success(position) {
              alert('定位成功,已將最近距離的展示中心放在最上層');

              // 將目前所在地設成比較的點
              let originPosition = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
              
              //marker2:web抓的現在位置
              let marker2 = new google.maps.Marker({
                position: new google.maps.LatLng(position.coords.latitude, position.coords.longitude),
                map: _this.map,
                animation: google.maps.Animation.BOUNCE,
                zIndex: 1, //重疊狀況下排在第x順位
              });
              _this.map.setZoom(11);  //放大到11
              _this.map.panTo(marker2.position);

              // 把要計算的點存成陣列
              let destinations = [];
              Array.prototype.forEach.call(_this.centers, c => {
                destinations.push(new google.maps.LatLng(c.centerLatitude, c.centerLongitude));
              });

              // 所在位置跟各點的距離
              const service = new google.maps.DistanceMatrixService();
              service.getDistanceMatrix({
                origins: [originPosition],  //起始點
                destinations: destinations,  //目的地
                travelMode: 'DRIVING', // 交通方式：BICYCLING(自行車)、DRIVING(開車，預設)、TRANSIT(大眾運輸)、WALKING(走路)
                unitSystem: google.maps.UnitSystem.METRIC, // 單位 METRIC(公里，預設)、IMPERIAL(哩)
                avoidHighways: true, // 是否避開高速公路
                avoidTolls: true // 是否避開收費路線
              }, callback);
              function callback(response, status) {
                var curdistance = ''  //與目前位置之間的距離
                var curdistance_text = ''  //與目前位置之間的距離(公里)
                var curdistance_time = ''  //與目前位置之間的開車時間
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