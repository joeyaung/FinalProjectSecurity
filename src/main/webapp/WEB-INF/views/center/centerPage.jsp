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
        /* color: white; */
        list-style-type: none;
        text-align: left;
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
            <div class="container">
              <div class="row">
                <div class="col-12" v-for="(item, index) in centers">
                  <div class="card h-100">
                    <!-- Sale badge-->
                    <!-- <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale
                              </div> -->
                    <!-- Product image-->
                    <!-- <img class="card-img-top" width="250px" height="250px" :src="`data:image/png;base64,`+item.base64Image" alt="..." /> -->
                    <!-- Product details-->
                    <div class="card-body p-4">
                      <div class="text-center">
                        <!-- Product name-->
                        <h3 class="fw-bolder product-title">{{ item.centerName }}</h3>
                        <li class="product_li">地址:{{ item.centerAddress }}</li>
                        <li class="product_li">連絡電話:{{ item.centerPhone }}</li>
                        <li class="product_li">E-mail:{{ item.centerEmail }}</li>


                        <a :href="'http://localhost:8080/FinalProject/center/location?centerId='+ item.centerId">Link</a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-8">
            <div id="map" class="embed-responsive embed-responsive-16by9"></div>
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
        centers: [],
        map: null, 

      },



      mounted: function () {
        var self = this;
        console.log(this)
        $.ajax({
          url: "/FinalProject/getAllCneter",
          method: "GET",
          success: function (res) {
            console.log(res);
            self.centers = res;
            


            // console.log(res[0].latitude)
            // for( location of res){
            //   console.log(location.latitude)
            // }




            

          },
          error: function () {
            console.log("Fail");
          },

        });

      },

      
      methods: {
            // init google map
            initMap() {
              
              // 預設顯示的地點
              let location = {
                lat: 23.97565, // 經度
                lng: 120.9738819 // 緯度
              };
              
              // 建立地圖
              this.map = new google.maps.Map(document.getElementById('map'), {
                center: location, // 中心點座標
                zoom: 7.5, // 1-20，數字愈大，地圖愈細：1是世界地圖，20就會到街道
                mapTypeId: 'roadmap'

              });
  
              // 放置marker
              let marker = new google.maps.Marker({
                position: location,
                map: this.map,
                // animation: google.maps.Animation.DROP
                animation: google.maps.Animation.BOUNCE
              });
              
              // console.log("123")
              // console.log(this.map)
              // console.log("321")


              // 放置多個marker
                


  
            }
          },
      
      
      
      created() {
            window.addEventListener('load', () => {
              this.initMap();
            });
          }



      

    });






  </script>
  </body>

  </html>