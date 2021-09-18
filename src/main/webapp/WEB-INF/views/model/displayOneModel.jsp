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
<!--         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"> -->

    <style>


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
      
      	<nav style="margin-top: -3%">
           <ul style="padding-left:0" id="model-href">
           </ul>
        </nav><br/>
      
        <div class="row gx-4 gx-lg-5 justify-content-center">
        
        
          <div class="col-lg-12">
            <h2 class="mb-4" style="margin-top:50px; font-size: 4em">The Audi <span id="title"></span> 耀眼登場</h2>
            
            
            
            <br/>
            <div class="container">
				  <span id="subtitle"></span>
			</div><br/>
			
			
			
            <div>
			
<!--       			<div class="container"> -->
				  <div class="row" style="margin-top:60px; font-size: 2.2em">
				    <div style="border-right:3px #cccccc solid" class="col">排氣量 (cc)<br><span id="displacement"></span></div>
				    <div class="col">最大馬力 (hp/rpm)<br><span id="power"></span></div>
				    <div style="border-left:3px #cccccc solid;" class="col">最大扭力(Nm/rpm)<br><span id="torque"></span></div>
				  </div>
<!-- 				</div> -->
      			
              <br/>
			  <div id="divimage"><img id="" src='' width="70%" height="auto" alt=""></div>
              <br/><br/><br/>
			
			
			
			<div class="container">
				  <h4 id="description"></h4>
			</div><br/><br/>
			
			

			<div class="btn-group btn-group-toggle" data-toggle="buttons">
    			<label class="btn btn-light" style="font-size: 25px"><input type="radio" name="IO" id="showOuter" value="outer" checked> 外觀 </label>
				<label class="btn btn-dark" style="font-size: 25px"><input type="radio" name="IO" id="showInner" value="inner"> 內裝 </label>
			</div>
			<div id="divInnerOuter" style="display: flex; justify-content: center;"><img id="" src='' width="70%" height="auto" alt=""></div>
			
            <br/>
						
						
			
				  <div class="row" style="margin:70px 0; font-size: 2em">
				    <div style="border-right:3px #cccccc solid" class="col">引擎動力類型<br><span style="font-size: .8em" id="engineType"></span></div>
				    <div style="border-right:3px #cccccc solid" class="col">油耗 (km/L)<br><span id="consumption"></span></div>
				    <div class="col">乘座人數 (cc)<br><span id="seat"></span></div>
				    <div style="border-left:3px #cccccc solid" class="col">參考售價<br><span id="price"></span></div>
				  </div>
			
						

            <header style="cursor: grabbing">
            	<div class="season" id='season'>
            	  <img src="/FinalProject/images/model/blank2.jpg" class="an1" alt="">
            	  <img src="/FinalProject/images/model/blank2.jpg" class="an4" alt="">
            	  <img src="/FinalProject/images/model/blank2.jpg" class="an7" alt="">
            	  <img src="/FinalProject/images/model/blank2.jpg" class="an10" alt="">
            	  <img src="/FinalProject/images/model/blank2.jpg" class="an13" alt="">
            	  <img src="/FinalProject/images/model/blank2.jpg" class="an16" alt="">
            	  <img src="/FinalProject/images/model/blank2.jpg" class="an19" alt="">
              </div>
              <div class="car">
            	  <img src="/FinalProject/images/model/A3_angle1.png"  class="an1" id="an1" alt="">
            	  <img src="/FinalProject/images/model/A3_angle4.png" class="an4" id="an4" alt="">
            	  <img src="/FinalProject/images/model/A3_angle7.png" class="an7" id="an7" alt="">
            	  <img src="/FinalProject/images/model/A3_angle10.png" class="an10" id="an10" alt="">
            	  <img src="/FinalProject/images/model/A3_angle13.png" class="an13" id="an13" alt="">
            	  <img src="/FinalProject/images/model/A3_angle16.png" class="an16" id="an16" alt="">
            	  <img src="/FinalProject/images/model/A3_angle19.png" class="an19" id="an19" alt="">
              </div>
            </header>




            <br/><a href="/FinalProject/TestDrive" class="btn btn-primary btn-lg" style="font-size: 20px" role="button"
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
				
		// 處理 carousel-inner
		$.each(data, function (index, item) {
			href += `<li class="li-custom"><a class="btn btn-dark btn-lg lf-10 btn-custom" role="button" aria-pressed="true" href="/FinalProject/Model/model?modelType=` + item.modelType + `">` + item.modelType + "</a></li>"
		});
		
		$("#model-href").html(href);
		},
		error: function (err) {
			alert('Ajax Error:' + err);
		}
	});
      
    	
    	
    	
    	
      const queryString = window.location.search;
      const urlParams = new URLSearchParams(queryString);
      const modelType = urlParams.get('modelType');
      $.ajax({
        url: "/FinalProject/findByIdModelAPI/" + modelType,
        method: "GET",
        dataType: "json",
        success: function (data) {
		
          let innerOuter="";
          innerOuter += "<img id='imgInn' src='data:image/png;base64," + data.interior + "' height='600px' alt='車型圖片'></li>" + 
          		"<img id='imgExt' src='data:image/png;base64," + data.exterior + "' height='600px' alt='車型圖片'></li>"
          
          $("#divInnerOuter").html(innerOuter)
          
          $("#imgInn").css('display','none');
          		
          		
          $("#divimage").html("<img src='data:image/png;base64," + data.background + "'width='100%' alt='車型圖片'>")
          		
          $("#title").html(data.modelType);
          $("#subtitle").html(data.subtitle);
          
          $("#description").html(data.description);
          
		  $("#displacement").html(data.engineDisplacement);  
		  $("#power").html(data.power);  
		  $("#torque").html(data.torque); 
		  
		  $("#engineType").html(data.engineType);
		  $("#consumption").html(data.consumption);
		  $("#seat").html(data.seat);
		  
		   function dollorFormated(price) {
		        let formatter = new Intl.NumberFormat("en-US", {
		          style: "currency",
		          currency: "TWD",
		          minimumFractionDigits: 0,
		        });
		        return formatter.format(price);
		    }
		      
		  
		  $("#price").html(dollorFormated(data.price));
		  
		  
		  
          $("#an1").prop("src","/FinalProject/images/model/"+data.modelType+"_angle1.png")
          $("#an4").prop("src","/FinalProject/images/model/"+data.modelType+"_angle4.png")
          $("#an7").prop("src","/FinalProject/images/model/"+data.modelType+"_angle7.png")
          $("#an10").prop("src","/FinalProject/images/model/"+data.modelType+"_angle10.png")
          $("#an13").prop("src","/FinalProject/images/model/"+data.modelType+"_angle13.png")
          $("#an16").prop("src","/FinalProject/images/model/"+data.modelType+"_angle16.png")
          $("#an19").prop("src","/FinalProject/images/model/"+data.modelType+"_angle19.png")
          		
          		
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
<script>
// 360 animation 360漸變圖
let startingPoint
const header = document.querySelector('header')

    header.addEventListener('mouseenter',(e) => {
        startingPoint = e.clientX;
        header.classList.add('moving');
    })
let still = 0;
    header.addEventListener('mouseout',(e) => {
//         header.style.setProperty('--percentage', 0);
        header.classList.remove('moving');
    })


const season = document.getElementById('season')
let leftEmpty = (window.outerWidth - season.offsetWidth)/2
header.addEventListener('mousemove',(e) => {
    // let percentage = 2*(e.clientX - startingPoint) / window.outerWidth ;
    let percentage = -(e.clientX - startingPoint) / (season.offsetWidth + leftEmpty - (window.outerWidth - startingPoint));
    console.log((e.clientX - startingPoint) +"###"+(season.offsetWidth)+"###"+percentage)
    header.style.setProperty('--percentage',  percentage)
    
})



</script>
</html>