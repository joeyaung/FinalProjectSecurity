<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-TW">

<html>
<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  
  <title>服務據點</title>
  
  		<!-- Bootstrap core JavaScript-->
		<script src="/FinalProject/vendor/jquery/jquery.min.js"></script>
		<script src="/FinalProject/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

		<!-- Core plugin JavaScript-->
		<script src="/FinalProject/vendor/jquery-easing/jquery.easing.min.js"></script>

		<!-- Custom scripts for all pages-->
		<script src="/FinalProject/js/sb-admin-2.js"></script>
<!-- ------ -->
		<!-- Page level plugins -->
<!-- 		<script src="/FinalProject/vendor/chart.js/Chart.min.js"></script> -->

		<!-- Page level custom scripts -->
		<script src="/FinalProject/js/inner/chart-area-demo.js"></script>
		<script src="/FinalProject/js/inner/chart-pie-demo.js"></script>
		<script src="/FinalProject/js/inner/adminTemplate.js"></script>
<!-- ------		 -->

		<!-- Page level custom scripts -->		
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

		<!-- Custom styles for this template -->
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
          <h1 class="h3 mb-2 text-gray-800">服務據點總覽</h1>
          <p class="mb-4">服務據點一覽表</p>

          <!-- Content Row -->
          <div class="row">
            <!-- 以下開始替換成你們的內容
                    可放表格, 圖表, 要填的 form 之類的~ -->
            	<!-- "新增"按鈕 -->
				<button id="addRetailerButton" type="submit" class="btn btn-primary">新增服務據點</button> 
				
				<!--Data Table -->
            	<table id="RetailerList" class="table table-striped table-bordered nowrap" style="width: 100%">
                    <thead>
                      <tr>
                        <th>據點名稱</th>
                        <th>Email</th>
                        <th>聯絡電話</th>
                        <th>地址</th>
                        <th>平日服務時間</th>
                        <th>假日服務時間</th>
                        <th>操作</th>
                      </tr>
                    </thead>
                    <tbody>
                      
                    </tbody>
                  </table>
		  </div>
          <!-- End of Content Row -->
          
          
          
          
          
          <!-- "新增表單"的互動視窗 Modal -->
						<div class="modal fade" tabindex="-1" role="dialog" id="editRetailerModal">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title">新增服務據點</h4>
									</div>
									<div class="modal-body">

										<form id="form1">

											<table class="box">
												<tr><td><label for="1name">據點名稱</label></td></tr>
												<tr><td><input class="form-control"
													type="text" aria-label="default input example"
                        							name="retailerName" maxlength="20" id="1name" size="70"
                        							placeholder="e.g. 內湖展示中心" required/><span id="1nameCheck"></span></td></tr>
                        						<tr><td><label for="1tel">聯絡電話</label></td></tr>
												<tr>
													<td><input class="form-control" 
													type="text" aria-label="default input example"
													name="tel" maxlength="20" id="1tel"
													placeholder="e.g. 02-27939191" required/><span id="1telCheck"></span></td></tr>
                        						<tr><td><label for="1mail">E-mail</label></td></tr>
												<tr><td><input class="form-control"
													  type="email" aria-label="default input example"
													  name="email" maxlength="40" id="1mail" 
													  placeholder="e.g. eeit2905@gmail.com" required/><span id="1mailCheck"></span></td></tr>
                        						<tr><td><label for="1loc">地址</label></td></tr>
                        						<tr><td><input class="form-control"
													type="text" aria-label="default input example"
                        							name="location" maxlength="80" id="1loc"
                        							placeholder="e.g. 台北市內湖區新湖三路 288 號" required/><span id="1locCheck"></span></td></tr>
												<tr><td><label for="1workday">平日服務時間</label></td></tr>
												<tr><td><input class="form-control"
													type="text" aria-label="default input example"
                        							name="workday" maxlength="20" id="1workday"
                        							placeholder="e.g. 09:00 - 21:00" required/><span id="1workdayCheck"></span></td></tr>
												<tr><td><label for="1weekend">假日服務時間</label></td></tr>
												<tr><td><input class="form-control"
													type="text" aria-label="default input example"
                        							name="weekend" maxlength="20" id="1weekend"
                        							placeholder="e.g. 10:00 - 20:00" required/><span id="1weekendCheck"></span></td></tr>
											</table>
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">關閉</button>
										<button id="1submit" type="button" data-dismiss="modal"
											class="btn btn-primary">送出</button>
										<button id="1oneKey" type="button" class="btn btn-primary">一鍵輸入</button>
									</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						<!-- /.modal -->
          
          
          
                    <!-- "修改表單"的互動視窗 Modal -->
						<div class="modal fade" tabindex="-1" role="dialog" id="addRetailerModal">
							<div class="modal-dialog" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
										<h4 class="modal-title">修改服務據點</h4>
									</div>
									<div class="modal-body">

										<form id="form2">

											<table class="box">
											<input type="hidden" id="2retailerId" name="retailerId">
												<tr><td><label for="2name">據點名稱</label></td></tr>
												<tr><td><input class="form-control"
													type="text" aria-label="default input example"
                        							name="retailerName" maxlength="20" size="70"
                        							placeholder="e.g. 內湖展示中心" id="2name" required/><span id="2nameCheck"></span></td></tr>
                        						<tr><td><label for="1tel">聯絡電話</label></td></tr>
												<tr>
													<td><input class="form-control" 
													type="text" aria-label="default input example"
													name="tel" maxlength="20" id="2tel"
													placeholder="e.g. 02-27939191" required/><span id="2telCheck"></span></td></tr>
                        						<tr><td><label for="1mail">E-mail</label></td></tr>
												<tr><td><input class="form-control"
													  type="email" aria-label="default input example"
													  name="email" maxlength="40" id="2mail" 
													  placeholder="e.g. eeit2905@gmail.com" required/><span id="2mailCheck"></span></td></tr>
                        						<tr><td><label for="1loc">地址</label></td></tr>
                        						<tr><td><input class="form-control"
													type="text" aria-label="default input example"
                        							name="location" maxlength="80" id="2loc"
                        							placeholder="e.g. 台北市內湖區新湖三路 288 號" required/><span id="2locCheck"></span></td></tr>
												<tr><td><label for="1workday">平日服務時間</label></td></tr>
												<tr><td><input class="form-control"
													type="text" aria-label="default input example"
                        							name="workday" maxlength="20" id="2workday"
                        							placeholder="e.g. 09:00 - 21:00" required/><span id="2workdayCheck"></span></td></tr>
												<tr><td><label for="1weekend">假日服務時間</label></td></tr>
												<tr><td><input class="form-control"
													type="text" aria-label="default input example"
                        							name="weekend" maxlength="20" id="2weekend"
                        							placeholder="e.g. 10:00 - 20:00" required/><span id="2weekendCheck"></span></td></tr>
											</table>
										</form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">關閉</button>
										<button id="2submit" type="button" data-dismiss="modal"
											class="btn btn-primary">確認修改</button>
										<button id="2oneKey" type="button" class="btn btn-primary">一鍵輸入</button>
									</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						<!-- /.modal -->
          
          
          
          
          
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
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
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
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>

	
</body>
<!-- 	<script src="/FinalProject/js/Formpage.js"></script> -->
<script>

		var table;
		$(function () {
			createdatatable();
		});
		//datatable 
		function createdatatable() {
			table = $("#RetailerList").DataTable({
				responsive: true,
				
				ajax:{
					url: "/FinalProject/getAllRetailer",
					dataSrc: ""
				},

				rowId: "tel",
				
				columns:[					
					{data: "retailerName"},
					{data: "tel"},
					{data: "email"},
					{data: "location"},
					{data: "workday"},
					{data: "weekend"},
					{data: "retailerId"}
				],
				
				
				columnDefs:[{
					targets: 6,
					orderable: false, // 禁用排序
					defaultContent: "",
					width: "10%",
					render: function (data) {
						return '<button id="' + data + '" onclick="editModal(this.id)"  data-dismiss="modal" class="btn btn-info btn-sm"><i class="fa fa-pencil"></i>Edit</button>'
						+ '<button id="' + data + '" onclick="deleteRetailer(this.id)"  data-dismiss="modal" class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i>Delete</button>';
					}
				}],

// 				initComplete: function () {
// 						console.log("table created");
// 						$(".btn-info").on("click", function (e) {
// 							console.log("button clicked");
// 							console.log(e.target.id);
// 							editModal(e.target.id)});						
// 						$(".btn-danger").on("click", function (e) {
// 							console.log("button clicked2");
// 							deleteModal(e.target.id)});
// 				},
				
				responsive: {
					details: {
						display: $.fn.dataTable.Responsive.display.modal({
								header: function (row) {
									var data = row.data();
									return 'Details for Retailer';
								}
						}),
						renderer: $.fn.dataTable.Responsive.renderer.tableAll({
								tableClass: 'table'
						})
					}
				},

				

				
			})
		}

        
		// "新增"按鈕叫出 Modal
		$('#addRetailerButton').click(function (e) {
			e.preventDefault();
			$('#addRetailerModal').modal('show');
			$('#addRetailerModal').css('overflow-y', 'auto');
		})		
		
		
		// 1送出前總檢查 2一鍵輸入  3送出
// 總檢查!!!!!有問題!!!!!
		function checkbeforeAdd(){
			let name1 = $("#1name").val().trim();
			let tel1 = $("#1tel").val().trim();
			let mail1 = $("#1mail").val().trim();
			let loc1 = $("#1loc").val().trim();
			let workday1 = $("#1workday").val().trim();
			let weekend1 = $("#1weekend").val().trim();
			console.log(name1)
			if (name1 == "" || tel1 == "" || mail1 == "" || loc1 == "" || workday1 == "" || weekend1 == "") {
				if (name1 == "") {
					console.log(name1)
					$("#1nameCheck").html(warning).css('color', 'red');
					$("#1nameCheck").next().attr("src", "../images/error.png");
				}
				if (tel1 == "") {
					$("#1telCheck").html(warning).css('color', 'red');
					$("#1telCheck").next().attr("src", "../images/error.png");
				}
				if (mail1 == "") {
					$("#1mailCheck").html(warning).css('color', 'red');
					$("#1mailCheck").next().attr("src", "../images/error.png");
				}
				if (loc1 == "") {
					$("#1locCheck").html(warning).css('color', 'red');
					$("#1locCheck").next().attr("src", "../images/error.png");
				}
				if (workday1 == "") {
					$("#1workdayCheck").html(warning).css('color', 'red');
					$("#1workdayCheck").next().attr("src", "../images/error.png");
				}
				if (weekend1 == "") {
					$("#1weekendCheck").html(warning).css('color', 'red');
					$("#1weekendCheck").next().attr("src", "../images/error.png");
				}
				return false;
			}else {
				return true;
			}
		}
		
		// execute add retailer
		function addretailer(formData) {
			$.ajax({
				url: "/FinalProject/addRetailer",
				method: "POST",
				data: formData,
				contentType: false, /// NEEDED, DON'T OMIT THIS (requires jQuery 1.6+)
				processData: false, // NEEDED, DON'T OMIT THIS
				"mimeType": "JSON/form-data",
				success: function (response) {
					$("#form1")[0].reset();
					table.ajax.reload();
				},
				error: function (err) {
					console.log(err);
					alert('insert failed:' + err);
				}
			});

		}
		
		$('#1submit').click(function(e){
			var formData = new FormData(document.getElementById("form1"));

			if (checkbeforeAdd() == true) {
				addretailer(formData);
// 				$(".add_span").html('');
			} else{
				e.stopPropagation();
			}
		});

		
		
		
		
		
		
		
		//Delete Retailer
		function deleteRetailer (retailerId) {
			console.log('delete id=' + retailerId);
			Swal.fire({
				title: 'Are you sure?',
				text: "You won't be able to revert this!",
				icon: 'warning',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: 'Yes, delete it!'
			}).then((result) => {
				if (result.isConfirmed) {
					$.ajax({
						url: "/FinalProject/deleteByIdRetailerAPI/" + retailerId,
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
						'Deleted!',
						'Your file has been deleted.',
						'success'
					)
				}
			})
		}
		
		
		
		
		// 修改
		function editModal(retailerId) {
			$('#form2')[0].reset();
	console.log(jQuery.type(retailerId))

			let fillWithOrigin = function (res) {
		console.log(res.retailerId + res.retailerName)
				$("#2retailerId").val(res.retailerId);
		console.log(2)
				$("#2name").val(res.retailerName);
		console.log(3)
				$("#2tel").val(res.tel);
		console.log(4)
				$("#2mail").val(res.email);
				$("#2loc").val(res.location);
				$("#2workday").val(res.workday);
				$("#2weekend").val(res.weekend);
			}
	
			findById(retailerId, fillWithOrigin)
			$('#editRetailerModal').modal('show');
			$('#editRetailerModal').css('overflow-y', 'auto');
		}

		
		// 啟用"修改"按鈕前置準備，尋找單筆
		function findById(retailerId, fillWithOrigin) {
			console.log("findbyid:  "+retailerId)
			$.ajax({
				url: "/FinalProject/findByIdRetailerAPI/" + retailerId,
				method: "GET",
				dataType: "json",
				success: function (res) {
					console.log("findbyid success")	
					fillWithOrigin(res)
				},
				error: function (err) {
					alert(err)
				}
			});
		}	
		
		// 總檢查
		function checkAll2(){
			return true;
		}
		
		// 點"確認修改"前先執行總檢查，再執行送出的Ajax
		$("#2submit").click(function (e) {			
//    var formData = new FormData(document.getElementById("form2"));
    		if (checkAll2() == true) {
    			editRetailer();
    		} else
        		e.stopPropagation();
		});

		// 確認修改送出
// 		測試
		function editRetailer () {
			var editRetailerFormData = new FormData($('#form2')[0]);
			console.log('確認修改click')				
			$.ajax({
				url: "/FinalProject/updateRetailerAPI",
				method: "POST",
				data: editRetailerFormData,
				contentType: false,
				processData: false,
				success: function (res) {
					console.log('edit success');
					$("#form2")[0].reset();   // 修改的model清空
					table.ajax.reload();     // data table刷新
				},
				error: function (err) {
					alert('update failed' + err);
				}
			});
		}
		
		
		
          

</script>
</html>