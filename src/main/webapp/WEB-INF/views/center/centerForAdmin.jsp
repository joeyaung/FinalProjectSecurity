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


	</head>

<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
      <!-- Sidebar -->
      <ul
        class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
        id="accordionSidebar"
      >
        <!-- Sidebar - Brand -->
        <a
          class="sidebar-brand d-flex align-items-center justify-content-center"
          href="/FinalProject/inner"
        >
          <div class="sidebar-brand-icon">
            <img src="/FinalProject/images/audi-logo.png" alt="" />
          </div>
        </a>

        <!-- Divider -->
        <hr class="sidebar-divider my-0" />

        <!-- Nav Item - Dashboard -->
        <li class="nav-item active">
          <a class="nav-link" href="/FinalProject/inner">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>Dashboard</span></a
          >
        </li>

        <!-- Divider -->
        <hr class="sidebar-divider" />

        <!-- Heading -->
        <div class="sidebar-heading">Analytics</div>

        <!-- Nav Item - Pages Collapse Menu -->
        <li class="nav-item">
          <a
            class="nav-link collapsed"
            href="#"
            data-toggle="collapse"
            data-target="#collapseTwo"
            aria-expanded="true"
            aria-controls="collapseTwo"
          >
            <i class="fas fa-users"></i>
            <span>Client</span>
          </a>
          <div
            id="collapseTwo"
            class="collapse"
            aria-labelledby="headingTwo"
            data-parent="#accordionSidebar"
          >
            <div class="bg-white py-2 collapse-inner rounded">
              <h6 class="collapse-header">Clients:</h6>
              <a class="collapse-item" href="buttons.html">Overview</a>
              <a class="collapse-item" href="cards.html">Curent Stage</a>
            </div>
          </div>
        </li>

        <!-- Nav Item - Utilities Collapse Menu -->
        <li class="nav-item">
          <a
            class="nav-link collapsed"
            href="#"
            data-toggle="collapse"
            data-target="#collapseUtilities"
            aria-expanded="true"
            aria-controls="collapseUtilities"
          >
            <i class="fas fa-id-card-alt"></i>
            <span>Employee</span>
          </a>
          <div
            id="collapseUtilities"
            class="collapse"
            aria-labelledby="headingUtilities"
            data-parent="#accordionSidebar"
          >
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
        <li class="nav-item">
          <a class="nav-link" href="/FinalProject/inner/admin/addEmployee">
            <i class="fas fa-user-plus"></i>
            <span>新增員工</span></a
          >
        </li>

        <!-- Nav Item - 試駕總覽 -->
        <li class="nav-item">
          <a class="nav-link" href="/FinalProject/admin/edit/testdrive">
            <i class="fas fa-car"></i>
            <span>試駕總覽</span></a
          >
        </li>

        <!-- Nav Item - 編輯消息 -->
        <li class="nav-item">
          <a class="nav-link" href="/FinalProject/inner/admin/AllNewsPage">
            <i class="fas fa-rss-square"></i>
            <span>編輯消息</span></a
          >
        </li>

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

            <!-- Topbar Search -->
            <form
              class="
                d-none d-sm-inline-block
                form-inline
                mr-auto
                ml-md-3
                my-2 my-md-0
                mw-100
                navbar-search
              "
            >
              <div class="input-group">
                <input
                  type="text"
                  class="form-control bg-light border-0 small"
                  placeholder="Search for..."
                  aria-label="Search"
                  aria-describedby="basic-addon2"
                />
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
              <li class="nav-item dropdown no-arrow d-sm-none">
                <a
                  class="nav-link dropdown-toggle"
                  href="#"
                  id="searchDropdown"
                  role="button"
                  data-toggle="dropdown"
                  aria-haspopup="true"
                  aria-expanded="false"
                >
                  <i class="fas fa-search fa-fw"></i>
                </a>
                <!-- Dropdown - Messages -->
                <div
                  class="
                    dropdown-menu dropdown-menu-right
                    p-3
                    shadow
                    animated--grow-in
                  "
                  aria-labelledby="searchDropdown"
                >
                  <form class="form-inline mr-auto w-100 navbar-search">
                    <div class="input-group">
                      <input
                        type="text"
                        class="form-control bg-light border-0 small"
                        placeholder="Search for..."
                        aria-label="Search"
                        aria-describedby="basic-addon2"
                      />
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
              <li class="nav-item dropdown no-arrow mx-1">
                <a
                  class="nav-link dropdown-toggle"
                  href="#"
                  id="alertsDropdown"
                  role="button"
                  data-toggle="dropdown"
                  aria-haspopup="true"
                  aria-expanded="false"
                >
                  <i class="fas fa-bell fa-fw"></i>
                  <!-- Counter - Alerts -->
                  <span class="badge badge-danger badge-counter">3+</span>
                </a>
                <!-- Dropdown - Alerts -->
                <div
                  class="
                    dropdown-list dropdown-menu dropdown-menu-right
                    shadow
                    animated--grow-in
                  "
                  aria-labelledby="alertsDropdown"
                >
                  <h6 class="dropdown-header">Alerts Center</h6>
                  <a class="dropdown-item d-flex align-items-center" href="#">
                    <div class="mr-3">
                      <div class="icon-circle bg-primary">
                        <i class="fas fa-file-alt text-white"></i>
                      </div>
                    </div>
                    <div>
                      <div class="small text-gray-500">December 12, 2019</div>
                      <span class="font-weight-bold"
                        >A new monthly report is ready to download!</span
                      >
                    </div>
                  </a>
                  <a class="dropdown-item d-flex align-items-center" href="#">
                    <div class="mr-3">
                      <div class="icon-circle bg-success">
                        <i class="fas fa-donate text-white"></i>
                      </div>
                    </div>
                    <div>
                      <div class="small text-gray-500">December 7, 2019</div>
                      $290.29 has been deposited into your account!
                    </div>
                  </a>
                  <a class="dropdown-item d-flex align-items-center" href="#">
                    <div class="mr-3">
                      <div class="icon-circle bg-warning">
                        <i class="fas fa-exclamation-triangle text-white"></i>
                      </div>
                    </div>
                    <div>
                      <div class="small text-gray-500">December 2, 2019</div>
                      Spending Alert: We've noticed unusually high spending for
                      your account.
                    </div>
                  </a>
                  <a
                    class="dropdown-item text-center small text-gray-500"
                    href="#"
                    >Show All Alerts</a
                  >
                </div>
              </li>

              <div class="topbar-divider d-none d-sm-block"></div>

              <!-- Nav Item - User Information -->
              <li class="nav-item dropdown no-arrow">
                <a
                  class="nav-link dropdown-toggle"
                  href="#"
                  id="userDropdown"
                  role="button"
                  data-toggle="dropdown"
                  aria-haspopup="true"
                  aria-expanded="false"
                >
                  <span class="mr-2 d-none d-lg-inline text-gray-600 small"
                    >${ empName }</span
                  >
                  <img
                    class="img-profile rounded-circle"
                    src="/FinalProject/images/svg/undraw_profile.svg"
                  />
                </a>
                <!-- Dropdown - User Information -->
                <div
                  class="
                    dropdown-menu dropdown-menu-right
                    shadow
                    animated--grow-in
                  "
                  aria-labelledby="userDropdown"
                >
                  <a class="dropdown-item" href="#">
                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                    Profile
                  </a>
                  <a class="dropdown-item" href="#">
                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                    Settings
                  </a>
                  <a class="dropdown-item" href="#">
                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                    Activity Log
                  </a>
                  <div class="dropdown-divider"></div>
                  <a
                    class="dropdown-item"
                    href="#"
                    data-toggle="modal"
                    data-target="#logoutModal"
                  >
                    <i
                      class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"
                    ></i>
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
							<button id="addCenterButton" type="submit" class="btn btn-primary">增加展示中心資訊</button>
								
								
								
							<!-- this is datables -->
							<table id="centerList" class="table table-striped table-bordered nowrap" style="width: 100%">
								<thead>
									<tr>
										<th>ID</th>
										<th>展示中心名稱</th>
										<th>聯絡電話</th>
										<th>E-Mail</th>
										<th>地址</th>
										<th>營業時間</th>
										<th>服務內容</th>
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
														<input class="myitem" id="centerName" type="text" name="centerName" value="" style="width: 500px"><br />
														<span id="sp1" style="width: 10px" class="add_span"></span> <img src="">
													</td>
												</tr>
												<tr>
													<td>連絡電話：</td>
												</tr>
												<tr>
													<td><input class="myitem" id="centerPhone" type="text" name="centerPhone"
															value="" style="width: 500px"><br /> 
															<span id="sp2" style="width: 10px" class="add_span"></span> <img src="">
													</td>
												</tr>
												<tr>
													<td>E-Mail:</td>
												</tr>
												<tr>
													<td><input class="myitem" id="centerEmail" type="text" name="centerEmail" value="" /> <br /> 
														<span id="sp3" style="width: 10px;" class="add_span"></span> <img src="">
													</td>
												</tr>
												<tr>
													<td>地址:</td>
												</tr>
												<tr>
													<td><input class="myitem" id="centerAddress" type="text" name="centerAddress" value="" /> <br /> 
														<span id="sp3" style="width: 10px;" class="add_span"></span> <img src="">
													</td>
												</tr>
												<tr>
													<td>營業時間:</td>
												</tr>
												<tr>
													<td><input class="myitem" id="centerOpentime" type="text" name="centerOpentime" value="" /> <br /> 
														<span id="sp3" style="width: 10px;" class="add_span"></span> <img src="">
													</td>
												</tr>
												<tr>
													<td>服務內容:</td>
												</tr>
												<tr>
													<td><input class="myitem" id="centerService" type="text" name="centerService" value="" /> <br /> 
														<span id="sp3" style="width: 10px;" class="add_span"></span> <img src="">
													</td>
												</tr>


											</table>

										</form>

									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">關閉</button>
										<button id="submitadd" type="button" data-dismiss="modal" class="btn btn-primary">送出</button>
										<!-- <button id="shortcut" type="button" class="btn btn-primary">ShortCut</button> -->
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

												<input type="hidden" id="edit_id" name="id">  <!--hidden-->

												<!-- <tr>
													<td>ID:</td>
												</tr>
												<tr>
													<td><input class="myitem" id="edit_centerId" type="text" name="centerId" style="width: 500px"><br />
														<span id="sp1" style="width: 10px"></span> <img src="">
													</td>
												</tr> -->

												<input type="hidden" id="edit_centerId" name="centerId">  <!--hidden-->

												<tr>
													<td>展示中心名稱:</td>
												</tr>
												<tr>
													<td><input class="myitem" id="edit_centerName" type="text" name="centerName" style="width: 500px"><br />
														<span id="sp2" style="width: 10px"></span> <img src="">
													</td>
												</tr>
												<tr>
													<td>連絡電話：</td>
												</tr>
												<tr>
													<td><input class="myitem" id="edit_centerPhone" type="text" name="centerPhone" /> <br />
														<span id="sp3" style="width: 10px;"></span> <img src=""></td>
												</tr>
												<tr>
													<td>E-Mail:</td>
												</tr>
												<tr>
													<td><input class="myitem" id="edit_centerEmail" type="text" name="centerEmail" style="width: 500px"><br />
														<span id="sp1" style="width: 10px"></span> <img src="">
													</td>
												</tr>
												<tr>
													<td>地址:</td>
												</tr>
												<tr>
													<td><input class="myitem" id="edit_centerAddress" type="text" name="centerAddress" style="width: 500px"><br />
														<span id="sp1" style="width: 10px"></span> <img src="">
													</td>
												</tr>
												<tr>
													<td>營業時間:</td>
												</tr>
												<tr>
													<td><input class="myitem" id="edit_centerOpentime" type="text" name="centerOpentime" style="width: 500px"><br />
														<span id="sp1" style="width: 10px"></span> <img src="">
													</td>
												</tr>
												<tr>
													<td>服務內容:</td>
												</tr>
												<tr>
													<td><input class="myitem" id="edit_centerService" type="text" name="centerService" style="width: 500px"><br />
														<span id="sp1" style="width: 10px"></span> <img src="">
													</td>
												</tr>
											</table>
										</form>

									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">Close</button>
										<button id="edit_submit" data-dismiss="modal" type="button"
											class="btn btn-primary">Submit</button>
										<button id="shortcut" type="button" class="btn btn-primary">ShortCut</button>
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
		function createdatatable(){
		table = $('#centerList').DataTable({
			"responsive": true,
			"ajax":{
				"url": "/FinalProject/getAllCneter",
				"dataSrc": "",
				// "type": "POST",
				// "dataType": 'json',
				
			},
			
			"rowId":"centerId",

			"columns":[
				{"data":"centerId"},
				{"data":"centerName"},
				{"data":"centerPhone"},
				{"data":"centerEmail"},
				{"data":"centerAddress"},
				{"data":"centerOpentime"},
				{"data":"centerService"},
				{"data":"centerId"},
				
			],

			"columnDefs": [
			// 				{
			// 					targets: 1,
			// 					render: function (data) {
			// 						return "<img src='data:image/png;base64," + data + "' width='100' height='100' alt='pic cannot be displayed'/>"
			// 					}
			// 				},
							
							{
								targets: 7,
								data:"centerId",
								orderable: false,
								defaultContent:"",
								width:"10%",
								render: function(data){
									return '<button id="edit_btn" onclick="editMode(' + data + ')" data-dismiss="modal" class="btn btn-info btn-sm"><i class="fa fa-pencil"></i>Edit</button>'
									+ '<button id="delete_btn" onclick="deleteCenter(' + data + ')" data-dismiss="modal" class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i>Delete</button>';

								}
							}

						],


			"responsive": {
							"details": {
								"display": $.fn.dataTable.Responsive.display.modal({
										"header": function (row) {
											var data = row.data();
											return 'Details for product';
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
			// previewimg(); 
			$('#addCenterModel').modal('show');  //顯示增加展示中心的model
			// validateData();
			e.preventDefault();
			
		})



		//增加商品function  V
		$("#submitadd").click(function (e) {

			var formData = new FormData(document.getElementById("form1"));
			
			// if (checkinputblank() == true) {  //如果要驗證就要把這邊註解打開
				addproduct(formData);
				$(".add_span").html('');
				$(".add_span").next().attr("src", "");
			// } else
			// 	e.stopPropagation();
		});



		// //增加商品的 預覽圖 V
		// function previewimg() {

		// 	$("#file").change(function () {
		// 		if (this.files && this.files[0]) {
		// 			let reader = new FileReader();
		// 			reader.readAsDataURL(this.files[0]);  //readAsDataURL(blob) —— 读取二进制数据，并将其编码为 base64 的 data url。
		// 			// console.log(this);
		// 			reader.onload = function (e) {
		// 				$('#preview_img').attr('src', e.target.result);
		// 			}
					
		// 		}
		// 	});

		// }


		// add center To資料庫 V
		function addproduct(formData) {
			$.ajax({
				url: "/FinalProject/addCenter",
				method: "POST",
				data: formData,
				contentType: false, /// NEEDED, DON'T OMIT THIS (requires jQuery 1.6+)
				processData: false, // NEEDED, DON'T OMIT THIS
				"mimeType": "multipart/form-data",
				success: function (response) {
					console.log("成功");
					$("#form1")[0].reset();
					$('#preview_img').attr('src','');
					table.ajax.reload();
				},
				error: function (err) {
					console.log("失敗");
					console.log(err);
					alert('insert failed:' + err);
				}
			});

		}



		// 刪除商品 V
		function deleteCenter(centerId) {
			console.log('delete id=' + centerId);
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

		// //////////////////////////////////////////////////////////////////////////////////////////////////////////
		// //////////////////////////////////////////////////////////////////////////////////////////////////////////
		// //////////////////////////////////////////////////////////////////////////////////////////////////////////

		// 更新資料function
		$("#edit_submit").click(
			function () {
				// console.log("1111111")
				var updateFormData = new FormData(document.getElementById("edit_form"));
				// console.log("2222222")
				editCenter(updateFormData);
				// console.log("333333333")
			})




		//編輯商品的model
		function editMode(centerId) {
			// console.log("按下按鈕")
			// edit_previewimg();

			let aftersuccess = function (res) {
				$("#edit_centerId").val(res.centerId);
				$("#edit_centerName").val(res.centerName);
				$("#edit_centerPhone").val(res.centerPhone);
				$("#edit_centerEmail").val(res.centerEmail);
				$("#edit_centerAddress").val(res.centerAddress);
				$("#edit_centerOpentime").val(res.centerOpentime);
				$("#edit_centerService").val(res.centerService);
				console.log("0123");
				console.log(res);
				console.log(res.centerId)
				// console.log(res.file);
			}
			findById(centerId, aftersuccess)
			$('#editCenterModal').modal('show');
			$('#editCenterModal').css('overflow-y', 'auto');

		}





		// 修改展示中心model
		function editCenter(updateFormData) {

			$.ajax({
				url: "/FinalProject/updateCenter",
				method: "POST",
				data: updateFormData,
				contentType: false, /// NEEDED, DON'T OMIT THIS (requires jQuery 1.6+)
				processData: false, // NEEDED, DON'T OMIT THIS
				success: function (res) {
					// $("#edit_form")[0].reset();  //把剛剛傳出後的資料清空
					// $('#edit_img').attr('src', '');  //把圖片清空
					table.ajax.reload();
				},
				error: function (err) {
					console.log("失敗");
					alert('update failed' + err);
				}
			});

		}




		// //更新圖片的model
		// function edit_previewimg() {

		// 	$("#edit_file").change(function () {
		// 		if (this.files && this.files[0]) {
		// 			// console.log("1");
		// 			// console.log(this);
		// 			// console.log("12");
		// 			let reader = new FileReader();
		// 			reader.readAsDataURL(this.files[0]);
		// 			reader.onload = function (e) {
		// 				$('#edit_img').attr('src', e.target.result);
		// 				console.log(e.target.result)
		// 			}
		// 		}
		// 	});
		// }




		function findById(centerId, aftersuccess) {
			console.log("findbyid:" + centerId)
			$.ajax({
				url: "/FinalProject/findCenterById/" + centerId,
				method: "GET",
				dataType: "json",
				success: function (res) {
					// console.log("成功")
					// console.log("1")
					// console.log(res)
					// console.log("2")
					// console.log(aftersuccess)
					// console.log("3")
					// console.log(aftersuccess(res))
					aftersuccess(res)

				},
				error: function (err) {
					console.log("findbyid失敗")
					alert(err)
					console.log(err)
				}
			});

		}


		

		// // //Add News Autofill  一鍵自動輸入 
		// // $("#shortcut")
		// // 	.click(
		// // 		function () {

		// // 			var text1 = "Audi 萬人註冊感謝季即刻開跑 敬邀四環車主預約回廠獨享尊榮禮遇";
		// // 			text1 = $("#title").val(text1);
		// // 			var text2 = "自 Audi 行動助理服務上線以來，台灣奧迪即日起至 2021 年 2 月 9 日舉辦「Audi 萬人註冊感謝季」，以回饋車主們一直以來的支持與肯定";
		// // 			text2 = $("#subtitle").val(text2);
		// // 			var text3 = "2021-03-09";
		// // 			text3 = $("#uploaddate").val(text3);
		// // 			var text4 = "自 Audi 行動助理服務上線以來，台灣奧迪即日起至 2021 年 2 月 9 日舉辦「Audi 萬人註冊感謝季」，以回饋車主們一直以來的支持與肯定。凡於活動期間內預約回廠健檢，即可享有免費全車系安全檢查，包括引擎、輪胎、底盤、煞車系統、燈光系統等檢測項目，車輛相關維修及保養另可享 Audi 原廠零件 88 折、輪胎兩條 85 折四條 8 折、風箱清洗優惠價 NT$ 2,288 元 、電瓶以及雨刷片 7 折、原廠配件與精品 85 折等專屬優惠。單次消費金額滿 NT$ 11,888 以上即贈送好禮一份 (數量有限，送完為止)。此外，凡於活動期間加入 Audi 點點入心禮活動並完成「免費行車安全檢查」之所有車主，將可獲得 2021 精緻筆記本。";
		// // 			text4 = $("#content1").val(text4);
		// // 			var text5 = "凡於活動期間內預約回廠車主即可享有多項品牌尊榮優惠禮遇。";
		// // 			text5 = $("#remarks").val(text5);
		// // 		})

		
		



		// //按下送出時再確認一次是否有空白 
		// function checkinputblank() {

		// 	let warning = "請輸入內容";

		// 	let productname = $("#productname").val().trim();
		// 	let quantity = $("#quantity").val().trim();
		// 	let price = $("#price").val().trim();
		// 	let file = $("#file").val();

		// 	if (productname == "" || quantity == "" || price == "" || file == "") {
		// 		if (productname == "") {
		// 			$("#sp1").html(warning).css('color', 'red');
		// 			$("#sp1").next().attr("src", "./images/error.png");
		// 		}
		// 		if (quantity == "") {
		// 			$("#sp2").html(warning).css('color', 'red');
		// 			$("#sp2").next().attr("src", "./images/error.png");
		// 		}
		// 		if (price == "") {
		// 			$("#sp3").html(warning).css('color', 'red');
		// 			$("#sp3").next().attr("src", "./images/error.png");
		// 		}
		// 		if (file == "") {
		// 			$("#sp4").html(warning).css('color', 'red');
		// 			$("#sp4").next().attr("src", "./images/error.png");
		// 		}
		// 		return false;

		// 	}
		// 	return true;
		// }



		
		// //Add product validation 新增商品驗證
		// function validateData() {
		// 	let warning = "請輸入內容";
		// 	$("#productname").blur(function () {

		// 		var productname = $("#productname").val().trim();

		// 		if (productname == "") {
		// 			$("#sp1").html(warning).css('color', 'red');
		// 			$("#sp1").next().attr("src", "./images/error.png");
		// 		} else if (productname != "") {
		// 			$("#sp1").html("");
		// 			$("#sp1").next().attr("src", "./images/greencheck.jpg");
		// 		}

		// 	})
		// 	$("#quantity").blur(function () {

		// 		var quantity = $("#quantity").val().trim();
		// 		if (quantity == "") {
		// 			$("#sp2").html(warning).css('color', 'red');
		// 			$("#sp2").next().attr("src", "./images/error.png");
		// 		} else if (quantity != "") {
		// 			$("#sp2").html("");
		// 			$("#sp2").next().attr("src", "./images/greencheck.jpg");
		// 		}
		// 	})



		// 	$("#price").blur(function () {

		// 		var price = $("#price").val().trim();
		// 		if (price == "") {
		// 			$("#sp3").html(warning).css('color', 'red');
		// 			$("#sp3").next().attr("src", "./images/error.png");
		// 		} else if (price != "") {
		// 			$("#sp3").html("");
		// 			$("#sp3").next().attr("src", "./images/greencheck.jpg");
		// 		}
		// 	})
		// }

		



	</script>

	</html>