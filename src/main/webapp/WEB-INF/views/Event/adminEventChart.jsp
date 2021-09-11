<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html lang="zh-TW">

	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
		<meta name="description" content="" />
		<meta name="author" content="" />

		<title>Audi - 內部</title>

		<!-- Custom fonts for this template-->
		<link href="/FinalProject/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />
		<link
			href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
			rel="stylesheet" />

		<!-- Vue.js 2.6.7 -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.6.7/vue.js"
			integrity="sha512-y/+zR8ZRJXvRWVRuhPbjSpGNIv2yG9hePHeWYEb5RPcciLwlyG0ZGd6JsiT9+sFtTON9FrDs+07ZzepwatYX1Q=="
			crossorigin="anonymous"></script>

		<!-- Vue-chart.js -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
		<script src="https://unpkg.com/vue-chartjs/dist/vue-chartjs.min.js"></script>
		<!-- Custom styles for this template-->
		<link href="/FinalProject/css/sb-admin-2.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="/FinalProject/css/adminDashboard.css" />

	</head>

	<body id="page-top">
		<!-- Page Wrapper -->
		<div id="wrapper">
			<!-- Sidebar -->
			<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
				<!-- Sidebar - Brand -->
				<a class="sidebar-brand d-flex align-items-center justify-content-center" href="/FinalProject/inner">
					<div class="sidebar-brand-icon">
						<img src="/FinalProject/images/audi-logo.png" alt="" />
					</div>
				</a>

				<!-- Divider -->
				<hr class="sidebar-divider my-0" />

				<!-- Nav Item - Dashboard -->
				<li class="nav-item active"><a class="nav-link" href="/FinalProject/inner"> <i
							class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span></a></li>

				<!-- Divider -->
				<hr class="sidebar-divider" />

				<!-- Heading -->
				<div class="sidebar-heading">Analytics</div>

				<!-- Nav Item - Pages Collapse Menu -->
				<li class="nav-item"><a class="nav-link collapsed" href="#" data-toggle="collapse"
						data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo"> <i
							class="fas fa-users"></i> <span>Client</span>
					</a>
					<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
						<div class="bg-white py-2 collapse-inner rounded">
							<h6 class="collapse-header">Clients:</h6>
							<a class="collapse-item" href="buttons.html">Overview</a> <a class="collapse-item"
								href="cards.html">Curent Stage</a>
						</div>
					</div>
				</li>

				<!-- Nav Item - Utilities Collapse Menu -->
				<li class="nav-item"><a class="nav-link collapsed" href="#" data-toggle="collapse"
						data-target="#collapseUtilities" aria-expanded="true" aria-controls="collapseUtilities"> <i
							class="fas fa-id-card-alt"></i> <span>Employee</span>
					</a>
					<div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
						data-parent="#accordionSidebar">
						<div class="bg-white py-2 collapse-inner rounded">
							<h6 class="collapse-header">Employee:</h6>
							<a class="collapse-item" href="utilities-color.html">Overview</a>
							<a class="collapse-item" href="utilities-border.html">Sales</a>
						</div>
					</div>
				</li>

				<!-- Divider -->
				<hr class="sidebar-divider" />

				<!-- Heading -->
				<div class="sidebar-heading">FUNCTIONS</div>

				<!-- Nav Item - 新增員工 -->
				<li class="nav-item"><a class="nav-link" href="/FinalProject/inner/admin/addEmployee"> <i
							class="fas fa-user-plus"></i> <span>新增員工</span></a></li>

				<!-- Nav Item - 試駕總覽 -->
				<li class="nav-item"><a class="nav-link" href="/FinalProject/admin/edit/testdrive"> <i
							class="fas fa-car"></i>
						<span>試駕總覽</span></a></li>

				<!-- Nav Item - 編輯消息 -->
				<li class="nav-item"><a class="nav-link" href="/FinalProject/inner/admin/AllNewsPage"> <i
							class="fas fa-rss-square"></i> <span>編輯消息</span></a></li>

				<!-- Nav Item - 編輯商品 -->
				<li class="nav-item"><a class="nav-link" href="/FinalProject/inner/admin/edit/products"> <i
							class="fas fa-rss-square"></i> <span>編輯商品</span></a></li>

				<!-- Nav Item - 編輯活動 -->
				<li class="nav-item"><a class="nav-link" href="/FinalProject/inner/admin/AllEventsPage"> <i
							class="fas fa-rss-square"></i> <span>編輯活動</span></a></li>

				<!-- Nav Item - 活動表單 -->
				<li class="nav-item"><a class="nav-link" href="/FinalProject/inner/admin/AllEventForm"> <i
							class="fas fa-rss-square"></i> <span>活動報名表單</span></a></li>

				<!-- Nav Item - 活動報名統計-->
				<li class="nav-item"><a class="nav-link" href="/FinalProject/inner/admin/EventDashboard"> <i
							class="fas fa-rss-square"></i> <span>活動報名統計</span></a></li>

				<!-- Divider -->
				<hr class="sidebar-divider d-none d-md-block" />

				<!-- Sidebar Toggler (Sidebar) -->
				<div class="text-center d-none d-md-inline">
					<button class="rounded-circle border-0" id="sidebarToggle"></button>
				</div>
			</ul>
			<!-- End of Sidebar -->

			<!-- Content Wrapper -->
			<div id="content-wrapper" class="d-flex flex-column">
				<!-- Main Content -->
				<div id="content">
					<!-- Topbar -->
					<nav class="
              navbar navbar-expand navbar-light
              bg-white
              topbar
              mb-4
              static-top
              shadow
            ">
						<!-- Sidebar Toggle (Topbar) -->
						<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
							<i class="fa fa-bars"></i>
						</button>

						<!-- Topbar Search -->
						<form class="
                d-none d-sm-inline-block
                form-inline
                mr-auto
                ml-md-3
                my-2 my-md-0
                mw-100
                navbar-search
              ">
							<div class="input-group">
								<input type="text" class="form-control bg-light border-0 small"
									placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2" />
								<div class="input-group-append">
									<button class="btn btn-primary" type="button">
										<i class="fas fa-search fa-sm"></i>
									</button>
								</div>
							</div>
						</form>

						<!-- Topbar Navbar -->
						<ul class="navbar-nav ml-auto">
							<!-- Nav Item - Search Dropdown (Visible Only XS) -->
							<li class="nav-item dropdown no-arrow d-sm-none"><a class="nav-link dropdown-toggle"
									href="#" id="searchDropdown" role="button" data-toggle="dropdown"
									aria-haspopup="true" aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
								</a> <!-- Dropdown - Messages -->
								<div class="
                    dropdown-menu dropdown-menu-right
                    p-3
                    shadow
                    animated--grow-in
                  " aria-labelledby="searchDropdown">
									<form class="form-inline mr-auto w-100 navbar-search">
										<div class="input-group">
											<input type="text" class="form-control bg-light border-0 small"
												placeholder="Search for..." aria-label="Search"
												aria-describedby="basic-addon2" />
											<div class="input-group-append">
												<button class="btn btn-primary" type="button">
													<i class="fas fa-search fa-sm"></i>
												</button>
											</div>
										</div>
									</form>
								</div>
							</li>

							<!-- Nav Item - Alerts -->
							<li class="nav-item dropdown no-arrow mx-1"><a class="nav-link dropdown-toggle" href="#"
									id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"> <i class="fas fa-bell fa-fw"></i> <!-- Counter - Alerts -->
									<span class="badge badge-danger badge-counter">3+</span>
								</a> <!-- Dropdown - Alerts -->
								<div class="
                    dropdown-list dropdown-menu dropdown-menu-right
                    shadow
                    animated--grow-in
                  " aria-labelledby="alertsDropdown">
									<h6 class="dropdown-header">Alerts Center</h6>
									<a class="dropdown-item d-flex align-items-center" href="#">
										<div class="mr-3">
											<div class="icon-circle bg-primary">
												<i class="fas fa-file-alt text-white"></i>
											</div>
										</div>
										<div>
											<div class="small text-gray-500">December 12, 2019</div>
											<span class="font-weight-bold">A new monthly report is
												ready to download!</span>
										</div>
									</a> <a class="dropdown-item d-flex align-items-center" href="#">
										<div class="mr-3">
											<div class="icon-circle bg-success">
												<i class="fas fa-donate text-white"></i>
											</div>
										</div>
										<div>
											<div class="small text-gray-500">December 7, 2019</div>
											$290.29 has been deposited into your account!
										</div>
									</a> <a class="dropdown-item d-flex align-items-center" href="#">
										<div class="mr-3">
											<div class="icon-circle bg-warning">
												<i class="fas fa-exclamation-triangle text-white"></i>
											</div>
										</div>
										<div>
											<div class="small text-gray-500">December 2, 2019</div>
											Spending Alert: We've noticed unusually high spending for your
											account.
										</div>
									</a> <a class="dropdown-item text-center small text-gray-500" href="#">Show All
										Alerts</a>
								</div>
							</li>

							<div class="topbar-divider d-none d-sm-block"></div>

							<!-- Nav Item - User Information -->
							<li class="nav-item dropdown no-arrow"><a class="nav-link dropdown-toggle" href="#"
									id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false"> <span class="mr-2 d-none d-lg-inline text-gray-600 small">${
										empName }</span>
									<img class="img-profile rounded-circle"
										src="/FinalProject/images/svg/undraw_profile.svg" />
								</a> <!-- Dropdown - User Information -->
								<div class="
                    dropdown-menu dropdown-menu-right
                    shadow
                    animated--grow-in
                  " aria-labelledby="userDropdown">
									<a class="dropdown-item" href="#"> <i
											class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
									</a> <a class="dropdown-item" href="#"> <i
											class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
										Settings
									</a> <a class="dropdown-item" href="#"> <i
											class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
										Activity Log
									</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal"> <i
											class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
										Logout
									</a>
								</div>
							</li>
						</ul>
					</nav>
					<!-- End of Topbar -->
					<!-- Begin Page Content -->
					<div class="container-fluid" id="app">
						<!-- Page Heading -->
						<div class="d-sm-flex align-items-center justify-content-between mb-4">
							<h1 class="h3 mb-0 text-gray-800">Admin - Dashboard</h1>
							<a href="#" class="
                  d-none d-sm-inline-block
                  btn btn-sm btn-primary
                  shadow-sm
                "><i class="fas fa-download fa-sm text-white-50"></i> 下載報表</a>
						</div>

						<div>
							<!-- <div class="chartdiv">
                <canvas class="myChart" id="myChart"></canvas>
              </div> -->

							<div class="row">
								<!-- Content Column -->
								<div class="col-12">
									<!-- 活動報名人數 -->
									<!-- Bar Chart -->
									<div class="card shadow mb-4">
										<div class="card-header py-3">
											<h6 class="m-0 font-weight-bold text-primary">各活動報名人數統計</h6>
										</div>
										<div class="card w-75">
											<div class="card-body">
												<div class="chart-bar">
													<canvas class="mybarChart" id="myChart"></canvas>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div id="container">
								<!-- Content Row -->
								<div class="row" id="rowid">
									


							</div>


							<!-- /.container-fluid -->
						</div>
						<!-- End of Main Content -->

						<!-- Footer -->
						<footer class="sticky-footer bg-white">
							<div class="container my-auto">
								<div class="copyright text-center my-auto">
									<span>Copyright &copy; 資策會第五組專題報告 2021</span>
								</div>
							</div>
						</footer>
						<!-- End of Footer -->
					</div>
					<!-- End of Content Wrapper -->
				</div>
				<!-- End of Page Wrapper -->

				<!-- Scroll to Top Button-->
				<a class="scroll-to-top rounded" href="#page-top"> <i class="fas fa-angle-up"></i>
				</a>

				<!-- Logout Modal-->
				<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
								<button class="close" type="button" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
							</div>
							<div class="modal-body">Select "Logout" below if you are ready
								to end your current session.</div>
							<div class="modal-footer">
								<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
								<a class="btn btn-primary" href="../../logout">Logout</a>
							</div>
						</div>
					</div>
				</div>

				<!-- Bootstrap core JavaScript-->
				<script src="/FinalProject/vendor/jquery/jquery.min.js"></script>
				<script src="/FinalProject/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

				<!-- Core plugin JavaScript-->
				<script src="/FinalProject/vendor/jquery-easing/jquery.easing.min.js"></script>

				<!-- Custom scripts for all pages-->
				<script src="/FinalProject/js/sb-admin-2.js"></script>

				<!-- Page level custom scripts -->
				<!-- Page level plugins -->
				<script src="/FinalProject/vendor/chart.js/Chart.min.js"></script>


				<!-- Page level custom scripts -->
				<!-- <script src="./js/chart-area-demo.js"></script> -->

				<script src="/FinalProject/js/inner/chart-area-demo.js"></script>
				<script src="/FinalProject/js/inner/adminDashboard.js"></script>


	</body>
	<script>




		$(document)
			.ready(
				function () {

					var registeredNumber = [];
					var attendLimit = [];
					var event = []

					//取得各活動已報名人數
					$.ajax({
						url: "/FinalProject/findEventRegisteredNumber",
						method: "GET",
						async: false,
						success: function (response) {

							registeredNumber = response;

						},
						error: function (err) {
							alert(err);
						}
					});

					//取得各活動報名人數上限
					$.ajax({
						url: "/FinalProject/findEventRegisteredLimit",
						method: "GET",
						async: false,
						success: function (data) {
							attendLimit = data;
						},
						error: function (err) {
							alert(err);
						}
					});

					$.ajax({
						url: "/FinalProject/getAllEventsOrderById",
						method: "GET",
						async: false,
						success: function (res) {
							
							event = res;
						}

					})

					//活動報名限制＋已報名人數bar chart 

					var colorSet = [
						'rgba(255, 99, 132, 0.2)',
						'rgba(54, 162, 235, 0.2)',
						'rgba(255, 206, 86, 0.2)',
						'rgba(75, 192, 192, 0.2)',
						'rgba(153, 102, 255, 0.2)',
						'rgba(255, 159, 64, 0.2)'
					]
					var colorBorderSet = [
						'rgba(255, 99, 132, 1)',
						'rgba(54, 162, 235, 1)',
						'rgba(255, 206, 86, 1)',
						'rgba(75, 192, 192, 1)',
						'rgba(153, 102, 255, 1)',
						'rgba(255, 159, 64, 1)'
					]
					var chartlabels = [];
					var backgroundColor = [];
					var borderColor = [];

					var ctx = document.getElementById('myChart').getContext('2d');


					for (let i = 0, j = 0; i < event.length; i++, j++) {
						registeredNumber.push(event[i].reserved_people);
						attendLimit.push(event[i].attend_limit);

						chartlabels.push(event[i].event_title);
						backgroundColor.push(colorSet[j])
						borderColor.push(colorBorderSet[j])
						if (j == 5)
							j = 0;
					}

					if (myChart != undefined)
						myChart.destroy()

					var ctx = document.getElementById('myChart')
						.getContext('2d');

					var myChart = new Chart(

						ctx,
						{
							type: 'bar',
							data: {
								labels: chartlabels,
								datasets: [
									{
										label: '# 報名人數統計表',
										data: registeredNumber,

										backgroundColor: [
											'rgba(255, 99, 132, 1)',
											'rgba(54, 162, 235, 1)',
											'rgba(255, 206, 86, 1)',
											'rgba(75, 192, 192, 1)',
											'rgba(153, 102, 255, 1)',
											'rgba(153, 102, 255, 1)'

										],
										borderWidth: 1
									},
									{
										label: '# 報名人數上限',
										data: attendLimit,
										backgroundColor: [
											'rgba(255, 99, 132, 0.2)',
											'rgba(54, 162, 235, 0.2)',
											'rgba(255, 206, 86, 0.2)',
											'rgba(75, 192, 192, 0.2)',
											'rgba(153, 102, 255, 0.2)',
											'rgba(153, 102, 255, 0.2)'
										],
										borderWidth: 1

									}]
							},
							options: {
								indexAxis: 'y',
								scales: {
									y: {
										beginAtZero: true
									}
								},
								maintainAspectRatio: false
							}
						});

					//取得活動男女比例
					//取得各活動男性人數
					var manCount = []
					var womanCount = []
					$.ajax({
						url: "/FinalProject/findEachEventManCount",
						method: "GET",
						async: false,
						success: function (response) {

							manCount = response;
						},
						error: function (err) {
							alert(err);
						}
					});

					$.ajax({
						url: "/FinalProject/findEachEventWomanCount",
						method: "GET",
						async: false,
						success: function (response) {
							womanCount = response;

						},
						error: function (err) {
							alert(err);
						}
					});
					createChart(event)

					for (let i = 0; i < event.length; i++) {

						var genderRatioArray = new Array(womanCount[i],
						manCount[i]);
						
						tempId = 'pieChart' + event[i].event_id;
						var ctx = document.getElementById(tempId)
						.getContext('2d');

						var chart = new Chart(ctx, {
							type: 'pie',
						data: {
							labels: ['女', '男'],
							datasets: [{
								data: genderRatioArray,
								backgroundColor: ['rgb(255, 99, 132)',
									'rgb(54, 162, 235)',],
								hoverOffset: 4
							}]
						},
						options: {
							pieceLabel: {
								render: 'value' //show values
							},
							maintainAspectRatio: false
						}

						})
					}

				});

		function createChart(res) {
			var chart ="";


			for(var i = 0; i<res.length; i++){

				if(i<=2){
					chart += 
				   '<div class="col-xl-4 col-lg-5">' +
				   '<div class="card shadow mb-4"></div>' +
				   '<div class="card - header py - 3 d - flex flex - row align - items - center justify - content - between">'+
				   '<h6 class="m-0 font-weight-bold text-primary">'+res[i].event_title+' 性別比</h6>' +
				   '</div>' +
				   '<div class="card-body d-flex flex-column">'+
					   '<div class="chart-pie pt-4 pb-2">' +
						   '<canvas class="myChart" id="pieChart'+res[i].event_id+'"></canvas>'+
						   '</div>' +
						   '<div class="mt-4 text-center small"></div>' +
						   '</div>'+
						   '</div>'+
						   '</div>'

				}else{

					chart += 
					
				   '<div class="col-xl-4 col-lg-5">' +
				   '<div class="card shadow mb-4"></div>' +
				   '<div class="card - header py - 3 d - flex flex - row align - items - center justify - content - between">'+
				   '<h6 class="m-0 font-weight-bold text-primary">'+res[i].event_title+' 性別比</h6>' +
				   '</div>' +
				   '<div class="card-body d-flex flex-column">'+
					   '<div class="chart-pie pt-4 pb-2">' +
						   '<canvas class="myChart" id="pieChart'+res[i].event_id+'"></canvas>'+
						   '</div>' +
						   '<div class="mt-4 text-center small"></div>' +
						   '</div>'+
						   '</div>'
						   


				}

			}


		$("#rowid").html(chart);	
		
		}


	</script>

	</html>