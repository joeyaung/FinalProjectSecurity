<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-TW">

  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Audi - 車型總覽</title>
    <link rel="icon" type="image/x-icon" href="images/favicon.png" />
    

	<!--  Page Level CSS -->
    
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
    <link rel="stylesheet" href="/FinalProject/css/modelAllPage.css" />

	<!-- Page Customed - Carousel  -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    
  </head>

  <body id="page-top">
    <!-- Navigation-->
    <nav
      class="navbar navbar-expand-lg navbar-light fixed-top navbar-shrink"
      id="mainNav"
    >
      <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="/FinalProject/"><img src="/FinalProject/images/audi-logo.png" alt="logo" /></a>
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
              <a class="nav-link" href="/FinalProject/TestDrive" style="padding: 1.5rem .8rem 1.25rem;">試駕體驗</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/FinalProject/News" style="padding: 1.5rem .8rem 1.25rem;">最新消息</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/FinalProject/Model" style="padding: 1.5rem .8rem 1.25rem;">了解車型</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/FinalProject/Events" style="padding: 1.5rem .8rem 1.25rem;">活動</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/FinalProject/products" style="padding: 1.5rem .8rem 1.25rem;">精品商城</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/FinalProject/center" style="padding: 1.5rem .8rem 1.25rem;">展示中心</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/FinalProject/account" style="padding: 1.5rem .8rem 1.25rem;">會員專區</a>
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
        	<nav style="margin-top: -3%">
                <ul style="padding-left:0" id="model-href">
            	</ul>
            </nav><br/>
    

      
      <div id="carouselExampleIndicators" class="carousel slide object-fit-out" data-ride="carousel">
  		<ol class="carousel-indicators" id="carousel_olli">
  		  <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
  		  <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
  		  <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>   
			<div class="carousel-inner object-fit" id="carousel">
			    <div class="carousel-item active">
      				<img class="d-block w-100" src="/FinalProject/images/model/A3_bg.jpg" alt="First slide">
    				<div class="carousel-caption d-none d-md-block">
  					  <h5>Audi A3</h5>
  					  <p>Audi A3 搶眼外型玩轉風潮，新世代運動美學，兼容優雅、動感於一身</p>
  					</div>
    			</div>
    			
    			<div class="carousel-item">
      				<img class="d-block w-100" src="/FinalProject/images/model/A4_bg.jpg" alt="Second slide">
    				<div class="carousel-caption d-none d-md-block">
  					  <h5>A4豪華</h5>
  					  <p>Audi A4 截然不同的車身設計，外觀彰顯動感，強勁且優美</p>
  					</div>
    			</div>
    			
    			<div class="carousel-item">
      				<img class="d-block w-100" src="/FinalProject/images/model/A5_bg.jpg" alt="Third slide">
    				<div class="carousel-caption d-none d-md-block">
  					  <h5>A5不凡</h5>
  					  <p>Audi A5 以全新元素融入設計語彙，為車頭、車側與車尾造型增添更多深度和氣度，開啟全新美學境界</p>
  					</div>
    			</div>
  			</div>
  			<a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
    			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
    			<span class="sr-only">Previous</span>
  			</a>
  			<a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
    			<span class="carousel-control-next-icon" aria-hidden="true"></span>
    			<span class="sr-only">Next</span>
  			</a>
		</div><br/><br/>
          
        
        </div>
      	<div id="container" style=" overflow:auto ; width:100%">
            <div class="main main3"><a href="/FinalProject/Model/model?modelType=A3">A3</a></div>
            <div class="main main4"><a href="/FinalProject/Model/model?modelType=A4">A4</a></div>
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



    <!--  -->
    <!--  -->
    

    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script>
//     $('.carousel').carousel({
//     	  interval: 3000
//     })
    </script>
	<!--  Bootstrap core JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
	<!--  Core theme JS -->
    <script src="js/template.js"></script>
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
    
    <script>
	// list為所有車型的array
	let list =[]		
	$(document).ready(function () {
		
		function showdetails(){
			console.log('Hello');
		}
			$.ajax({
				url: "/FinalProject/getAllModel",
				method: "GET",
				dataTypte: "json",
				success: function (data) {
					
					let href = "";

					// 處理 carousel-inner
					let divCarou = "";
					$.each(data, function (index, item) {
						
// 						href += `<li class="li-custom"><form class="form-inline" action="/FinalProject/Model/model?modelType=` + item.modelType + 
// 								`"><input type="button" id="secondHalfYear" class="" value="` + item.modelType + `" style="width: 150px; height: 50px;">`
                 		
						href += `<li class="li-custom"><a class="btn btn-dark btn-lg lf-10" role="button" aria-pressed="true" href="/FinalProject/Model/model?modelType=` + item.modelType + `">` + item.modelType + "</a></li>"
						list.push(item.modelType)	
								
						if(index==0){
							divCarou += `<div class="carousel-item active">`
						} else {
							divCarou += `<div class="carousel-item">`
						}
						divCarou += `<img class="d-block w-100" src="/FinalProject/images/model/` + item.modelType + `_bg.jpg" alt=""><div class="carousel-caption d-none d-md-block"><h5> Audi ` 
						+ item.modelType + `</h5><p class="marginBut-custom">` + item.subtitle + `</p></div></div>`;
					
					
					});
					
					// 處理 ol li
					let olli = `<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>`;
					for(let i=1 ; i<data.length ; i++){
						olli += `<li data-target="#carouselExampleIndicators" data-slide-to="` + i + `" ></li>`;
					}
					
					$("#carousel").html(divCarou);
					$("#carousel_olli").html(olli);
					
					
					
					$("#model-href").html(href);
					

				},
				error: function (err) {
					alert('Ajax Error:' + err);
				}
			});


		});
	
    let index = 2;
        
	window.addEventListener("scroll", function(){
		let pageY = window.pageYOffset;
		let main2 = document.querySelector(".main2");
		$('.main3').css('background-position', -pageY*.3+'px '+'-300px');
// 		main2.style.backgroundPosition = -(pageY * .25)+`px -600px`
		$('.main4').css('background-position', (pageY*.3-700)+'px '+'-300px');
		
        let pageH=$('body').height()
        let winH=$(window).height()
        let winTop=$(this).scrollTop();
        let scrollPercent = (winTop/(pageH-winH));
        if( scrollPercent > 0.98){

          if(index < list.length){
            $.ajax({
                url: "/FinalProject/findByIdModelAPI/" + list[index],
                method: "GET",
                dataType: "json",
                success: function (data) {
                	console.log("list[index]  "+data.modelType)
// 		        	$("#container").append(`<div class="main main5" id="`+data.modelType+`" style="")><a href="/FinalProject/Model/model?modelType=`+ data.modelType+`">`+ data.modelType+`</a></div>`)
// 		        	$("#"+data.modelType).css('background-image', `url('/FinalProject/images/model/` + data.modelType + `_bg.jpg')`);
// 		        	$("#"+data.modelType).css('background-position', '-150px -500px');
		        	$("#container").append(`<div class="main main5" id="`+data.modelType+`" style="")><a href="/FinalProject/Model/model?modelType=`+ data.modelType+`">`+ data.modelType+`</a></div>`)
		        	$("#"+data.modelType).css('background-image', `url("data:image/png;base64,` + data.background + `")`);
		        	$("#"+data.modelType).css('background-position', '-150px -500px');
        			
//        			 	console.log(data.modelType +"=data.modelType"+"***"+modellist[index])
		        	
		        	setTimeout(function(){;}, 1000);
                },
                error: function (err) {
                	console.log(err)
                }
              });
		        	index++;
          } else if(index >= list.length){
          }
        }    
		
		
	})
  </script>
  </body>
</html>
