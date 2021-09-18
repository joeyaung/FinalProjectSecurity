<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html lang="zh-TW">

	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
		<meta name="description" content="" />
		<meta name="author" content="" />

		<title>編輯展示中心資訊</title>

		<link rel="icon" type="image/x-icon" href="/FinalProject/images/favicon.png?v=2" />
		

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
		<!-- 刪掉這兩個就不會跳錯了-->
		<script src="/FinalProject/js/inner/chart-area-demo.js"></script>
		<script src="/FinalProject/js/inner/chart-pie-demo.js"></script>
		<script src="/FinalProject/js/inner/adminTemplate.js"></script>



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
			#map {
				width: 500px;
				height: 500px;
			}

			#edit_map {
				width: 500px;
				height: 500px;
			}

			.modal {
				overflow-y: auto;
			}

			.navbar-nav .nav-item+.nav-item {
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

				<!-- Divider -->
				<hr class="sidebar-divider my-0" />



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
                <li class="nav-item active"><a class="nav-link" href="/FinalProject/inner/admin/edit/center"> <i class="fas fa-landmark"></i> <span>編輯展示中心</span></a></li>

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
          <nav
            class="
              navbar navbar-expand navbar-light
              bg-white
              topbar
              mb-4
              static-top
              shadow
            "
          >
            <!-- Sidebar Toggle (Topbar) -->
            <button
              id="sidebarToggleTop"
              class="btn btn-link d-md-none rounded-circle mr-3"
            >
              <i class="fa fa-bars"></i>
            </button>

            <!-- Topbar Navbar -->
            <ul class="navbar-nav ml-auto">
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
								<a class="dropdown-item" href="/FinalProject/inner/profile/${empId}"> <i
									class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Profile
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
						<h1 class="h3 mb-2 text-gray-800">編輯展示中心資訊</h1>
						<p class="mb-4">編輯展示中心資訊</p>

						<!-- Content Row -->
						<div class="row">


							<!-- 以下開始替換成你們的內容可放表格, 圖表, 要填的 form 之類的~ -->


							<!-- this is button -->
							<button id="addCenterButton" type="submit" class="btn btn-primary" style="margin-left: 15px;">增加展示中心</button>


							<!-- this is datables -->
							<table id="centerList" class="table table-striped table-bordered nowrap"
								style="width: 100%">
								<thead>
									<tr>
										<th>ID</th>
										<th>展示中心名稱</th>
										<th>聯絡電話</th>
										<th>E-Mail</th>
										<th>縣市</th>
										<th>地區</th>
										<th>地址</th>
										<th>緯度</th>
										<th>經度</th>
										<th>營業時間</th>
										<th>圖片</th>
										<th>操作</th>

									</tr>
								</thead>
								<tbody>
								</tbody>
							</table>
						</div>


						<!-- 增加展示中心model -->
						<div class="modal fade" tabindex="-1" role="dialog" id="addCenterModel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title">新增展示中心</h4>
									</div>
									<div class="modal-body">

										<form id="form1">

											<table class="box">
												<!-- <tr>
													<td>ID:</td>
												</tr>
												<tr>
													<td>
														<input class="myitem" id="centerId" type="text" name="centerId" value="" style="width: 500px"><br />
														<span id="sp1" style="width: 10px" class="add_span"></span> <img src="">
													</td>
												</tr> -->
												<tr>
													<td>展示中心名稱:</td>
												</tr>
												<tr>
													<td>
														<input class="myitem" id="centerName" type="text"
															name="centerName" value="" style="width: 400px"><br />
														<span id="sp1" style="width: 10px" class="add_span"></span> <img
															src="">
													</td>
												</tr>
												<tr>
													<td>連絡電話：</td>
												</tr>
												<tr>
													<td><input class="myitem" id="centerPhone" type="text"
															name="centerPhone" value="" style="width: 400px"><br />
														<span id="sp2" style="width: 10px" class="add_span"></span> <img
															src="">
													</td>
												</tr>
												<tr>
													<td>E-Mail:</td>
												</tr>
												<tr>
													<td><input class="myitem" id="centerEmail" type="text"
															name="centerEmail" value="" style="width: 400px" /> <br />
														<span id="sp3" style="width: 300px;" class="add_span"></span>
														<img src="">
													</td>
												</tr>
												<tr>
													<td>縣市:</td>
												</tr>
												<tr>
													<td><input class="myitem" id="centerLoc" type="text"
															name="centerLoc" value="" style="width: 400px" /> <br />
														<span id="sp4" style="width: 300px;" class="add_span"></span>
														<img src="">
													</td>
												</tr>
												<tr>
													<td>地區:</td>
												</tr>
												<tr>
													<td><input class="myitem" id="centerLocSit" type="text"
															name="centerLocSit" value="" style="width: 400px" /> <br />
														<span id="sp5" style="width: 10px;" class="add_span"></span>
														<img src="">
													</td>
												</tr>
												<tr>
													<td>地址:</td>
												</tr>
												<tr>
													<td>
														<input class="myitem" id="centerAddress" type="text"
															name="centerAddress" value="" style="width: 400px" /> <br />
														<button id="queryaddr"
															class="btn btn-secondary btn-sm">座標查詢</button>
														<span id="sp6" style="width: 10px;" class="add_span"></span>
														<img src="">
													</td>
												</tr>
												<tr>
													<td>緯度:</td>
												</tr>
												<tr>
													<td><input class="myitem" id="centerLatitude" type="text"
															name="centerLatitude" value="" style="width: 400px" />
														<br />
														<span id="sp7" style="width: 10px;" class="add_span"></span>
														<img src="">
													</td>
												</tr>
												<tr>
													<td>經度:</td>
												</tr>
												<tr>
													<td><input class="myitem" id="centerLongitude" type="text"
															name="centerLongitude" value="" style="width: 400px" />
														<br />
														<span id="sp8" style="width: 10px;" class="add_span"></span>
														<img src="">
													</td>
												</tr>
												<tr>
													<td>營業時間:</td>
												</tr>
												<tr>
													<td><input class="myitem" id="centerOpentime" type="text"
															name="centerOpentime" value="" style="width: 400px" />
														<br />
														<span id="sp9" style="width: 10px;" class="add_span"></span>
														<img src="">
													</td>
												</tr>
												<tr>
													<td>
														<div class="image">
															<img class="myitem" src="/FinalProject/images/default.jpg"
																id="preview_img" width="400" height="300" />
														</div>
														<input id="centerFile" type="file" name="centerFile" />
														<span class="add_span" id="sp10" style="width: 10px;"></span>
														<img src="">
													</td>
												</tr>
											</table>
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">關閉</button>
										<button id="submitadd" type="button" data-dismiss="modal"
											class="btn btn-primary">送出</button>
										<button id="onekey" type="button" class="btn btn-primary">一鍵輸入</button>
									</div>

								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						<!-- /.modal -->

						<!-- 更改商品model -->
						<div class="modal fade" tabindex="-1" role="dialog" id="editCenterModal">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title">編輯展示中心</h4>
									</div>
									<div class="modal-body">

										<form id="edit_form">

											<table class="box">

												<!-- <tr>
													<td>ID:</td>
												</tr>
												<tr>
													<td><input class="myitem" id="edit_centerId" type="text" name="centerId" style="width: 500px"><br />
														<span id="sp1" style="width: 10px"></span> <img src="">
													</td>
												</tr> -->

												<input type="hidden" id="edit_centerId" name="centerId">
												<!--hidden-->

												<tr>
													<td>展示中心名稱:</td>
												</tr>
												<tr>
													<td><input class="myitem" id="edit_centerName" type="text"
															name="centerName" style="width: 400px"><br />
														<span id="editsp1" style="width: 10px" class="add_span"></span>
														<img src="">
													</td>
												</tr>
												<tr>
													<td>連絡電話：</td>
												</tr>
												<tr>
													<td><input class="myitem" id="edit_centerPhone" type="text"
															name="centerPhone" style="width: 400px" /> <br />
														<span id="editsp2" style="width: 10px;" class="add_span"></span>
														<img src="">
													</td>
												</tr>
												<tr>
													<td>E-Mail:</td>
												</tr>
												<tr>
													<td><input class="myitem" id="edit_centerEmail" type="text"
															name="centerEmail" style="width: 400px"><br />
														<span id="editsp3" style="width: 10px" class="add_span"></span>
														<img src="">
													</td>
												</tr>
												<tr>
													<td>縣市:</td>
												</tr>
												<tr>
													<td><input class="myitem" id="edit_centerLoc" type="text"
															name="centerLoc" style="width: 400px"><br />
														<span id="editsp4" style="width: 10px" class="add_span"></span>
														<img src="">
													</td>
												</tr>
												<tr>
													<td>地區:</td>
												</tr>
												<tr>
													<td><input class="myitem" id="edit_centerLocSit" type="text"
															name="centerLocSit" style="width: 400px"><br />
														<span id="editsp5" style="width: 10px" class="add_span"></span>
														<img src="">
													</td>
												</tr>
												<tr>
													<td>地址:</td>
												</tr>

												<tr>
													<td>
														<input class="myitem" id="edit_centerAddress" type="text"
															name="centerAddress" style="width: 400px"><br />
														<button id="edit_queryaddr"
															class="btn btn-secondary btn-sm">座標查詢</button>
														<span id="editsp6" style="width: 10px" class="add_span"></span>
														<img src="">
													</td>
												</tr>
												<tr>
													<td>緯度:</td>
												</tr>
												<tr>
													<td><input class="myitem" id="edit_centerLatitude" type="text"
															name="centerLatitude" style="width: 400px"><br />
														<span id="editsp7" style="width: 10px" class="add_span"></span>
														<img src="">
													</td>
												</tr>
												<tr>
													<td>經度:</td>
												</tr>
												<tr>
													<td><input class="myitem" id="edit_centerLongitude" type="text"
															name="centerLongitude" style="width: 400px"><br />
														<span id="editsp8" style="width: 10px" class="add_span"></span>
														<img src="">
													</td>
												</tr>
												<tr>
													<td>營業時間:</td>
												</tr>
												<tr>
													<td><input class="myitem" id="edit_centerOpentime" type="text"
															name="centerOpentime" style="width: 400px"><br />
														<span id="editsp9" style="width: 10px" class="add_span"></span>
														<img src="">
													</td>
												</tr>

												<tr>
													<td>中心圖片：</td>
												</tr>
												<tr>
													<td>
														<div class="image">
															<img class="myitem" src="/FinalProject/images/default.jpg"
																id="edit_img" width="400" height="300" />
														</div>
														<input id="edit_centerFile" type="file" name="centerFile" />
														<span id="editsp10" style="width: 10px;"
															class="add_span"></span> <img src="">
													</td>
												</tr>
											</table>
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">關閉</button>
										<button id="edit_submit" data-dismiss="modal" type="button"
											class="btn btn-primary">送出</button>
										<button id="edit_onekey" type="button" class="btn btn-primary">一鍵輸入</button>
									</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						<!-- /.modal -->





						<!-- 查詢座標的model (增加) -->
						<div class="modal fade" tabindex="-1" role="dialog" id="queryaddrModel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title">座標</h4>
									</div>
									<div class="modal-body">

										<div>
											<input type="text" id="address" placeholder="請輸入地點">
											<button id="query">查詢</button>
											<!-- <input type="button" value="定位"> -->
										</div>

										<div id="lat"></div>
										<div id="lng"></div>

										<!--The div element for the map -->
										<div id="map"></div>


									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">關閉</button>
										<button id="submitquery" type="button" data-dismiss="modal"
											class="btn btn-primary">送出</button>
										<!-- <button id="onekey" type="button" class="btn btn-primary">一鍵輸入</button> -->
									</div>

								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						<!-- /.modal -->


						<!-- 查詢座標的model (修改) -->
						<div class="modal fade" tabindex="-1" role="dialog" id="edit_queryaddrModel">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title">座標</h4>
									</div>
									<div class="modal-body">

										<div>
											<input type="text" id="edit_address" placeholder="請輸入地點">
											<button id="edit_query">查詢</button>
											<!-- <input type="button" value="定位"> -->
										</div>

										<div id="edit_lat"></div>
										<div id="edit_lng"></div>

										<!--The div element for the map -->
										<div id="edit_map"></div>


									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">關閉</button>
										<button id="edit_submitquery" type="button" data-dismiss="modal"
											class="btn btn-primary">送出</button>
										<!-- <button id="onekey" type="button" class="btn btn-primary">一鍵輸入</button> -->
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
							<h5 class="modal-title" id="exampleModalLabel">Ready to
								Leave?</h5>
							<button class="close" type="button" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">Select "Logout" below if you are
							ready to end your current session.
						</div>
						<div class="modal-footer">
							<button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
							<a class="btn btn-primary" href="login.html">Logout</a>
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
			table = $('#centerList').DataTable({
				"responsive": true,
				"ajax": {
					"url": "/FinalProject/getAllCneter",
					"dataSrc": "",
					// "type": "POST",
					// "dataType": 'json',

				},

				"rowId": "centerId",

				"columns": [
					{ "data": "centerId", responsivePriority: 1 },
					{ "data": "centerName", responsivePriority: 1 },
					{ "data": "centerPhone", responsivePriority: 1 },
					{ "data": "centerEmail" },
					{ "data": "centerLoc" },
					{ "data": "centerLocSit" },
					{ "data": "centerAddress" },
					{ "data": "centerLatitude" },
					{ "data": "centerLongitude" },
					{ "data": "centerOpentime", responsivePriority: 1 },
					{ "data": "centerBase64Image" },
					{ "data": "centerId", responsivePriority: 1 },

				],

				"columnDefs": [
					{
						targets: 10,
						render: function (data) {
							return "<img src='data:image/png;base64," + data + "' width='100' height='100' alt='pic cannot be displayed'/>"
						}
					},

					{
						targets: 11,
						data: "centerId",
						orderable: false,
						defaultContent: "",
						width: "10%",
						render: function (data) {
							return '<button id="edit_btn" onclick="editMode(' + data + ')" data-dismiss="modal" class="btn btn-info btn-sm"><i class="fa fa-pencil"></i>修改</button>'
								+ '<button id="delete_btn" onclick="deleteCenter(' + data + ')" data-dismiss="modal" class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i>刪除</button>';

						}
					}
				],

				"responsive": {
					"details": {
						"display": $.fn.dataTable.Responsive.display.modal({
							"header": function (row) {
								var data = row.data();
								return '展示中心';
							}
						}),
						"renderer": $.fn.dataTable.Responsive.renderer.tableAll({
							tableClass: 'table'
						})

					}
				},
			});
		}

		//binding增加商品按鈕 V
		$('#addCenterButton').click(function (e) {
			previewimg();
			$('#addCenterModel').modal('show');  //顯示增加展示中心的model
			validateData();
			e.preventDefault();
		})

		//增加中心的function  V
		$("#submitadd").click(function (e) {

			var formData = new FormData(document.getElementById("form1"));

			if (checkinputblank() == true) {
				addCenter(formData);
				$(".add_span").html('');
				$(".add_span").next().attr("src", "");
			} else
				e.stopPropagation();
		});


		//增加中心的 預覽圖 function V
		function previewimg() {

			$("#centerFile").change(function () {
				if (this.files && this.files[0]) {
					let reader = new FileReader();
					reader.readAsDataURL(this.files[0]);  //readAsDataURL(blob) —— 读取二进制数据，并将其编码为 base64 的 data url。
					reader.onload = function (e) {
						$('#preview_img').attr('src', e.target.result);
					}

				}
			});

		}

		// add center To資料庫 V
		function addCenter(formData) {
			$.ajax({
				url: "/FinalProject/addCenter",
				method: "POST",
				data: formData,
				contentType: false, /// NEEDED, DON'T OMIT THIS (requires jQuery 1.6+)
				processData: false, // NEEDED, DON'T OMIT THIS
				"mimeType": "multipart/form-data",
				success: function (response) {
					$("#form1")[0].reset();
					$('#preview_img').attr('src', '/FinalProject/images/default.jpg');
					table.ajax.reload();
				},
				error: function (err) {
					alert('insert failed:' + err);
				}
			});
		}

		// 刪除Center V
		function deleteCenter(centerId) {
			Swal.fire({
				title: '確定刪除?',
				text: "再給一次機會喔！真的要刪除嗎？",
				icon: 'warning',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: '確定刪除',
				cancelButtonText: '取消'
			}).then((result) => {
				if (result.isConfirmed) {
					$.ajax({
						url: "/FinalProject/deleteCenterById/" + centerId,
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
						'已刪除',
						'您選的資料已確定刪除',
						'成功'
					)
				}
			})
		}


		//展示中心的修改fnction 驗證是否有空白
		function checkeditinputblank() {

			let edit_centerName = $('#edit_centerName').val().trim();
			let edit_centerPhone = $('#edit_centerPhone').val().trim();
			let edit_centerEmail = $('#edit_centerEmail').val().trim();
			let edit_centerLoc = $('#edit_centerLoc').val().trim();
			let edit_centerLocSit = $('#edit_centerLocSit').val().trim();
			let edit_centerAddress = $('#edit_centerAddress').val().trim();
			let edit_centerLatitude = $('#edit_centerLatitude').val().trim();
			let edit_centerLongitude = $('#edit_centerLongitude').val().trim();
			let edit_centerOpentime = $('#edit_centerOpentime').val().trim();
			let edit_centerFile = $('#edit_centerFile').val();

			if (edit_centerName == '' || edit_centerPhone == '' || edit_centerEmail == '' || edit_centerLoc == '' || edit_centerLocSit == '' || edit_centerAddress == '' || edit_centerLatitude == '' || edit_centerLongitude == '' || edit_centerOpentime == '' || edit_centerFile == '') {
				if (edit_centerName == '') {
					$('#editsp1').html('請輸入中心名稱').css('color', 'red');
					$('#editsp1').next().attr('src', '/FinalProject/images/error.png');
				} else if (edit_centerName != "") {
					$("#editsp1").html("");
					$("#editsp1").next().attr("src", "/FinalProject/images/check.png");
				}

				if (edit_centerPhone == '') {
					$('#editsp2').html('請輸入中心電話').css('color', 'red');
					$('#editsp2').next().attr('src', '/FinalProject/images/error.png');
				} else if (edit_centerPhone != "") {
					$("#editsp2").html("");
					$("#editsp2").next().attr("src", "/FinalProject/images/check.png");
				}

				if (edit_centerEmail == '') {
					$('#editsp3').html('請輸入中心電子信箱').css('color', 'red');
					$('#editsp3').next().attr('src', '/FinalProject/images/error.png');
				} else if (edit_centerEmail != "") {
					$("#editsp3").html("");
					$("#editsp3").next().attr("src", "/FinalProject/images/check.png");
				}
				if (edit_centerLoc == '') {
					$('#editsp4').html('請輸入中心縣市').css('color', 'red');
					$('#editsp4').next().attr('src', '/FinalProject/images/error.png');
				} else if (edit_centerLoc != "") {
					$("#editsp4").html("");
					$("#editsp4").next().attr("src", "/FinalProject/images/check.png");
				}
				if (edit_centerLocSit == '') {
					$('#editsp5').html('請輸入中心地區').css('color', 'red');
					$('#editsp5').next().attr('src', '/FinalProject/images/error.png');
				} else if (edit_centerLocSit != "") {
					$("#editsp5").html("");
					$("#editsp5").next().attr("src", "/FinalProject/images/check.png");
				}
				if (edit_centerAddress == '') {
					$('#editsp6').html('請輸入中心地址').css('color', 'red');
					$('#editsp6').next().attr('src', '/FinalProject/images/error.png');
				} else if (edit_centerAddress != "") {
					$("#editsp6").html("");
					$("#editsp6").next().attr("src", "/FinalProject/images/check.png");
				}
				if (edit_centerLatitude == '') {
					$('#editsp7').html('請輸入中心緯度').css('color', 'red');
					$('#editsp7').next().attr('src', '/FinalProject/images/error.png');
				} else if (edit_centerLatitude != "") {
					$("#editsp7").html("");
					$("#editsp7").next().attr("src", "/FinalProject/images/check.png");
				}
				if (edit_centerLongitude == '') {
					$('#editsp8').html('請輸入中心經度').css('color', 'red');
					$('#editsp8').next().attr('src', '/FinalProject/images/error.png');
				} else if (edit_centerLongitude != "") {
					$("#editsp8").html("");
					$("#editsp8").next().attr("src", "/FinalProject/images/check.png");
				}
				if (edit_centerOpentime == '') {
					$('#editsp9').html('請輸入中心營業時間').css('color', 'red');
					$('#editsp9').next().attr('src', '/FinalProject/images/error.png');
				} else if (edit_centerOpentime != "") {
					$("#editsp9").html("");
					$("#editsp9").next().attr("src", "/FinalProject/images/check.png");
				}

				if (edit_centerFile == '') {
					$('#editsp10').html('請加入圖片').css('color', 'red');
					$('#editsp10').next().attr('src', '/FinalProject/images/error.png');
				} else if (edit_centerFile != '') {
					$('#editsp10').html();
					$('#editsp10').next().attr('src', '/FinalProject/images/check.png')
				}

				return false;
			}
			return true;
		}


		// 更新資料function
		$("#edit_submit").click(function (e) {

			var updateFormData = new FormData(document.getElementById("edit_form"));

			if (checkeditinputblank() == true) {
				editCenter(updateFormData);  //修改展示中心的ajax
				$(".add_span").html('');
				$(".add_span").next().attr("src", "");
			} else
				e.stopPropagation();
		})


		// 修改商品的model
		function editMode(centerId) {
			edit_previewimg();  // 更新圖片function

			let aftersuccess = function (res) {
				$("#edit_centerId").val(res.centerId);
				$("#edit_centerName").val(res.centerName);
				$("#edit_centerPhone").val(res.centerPhone);
				$("#edit_centerEmail").val(res.centerEmail);
				$("#edit_centerLoc").val(res.centerLoc);
				$("#edit_centerLocSit").val(res.centerLocSit);
				$("#edit_centerAddress").val(res.centerAddress);
				$("#edit_centerLatitude").val(res.centerLatitude);
				$("#edit_centerLongitude").val(res.centerLongitude);
				$("#edit_centerOpentime").val(res.centerOpentime);

			}
			findById(centerId, aftersuccess)  //帶入id資料function
			$('#editCenterModal').modal('show');
			$('#editCenterModal').css('overflow-y', 'auto');

		}


		// 修改展示中心的ajax
		function editCenter(updateFormData) {

			$.ajax({
				url: "/FinalProject/updateCenter",
				method: "POST",
				data: updateFormData,
				contentType: false, /// NEEDED, DON'T OMIT THIS (requires jQuery 1.6+)
				processData: false, // NEEDED, DON'T OMIT THIS
				success: function (res) {
					$("#edit_form")[0].reset();  //把剛剛傳出後的資料清空
					$('#edit_img').attr('src', '/FinalProject/images/default.jpg');  //把圖片變成預設值
					table.ajax.reload();
				},
				error: function (err) {
					alert('update failed' + err);
				}
			});

		}


		// 修改中心的 預覽圖 function
		function edit_previewimg() {

			$("#edit_centerFile").change(function () {
				if (this.files && this.files[0]) {
					let reader = new FileReader();
					reader.readAsDataURL(this.files[0]);
					reader.onload = function (e) {
						$('#edit_img').attr('src', e.target.result);
					}
				}
			});
		}



		//帶入id資料
		function findById(centerId, aftersuccess) {
			$.ajax({
				url: "/FinalProject/findCenterById/" + centerId,
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



		//一鍵輸入(增加)
		$('#onekey').on('click', function () {
			$('#centerName').val('阿里山展示中心');
			$('#centerPhone').val('05-2679917');
			$('#centerEmail').val('AlishanCenter@gmail.com');
			$('#centerLoc').val('嘉義縣');
			$('#centerLocSit').val('阿里山鄉');
			$('#centerAddress').val('嘉義縣阿里山鄉59號');
			$('#centerOpentime').val('週一至週日 09:00 - 21:00');

		})


		//一鍵輸入(修改)
		$('#edit_onekey').on('click', function () {
			$('#edit_centerName').val('墾丁展示中心');
			$('#edit_centerPhone').val('08-8861165');
			$('#edit_centerEmail').val('KentingCenter@gmail.com');
			$('#edit_centerLoc').val('屏東縣');
			$('#edit_centerLocSit').val('恆春鎮');
			$('#edit_centerAddress').val('屏東縣恆春鎮墾丁路342號');
			$('#edit_centerLatitude').val('');
			$('#edit_centerLongitude').val('');
			$('#edit_centerOpentime').val('週一至週日 09:00 - 21:00');
		})


		//新增商品按下送出時再確認一次是否有空白 
		function checkinputblank() {

			let centerName = $("#centerName").val().trim();
			let centerPhone = $("#centerPhone").val().trim();
			let centerEmail = $("#centerEmail").val().trim();
			let centerLoc = $("#centerLoc").val().trim();
			let centerLocSit = $("#centerLocSit").val().trim();
			let centerAddress = $("#centerAddress").val().trim();
			let centerLatitude = $("#centerLatitude").val().trim();
			let centerLongitude = $("#centerLongitude").val().trim();
			let centerOpentime = $("#centerOpentime").val().trim();
			let centerFile = $("#centerFile").val();


			if (centerName == "" || centerPhone == "" || centerEmail == "" || centerLoc == "" || centerLocSit == "" || centerAddress == "" || centerLatitude == "" || centerLongitude == "" || centerOpentime == "" || centerFile == "") {
				if (centerName == "") {
					$("#sp1").html('請輸入中心名稱').css('color', 'red');
					$("#sp1").next().attr("src", "/FinalProject/images/error.png");
				} else if (centerName != "") {
					$("#sp1").html("");
					$("#sp1").next().attr("src", "/FinalProject/images/check.png");
				}
				if (centerPhone == "") {
					$("#sp2").html('請新增中心電話').css('color', 'red');
					$("#sp2").next().attr("src", "/FinalProject/images/error.png");
				} else if (centerPhone != "") {
					$("#sp2").html("");
					$("#sp2").next().attr("src", "/FinalProject/images/check.png")
				}
				if (centerEmail == "") {
					$("#sp3").html('請新增中心電子信箱').css('color', 'red');
					$("#sp3").next().attr("src", "/FinalProject/images/error.png");
				} else if (centerEmail != "") {
					$("#sp3").html("");
					$("#sp3").next().attr("src", "/FinalProject/images/check.png");
				}
				if (centerLoc == "") {
					$("#sp4").html('請新增中心縣市').css('color', 'red');
					$("#sp4").next().attr("src", "/FinalProject/images/error.png");
				} else if (centerLoc != "") {
					$("#sp4").html("");
					$("#sp4").next().attr("src", "/FinalProject/images/check.png");
				}
				if (centerLocSit == "") {
					$("#sp5").html('請新增中心區域').css('color', 'red');
					$("#sp5").next().attr("src", "/FinalProject/images/error.png");
				} else if (centerLocSit != "") {
					$("#sp5").html("");
					$("#sp5").next().attr("src", "/FinalProject/images/check.png");
				}
				if (centerAddress == "") {
					$("#sp6").html('請新增中心地址').css('color', 'red');
					$("#sp6").next().attr("src", "/FinalProject/images/error.png");
				} else if (centerAddress != "") {
					$("#sp6").html("");
					$("#sp6").next().attr("src", "/FinalProject/images/check.png");
				}
				if (centerLatitude == "") {
					$("#sp7").html('請新增中心緯度').css('color', 'red');
					$("#sp7").next().attr("src", "/FinalProject/images/error.png");
				} else if (centerLatitude != "") {
					$("#sp7").html("");
					$("#sp7").next().attr("src", "/FinalProject/images/check.png");
				}
				if (centerLongitude == "") {
					$("#sp8").html('請新增中心經度').css('color', 'red');
					$("#sp8").next().attr("src", "/FinalProject/images/error.png");
				} else if (centerLongitude != "") {
					$("#sp8").html("");
					$("#sp8").next().attr("src", "/FinalProject/images/check.png");
				}
				if (centerOpentime == "") {
					$("#sp9").html('請新增中心營業時間').css('color', 'red');
					$("#sp9").next().attr("src", "/FinalProject/images/error.png");
				} else if (centerOpentime != "") {
					$("#sp9").html("");
					$("#sp9").next().attr("src", "/FinalProject/images/check.png");
				}

				if (centerFile == "") {
					$("#sp10").html('請新增圖片').css('color', 'red');
					$("#sp10").next().attr("src", "/FinalProject/images/error.png");
				} else if (centerFile != '') {
					$('#sp10').html('');
					$('#sp10').next().attr('src', '/FinalProject/images/check.png');
				}
				return false;

			}
			return true;
		}




		//新增商品時滑鼠移開的即時確認
		function validateData() {
			$("#centerName").blur(function () {

				var centerName = $("#centerName").val().trim();

				if (centerName == "") {
					$("#sp1").html('請輸入中心名稱').css('color', 'red');
					$("#sp1").next().attr("src", "/FinalProject/images/error.png");
				} else if (centerName != "") {
					$("#sp1").html("");
					$("#sp1").next().attr("src", "/FinalProject/images/check.png");
				}
			})
			$("#centerPhone").blur(function () {

				var centerPhone = $("#centerPhone").val().trim();
				if (centerPhone == "") {
					$("#sp2").html('請新增中心電話').css('color', 'red');
					$("#sp2").next().attr("src", "/FinalProject/images/error.png");
				} else if (centerPhone != "") {
					$("#sp2").html("");
					$("#sp2").next().attr("src", "/FinalProject/images/check.png");
				}
			})



			$("#centerEmail").blur(function () {

				var centerEmail = $("#centerEmail").val().trim();
				if (centerEmail == "") {
					$("#sp3").html('請新增中心電子信箱').css('color', 'red');
					$("#sp3").next().attr("src", "/FinalProject/images/error.png");
				} else if (centerEmail != "") {
					$("#sp3").html("");
					$("#sp3").next().attr("src", "/FinalProject/images/check.png");
				}
			})

			$("#centerLoc").blur(function () {

				var centerLoc = $("#centerLoc").val().trim();
				if (centerLoc == "") {
					$("#sp4").html('請新增中心縣市').css('color', 'red');
					$("#sp4").next().attr("src", "/FinalProject/images/error.png");
				} else if (centerLoc != "") {
					$("#sp4").html("");
					$("#sp4").next().attr("src", "/FinalProject/images/check.png");
				}
			})


			$("#centerLocSit").blur(function () {

				var centerLocSit = $("#centerLocSit").val().trim();
				if (centerLocSit == "") {
					$("#sp5").html('請新增中心區域').css('color', 'red');
					$("#sp5").next().attr("src", "/FinalProject/images/error.png");
				} else if (centerLocSit != "") {
					$("#sp5").html("");
					$("#sp5").next().attr("src", "/FinalProject/images/check.png");
				}
			})


			$("#centerAddress").blur(function () {

				var centerAddress = $("#centerAddress").val().trim();
				if (centerAddress == "") {
					$("#sp6").html('請新增中心地址').css('color', 'red');
					$("#sp6").next().attr("src", "/FinalProject/images/error.png");
				} else if (centerAddress != "") {
					$("#sp6").html("");
					$("#sp6").next().attr("src", "/FinalProject/images/check.png");
				}
			})

			$("#centerLatitude").blur(function () {

				var centerLatitude = $("#centerLatitude").val().trim();
				if (centerLatitude == "") {
					$("#sp7").html('請新增中心緯度').css('color', 'red');
					$("#sp7").next().attr("src", "/FinalProject/images/error.png");
				} else if (centerLatitude != "") {
					$("#sp7").html("");
					$("#sp7").next().attr("src", "/FinalProject/images/check.png");
				}
			})


			$("#centerLongitude").blur(function () {

				var centerLongitude = $("#centerLongitude").val().trim();
				if (centerLongitude == "") {
					$("#sp8").html('請新增中心經度').css('color', 'red');
					$("#sp8").next().attr("src", "/FinalProject/images/error.png");
				} else if (centerLongitude != "") {
					$("#sp8").html("");
					$("#sp8").next().attr("src", "/FinalProject/images/check.png");
				}
			})


			$("#centerOpentime").blur(function () {

				var centerOpentime = $("#centerOpentime").val().trim();
				if (centerOpentime == "") {
					$("#sp9").html('請新增中心營業時間').css('color', 'red');
					$("#sp9").next().attr("src", "/FinalProject/images/error.png");
				} else if (centerOpentime != "") {
					$("#sp9").html("");
					$("#sp9").next().attr("src", "/FinalProject/images/check.png");
				}
			})

		}



		//binding 查詢座標的按鈕 (增加)
		$('#queryaddr').click(function (e) {
			$('#queryaddrModel').modal('show');  //顯示增加展示中心的model
			e.preventDefault();
		})

		//binding 查詢座標的按鈕 (修改)
		$('#edit_queryaddr').click(function (e) {
			$('#edit_queryaddrModel').modal('show');  //顯示增加展示中心的model
			e.preventDefault();
		})



		//查詢座標的function
		function initMap() {

			//座標地圖(增加的)
			geocoder = new google.maps.Geocoder();
			map = new google.maps.Map(document.getElementById('map'), {
				zoom: 15,
				center: { lat: 25.0338, lng: 121.5648 },
			});


			$('#query').click(function () {
				// 取得使用者輸入的地址
				var address = $('#address').val();
				if (address == '') return; // 若為空字串則返回


				// 用使用者輸入的地址查詢
				geocoder.geocode({ 'address': address }, function (results, status) {
					if (status == 'OK') {  // 確認 OK
						var latlng = results[0].geometry.location;
						//  取得查詢結果第0筆中的經緯度物件
						map.setCenter(latlng); //將查詢結果設為地圖的中心
						$('#lat').text(latlng.lat()); //顯示經度
						$('#lng').text(latlng.lng()); //顯示緯度

						// (放置marker) The marker, positioned at Taoyuanaudi 
						const marker = new google.maps.Marker({
							position: { lat: latlng.lat(), lng: latlng.lng() },
							map: map,
						});

					} else {
						console.log(status);
					}

					//查詢座標的送出
					$('#submitquery').click(function (e) {
						initMap();
						$('#centerLatitude').val(latlng.lat());
						$('#centerLongitude').val(latlng.lng());

					});
				});
			});


			// 設定輸入欄位按鍵放開的事件處理函式
			$('#address').keypress(function (e) {
				if (e.which == 13) // 按下/放開 Enter 鍵 
					$('#query').click();
			});


			//座標地圖(修改的)
			edit_geocoder = new google.maps.Geocoder();
			edit_map = new google.maps.Map(document.getElementById('edit_map'), {
				zoom: 15,
				center: { lat: 25.0338, lng: 121.5648 },
			});

			$('#edit_query').click(function () {
				// 取得使用者輸入的地址
				var edit_address = $('#edit_address').val();
				if (edit_address == '') return; // 若為空字串則返回



				// 用使用者輸入的地址查詢
				edit_geocoder.geocode({ 'address': edit_address }, function (results, status) {
					if (status == 'OK') {  // 確認 OK
						var edit_latlng = results[0].geometry.location;
						//  取得查詢結果第0筆中的經緯度物件
						edit_map.setCenter(edit_latlng); //將查詢結果設為地圖的中心
						$('#edit_lat').text(edit_latlng.lat()); //顯示經度
						$('#edit_lng').text(edit_latlng.lng()); //顯示緯度

						// (放置marker) The marker, positioned at Taoyuanaudi 
						const edit_marker = new google.maps.Marker({
							position: { lat: edit_latlng.lat(), lng: edit_latlng.lng() },
							map: this.edit_map,
						});


					} else {
						console.log(status);
					}


					//查詢座標的送出  V
					$('#edit_submitquery').click(function (e) {
						initMap();
						$('#edit_centerLatitude').val(edit_latlng.lat());
						$('#edit_centerLongitude').val(edit_latlng.lng());


					});




				});
			});

			$('#edit_address').keypress(function (e) {
				if (e.which == 13) // 按下/放開 Enter 鍵 
					$('#edit_query').click();
			});



		}


	</script>

	<!--地圖api key-->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBYfh8-A26ni-AEF58RvN30Xg1B1_wx3kg&callback=initMap&libraries=&v=weekly&language=zh-TW"
		async></script>

	</html>