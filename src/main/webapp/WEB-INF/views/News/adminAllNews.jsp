<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html lang="zh-TW">

	<head>
		<meta charset="utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
		<meta name="description" content="" />
		<meta name="author" content="" />

		<title>編輯最新消息</title>
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
		<!--CK editor 4-->
		<script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>

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
                <li class="nav-item active"><a class="nav-link" href="/FinalProject/inner/admin/AllNewsPage"> <i class="fas fa-rss-square"></i> <span>編輯消息</span></a></li>
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
<!-- 							<div class="topbar-divider d-none d-sm-block"></div> -->

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
						<h1 class="h3 mb-2 text-gray-800">編輯最新消息</h1>
						<p class="mb-4">最新消息編輯</p>

						<!-- Content Row -->
						<div class="row">
							<!-- 以下開始替換成你們的內容
                    可放表格, 圖表, 要填的 form 之類的~ -->
							<!-- this is button -->
							<button id="addNewsButton" type="submit" class="btn btn-primary" style="margin-left: 15px;">新增消息
								</button>
							<!-- this is datables -->
							<table id="newslist" class="table table-striped table-bordered nowrap" style="width: 100%">
								<thead>
									<tr>
										<th>新聞編號</th>
										<th>標題</th>
										<th>副標題</th>
										<th>上傳日期</th>
										<th>內文</th>
										<th>備註</th>
										<th>圖片</th>
										<th>

									</tr>

								</thead>
								<tbody>

								</tbody>
							</table>

						</div>

						<!-- this is addNews modal -->
						<div class="modal fade" tabindex="-1" role="dialog" id="addNewsModal">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title">新增消息</h4>
									</div>
									<div class="modal-body">

										<form id="form1">

											<table class="box">
												<tr>
													<td>標題
												<tr>
													<td><input class="myitem" id="title" type="text" name="title"
															value="${news.title}" style="width: 500px"><br />
														<span id="sp1" style="width: 10px" class="add_span"></span>
														<img src="">
													</td>
												<tr>
													<td>副標題
												<tr>
													<td><input class="myitem" id="subtitle" type="text" name="subtitle"
															value="${news.subtitle}" style="width: 500px"><br /> <span
															id="sp2" style="width: 10px" class="add_span"></span> <img
															src=""></td>
												<tr>
													<td>上傳日期
												<tr>
													<td><input class="myitem" id="uploaddate" type="date"
															name="uploadDate" value="${news.uploadDate}" /> <br /> <span
															id="sp3" style="width: 10px;" class="add_span"></span> <img
															src=""></td>
												<tr>
													<td>內文
												<tr>
													<td><textarea class="myitem" id="add_content" rows="30"
															cols="70"></textarea> <br /> <span id="sp4"
															style="width: 10px;" class="add_span"></span> <img src="">
													</td>
												<tr>
													<td>圖片
												<tr>
													<td>
														<div class="image">
															<img class="myitem" id="preview_img" width="200"
																height="200" />

														</div> <input id="file" type="file" name="file" /> <span
															class="add_span" id="sp5" style="width: 10px;"></span> <img
															src="">
													</td>
												<tr>
													<td>備註
												<tr>
													<td><input id="remarks" name="remarks" value="${news.remarks}"
															style="width: 500px"></td>
												<tr>
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



						<!-- this is editNews modal -->
						<div class="modal fade" tabindex="-1" role="dialog" id="editNewsModal">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title">編輯消息</h4>
									</div>
									<div class="modal-body">

										<form id="edit_form">

											<table class="box">

												<input type="hidden" id="edit_newsId" name="newsId">

												<tr>
													<td>標題
												<tr>

													<td><input class="myitem" id="edit_title" type="text" name="title"
															style="width: 500px"><br /> <span id="sp1"
															style="width: 10px"></span> <img src=""></td>
												<tr>
													<td>副標題
												<tr>
													<td><input class="myitem" id="edit_subtitle" type="text"
															name="subtitle" style="width: 500px"><br />
														<span id="sp2" style="width: 10px"></span> <img src="">
													</td>
												<tr>
													<td>上傳日期
												<tr>
													<td><input class="myitem" id="edit_uploaddate" type="date"
															name="uploadDate" /> <br /> <span id="sp3"
															style="width: 10px;"></span> <img src=""></td>
												<tr>
													<td>內文
												<tr>
													<td><textarea class="myitem" id="edit_content" rows="30"
															cols="70"></textarea> <br /> <span id="sp4"
															style="width: 10px;"></span> <img src=""></td>
												<tr>
													<td>圖片
												<tr>
													<td>
														<div class="image">
															<img class="myitem" id="edit_preview_img" width="200"
																height="200" /> <img class="myitem" id="edit_img"
																width="200" height="200" />

														</div> <input id="edit_file" type="file" name="file" /> <span
															id="sp5" style="width: 10px;"></span> <img src="">
													</td>
												<tr>
													<td>
												<tr>
													<td><input id="edit_remarks" name="remarks" value="${news.remarks}"
															style="width: 500px"></td>
												<tr>
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

			table = $('#newslist')
				.DataTable(
					{
						"ajax": {
							"dataSrc": "",
							"url": "/FinalProject/getAllNews"
						},
						"rowId": "newsId",
						"columnDefs": [

							{
								targets: 6,
								render: function (data) {
									if (data == null) {
										return "<img src='../../images/default.jpg' width='400' height='300' alt='pic cannot be displayed'/>"
									} else
										return "<img src='data:image/png;base64," + data + "' width='400' height='300' alt='pic cannot be displayed'/>"
								}
							},
							{
								targets: 7,
								data: "newsId",
								orderable: false, // 禁用排序
								defaultContent: "",
								width: "10%",
								render: function (data) {
									return '<button id="edit_btn" onclick="editMode('
										+ data
										+ ')" data-dismiss="modal" class="btn btn-info btn-sm"><i class="fas fa-edit"></i>編輯</button>'
										+ '<button id="delete_btn" onclick="deleteNews(' + data + ')" data-dismiss="modal" class="btn btn-danger btn-sm"><i class="fas fa-trash-alt"></i>刪除</button>';

								}
							}],
						"columns": [{
							data: "newsId"
						}, {
							data: "title"
						}, {
							data: "subtitle"
						}, {
							data: "uploadDate"
						}, {
							data: "content"
						}, {
							data: "remarks"
						}, {
							data: "base64Image"
						}
						 , {
						 	data: "newsId"
						 }

						],

						"responsive": {
							"details": {
								"display": $.fn.dataTable.Responsive.display
									.modal({
										"header": function (row) {
											var data = row.data();
											return '最新消息詳細資訊';
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


		//binding add button
		$('#addNewsButton').click(function (e) {
			previewimg();
			$('#preview_img').attr('src', '../../images/default.jpg');

			$('#addNewsModal').modal('show');
			CKEDITOR.replace('add_content');

			validateData();

			e.preventDefault();
		})





		//call edit news modal and fill in the blank
		function editMode(newsId) {
			edit_previewimg();

			let aftersuccess = function (res) {
				CKEDITOR.replace('edit_content');
				$("#edit_newsId").val(res.newsId);
				$("#edit_title").val(res.title);
				$("#edit_subtitle").val(res.subtitle);
				$("#edit_uploaddate").val(res.uploadDate);
				CKEDITOR.instances['edit_content'].setData(res.content);
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
				$("#edit_remarks").val(res.remarks);
			}
			findById(newsId, aftersuccess)
			$('#editNewsModal').modal('show');
			$('#editNewsModal').css('overflow-y', 'auto');

		}

		// Update News Function
		$("#edit_submit").click(
			function () {

				var editNewsFormData = new FormData(document
					.getElementById("edit_form"));

				editNewsFormData.append('content', CKEDITOR.instances['edit_content'].getData());

				editNews(editNewsFormData)

			})

		// Execute update news
		function editNews(editNewsFormData) {

			$.ajax({
				url: "/FinalProject/updateNews",
				method: "POST",
				data: editNewsFormData,
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

		function findById(newsId, aftersuccess) {

			$.ajax({
				url: "/FinalProject/findNewsById/" + newsId,
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

		//Add News Autofill 
		$("#shortcut")
			.click(
				function () {

					var text1 = "Audi 萬人註冊感謝季即刻開跑 敬邀四環車主預約回廠獨享尊榮禮遇";
					text1 = $("#title").val(text1);
					var text2 = "自 Audi 行動助理服務上線以來，台灣奧迪即日起至 2021 年 2 月 9 日舉辦「Audi 萬人註冊感謝季」，以回饋車主們一直以來的支持與肯定";
					text2 = $("#subtitle").val(text2);
					var text3 = "2021-08-09";
					text3 = $("#uploaddate").val(text3);
					var text4 = "自 Audi 行動助理服務上線以來，台灣奧迪即日起至 2021 年 2 月 9 日舉辦「Audi 萬人註冊感謝季」，以回饋車主們一直以來的支持與肯定。凡於活動期間內預約回廠健檢，即可享有免費全車系安全檢查，包括引擎、輪胎、底盤、煞車系統、燈光系統等檢測項目，車輛相關維修及保養另可享 Audi 原廠零件 88 折、輪胎兩條 85 折四條 8 折、風箱清洗優惠價 NT$ 2,288 元 、電瓶以及雨刷片 7 折、原廠配件與精品 85 折等專屬優惠。單次消費金額滿 NT$ 11,888 以上即贈送好禮一份 (數量有限，送完為止)。此外，凡於活動期間加入 Audi 點點入心禮活動並完成「免費行車安全檢查」之所有車主，將可獲得 2021 精緻筆記本。";

					CKEDITOR.instances['add_content'].setData(text4);


					var text5 = "凡於活動期間內預約回廠車主即可享有多項品牌尊榮優惠禮遇。";
					text5 = $("#remarks").val(text5);
				})

		//Add News function
		$("#submit").click(function (e) {

			var formData = new FormData(document.getElementById("form1"));

			formData.append('content', CKEDITOR.instances['add_content'].getData());

			if (checkinputblank() == true) {
				addnews(formData);
				$(".add_span").html('');
				$(".add_span").next().attr("src", "");
			} else
				e.stopPropagation();
		});

		// execute add news
		function addnews(formData) {
			$.ajax({
				url: "/FinalProject/addNews",
				method: "POST",
				data: formData,
				contentType: false, // NEEDED, DON'T OMIT THIS (requires jQuery 1.6+)
				processData: false, // NEEDED, DON'T OMIT THIS
				"mimeType": "multipart/form-data",
				success: function (response) {
					$("#form1")[0].reset();
					CKEDITOR.instances['add_content'].setData('');
					$('#preview_img').attr('src', '../../images/default.jpg');
					table.ajax.reload();
				},
				error: function (err) {
					console.log(err);
					alert('insert failed:' + err);
				}
			});

		}

		//check if add news form has blank field
		function checkinputblank() {

			let warning = "This field is required.";

			let title = $("#title").val().trim();
			let subtitle = $("#subtitle").val().trim();
			let uploadDate = $("#uploaddate").val().trim();
			let content = CKEDITOR.instances['add_content'].getData();
			let file = $("#file").val();

			if (title == "" || subtitle == "" || uploadDate == "" || content == "") {
				if (title == "") {
					$("#sp1").html(warning).css('color', 'red');
					$("#sp1").next().attr("src", "../../images/error.png");
				}
				if (subtitle == "") {
					$("#sp2").html(warning).css('color', 'red');
					$("#sp2").next().attr("src", "../../images/error.png");
				}
				if (uploadDate == "") {
					$("#sp3").html(warning).css('color', 'red');
					$("#sp3").next().attr("src", "../../images/error.png");
				}
				if (content == "") {
					$("#sp4").html(warning).css('color', 'red');
					$("#sp4").next().attr("src", "../../images/error.png");
				}

				if (file == "") {
					$("#sp5").html(warning).css('color', 'red');
					$("#sp5").next().attr("src", "../../images/error.png");
				}
				return false;

			}
			return true;
		}

		//Add news validation
		function validateData() {
			let warning = "This field is required.";


			$("#title").blur(function () {

				var title = $("#title").val().trim();

				if (title == "") {
					$("#sp1").html(warning).css('color', 'red');
					$("#sp1").next().attr("src", "../../images/error.png");
				} else if (title != "") {
					$("#sp1").html("");
					$("#sp1").next().attr("src", "../../images/check.png");
				}

			})
			$("#subtitle").blur(function () {

				var subtitle = $("#subtitle").val().trim();
				if (subtitle == "") {
					$("#sp2").html(warning).css('color', 'red');
					$("#sp2").next().attr("src", "../../images/error.png");
				} else if (subtitle != "") {
					$("#sp2").html("");
					$("#sp2").next().attr("src", "../../images/check.png");
				}
			})

			$("#uploaddate").blur(function () {

				var uploaddate = $("#uploaddate").val().trim();
				if (uploaddate == "") {
					$("#sp3").html(warning).css('color', 'red');
					$("#sp3").next().attr("src", "../../images/error.png");
				} else if (uploaddate != "") {
					$("#sp3").html("");
					$("#sp3").next().attr("src", "../../images/check.png");
				}
			})

			$("#add_content").blur(function () {

				var content = CKEDITOR.instances['add_content'].getData()
				if (content == "") {
					$("#sp4").html(warning).css('color', 'red');
					$("#sp4").next().attr("src", "../../images/error.png");
				} else if (content != "") {
					$("#sp4").html("");
					$("#sp4").next().attr("src", "../../images/check.png");
				}
			})

			$("#file").blur(function () {

				var content = $("#file").val();
				if (content == "") {
					$("#sp5").html(warning).css('color', 'red');
					$("#sp5").next().attr("src", "../../images/error.png");
				} else if (content != "") {
					$("#sp5").html("");
					$("#sp5").next().attr("src", "../../images/check.png");
				}
			})

		}
		//Delete News
		function deleteNews(newsId) {
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
						url: "/FinalProject/deleteNewsById/" + newsId,
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

		//Preview image for add news function

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