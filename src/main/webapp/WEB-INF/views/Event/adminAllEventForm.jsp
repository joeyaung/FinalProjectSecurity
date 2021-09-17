<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html lang="zh-TW">

	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
		<meta name="description" content="" />
		<meta name="author" content="" />

		<title>活動報名列表</title>

		<!-- Bootstrap core JavaScript-->
		<script src="/FinalProject/vendor/jquery/jquery.min.js"></script>
		<script src="/FinalProject/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

		<!-- Core plugin JavaScript-->
		<script src="/FinalProject/vendor/jquery-easing/jquery.easing.min.js"></script>

		<!-- Custom scripts for all pages-->
		<script src="/FinalProject/js/sb-admin-2.js"></script>

		<!-- Page level plugins -->
		<script src="/FinalProject/vendor/chart.js/Chart.min.js"></script>

		<!-- Page level custom scripts -->
		<!-- <script src="/FinalProject/js/inner/chart-area-demo.js"></script>
        <script src="/FinalProject/js/inner/chart-pie-demo.js"></script>
        <script src="/FinalProject/js/inner/adminTemplate.js"></script> -->

		<!-- js for datatables-->
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<!-- js for modal-->

		<script src="https://code.jquery.com/jquery-1.12.3.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
		<script src="https://www.ksia.or.kr/plugin/DataTables-1.10.15/media/js/jquery.dataTables.js"></script>
		<script src="https://www.ksia.or.kr/plugin/DataTables-1.10.15/media/js/dataTables.bootstrap4.js"></script>
		<script
			src="https://www.ksia.or.kr/plugin/DataTables-1.10.15/extensions/Responsive/js/dataTables.responsive.js"></script>

		<script
			src="https://www.ksia.or.kr/plugin/DataTables-1.10.15/extensions/Responsive/js/dataTables.responsive.js"></script>
		<script
			src="https://www.ksia.or.kr/plugin/DataTables-1.10.15/extensions/Responsive/js/responsive.bootstrap4.js"></script>
		<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

		<!-- Custom fonts for this template-->
		<link href="/FinalProject/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css" />
		<link
			href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
			rel="stylesheet" />

		<!-- Custom styles for this template-->
		<link href="/FinalProject/css/sb-admin-2.min.css" rel="stylesheet" />

		<!-- css for modal-->

		<link rel="stylesheet"
			href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.5/css/bootstrap.css">
		<link rel="stylesheet"
			href="https://www.ksia.or.kr/plugin/DataTables-1.10.15/media/css/dataTables.bootstrap4.css">
		<link rel="stylesheet"
			href="https://www.ksia.or.kr/plugin/DataTables-1.10.15/extensions/Responsive/css/responsive.bootstrap4.css">

		<!--font awesome-->
		<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
			integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
			crossorigin="anonymous" />

		<!--buttons css-->
		<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.7.1/css/buttons.dataTables.min.css">

		<style>
			.error {
				outline: 1px solid red;
			}

			.switch {
				position: relative;
				display: inline-block;
				width: 60px;
				height: 34px;
			}

			.switch input {
				opacity: 0;
				width: 0;
				height: 0;
			}

			.slider {
				position: absolute;
				cursor: pointer;
				top: 0;
				left: 0;
				right: 0;
				bottom: 0;
				background-color: #ccc;
				-webkit-transition: .4s;
				transition: .4s;
			}

			.slider:before {
				position: absolute;
				content: "";
				height: 26px;
				width: 26px;
				left: 4px;
				bottom: 4px;
				background-color: white;
				-webkit-transition: .4s;
				transition: .4s;
			}

			input:checked+.slider {
				background-color: #2196F3;
			}

			input:focus+.slider {
				box-shadow: 0 0 1px #2196F3;
			}

			input:checked+.slider:before {
				-webkit-transform: translateX(26px);
				-ms-transform: translateX(26px);
				transform: translateX(26px);
			}

			/* Rounded sliders */
			.slider.round {
				border-radius: 34px;
			}

			.slider.round:before {
				border-radius: 50%;
			}

			.on {
				display: none;
			}

			.on,
			.off {
				color: white;
				position: absolute;
				transform: translate(-50%, -50%);
				top: 50%;
				left: 50%;
				font-size: 10px;
				font-family: Verdana, sans-serif;
			}

			input:checked+.slider .on {
				display: block;
			}

			input:checked+.slider .off {
				display: none;
			}
			
		.navbar-nav .nav-item + .nav-item {
margin-left: 0rem;
}
	
		</style>

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

				<!-- Heading -->
				<div class="sidebar-heading">FUNCTIONS</div>

				  <!-- Nav Item - 新增員工 -->
                <li class="nav-item"><a class="nav-link" href="/FinalProject/inner/admin/addEmployee"> <i class="fas fa-user-plus"></i> <span>新增員工</span></a></li>
                <!-- Nav Item - 試駕總覽 -->
                <li class="nav-item"><a class="nav-link" href="/FinalProject/inner/admin/edit/testdrive"> <i class="fas fa-car"></i> <span>試駕總覽</span></a></li>
                <!-- Nav Item - 車型總覽 -->
                <li class="nav-item"><a class="nav-link" href="/FinalProject/inner/admin/edit/model"> <i class="fas fa-car-side"></i> <span>車型總覽</span></a></li>
                <!-- Nav Item - 編輯消息 -->
                <li class="nav-item"><a class="nav-link" href="/FinalProject/inner/admin/AllNewsPage"> <i class="fas fa-rss-square"></i> <span>編輯消息</span></a></li>
                <!-- Nav Item - 編輯活動 -->
                <li class="nav-item"><a class="nav-link" href="/FinalProject/inner/admin/AllEventsPage"> <i class="fas fa-snowboarding"></i></i> <span>編輯活動</span></a></li>
                <!-- Nav Item - 活動報名表單 -->
                <li class="nav-item"><a class="nav-link" href="/FinalProject/inner/admin/AllEventForm"> <i class="fas fa-file-signature"></i> <span>活動報名表單</span></a></li>
                <!-- Nav Item - 活動報名統計 -->
                <li class="nav-item"><a class="nav-link" href="/FinalProject/inner/admin/EventDashboard"> <i class="fas fa-signal"></i> <span>活動報名統計</span></a></li>
                <!-- Nav Item - 商品管理 -->
                <li class="nav-item"><a class="nav-link" href="/FinalProject/inner/admin/products"> <i class="fas fa-store-alt"></i> <span>商品管理</span></a></li>
                <!-- Nav Item - 訂單管理 -->
                <li class="nav-item"><a class="nav-link" href="/FinalProject/inner/admin/orders"> <i class="fas fa-shopping-cart"></i> <span>訂單管理</span></a></li>
                <!-- Nav Item - 編輯展示中心 -->
                <li class="nav-item"><a class="nav-link" href="/FinalProject/inner/admin/edit/center"> <i class="fas fa-landmark"></i> <span>編輯展示中心</span></a></li>

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
									<a class="dropdown-item" href="/FinalProject/inner/profile/${empId}"> <i
											class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
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
					<div class="container-fluid">
						<!-- Page Heading -->
						<h1 class="h3 mb-2 text-gray-800">活動報名表單管理</h1>
						<p class="mb-4">活動表單編輯</p>

						<!-- Content Row -->
						<div class="row" id='rowdiv'>
							<!-- 以下開始替換成你們的內容
                        可放表格, 圖表, 要填的 form 之類的~ -->
							<select id="status">
								<option value="全部">全部</option>
								<option value="成功">成功</option>
								<option value="待審核">待審核</option>
								<option value="報名取消">報名取消</option>
							</select>
							<!-- this is datables -->
						
							<table id="eventFormList" class="table table-striped table-bordered nowrap"
								style="width: 100%">
								<thead>
									<tr>
										<th></th>
									</tr>

								</thead>
								<tbody>


								</tbody>
							</table>
						
						</div>


						<!-- /.container-fluid -->
						<!-- 結束內容 -->


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
						<div class="modal-body">
							Select "Logout" below if you are ready to end your current session.
						</div>
						<div class="modal-footer">
							<button class="btn btn-secondary" type="button" data-dismiss="modal">
								Cancel
							</button>
							<a class="btn btn-primary" href="../../logout">Logout</a>
						</div>
					</div>
				</div>
			</div>
	</body>
	<script>
		var table;
		var formData = new FormData();
		var switchStatus = false;
		var sortByStatusTable;
		$(document).ready(function () {
			createdatatable();
			$("#status").change(function () {
				var status = $(this).val();
				if(status=='全部'){
					createdatatable();
				}else{
					sortByStatus(status);
				}
			});

		})

		function approveFunction() {

			var checkBoxes = $("#approve_id");
			checkBoxes.prop("checked", !checkBoxes.prop("checked"));
			if (checkBoxes.is(':checked')) {
				console.log(!checkBoxes.is(':checked'))
				console.log("enter function");
				var object = {};
				formData.forEach(function (value, key) {
					object[key] = value;
				});

				var formId = object.form_id;
				var userId = object.user_id;
				var eventId = object.event_id;

				var idString = {
					"form_id": formId,
					"event_id": eventId,
					"user_id": userId
				};

				$.ajax({
					url: "/FinalProject/approveEventForm",
					method: "POST",
					data: {
						"jsonString": JSON.stringify(idString)
					},
					success: function (response) {
						alert('Email已成功寄出!');
						sortByStatusTable.ajax.reload();
						table.ajax.reload();
						// $("#approve_id").prop("checked", true);
					},
					error: function (err) {
						alert('failed!')
						alert(err);
					}
				});


			} else {
				console.log(!checkBoxes.is(':checked'))
				console.log("didn't enter function");
				alert('err!');
			}



		}

		function sortByStatus(status){
			$('#eventFormList').DataTable().destroy();
				mytable = null;
				$('#eventFormList').empty();
			console.log(status);
			sortByStatusTable = $("#eventFormList")
				.DataTable(
					{
						"ajax": {
							"dataSrc": "",
							"url": "/FinalProject/findByStatus",
							"method":"POST",
							"data":{
								"status": status
							},
						},
						"rowId": "form_id",
						"columns": [
							{
								data: "form_id",
								title: "表單編號"
							},
							{
								data: "event.event_id",
								title: "活動編號"

							},
							{
								data: "applicationUser.id",
								title: "會員ID"
							},
							{
								data: "creation_time",
								title: "表單建立時間"
							},
							{
								data: "applicationUser.fullName",
								title: "姓名"
							},
							{
								data: "gender",
								title: "性別"
							},
							{
								data: "id_number",
								title: "身分證字號"
							},
							{
								data: "applicationUser.phone",
								title: "聯絡電話"
							},
							{
								data: "applicationUser.username",
								title: "電子郵件"
							},
							{
								data: "applicationUser.fullAddress",
								title: "地址"
							},
							{
								data: "status",
								title: "狀態"
							},
							{
								data: "message",
								title: "備註"
							},
							{
								data: null,
								title: "審核",
								render: function (data, type, row) {
									if (row['status'] == "成功") {
										return "<label class='switch'><input id='approve_id' type='checkbox' onChange='approveFunction()' checked><span class='slider round'> <span class='on'>ON</span>"
											+ "<span class='off'>OFF</span</span></label>";
									} else
										return "<label class='switch'><input id='approve_id' type='checkbox' onChange='approveFunction()'><span class='slider round'> <span class='on'>ON</span>"
											+ "<span class='off'>OFF</span</span></label>";
								}
							}],

						"responsive": {
							"details": {
								"display": $.fn.dataTable.Responsive.display
									.modal({
										"header": function (row) {
											var data = row.data();
											formData.append("form_id",
												data.form_id);
											formData
												.append(
													"event_id",
													data.event.event_id);
											formData
												.append(
													"user_id",
													data.applicationUser.id);
											return '表單報名詳細資訊';
										}
									}),
								"renderer": $.fn.dataTable.Responsive.renderer
									.tableAll({
										tableClass: 'table'
									})

							}

						},
					});
	
		}
			
		
		
		//datatable 
		function createdatatable() {

			if (table !== null) {
				$('#eventFormList').DataTable().destroy();
				mytable = null;
				$('#eventFormList').empty();
			}

			table = $("#eventFormList")
				.DataTable(
					{
						"ajax": {
							"dataSrc": "",
							"url": "/FinalProject/getAllEventForm"
						},
						"rowId": "form_id",
						"columns": [
							{
								data: "form_id",
								title: "表單編號"
							},
							{
								data: "event.event_id",
								title: "活動編號"

							},
							{
								data: "applicationUser.id",
								title: "會員ID"
							},
							{
								data: "creation_time",
								title: "表單建立時間"
							},
							{
								data: "applicationUser.fullName",
								title: "姓名"
							},
							{
								data: "gender",
								title: "性別"
							},
							{
								data: "id_number",
								title: "身分證字號"
							},
							{
								data: "applicationUser.phone",
								title: "聯絡電話"
							},
							{
								data: "applicationUser.username",
								title: "電子郵件"
							},
							{
								data: "applicationUser.fullAddress",
								title: "地址"
							},
							{
								data: "status",
								title: "狀態"
							},
							{
								data: "message",
								title: "備註"
							},
							{
								data: null,
								title: "審核",
								render: function (data, type, row) {
									if (row['status'] == "成功") {
										return "<label class='switch'><input id='approve_id' type='checkbox' onChange='approveFunction()' checked><span class='slider round'> <span class='on'>ON</span>"
											+ "<span class='off'>OFF</span</span></label>";
									} else
										return "<label class='switch'><input id='approve_id' type='checkbox' onChange='approveFunction()'><span class='slider round'> <span class='on'>ON</span>"
											+ "<span class='off'>OFF</span</span></label>";
								}
							}],

						"responsive": {
							"details": {
								"display": $.fn.dataTable.Responsive.display
									.modal({
										"header": function (row) {
											var data = row.data();
											formData.append("form_id",
												data.form_id);
											formData
												.append(
													"event_id",
													data.event.event_id);
											formData
												.append(
													"user_id",
													data.applicationUser.id);
											return '表單報名詳細資訊';
										}
									}),
								"renderer": $.fn.dataTable.Responsive.renderer
									.tableAll({
										tableClass: 'table'
									})

							}

						},
					});

		}
	</script>


	</html>