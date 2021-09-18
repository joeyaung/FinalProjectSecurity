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

    <!-- jquery安裝 -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <!-- Vue安裝 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.6.7/vue.js"></script>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="/FinalProject/js/template.js"></script>
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
        text-align: center;
        
      }

      .section_height{
        height: 1500px;
      }

      .main{
        border: solid red;
        width: 800px;
        float: right;
      }


      .side{
        border: solid green;
        width: 300px;
        float: left;
      }

      .sidecard{
        width: 250px;
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
    <section class="py-5 section_height" id="app">
      <div class="container px-4 px-lg-5 mt-5">
      
        <!-- main -->
        <div class="gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center main" id="product-container">
          <div class="col mb-5"> 

                <div class="text-center">

                  <!-- findbyid From Center-->
                  <h5>台北展示中心</h5>
                  <li class="center_li">地址:台北市大同區</li>
                  <li class="center_li">連絡電話：02-12345678</li>
                  <li class="center_li">Email:abc@gamil.com</li>



                </div>
          </div>
        </div>



        <!-- side -->
        <div class="gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center side" id="product-container">
          <div class="col mb-5" v-for="(item, index) in centers ">  <!-- vue的for迴圈 -->
            <div class="card h-100 sidecard">
              <div class="card-body p-4">
                <div class="text-center">

                  <!-- Center name-->
                  <h5 class="fw-bolder center-title">{{ item.centerName }}</h5>
                  <li class="center_li">{{ item.centerAddress }}</li>
                  <li class="center_li">連絡電話：{{ item.centerPhone }}</li>
                  <li class="center_li">{{ item.centerEmail }}</li>


                  <a :href="'http://localhost:8080/FinalProject/location/center?id='+item.centerId">Link</a>

                  <!-- <span class="product-price">{{ item.centerPhone }}</span> -->
                </div>
              </div>
              <!-- Product actions-->
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


    
    <!-- <script src="js/productall.js"></script> -->
    <script>
      let productVM = new Vue({
	el:"#app",
	data:{
	  centers:[],

	},
	
	mounted: function(){
		var self = this;
		$.ajax({
			url:"/FinalProject/getAllCneter",
			method:"GET",
			success:function(res){
				console.log(res);
				self.centers = res;
			},
			error:function(){
				console.log("Fail");
			},
			
		});
		
	},

  // mounted: function(){
	// 	var self = this;
  //   console.log(window.location.search)
	// 	$.ajax({
	// 		url:"/FinalProject/getAllCneter/" + centerId,
	// 		method:"GET",
	// 		success:function(res){
	// 			console.log(res);
	// 			self.centers = res;
	// 		},
	// 		error:function(){
	// 			console.log("Fail");
	// 		},
			
	// 	});
		
	// },
	
});
      
      

      
      
      
    </script>
  </body>
</html>