<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="zh-TW">
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Audi - 完成預約</title>
    <link rel="icon" type="image/x-icon" href="images/favicon.png" />
    <!-- Font Awesome icons (free version)-->
    <script
      src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
      crossorigin="anonymous"
    ></script>
    <!-- Google fonts-->
    <link
      href="https://fonts.googleapis.com/css?family=Varela+Round"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
      rel="stylesheet"
    />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="css/index.css" rel="stylesheet" />
    <link rel="stylesheet" href="./css/bookForm.css" />
    <style>
    span {
    	display: inline-block;
    	animation: .4s jump ease-in-out;
    	animation-delay: var(--delay);
    }

	@keyframes jump {
		0%, 100%{
 			transform: translateY(0px); 
			color: inherit;
		}
		50% {
 			transform: translateY(-10px); 
			color: red;
		}
	}
    
    </style>
    
  </head>

  <body id="page-top">
    <!-- Navigation-->
    <nav
      class="navbar navbar-expand-lg navbar-light fixed-top navbar-shrink"
      id="mainNav"
    >
      <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="#page-top"
          ><img src="images/audi-logo.png" alt="logo"
        /></a>
        <button
          class="navbar-toggler navbar-toggler-right"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarResponsive"
          aria-controls="navbarResponsive"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
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
        
          <div class="col-lg-10 image-holder-custom" style="top:-50px">
            <img src="images/17.jpg" alt="" style="height:330px">
            <h3>BOOK A TEST DRIVE</h3>
          </div>
          
          <div style="margin-top:1%; height: 5%"> 
            <h1>預約成功</h1><br>
            <div class="po-re">
            	<h3 class="h_bookc dis-ib-custom">您的試駕表單編號為:<strong id="copied" style="color:#64A19D">${formId}</strong></h3>
              	<span class="input-group-addon color-blue copy-custom" id="copy" title="複製表單編號" onclick="copyEvent('copied')">
                <i class="fas fa-clone"></i></span><br/>
            	<h3 class="h_bookc">試駕表單資訊已寄送至您的E-mail信箱，請於信箱中確認</h3><br/><br/><br/>
            	<%session.invalidate();%>
              <form action="TestDrive" method="post">
				<div class="div">
                	<button type="submit" class="btn btn-warning wh-40">返回預約賞車</button>
              	</div><br/><br/>
              </form>
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

    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/template.js"></script>
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

    <script>
      function copyEvent(id)
      {	  //  複製表單編號
          var str = document.getElementById(id);
          window.getSelection().selectAllChildren(str);
          document.execCommand("Copy");
          //  製造文字效果: 為每個文字分別加上tag，並設定delay 變數
          str.innerHTML = str.textContent.replace(/\S/g,"<span>$&</span>");
          document.querySelectorAll('span').forEach((span, index) => {
        	  span.style.setProperty('--delay', index*0.1+'s')
          })
      }
  </script>
  </body>
</html>
