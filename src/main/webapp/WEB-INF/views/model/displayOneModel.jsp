<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html lang="zh-TW">

  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Audi - 了解車款</title>
    <link rel="icon" type="image/x-icon" href="images/favicon.png" />
	
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/template.js"></script>
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>

    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
    <link
      href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
      rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../css/index.css" rel="stylesheet" />
    <link rel="stylesheet" href="/FinalProject/css/modelAllPage.css" />

    <style>
      .news_li {
        color: black;
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
              <a class="nav-link" href="/FinalProject/Model">了解車型</a>
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
    <!-- About -->
    <section class="about-section text-center bg-gray-custom pd-2rem">
      <div class="container px-4 px-lg-5">
        <div class="row gx-4 gx-lg-5 justify-content-center">
              <nav style="margin-top: -3%">
              	
              	<form class="form-inline" action="https://google.com">
              		<input type="button" id="secondHalfYear" class=""
                  value="A3" style="width: 150px; height: 50px;"> 
				</form>
              	
              	<form class="form-inline" action="https://google.com">
              		<input type="button" id="secondHalfYear" class=""
                  value="A3" style="width: 150px; height: 50px;"> 
				</form>
              
              </nav>
          <div class="col-lg-8">
            <h2 class="mb-4">Audi AG 旗艦不凡</h2>

            <div id="container">

              <br/>

              <ul id="modeldata">
                <li class='news_li'><img src='data:image/png;base64,' width="800px" height="600px" alt="沒圖片"></li>
              </ul>
                <br/><br/><br/>
			
			<div class="btn-group btn-group-toggle" data-toggle="buttons">
    			<label class="btn btn-primary"><input type="radio" name="IO" id="showOuter" value="outer"> 外觀 </label>
				<label class="btn btn-secondary"><input type="radio" name="IO" id="showInner" value="inner"> 內裝 </label>
			</div>
			<div id="divInnerOuter"><img id="" src='' width="70%" height="auto" alt=""></div>
			
			<div class="col-lg-10 image-holder-custom">
            <header>
            	<div class="season" id='season'>
            	  <img src="" class="spring" alt="" id="an1">
            	  <img src="" class="summer" alt="" id="an4">
            	  <img src="" class="autumn" alt="" id="an7">
            	  <img src="" class="winter" alt="" id="an10">
            	  <img src="" class="winter" alt="" id="an13">
            	  <img src="" class="winter" alt="" id="an16">
            	  <img src="" class="winter" alt="" id="an19">
              </div>
            </header>
          	</div>

            <br/><a href="/FinalProject/TestDrive" class="btn btn-primary btn-lg active" role="button"
                aria-pressed="true">預約試駕</a>

			  </div>
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
    //search by id
    $(document).ready(function () {
		$.ajax({
			url: "/FinalProject/getAllModel",
			method: "GET",
			dataTypte: "json",
			success: function (data) {
				
				let href = "";
				
				$.each(data, function (index, item) {
					href += `<li class="li-custom"><a class="" href="/FinalProject/Model/model?modelType=` + item.modelType + `">` + item.modelType + "</a></li>"
					
				});
			}
    	
    	
    	
      const queryString = window.location.search;
      const urlParams = new URLSearchParams(queryString);
      const modelType = urlParams.get('modelType');
      $.ajax({
        url: "/FinalProject/findByIdModelAPI/" + modelType,
        method: "GET",
        dataType: "json",
        success: function (data) {
          let str = "";
          str += "<li class='news_li'><h2>" + data.modelType + 
          	"</h2></li><li class='news_li'>建議售價:" + data.price + 
          	"</li><li class='news_li'>引擎類型:" + data.engineType + 
          	"</li><li class='news_li'>排氣量:" + data.engineDisplacement + 
          	"</li><li class='news_li'>馬力:" + data.power + 
          	"</li><li class='news_li'>扭力:" + data.torque + 
          	"</li><li class='news_li'>油耗:" + data.consumption + 
          	"</li><li class='news_li'>乘坐人數:" + data.seat + 
          	"</li><li class='news_li'><img src='data:image/png;base64," + data.background + 
          	"'width='800px' height='600px' alt='車型圖片'></li>" + "<br/><br/><br/>" + data.description;
          $("#modeldata").html(str)
		
          let innerOuter="";
          innerOuter += "<img id='imgInn' src='data:image/png;base64," + data.interior + "'width='800px' height='600px' alt='車型圖片'></li>" + 
          		"<img id='imgExt' src='data:image/png;base64," + data.exterior + "'width='800px' height='600px' alt='車型圖片'></li>"
          
          $("#divInnerOuter").html(innerOuter)
          
          $("#imgInn").css('display','none');
        },
        error: function (err) {
          console.log("沒抓到id")
          alert(err)
          console.log(err)
        }
      });
    });
	
    $('input:radio[name="IO"]').change(
    	    function(){
    	    	if (this.value == 'outer') {
    	    		$("#imgExt").css('display','block');
    	    		$("#imgInn").css('display','none');
				} else if (this.value == 'inner') {	
    	    		$("#imgExt").css('display','none');
    	    		$("#imgInn").css('display','block');
    	        }
    	    });
  </script>

  </html>