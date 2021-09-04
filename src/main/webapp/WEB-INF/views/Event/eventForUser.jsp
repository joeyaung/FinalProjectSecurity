<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html lang="zh-TW">

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
		<meta name="description" content="" />
		<meta name="author" content="" />
		<title>活動</title>

		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<!-- Bootstrap core JS-->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
		<!-- Core theme JS-->
		<script src="js/template.js"></script>
		<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
		<!-- lightslider JS -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/lightslider/1.1.6/js/lightslider.min.js"></script>

		<link rel="icon" type="image/x-icon" href="images/favicon.ico" />
		<!-- Font Awesome icons (free version)-->
		<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>

		<!-- Google fonts-->
		<link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
		<link
			href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
			rel="stylesheet" />
		<!-- Core theme CSS (includes Bootstrap)-->
		<link href="css/index.css" rel="stylesheet" />
		<!-- lightslider css -->
		<link href="https://cdnjs.cloudflare.com/ajax/libs/lightslider/1.1.6/css/lightslider.css" rel="stylesheet" />


		<style>
			.bg-gray-custom {
				background: linear-gradient(to bottom, #ced6e0 0%, rgba(206, 214, 224, 0.4) 75%, rgba(206, 214, 224, 0.6) 100%);
			}

			@import url(https://fonts.googleapis.com/earlyaccess/cwtexfangsong.css);
		</style>

	</head>

	<body id="page-top">
		<!-- Navigation-->
		<nav class="navbar navbar-expand-lg navbar-light fixed-top navbar-shrink" id="mainNav">
			<div class="container px-4 px-lg-5">
				<a class="navbar-brand" href="/FinalProject/"><img src="/FinalProject/images/audi-logo.png"
						alt="logo" /></a>
				<button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse"
					data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
					aria-label="Toggle navigation">
					Menu <i class="fas fa-bars"></i>
				</button>
				<div class="collapse navbar-collapse" id="navbarResponsive">
					<ul class="navbar-nav ms-auto">
						<li class="nav-item"><a class="nav-link" href="/FinalProject/TestDrive">試駕體驗</a></li>
						<li class="nav-item"><a class="nav-link" href="/FinalProject/News">最新消息</a></li>
						<li class="nav-item"><a class="nav-link" href="#signup">了解車型</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="/FinalProject/Events">活動</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="#signup">精品商城</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="#signup">展示中心</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="/FinalProject/account">會員專區</a></li>
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
				  <div class="col-lg-10 po-re">
					<h2 class="h_bookf" style="color:black;">活動</h2>
						<p class="text-white-50">
						<div id="container">

							<div id="lightSlider">
							
							</div>

						</div>

					</div>

				</div>
			</div>
			<!-- <img class="img-fluid" src="images/audi-etron.png" alt="..." /> -->
		</section>

		<!-- 以下不要動 -->
		<!-- Footer-->
		<footer class="footer bg-black small text-center text-white-50">
			<div class="container px-4 px-lg-5">Copyright &copy; 資策會第五組專題報告
				2021</div>
		</footer>


	</body>
	<script type="text/javascript">
		$(document).ready(function () {

			function showdetails() {
				console.log('Hello');
			}


			$.ajax({
				url: "/FinalProject/getAllEvents",
				method: "GET",
				dataTypte: "json",
				success: function (data) {
					var list = "";

					$.each(data, function (index, item) {

						list += "<div class='event_div' style='position: relative; width: 563px; height: 350px;'><a href='Events/OneEvent?event_id=" + item.event_id + "'><img class='event_img' src='data:image/png;base64,"
							+ item.event_img + "' width='563' height='350' alt='pic cannot be displayed' style='border-radius: 10%'';;/><span style='position:absolute; z-index:2; left:275px; top:10px; color:white; font-family: ‘cwTeXFangSong’, serif; font-size: 25px;'>" + item.event_title + "</span></a></div>";
					});


					$("#lightSlider").html(list);



					$("#lightSlider").lightSlider({
						slideWidth: 320, // 物件寬度
						speed: 400, // 切換速度
						pause: 3000, // 當等待時間超過此時，則自動切換
						auto: true, // 自動切換
						item: 1, // 顯示數量
						responsive: [
							{
								breakpoint: 960, // 當螢幕大於此寬度時，則啟用此設定值
								settings: {
									item: 6, // 顯示數量
									slideMove: 1 // 一次切換數量
								}
							},
							{
								breakpoint: 640, // 當螢幕大於此寬度時，則啟用此設定值
								settings: {
									item: 1, // 顯示張數
									slideMove: 1 // 一次切換數量
								}
							}
						]



					});



				},
				error: function (err) {
					alert('fetch events failed :' + err);
				}
			});




		});
	</script>

	</html>