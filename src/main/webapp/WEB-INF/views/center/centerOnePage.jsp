<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html lang="zh-TW">

  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>展示中心</title>

    <link rel="icon" type="image/x-icon" href="images/favicon.png" />

    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/template.js"></script>
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

    <link rel="icon" type="image/x-icon" href="/FinalProject/images/favicon.png?v=2" />

    <!-- Bootstrap 4 message board js-->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
      integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
      crossorigin="anonymous"></script>

    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
    <link
      href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
      rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../css/index.css" rel="stylesheet" />

    <!-- Bootstrap 4 message board css-->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
      integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <style>
      .center_li {
        list-style-type: none;
        text-align: left;
      }

      #title_li {
        font-size: 20px;
      }

      #seemore_btn {
        background-color: black;
        color: white;
        border: none;
      }

      nav input {
        border: 0;
        background-color: #003C9D;
        color: #fff;
        border-radius: 10px;
        cursor: pointer;
      }

      nav input:hover {
        color: #003C9D;
        background-color: #fff;
        border: 2px #003C9D solid;
      }

      .bg-gray-custom {
        background: linear-gradient(to bottom, #ced6e0 0%, rgba(206, 214, 224, 0.4) 75%, rgba(206, 214, 224, 0.6) 100%);
      }

      /* Set the size of the div element that contains the map */
      #map {
        margin: 40px auto;
        height: 500px;
        width: 500px;
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
              <a class="nav-link" href="#signup">精品商城</a>
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
    <!-- About -->
    <section class="text-center bg-gray-custom">
      <div class="container px-4 px-lg-5">
        <div class="row gx-4 gx-lg-5 justify-content-center">
          <div class="col-lg-8">
            <!-- <h1 class="text-black mb-4">展示中心</h1> -->
            <!-- <p class="text-white-50"> -->
            <div id="container">
              <ul id="centerdata">
                <li class='center_li'><img src='data:image/png;base64,' width="800px" height="600px" alt="展示中心"></li>
              </ul>
              <a href="http://localhost:8080/FinalProject/TestDrive" class="btn btn-primary btn-lg active" role="button"
                aria-pressed="true" style="font-size: 20px;margin: 20px auto 0 auto;">預約試駕</a>

              <!--The div element for the map -->
              <div id="map">

              </div>

              <!-- Async script executes immediately and must be after any DOM elements used in callback. -->
              <script
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBYfh8-A26ni-AEF58RvN30Xg1B1_wx3kg&callback=initMap&libraries=&v=weekly&language=zh-TW"
                async></script>
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

  <script>
    //search by id
    $(document).ready(function () {
      const queryString = window.location.search;
      const urlParams = new URLSearchParams(queryString);
      const centerId = urlParams.get('centerId');

      $.ajax({
        url: "/FinalProject/findCenterById/" + centerId,
        method: "GET",
        dataType: "json",
        success: function (data) {

          var list = "";
          var latitude = parseFloat(data.centerLatitude)
          var longitude = parseFloat(data.centerLongitude)
          var centername = data.centerName
          var centeraddress = data.centerAddress
          var centerphone = data.centerPhone

          list += "<li class='center_li'><h2>" + data.centerName + "</h2></li><li class='center_li'>連絡電話:"
            + data.centerPhone + "</li><li class='center_li'>中心地址:"
            + data.centerAddress + "</li><li class='center_li'>E-mail:"
            + data.centerEmail + "</li><li class='center_li'>營業時間:"
            + data.centerOpentime + "</li><li class='center_li'><img src='data:image/png;base64,"
            + data.centerImage + "'width='800px' height='600px' alt='展示中心圖片'></li>"

          $("#centerdata").html(list)

          //執行地圖function
          initMap(latitude, longitude, centername, centeraddress, centerphone);
        },
        error: function (err) {
          console.log("沒抓到id")
          alert(err)
        }
      });
    });
    // Initialize and add the map

    function initMap(latitude, longitude, centername, centeraddress, centerphone) {

      // 展示中心的座標
      const location = {
        lat: latitude,  //緯度   latitude
        lng: longitude   //經度   longitude
      };

      // 建立地圖
      const map = new google.maps.Map(document.getElementById("map"), {
        zoom: 17,  // 1-20，數字愈大，地圖愈細：1是世界地圖，20就會到街道
        center: location, // 中心點座標

      });

      // (放置marker) The marker, positioned at location
      const marker = new google.maps.Marker({
        position: location,
        map: map,
        title: this.location,
        icon: 'https://i.imgur.com/Z1H7jQI.jpg',
        animation: google.maps.Animation.BOUNCE
      });

      var cont = "<h4><a href='https://www.google.com/maps/place/"
        + centeraddress + "' target = '_blank' rel = 'noreferrer noopener'><i class='fas fa-map-marker-alt'></i>路線規劃</h4>"
        + "<h4><a href=\"tel:" + centerphone + "\"><i class=\"fas fa-phone-square\"></i>撥打電話</a></h4>"

      var infowindow = new google.maps.InfoWindow({
        content: cont,
        position: location,
        maxWidth: 200,
        // pixelOffset: new google.maps.Size(100, -20) 
      });
      infowindow.open(map, marker);
    }

  </script>

  </html>