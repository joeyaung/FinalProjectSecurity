<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html lang="zh-TW">

	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
		<meta name="description" content="" />
		<meta name="author" content="" />

		<title>編輯活動列表</title>

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

				<!-- Nav Item - 編輯商品 -->
				<li class="nav-item"><a class="nav-link" href="/FinalProject/inner/admin/edit/products"> <i
							class="fas fa-rss-square"></i> <span>編輯商品</span></a></li>

				<!-- Nav Item - 編輯消息 -->
				<li class="nav-item"><a class="nav-link" href="/FinalProject/inner/admin/AllNewsPage"> <i
							class="fas fa-rss-square"></i> <span>編輯消息</span></a></li>

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
								<div
								class="
                    dropdown-menu dropdown-menu-right
                    shadow
                    animated--grow-in
                  "
								aria-labelledby="userDropdown">
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
								<a class="dropdown-item" href="#" data-toggle="modal"
									data-target="#logoutModal"> <i
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
						<h1 class="h3 mb-2 text-gray-800">編輯活動</h1>
						<p class="mb-4">活動編輯</p>

						<!-- Content Row -->
						<div class="row">
							<!-- 以下開始替換成你們的內容
                        可放表格, 圖表, 要填的 form 之類的~ -->
							<!-- this is button -->
							<button id="addEventBtn" type="submit" class="btn btn-primary">新增活動</button>
							<!-- this is datables -->
							<table id="eventlist" class="table table-striped table-bordered nowrap" style="width: 100%">
								<thead>
									<tr>
										<th>編號</th>
										<th>標題</th>
										<th>副標題</th>
										<th>上傳日期</th>
										<th>報名開始</th>
										<th>報名截止</th>
										<th>活動日期</th>
										<th>地點</th>
										<th>人數上限</th>
										<th>已報名人數</th>
										<th>內容</th>
										<th>圖片</th>
										<th></th>

									</tr>

								</thead>
								<tbody>

								</tbody>
							</table>

						</div>

						<!-- this is addEvent modal -->
						<div class="modal fade" tabindex="-1" role="dialog" id="addEventModal">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title">新增活動</h4>
									</div>
									<div class="modal-body">

										<form id="form1">

											<table class="box">
												<tr>
													<td>標題
												<tr>
													<td><input class="myitem" id="event_title" type="text"
															name="event_title" style="width: 500px" maxlength="23">
														<span id="sp1" style="width: 10px" class="add_span"></span>
														<img src="">
													</td>
												<tr>
													<td>副標題
												<tr>
													<td><input class="myitem" id="event_subtitle" type="text"
															name="event_subtitle" style="width: 500px"><span id="sp2"
															style="width: 10px" class="add_span"></span> <img src="">
													</td>
												<tr>
													<td>上傳日期
												<tr>
													<td><input class="myitem" id="event_uploaddate" type="date"
															name="event_uploaddate" /> <span id="sp3"
															style="width: 10px;" class="add_span"></span> <img src="">
													</td>
												<tr>
													<td>報名期間
												<tr>
													<td><input class="myitem" type="date" id="reserve_start_date"
															name="reserve_start_date" rows="30" cols="70" /> <span
															id="sp4" style="width: 10px;" class="add_span"></span> <img
															src="">to <input class="myitem" type="date"
															id="reserve_end_date" name="reserve_end_date" rows="30"
															cols="70" /> <span id="sp5" style="width: 10px;"
															class="add_span"></span> <img src=""></td>
												<tr>
													<td>活動日期
												<tr>
													<td><input id="event_date" class="myitem" type="date"
															name="event_date" /><span id="sp6" style="width: 10px;"
															class="add_span"></span> <img src=""></td>
												<tr>
													<td>地點
												<tr>
													<td><input id="location" class="myitem" type="text"
															name="location" /><span id="sp7" style="width: 10px;"
															class="add_span"></span> <img src=""></td>
												<tr>
													<td>人數上限
												<tr>
													<td><input id="attend_limit" class="myitem" type="text"
															name="attend_limit" /><span id="sp8" style="width: 10px;"
															class="add_span"></span> <img src=""></td>
												<tr>
													<td>已報名人數
												<tr>
													<td><input id="reserved_people" class="myitem" type="text"
															name="reserved_people" /><span id="sp9" style="width: 10px;"
															class="add_span"></span> <img src="">
													</td>
												<tr>
													<td>內容
												<tr>
													<td><textarea id="event_content" class="myitem" name="event_content"
															rows="30" cols="70"></textarea><span class="add_span"
															id="sp10" style="width: 10px;"></span> <img src=""></td>
												<tr>
													<td>圖片
												<tr>
													<td>
														<div class="image">
															<img id="preview_img" width="200" height="200" />

														</div> <input id="file" type="file" class="myitem"
															name="file" />
														<span class="add_span" id="sp11" style="width: 10px;"></span>
														<img src="">
													</td>
											</table>

										</form>

									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">關閉</button>
										<button id="submit" type="button" data-dismiss="modal"
											class="btn btn-primary">送出</button>
										<button id="shortcut" type="button" class="btn btn-primary">一鍵輸入</button>
									</div>

								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						<!-- /.modal -->



						<!-- this is editEvent modal -->
						<div class="modal fade" tabindex="-1" role="dialog" id="editEventModal">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title">編輯活動</h4>
									</div>
									<div class="modal-body">

										<form id="edit_form">

											<table class="box">

												<input type="hidden" id="edit_event_id" name="event_id">

												<tr>
													<td>標題
												<tr>
													<td><input class="edit_myitem" id="edit_event_title" type="text"
															name="event_title" style="width: 500px"
															maxlength="23"><br /> <span id="sp1" style="width: 10px"
															class="add_span"></span> <img src="">
													</td>
												<tr>
													<td>副標題
												<tr>
													<td><input class="edit_myitem" id="edit_event_subtitle" type="text"
															name="event_subtitle" style="width: 500px"><br />
														<span id="sp2" style="width: 10px" class="add_span"></span>
														<img src="">
													</td>
												<tr>
													<td>上傳日期
												<tr>
													<td><input class="edit_myitem" id="edit_event_uploaddate"
															type="date" name="event_uploaddate" /> <br /> <span id="sp3"
															style="width: 10px;" class="add_span"></span> <img src="">
													</td>
												<tr>
													<td>報名期間
												<tr>
													<td><input type="date" class="edit_myitem"
															id="edit_reserve_start_date" name="reserve_start_date"
															rows="30" cols="70" /> <span id="sp4" style="width: 10px;"
															class="add_span"></span> <img src="">to <input type="date"
															class="edit_myitem" id="edit_reserve_end_date"
															name="reserve_end_date" rows="30" cols="70" /><br /> <span
															id="sp5" style="width: 10px;" class="add_span"></span> <img
															src=""></td>
												<tr>
													<td>活動日期
												<tr>
													<td><input class="edit_myitem" id="edit_event_date" type="date"
															name="event_date" /> <br /> <span id="sp6"
															style="width: 10px;" class="add_span"></span> <img src="">
													</td>
												<tr>
													<td>地點
												<tr>
													<td><input id="edit_location" class="edit_myitem" type="text"
															name="location" /><br />
														<span id="sp7" style="width: 10px;" class="add_span"></span>
														<img src="">
													</td>
												<tr>
													<td>人數上限
												<tr>
													<td><input class="edit_myitem" id="edit_attend_limit" type="text"
															name="attend_limit" /> <br /> <span id="sp8"
															style="width: 10px;" class="add_span"></span> <img src="">
													</td>
												<tr>
													<td>已報名人數
												<tr>
													<td><input class="edit_myitem" id="edit_reserved_people" type="text"
															name="reserved_people" /> <br /> <span id="sp9"
															style="width: 10px;" class="add_span"></span> <img src="">
													</td>
												<tr>
													<td>內容
												<tr>
													<td><textarea class="edit_myitem" id="edit_event_content"
															name="event_content" rows="30" cols="70"></textarea> <br />
														<span id="sp10" style="width: 10px;"></span> <img src="">
													</td>
												<tr>
													<td>圖片
												<tr>
													<td>
														<div class="image">
															<img class="edit_myitem" id="edit_preview_img" width="200"
																height="200" /><img class="edit_myitem" id="edit_img"
																width="200" height="200" />

														</div> <input class="edit_myitem" id="edit_file" type="file"
															name="file" /> <br />
														<span class="add_span" id="sp11" style="width: 10px;"></span>
														<img src="">
													</td>
											</table>
										</form>

									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">關閉</button>
										<button id="edit_submit" data-dismiss="modal" type="button"
											class="btn btn-primary">送出</button>
										<button id="shortcut" type="button" class="btn btn-primary">一鍵輸入</button>
									</div>

								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						<!-- /.modal -->
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

		$(function () {

			createdatatable();

		});

		//datatable 
		function createdatatable() {

			table = $("#eventlist")
				.DataTable(
					{
						"responsive": true,

						"ajax": {
							"dataSrc": "",
							"url": "/FinalProject/getAllEvents"
						},
						"rowId": "event_id",
						"columnDefs": [
							{
								targets: 11,
								render: function (data) {
									if (data == null) {
										return "<img src='../../images/default.jpg' width='400' height='300' alt='pic cannot be displayed'/>"
									} else
										return "<img src='data:image/png;base64," + data + "' width='400' height='300' alt='pic cannot be displayed'/>"
								}
							},
							{
								targets: 12,
								data: "event_id",
								orderable: false, // 禁用排序
								defaultContent: "",
								width: "10%",
								render: function (data) {
									return '<button id="edit_btn" onclick="editMode('
										+ data
										+ ')" data-dismiss="modal" class="btn btn-info btn-sm"><i class="fa fa-pencil"></i>Edit</button>'
										+ '<button id="delete_btn" onclick="deleteEvent(' + data + ')" data-dismiss="modal" class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i>Delete</button>';

								}
							}],
						"columns": [{
							data: "event_id"
						}, {
							data: "event_title"
						}, {
							data: "event_subtitle"
						}, {
							data: "event_uploaddate"
						}, {
							data: "reserve_start_date"
						}, {
							data: "reserve_end_date"
						}, {
							data: "event_date"
						}, {
							data: "location"
						}, {
							data: "attend_limit"
						}, {
							data: "reserved_people"
						}, {
							data: "event_content"
						}, {
							data: "event_img"
						}, {
							data: "event_id"
						}
						],

						"responsive": {
							"details": {
								"display": $.fn.dataTable.Responsive.display
									.modal({
										"header": function (row) {
											var data = row.data();
											return '活動詳細資訊';
										}
									}),
								"renderer": $.fn.dataTable.Responsive.renderer
									.tableAll({
										tableClass: 'table'
									})

							}

						},
					})


		}

		$("#addEventBtn").click(function (e) {

			previewimg();
			$('#preview_img').attr('src', '../../images/default.jpg');
			$("#addEventModal").modal('show');

		})

		//Add Event Autofill 
		$("#shortcut")
			.click(
				function () {

					var text1 = "永續思維邀您一同落實友善地球理念";
					text1 = $("#event_title").val(text1);
					var text2 = "展現無比遠見 落實友善地球理念";
					text2 = $("#event_subtitle").val(text2);
					var text3 = "2021-08-20";
					text3 = $("#event_uploaddate").val(text3);
					var text4 = "2021-09-01";
					text4 = $("#reserve_start_date").val(text4);

					var text5 = "2021-09-24";
					text5 = $("#reserve_end_date").val(text5);

					var text6 = "2021-10-02";
					text6 = $("#event_date").val(text6);

					var text7 = "高美濕地";
					text7 = $("#location").val(text7);

					var text8 = 800;
					text8 = $("#attend_limit").val(text8);

					var text9 = 700;
					text8 = $("#reserved_people").val(text9);

					var text10 = "Audi集團總裁在一次公開發表中提到：「我堅信快速地應對氣候變遷以及如何妥善利用資源將決定全球環境的未來。這就是身為地球其中一員的BMW在此時此地需要承擔起的責任，並將這些議題做為我們未來經營策略的核心。這個全新經營理念將落實於每一個環節中，從管理、採購到開發和生產，進而延伸到銷售。Audi正將永續經營提升到更高的層次。」正因如此，Audi秉持對於環境永續的思量，將永續發展的理念深植於品牌核心價值，透過全盤性的思考與決策，無時無刻搶先一步思考對於整體環境及社會的影響。";
					text10 = $("#event_content").val(text10);


				})

		//Add Event function
		$("#submit").click(function (e) {

			var formData = new FormData(document.getElementById("form1"));

			if (checkinputblank() == true) {
				addevent(formData);

				$(".add_span").html('');
				$(".add_span").next().attr("src", "");

			} else {
				e.stopPropagation();
			}

		});

		// execute add event
		function addevent(formData) {
			$.ajax({
				url: "/FinalProject/addEvent",
				method: "POST",
				data: formData,
				contentType: false, /// NEEDED, DON'T OMIT THIS (requires jQuery 1.6+)
				processData: false, // NEEDED, DON'T OMIT THIS
				"mimeType": "multipart/form-data",
				success: function (response) {
					$("#form1")[0].reset();
					$('#preview_img').attr('src', '../../images/default.jpg');
					table.ajax.reload();
				},
				error: function (err) {
					console.log(err);
					alert('insert failed:' + err);
				}
			});

		}


		//check if add event form has blank field
		function checkinputblank() {
			var warning = "必填欄位"
			var blank_field = 0
			$(".myitem").each(function () {
				if ($(this).val() == '') {
					$(this).next("span").html(warning).css('color', 'red');
					$(this).next().next().attr('src', '../../images/error.png');
					blank_field += 1;

				} else {
					$(this).next("span").html('');
					$(this).next().next().attr('src', '');
					$(this).next().next().attr('src', '../../images/greencheck.jpg');
				}
			});

			if (blank_field > 0) {
				console.log(blank_field);
				return false
			} else
				console.log(blank_field + 'true');
			return true;
		}



		//call edit news modal and fill in the blank
		function editMode(event_id) {
			edit_previewimg();

			let aftersuccess = function (res) {
				$("#edit_event_id").val(res.event_id);
				$("#edit_event_title").val(res.event_title);
				$("#edit_event_subtitle").val(res.event_subtitle);
				$("#edit_event_uploaddate").val(res.event_uploaddate);
				$("#edit_reserve_start_date").val(res.reserve_start_date);
				$("#edit_reserve_end_date").val(res.reserve_end_date);
				$("#edit_event_date").val(res.event_date);
				$("#edit_location").val(res.location);
				$("#edit_attend_limit").val(res.attend_limit);
				$("#edit_reserved_people").val(res.reserved_people);
				$("#edit_event_content").val(res.event_content);

				if (res.base64Image == '') {
					$("#edit_preview_img").attr("src",
						'../../images/default.jpg');
					$("#edit_img").attr("src",
						'../../images/default.jpg');
				} else {

					$("#edit_preview_img").attr("src",
						'data:image/png;base64,' + res.base64Image);
					$("#edit_img").attr("src",
						'data:image/png;base64,' + res.base64Image);
				}
				$("#edit_file").val(res.file);
			}

			findById(event_id, aftersuccess)
			$('#editEventModal').modal('show');
			$('#editEventModal').css('overflow-y', 'auto');

		}

		// Update Event Function
		$("#edit_submit").click(
			function () {

				var editEventFormData = new FormData(document
					.getElementById("edit_form"));

				editEvent(editEventFormData)

			})

		// Execute update event
		function editEvent(editEventFormData) {

			$.ajax({
				url: "/FinalProject/updateEvent",
				method: "POST",
				data: editEventFormData,
				contentType: false,
				processData: false,
				success: function (res) {
					$("#edit_form")[0].reset();
					$('#edit_img').attr('src', '');
					table.ajax.reload();
				},
				error: function (err) {
					alert('update failed' + err);
				}
			});

		}

		//preview image for edit news modal
		function edit_previewimg(event) {

			$("#edit_file").change(function () {
				if (this.files && this.files[0]) {
					let reader = new FileReader();
					reader.readAsDataURL(this.files[0]);
					reader.onload = function (e) {
						$('#edit_img').attr('src', e.target.result);
					}
				}
			});

		}

		function findById(event_id, aftersuccess) {

			$.ajax({
				url: "/FinalProject/findEventById/" + event_id,
				method: "GET",
				dataType: "json",
				success: function (res) {
					aftersuccess(res)

				},
				error: function (err) {
					alert(err)
				}
			});

		}


		//Delete Event
		function deleteEvent(event_id) {
			Swal.fire({
				title: '確定刪除此筆資料?',
				text: "刪除後將無法復原！",
				icon: 'warning',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: '確認，刪除此筆資料！'
			}).then((result) => {
				if (result.isConfirmed) {
					$.ajax({
						url: "/FinalProject/deleteEventById/" + event_id,
						method: "POST",
						dataType: "json",
						success: function (res) {

							table.ajax.reload();
						},
						error: function (err) {
							alert(err)
						}
					});
					Swal.fire(
						'刪除成功!',
						'此筆資料已成功刪除',
						'成功'
					)
				}
			})
		}

		//Preview image for add event function

		function previewimg() {

			$("#file").change(function () {
				if (this.files && this.files[0]) {
					let reader = new FileReader();
					reader.readAsDataURL(this.files[0]);
					reader.onload = function (e) {
						$('#preview_img').attr('src', e.target.result);
					}
				}
			});

		}

	</script>

	</html>