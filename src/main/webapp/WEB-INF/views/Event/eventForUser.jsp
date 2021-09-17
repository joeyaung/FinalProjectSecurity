<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-TW">

<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Audi - 活動總覽</title>
<link rel="icon" type="image/x-icon" href="images/favicon.png" />

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- Bootstrap core JS-->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="js/template.js"></script>
<script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
<!-- lightslider JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/lightslider/1.1.6/js/lightslider.min.js"></script>
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
	crossorigin="anonymous"></script>

<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Varela+Round"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/index.css" rel="stylesheet" />
<!-- lightslider css -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/lightslider/1.1.6/css/lightslider.css"
	rel="stylesheet" />


<style>
.bg-gray-custom {
	background: linear-gradient(to bottom, #ced6e0 0%, rgba(206, 214, 224, 0.4)
		75%, rgba(206, 214, 224, 0.6) 100%);
}

@import url(https://fonts.googleapis.com/earlyaccess/cwtexfangsong.css);

.container1 {
	position: relative;
	width: 75%;
	/* width: 563px;
				height: 350px; */
	text-align: center;
}

.image {
	opacity: 1;
	display: block;
	width: 75%;
	height: auto;
	transition: .5s ease;
	backface-visibility: hidden;
	margin: auto;
}

.middle {
	transition: .5s ease;
	opacity: 0;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	text-align: center;
}

.container:hover .image {
	opacity: 0.3;
}

.container:hover .middle {
	opacity: 1;
}

.text {
	background-color: #04AA6D;
	color: white;
	font-size: 16px;
	padding: 16px 32px;
}

@import
	url("https://fonts.googleapis.com/css2?family=Merriweather&family=Merriweather+Sans:wght@300&display=swap")
	;

/*General styling for structure*/
body {
	margin: 0;
	font-family: "Merriweather Sans", sans-serif;
}

.container {
	max-width: 1280px;
	width: 95%;
	margin: 0 auto;
}

header {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	text-align: center;
	font-family: "Merriweather", serif;
	height: 100vh;
}

header h2 {
	font-weight: 400;
}

.scroll-container {
	height: 100vh;
	min-height: 450px;
	padding: 2rem 1rem;
	display: flex;
	align-items: center;
	box-sizing: border-box;
}

.scroll-container:nth-of-type(1) {
	background-color: #bdd0c4;
}

.scroll-container:nth-of-type(2) {
	background-color: #f5d2d3;
}

.scroll-container:nth-of-type(3) {
	background-color: #9ab7d3;
}

.scroll-container:nth-of-type(4) {
	background-color: #dfccf1;
}

.scroll-container:nth-of-type(even) {
	flex-direction: row-reverse;
}

.scroll-element, .scroll-caption {
	width: 50%;
}

.scroll-element {
	min-height: 300px;
	height: 100%;
	background-color: #eaeaea;
}

.scroll-caption {
	margin: 1rem;
}

footer {
	text-align: center;
	padding: 0.5rem 0;
	background-color: #faddad;
}

footer p {
	font-size: 0.75rem;
	margin: 0.25rem 0;
	color: #221133;
}

footer a {
	text-decoration: none;
	color: inherit;
}

@media screen and (max-width: 650px) {
	.scroll-container, .scroll-container:nth-of-type(even) {
		flex-direction: column;
		align-content: inherit;
	}
	.scroll-element {
		height: 100%;
	}
	.scroll-element, .scroll-caption {
		width: 100%;
	}
}

/**Styling scrollable elements*/
.js-scroll {
	opacity: 0;
	transition: opacity 500ms;
}

.js-scroll.scrolled {
	opacity: 1;
}

.scrolled.fade-in {
	animation: fade-in 1s ease-in-out both;
}

.scrolled.fade-in-bottom {
	animation: fade-in-bottom 1s ease-in-out both;
}

.scrolled.slide-left {
	animation: slide-in-left 1s ease-in-out both;
}

.scrolled.slide-right {
	animation: slide-in-right 1s ease-in-out both;
}

/* ----------------------------------------------
 * Generated by Animista on 2021-2-11 23:32:31
 * Licensed under FreeBSD License.
 * See http://animista.net/license for more info. 
 * w: http://animista.net, t: @cssanimista
 * ---------------------------------------------- */
@
keyframes slide-in-left { 0% {
	-webkit-transform: translateX(-100px);
	transform: translateX(-100px);
	opacity: 0;
}

100
%
{
-webkit-transform
:
translateX(
0
);
transform
:
translateX(
0
);
opacity
:
1;
}
}
@
keyframes slide-in-right { 0% {
	-webkit-transform: translateX(100px);
	transform: translateX(100px);
	opacity: 0;
}

100
%
{
-webkit-transform
:
translateX(
0
);
transform
:
translateX(
0
);
opacity
:
1;
}
}
@
keyframes fade-in-bottom { 0% {
	-webkit-transform: translateY(50px);
	transform: translateY(50px);
	opacity: 0;
}

100
%
{
-webkit-transform
:
translateY(
0
);
transform
:
translateY(
0
);
opacity
:
1;
}
}
@
keyframes fade-in { 0% {
	opacity: 0;
}
100
%
{
opacity
:
1;
}
}
</style>

</head>

<body id="page-top">
	<!-- Navigation-->
	<nav
		class="navbar navbar-expand-lg navbar-light fixed-top navbar-shrink"
		id="mainNav">
		<div class="container px-4 px-lg-5">
			<a class="navbar-brand" href="/FinalProject/"><img
				src="/FinalProject/images/audi-logo.png" alt="logo" /></a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link"
						href="/FinalProject/TestDrive">試駕體驗</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/FinalProject/News">最新消息</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/FinalProject/Model">了解車型</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/FinalProject/Events">活動</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/FinalProject/products">精品商城</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/FinalProject/center">展示中心</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/FinalProject/account">會員專區</a></li>
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
					<h2 class="h_bookf" style="color: black;">活動</h2>
					<p class="text-white-50">
					<div id="container">

						<div id="lightSlider"></div>

						<section class="scroll-container">
							<div class="scroll-element js-scroll fade-in">
								<img width="400" height="300"
									src="/FinalProject/images/eventsphotos/event_img6.jpeg" />
							</div>
							<div class="scroll-caption">
								長久以來致力於推廣兒童交通安全教育的Audi，不僅持續耕耘交通安全教育的推廣與知識傳播，更持續舉辦Audi Kids
								Campus超過10年以上，落實公益、實踐企業社會責任。 </br> <a
									href="Events/OneEvent?event_id=5">更多資訊</a>
							</div>
						</section>
						<section class="scroll-container">
							<div class="scroll-element js-scroll fade-in-bottom">
								<img width="400" height="300"
									src="/FinalProject/images/eventsphotos/event_img5.jpg" />
							</div>
							<div class="scroll-caption">
								台灣奧迪自創立以來，始終秉持以人為本的設計理念，持續突破、創新，致力於打造人性化的未來移動空間。 </br> <a
									href="Events/OneEvent?event_id=4">更多資訊</a>
							</div>
						</section>
						<section class="scroll-container">
							<div class="scroll-element js-scroll slide-left">
								<img width="400" height="300"
									src="/FinalProject/images/eventsphotos/event_img4.jpg" />
							</div>
							<div class="scroll-caption">
								台灣奧迪自 2005 年成立以來，連年舉辦 Audi quattro Cup 車主杯高爾夫球賽。 </br> <a
									href="Events/OneEvent?event_id=3">更多資訊</a>
							</div>
						</section>
						<section class="scroll-container">
							<div class="scroll-element js-scroll slide-right">
								<img width="400" height="300"
									src="/FinalProject/images/eventsphotos/event_img2.jpg" />
							</div>
							<div class="scroll-caption">
								Audi 首款純電 SUV，以無比的安全性與性能表現，滿足您輕鬆邁向純電未來的日常通勤所需。 具備最大 408
								匹馬力輸出，續航里程可達 436 公里。 駕駛 Audi e-tron，即刻創見純電移動的精彩未來。 </br> <a
									href="Events/OneEvent?event_id=2">更多資訊</a>
							</div>
						</section>

						<section class="scroll-container">
							<div class="scroll-element js-scroll slide-right">
								<img width="400" height="300"
									src="/FinalProject/images/eventsphotos/event_img1.jpeg" />
							</div>
							<div class="scroll-caption">
								把握天氣微涼的暮春之際，Audi於10月25日在台中麗寶落羽松林大草皮舉辦「Touring Festival」。 </br> <a
									href="Events/OneEvent?event_id=1">更多資訊</a>
							</div>
						</section>
					</div>

				</div>

			</div>
		</div>

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

			const scrollElements = document.querySelectorAll(".js-scroll");

			const elementInView = (el, dividend = 1) => {
				const elementTop = el.getBoundingClientRect().top;

				return (
					elementTop <=
					(window.innerHeight || document.documentElement.clientHeight) / dividend
				);
			};

			const elementOutofView = (el) => {
				const elementTop = el.getBoundingClientRect().top;

				return (
					elementTop > (window.innerHeight || document.documentElement.clientHeight)
				);
			};

			const displayScrollElement = (element) => {
				element.classList.add("scrolled");
			};

			const hideScrollElement = (element) => {
				element.classList.remove("scrolled");
			};

			const handleScrollAnimation = () => {
				scrollElements.forEach((el) => {
					if (elementInView(el, 1.25)) {
						displayScrollElement(el);
					} else if (elementOutofView(el)) {
						hideScrollElement(el)
					}
				})
			}

			window.addEventListener("scroll", () => {
				handleScrollAnimation();
			});


			$.ajax({
				url: "/FinalProject/getAllEvents",
				method: "GET",
				dataTypte: "json",
				success: function (data) {
					var list = "";

					$.each(data, function (index, item) {

						list += "<div class='container1'><a href='Events/OneEvent?event_id=" + item.event_id + "'><img class='image' src='data:image/png;base64,"
							+ item.event_img + "' alt='pic cannot be displayed' style='border-radius: 10%';/><div class='middle'><div class='text'>更多資訊</div></div><span style='position:absolute; z-index:2; left:275px; top:10px; color:white; font-family: ‘cwTeXFangSong’, serif; font-size: 25px;'>" + item.event_title + "</span></a></div>";
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