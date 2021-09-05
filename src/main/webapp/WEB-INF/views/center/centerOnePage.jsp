<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html lang="zh-TW">

  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>展示中心</title>

    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/template.js"></script>
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

    <link rel="icon" type="image/x-icon" href="../images/favicon.ico" />

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
      .news_li {
        color: white;
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

      .msg_title {
        color: white;
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

      /* 預約駕車的連結css，待修 */
      a.button {
    -webkit-appearance: button;
    -moz-appearance: button;
    appearance: button;

    text-decoration: none;
    color: white;
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
    <!-- About -->
    <section class="about-section text-center">
      <div class="container px-4 px-lg-5">
        <div class="row gx-4 gx-lg-5 justify-content-center">
          <div class="col-lg-8">
            <h1 class="text-white mb-4">展示中心</h1>
            <p class="text-white-50">

            <div id="container">
              <!-- <nav style="margin-top: 100px">
                <input type="button" id="secondHalfYear" class="2021070120211231"value="2021年07-12月" style="width: 150px; height: 50px;">
                <input type="button" id="firstHalfYear" class="2021010120210630" value="2021年01-06月" style="width: 150px; height: 50px;">
                <input type="button" id="secondHalfYear2020" class="2020070120201231" value="2020年07-12月" style="width: 150px; height: 50px;">
              </nav> -->

              </br> </br>

              <ul id="centerdata">
                <!-- <li class='news_li'><h2> 台北展示中心 </h2></li>
                <li class='news_li'>連絡電話:02-27939191</li>
                <li class='news_li'>中心地址:台北市內湖區新湖三路288號</li>
                <li class='news_li'>E-mail:TaipeiCenter@gmail.com</li>
                <li class='news_li'>營業時間:週一至週日 09:00 - 21:00</li>
                <li class='news_li'>服務項目:銷售</li>
                <li class='news_li'><img src="/FinalProject/images/center/taipei.jpg" width="800px" height="600px" alt="沒圖片"></li> -->
                <li class='news_li'><img src='data:image/png;base64,' width="800px" height="600px" alt="沒圖片"></li>

              <a href='/FinalProject/center'><img src='/FinalProject/images/goBack.jpg'></a>
            </br></br></br>
              </ul>


              <!-- <ul id="user_newslist">
                <li class='news_li'><h2> 2020-12-05 </h2></li>
                <li class='news_li'><h1> 開創未來的四環純電科技核心 </h1></li>
                <li class='news_li'><img src='data:image/png;base64,data.image' width='563' height='350' alt='pic cannot be displayed'/></li>
              </br>
                <li class='news_li'>次標題</li>
              </br>
                <li class='news_li'>內容</li>
              </br>
                <li class='news_li'></li>
              </br>
              </br>
              <a href='/FinalProject/News'><img src='/FinalProject/images/goBack.jpg'></a>
            </br></br></br>
              </ul> -->
              
              <a href="http://localhost:8080/FinalProject/TestDrive" class="button">預約試駕</a>
              <!-- <input type="button" id="secondHalfYear" class="2021070120211231"value="預約試駕" style="width: 150px; height: 50px;"> -->
              <!-- <div><a href='/FinalProject/center'><img src='/FinalProject/images/goBack.jpg'></a></div> -->
            </br>
          </br>
        </br>
            </div>

          </div>
        </div>
        <img class="img-fluid" src="../images/audi-etron.png" alt="..." />
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
    //display details of the selected news
    $(document).ready(function () {
      const queryString = window.location.search;
      const urlParams = new URLSearchParams(queryString);
      const centerId = urlParams.get('centerId');
      console.log(queryString);
      console.log(centerId);
      $.ajax({
        url: "/FinalProject/findCenterById/" + centerId,
        method: "GET",
        dataType: "json",
        success: function (data) {
          console.log("成功抓到id")
          console.log(data)
          
          var list = "";
          list += "<li class='news_li'><h2>" + data.centerName + "</h2></li><li class='news_li'>連絡電話:"
            + data.centerPhone + "</li><li class='news_li'中心地址:>"
            + data.centerAddress + "</li><li class='news_li'>E-mail:"
            + data.centerEmail + "</li><li class='news_li'>營業項目"
            + data.centerOpentime + "</li><li class='news_li'>服務項目:銷售"
            + data.centerService + "</li><li class='news_li'><img src='data:image/png;base64,"
            + data.centerImage + "'width='800px' height='600px' alt='展示中心圖片'></li>"
          
          $("#centerdata").html(list)

        },
        error: function (err) {
          console.log("沒抓到id")
          alert(err)
          console.log(err)
        }
      });





      
    });

  </script>

  </html>

  </html>