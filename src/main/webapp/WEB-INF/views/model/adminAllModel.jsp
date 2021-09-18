<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-TW">

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>Audi - 車型管理</title>
  <link rel="icon" type="image/x-icon" href="/FinalProject/images/favicon.png?v=2" />
  		<!-- Bootstrap core JavaScript-->
		<script src="/FinalProject/vendor/jquery/jquery.min.js"></script>
		<script src="/FinalProject/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

		<!-- Core plugin JavaScript-->
		<script src="/FinalProject/vendor/jquery-easing/jquery.easing.min.js"></script>

		<!-- Custom scripts for all pages-->
		<script src="/FinalProject/js/sb-admin-2.js"></script>

		<!-- Page level plugins -->

		<!-- Page level custom scripts -->
		<script src="/FinalProject/js/inner/chart-area-demo.js"></script>
		<script src="/FinalProject/js/inner/chart-pie-demo.js"></script>

		<!-- Page level custom scripts -->		

		
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
      		
		<!-- Page level plugins -->
		<link rel="stylesheet" href="/FinalProject/css/adminModel.css"/>
		<style type="text/css">
			
		</style>
	</head>
<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">
      <!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">
			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="/FinalProject/inner">
				<div class="sidebar-brand-icon">
					<img src="/FinalProject/images/audi-logo.png" alt="" />
				</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0" />

			<!-- Nav Item - Dashboard -->
<!-- 			<li class="nav-item"><a class="nav-link" -->
<!-- 				href="/FinalProject/inner"> <i -->
<!-- 					class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span></a></li> -->

			<!-- Divider -->
<!-- 			<hr class="sidebar-divider" /> -->

			<!-- Heading -->
<!-- 			<div class="sidebar-heading">Analytics</div> -->

			<!-- Nav Item - Pages Collapse Menu -->
<!-- 			<li class="nav-item"><a class="nav-link collapsed" href="#" -->
<!-- 				data-toggle="collapse" data-target="#collapseTwo" -->
<!-- 				aria-expanded="true" aria-controls="collapseTwo"> <i -->
<!-- 					class="fas fa-users"></i> <span>Client</span> -->
<!-- 			</a> -->
<!-- 				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" -->
<!-- 					data-parent="#accordionSidebar"> -->
<!-- 					<div class="bg-white py-2 collapse-inner rounded"> -->
<!-- 						<h6 class="collapse-header">Clients:</h6> -->
<!-- 						<a class="collapse-item" href="buttons.html">Overview</a> <a -->
<!-- 							class="collapse-item" href="cards.html">Curent Stage</a> -->
<!-- 					</div> -->
<!-- 				</div></li> -->

			<!-- Nav Item - Utilities Collapse Menu -->
<!-- 			<li class="nav-item"><a class="nav-link collapsed" href="#" -->
<!-- 				data-toggle="collapse" data-target="#collapseUtilities" -->
<!-- 				aria-expanded="true" aria-controls="collapseUtilities"> -->
<!-- 					<i class="fas fa-id-card-alt"></i> <span>Employee</span> -->
<!-- 			</a> -->
<!-- 				<div id="collapseUtilities" class="collapse" -->
<!-- 					aria-labelledby="headingUtilities" data-parent="#accordionSidebar"> -->
<!-- 					<div class="bg-white py-2 collapse-inner rounded"> -->
<!-- 						<h6 class="collapse-header">Employee:</h6> -->
<!-- 						<a class="collapse-item" href="utilities-color.html">Overview</a> -->
<!-- 						<a class="collapse-item" href="utilities-border.html">Sales</a> -->
<!-- 					</div> -->
<!-- 				</div></li> -->

			<!-- Divider -->
			<hr class="sidebar-divider" />

			<!-- Heading -->
			<div class="sidebar-heading">FUNCTIONS</div>

			<!-- Nav Item - 新增員工 -->
			<li class="nav-item"><a class="nav-link" href="/FinalProject/inner/admin/addEmployee"> <i
				class="fas fa-user-plus"></i> <span>新增員工</span></a></li>

			<!-- Nav Item - 試駕總覽 -->
			<li class="nav-item"><a class="nav-link" href="/FinalProject/inner/admin/edit/testdrive"> <i 
				class="fas fa-car"></i> <span>試駕總覽</span></a></li>
				
			<!-- Nav Item - 車型總覽 -->
			<li class="nav-item active"><a class="nav-link" href="/FinalProject/inner/admin/edit/model"> <i 
				class="fas fa-car-side"></i> <span>車型總覽</span></a></li>	

			<!-- Nav Item - 編輯消息 -->
			<li class="nav-item"><a class="nav-link" href="/FinalProject/inner/admin/AllNewsPage"> <i
				class="fas fa-rss-square"></i> <span>編輯消息</span></a></li>

			<!-- Nav Item - 活動表單 -->
			<li class="nav-item"><a class="nav-link" href="/FinalProject/inner/admin/AllEventForm"> <i
				class="fas fa-rss-square"></i> <span>活動報名表單</span></a></li>

			<!-- Nav Item - 活動報名統計-->
			<li class="nav-item"><a class="nav-link" href="/FinalProject/inner/admin/EventDashboard"> <i
				class="fas fa-rss-square"></i> <span>活動報名統計</span></a></li>

			<!-- Nav Item - 編輯商品 -->
			<li class="nav-item"><a class="nav-link" href="/FinalProject/inner/admin/products"> <i
				class="fas fa-store-alt"></i> <span>商品管理</span></a></li>

			<!-- Nav Item - 訂單管理 -->
			<li class="nav-item"><a class="nav-link" href="/FinalProject/inner/admin/orders"> <i
				class="fas fa-shopping-cart"></i> <span>訂單管理</span></a></li>

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
<!--                 <a -->
<!--                   class="nav-link dropdown-toggle" -->
<!--                   href="#" -->
<!--                   id="alertsDropdown" -->
<!--                   role="button" -->
<!--                   data-toggle="dropdown" -->
<!--                   aria-haspopup="true" -->
<!--                   aria-expanded="false" -->
<!--                 > -->
<!--                   <i class="fas fa-bell fa-fw"></i> -->
<!--                   Counter - Alerts -->
<!--                   <span class="badge badge-danger badge-counter">3+</span> -->
<!--                 </a> -->
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

<!--               <div class="topbar-divider d-none d-sm-block"></div> -->

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
          <h1 class="h3 mb-2 text-gray-800">車型總覽 Car Model DashBoard</h1>
          <p class="mb-4">所有車型總覽</p>

          <!-- Content Row -->
          <div class="row">
            <!-- 以下開始替換成你們的內容
                    可放表格, 圖表, 要填的 form 之類的~ -->
            	<!-- "新增"按鈕 -->
				<button id="addModelButton" type="submit" class="btn btn-primary" style="margin-left: 15px;"
					>新增車型</button> 
				
				<!--Data Table -->
            	<table id="ModelList" class="table table-striped table-bordered nowrap" style="width: 100%">
                    <thead>
                      <tr>
                        <th>車型</th>
                        <th>外觀</th>
                        <th>內裝</th>
                        <th>背景</th>
                        <th>參考售價</th>
                        <th>引擎動力</th>
                        <th>排氣量</th>
                        <th>馬力</th>
                        <th>扭力</th>
                        <th>油耗</th>
                        <th>乘坐人數</th>
                        <th>標語</th>
                        <th>描述</th>
                        <th>angle_1</th>
                        <th>angle_4</th>
                        <th>angle_7</th>
                        <th>angle_10</th>
                        <th>angle_13</th>
                        <th>angle_16</th>
                        <th>angle_19</th>
                        <th>操作</th>
                      </tr>
                    </thead>
                    <tbody id="tbody_showform">
                      
                    </tbody>
                  </table>
		  </div>
          <!-- End of Content Row -->
          
        
    	    <!-- "新增車型"的互動視窗 Modal -->
			<div class="modal fade" tabindex="-1" role="dialog" id="addModelModal">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">新增車型</h4>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">

							<form id="form1">

								<table class="box add-edit-ModelTable">
<!-- 									<tr><td colspan="2"><label for="1modelType">車型</label></td></tr> -->
<!-- 									<tr><td colspan="2"> -->
<!-- 											<input class="form-control" size="60" -->
<!-- 												  type="text" aria-label="default input example" -->
<!--                        							  name="modelType" maxlength="10" id="1modelType" -->
<!--                        							  placeholder="請輸入車型" required/><span id="1modelTypeCheck"></span><img src=""></td></tr> -->
											
<!-- 									<tr><td colspan="2"><br/><label for="1price">參考售價</label></td> -->
<!-- 									<tr><td colspan="2"> -->
<!-- 											<input class="form-control" -->
<!-- 												  type="text" aria-label="default input example" -->
<!--                   								  name="price" maxlength="10" id="1price" -->
<!--                    								  placeholder="請輸入參考售價" required/><span id="1priceCheck"></span><img src=""></td></tr> -->
                        			
									<tr><td><label for="1modelType">車型</label></td>
									    <td><label for="1price">參考售價</label></td>
									<tr>
										<td><input class="form-control" size="60"
												  type="text" aria-label="default input example"
                       							  name="modelType" maxlength="10" id="1modelType"
                       							  placeholder="請輸入車型" required/><span id="1modelTypeCheck"></span><img src=""></td>
										<td><input class="form-control"
												  type="text" aria-label="default input example"
                  								  name="price" maxlength="10" id="1price"
                   								  placeholder="請輸入參考售價" required/><span id="1priceCheck"></span><img src=""></td></tr>
                        			
<!--                   					<tr><td colspan="2"><br/><label for="1engineType">引擎動力</label></td></tr> -->
<!-- 									<tr><td colspan="2"> -->
<!-- 											<input class="form-control" -->
<!-- 												  type="text" aria-label="default input example" -->
<!--                         						  name="engineType" maxlength="10" id="1engineType" -->
<!--                         						  placeholder="請輸入引擎類型" required/><span id="1engineTypeCheck"></span><img src=""></td></tr> -->
                        						
<!--                         			<tr><td colspan="2"><br/><label for="1displacement">排氣量</label></td> -->
<!-- 									<tr><td colspan="2"> -->
<!-- 											<input class="form-control" -->
<!-- 												  type="text" aria-label="default input example" -->
<!--                         						  name="engineDisplacement" maxlength="10" id="1displacement" -->
<!--                         						  placeholder="請輸入排氣量" required/><span id="1displacementCheck"></span><img src=""></td></tr> -->

									<tr><td><br/><label for="1engineType">引擎動力</label></td>
									    <td><br/><label for="1displacement">引擎排氣量</label></td></tr>
									<tr>
										<td><input class="form-control"
												  type="text" aria-label="default input example"
                        						  name="engineType" maxlength="10" id="1engineType"
                        						  placeholder="請輸入引擎類型" required/><span id="1engineTypeCheck"></span><img src=""></td>
										<td><input class="form-control"
												  type="text" aria-label="default input example"
                        						  name="engineDisplacement" maxlength="10" id="1displacement"
                        						  placeholder="請輸入引擎排氣量" required/><span id="1displacementCheck"></span><img src=""></td></tr>

<!--                         			<tr><td colspan="2"><br/><label for="1power">馬力</label></td> -->
<!-- 									<tr><td colspan="2"> -->
<!-- 											<input class="form-control" -->
<!-- 												  type="text" aria-label="default input example" -->
<!--                         						  name="power" maxlength="10" id="1power" -->
<!--                         						  placeholder="請輸入馬力" required/><span id="1powerCheck"></span><img src=""></td></tr> -->

<!--                         			<tr><td colspan="2"><br/><label for="1torque">扭力</label></td> -->
<!-- 									<tr><td colspan="2"> -->
<!-- 											<input class="form-control" -->
<!-- 												  type="text" aria-label="default input example" -->
<!--                         						  name="torque" maxlength="10" id="1torque" -->
<!--                         						  placeholder="請輸入扭力" required/><span id="1torqueCheck"></span><img src=""></td></tr> -->

									<tr><td><br/><label for="1power">馬力</label></td>
									    <td><br/><label for="1torque">扭力</label></td></tr>
									<tr><td><input class="form-control"
												  type="text" aria-label="default input example"
                        						  name="power" maxlength="10" id="1power"
                        						  placeholder="請輸入馬力" required/><span id="1powerCheck"></span><img src=""></td>
										<td><input class="form-control"
												  type="text" aria-label="default input example"
                        						  name="torque" maxlength="10" id="1torque"
                        						  placeholder="請輸入扭力" required/><span id="1torqueCheck"></span><img src=""></td></tr>


									<tr><td><br/><label for="1consumption">油耗</label></td>
									    <td><br/><label for="1seat">乘坐人數</label></td></tr>
									<tr><td><input class="form-control"
											   type="text" aria-label="default input example"
                        					   name="consumption" maxlength="10" id="1consumption"
                        					   placeholder="請輸入油耗" required/><span id="1consumptionCheck"></span><img src=""></td>
										<td><input class="form-control"
												  type="text" aria-label="default input example"
                        						  name="seat" maxlength="10" id="1seat"
                        						  placeholder="請輸入乘坐人數" required/><span id="1seatCheck"></span><img src=""></td></tr>


<!--                         			<tr><td colspan="2"><br/><label for="1consumption">油耗</label></td> -->
<!-- 									<tr><td colspan="2"> -->
<!-- 										<input class="form-control" -->
<!-- 											   type="text" aria-label="default input example" -->
<!--                         					   name="consumption" maxlength="10" id="1consumption" -->
<!--                         					   placeholder="請輸入油耗" required/><span id="1consumptionCheck"></span><img src=""></td></tr> -->

<!--                         			<tr><td colspan="2"><br/><label for="1seat">乘坐人數</label></td> -->
<!-- 									<tr><td colspan="2"> -->
<!-- 											<input class="form-control" -->
<!-- 												  type="text" aria-label="default input example" -->
<!--                         						  name="seat" maxlength="10" id="1seat" -->
<!--                         						  placeholder="請輸入乘坐人數" required/><span id="1seatCheck"></span><img src=""></td></tr> -->
                        						
                        			<tr><td colspan="2"><br/><label for="1subtitle">標語</label></td></tr>
									<tr><td colspan="2">
											<textarea class="form-control" style="resize: none" maxlength="50" id="1subtitle" rows="5" cols="30" name="subtitle" 
													placeholder="標語字數限制50字" required></textarea><span style="left:auto; color:red" id="1subtitleCheck"></span><img src=""></td></tr>
									
									<tr><td colspan="2"><br/><label for="1description">描述</label></td></tr>
									<tr><td colspan="2">
											<textarea class="form-control" style="resize: none" maxlength="200" id="1description" rows="5" cols="30" name="description" 
													placeholder="備註字數限制200字" required></textarea><span style="left:auto; color:red" id="1descriptionCheck"></span><img src=""></td></tr>
										
									<tr><td><label for="1outer">外觀</label></td>
									    <td><label for="1inner">內裝</label></td></tr>
									<tr>
										<td>
											<div class="image">
<!-- 												<img class="myitem" id="1preview_outer" width="200" height="200" /> -->
												<img class="myitem" id="1preview_outer" height="150" />
											</div> 
											<input id="1outer" type="file" name="outerFile" /> 
											<span id="1outerCheck" style="width: 10px;"></span> <img src=""></td>
										<td>
											<div class="image w210">
<!-- 												<img class="myitem" id="1preview_inner" width="200" height="200" /> -->
												<img class="myitem" id="1preview_inner" height="150" />
											</div> 
											<input id="1inner" type="file" name="innerFile" /> 
											<span id="1innerCheck" style="width: 10px;"></span> <img src=""></td></tr><tr></tr>
                        					
                        			<tr class="border-top"><td><label for="1bg">背景</label></td>
                        				<td><label for="1an1">angle_1</label></td></tr>
									<tr>
										<td>
											<div class="image">
<!-- 												<img class="myitem" id="1preview_bg" width="200" height="200" /> -->
												<img class="myitem" id="1preview_bg" height="150" />
											</div> 
											<input id="1bg" type="file" name="backgroundFile" /> 
											<span id="1bgCheck" style="width: 10px;"></span> <img src=""></td>
										<td>
											<div class="image w210">
<!-- 												<img class="myitem" id="1preview_an1" width="200" height="200" /> -->
												<img class="myitem" id="1preview_an1" height="150" />
											</div> 
											<input id="1an1" type="file" name="angle1File" /> 
											<span id="1an1Check" style="width: 10px;"></span> <img src=""></td></tr><tr></tr>
												
														
                        			<tr class="border-top"><td><label for="1an4">angle_4</label></td>
                        				<td><label for="1an7">angle_7</label></td></tr>
									<tr>
										<td>
											<div class="image">
<!-- 												<img class="myitem" id="1preview_an4" width="200" height="200" /> -->
												<img class="myitem" id="1preview_an4" height="150" />
											</div> 
											<input id="1an4" type="file" name="angle4File" /> 
											<span id="1an4Check" style="width: 10px;"></span> <img src=""></td>
										<td>
											<div class="image w210">
<!-- 												<img class="myitem" id="1preview_an7" width="200" height="200" /> -->
												<img class="myitem" id="1preview_an7" height="150" />
											</div> 
											<input id="1an7" type="file" name="angle7File" /> 
											<span id="1an7Check" style="width: 10px;"></span> <img src=""></td></tr><tr></tr>
														
														
                        			<tr class="border-top"><td><label for="1an10">angle_10</label></td>
                        				<td><label for="1an13">angle_13</label></td></tr>
									<tr>
										<td>
											<div class="image">
<!-- 												<img class="myitem" id="1preview_an10" width="200" height="200" /> -->
												<img class="myitem" id="1preview_an10" height="150" />
											</div> 
											<input id="1an10" type="file" name="angle10File" /> 
											<span id="1an10Check" style="width: 10px;"></span> <img src=""></td>
										<td>
											<div class="image w210">
<!-- 												<img class="myitem" id="1preview_an13" width="200" height="200" /> -->
												<img class="myitem" id="1preview_an13" height="150" />
											</div> 
											<input id="1an13" type="file" name="angle13File" /> 
											<span id="1an13Check" style="width: 10px;"></span> <img src=""></td></tr><tr></tr>
														
														
                        			<tr class="border-top"><td><label for="1an16">angle_16</label></td>
                        				<td><label for="1an19">angle_19</label></td></tr>
									<tr>
										<td>
											<div class="image">
<!-- 												<img class="myitem" id="1preview_an16" width="200" height="200" /> -->
												<img class="myitem" id="1preview_an16" height="150" />
											</div> 
											<input id="1an16" type="file" name="angle16File" /> 
											<span id="1an16Check" style="width: 10px;"></span> <img src=""></td>
										<td>
											<div class="image w210">
<!-- 												<img class="myitem" id="1preview_an19" width="200" height="200" /> -->
												<img class="myitem" id="1preview_an19" height="150" />
											</div> 
											<input id="1an19" type="file" name="angle19File" /> 
											<span id="1an19Check" style="width: 10px;"></span> <img src=""></td></tr><tr></tr>						
										
									<tr><td><span style="left: auto;color:red" id="1submitcheck"></span></td></tr>
																							
								</table>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
									data-dismiss="modal">關閉</button>
							<button id="1submit" type="button" data-dismiss="modal"
									class="btn btn-primary">送出</button>
							<button id="1oneKey" type="button" class="btn btn-secondary">一鍵輸入</button>
						</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->
            

          <!-- "修改車型"的互動視窗 Modal -->
			<div class="modal fade" tabindex="-1" role="dialog" id="editModelModal">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">修改車型資訊</h4>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">

							<form id="form2">

								<table class="box add-edit-ModelTable">
                        			
									<tr><td><label id="2modelType">車型</label><input type="hidden" name="modelType" id="2hideId" value=""></td>
									    <td><label for="2price">參考售價</label></td>
									<tr><td><label id="2showId" style="font-size: large"></label></td>
										<td><input class="form-control"
												  type="text" aria-label="default input example"
                  								  name="price" maxlength="10" id="2price"
                   								  placeholder="請輸入參考售價" required/><span id="2priceCheck"></span><img src=""></td></tr>
                        			
									<tr><td><br/><label for="2engineType">引擎動力</label></td>
									    <td><br/><label for="2displacement">引擎排氣量</label></td></tr>
									<tr><td><input class="form-control"
												  type="text" aria-label="default input example"
                        						  name="engineType" maxlength="10" id="2engineType"
                        						  placeholder="請輸入引擎類型" required/><span id="2engineTypeCheck"></span><img src=""></td>
										<td><input class="form-control"
												  type="text" aria-label="default input example"
                        						  name="engineDisplacement" maxlength="10" id="2displacement"
                        						  placeholder="請輸入引擎排氣量" required/><span id="2displacementCheck"></span><img src=""></td></tr>

									<tr><td><br/><label for="2power">馬力</label></td>
									    <td><br/><label for="2torque">扭力</label></td></tr>
									<tr><td><input class="form-control"
												  type="text" aria-label="default input example"
                        						  name="power" maxlength="10" id="2power"
                        						  placeholder="請輸入馬力" required/><span id="2powerCheck"></span><img src=""></td>
										<td><input class="form-control"
												  type="text" aria-label="default input example"
                        						  name="torque" maxlength="10" id="2torque"
                        						  placeholder="請輸入扭力" required/><span id="2torqueCheck"></span><img src=""></td></tr>


									<tr><td><br/><label for="2consumption">油耗</label></td>
									    <td><br/><label for="2seat">乘坐人數</label></td></tr>
									<tr><td><input class="form-control"
											   type="text" aria-label="default input example"
                        					   name="consumption" maxlength="10" id="2consumption"
                        					   placeholder="請輸入油耗" required/><span id="2consumptionCheck"></span><img src=""></td>
										<td><input class="form-control"
												  type="text" aria-label="default input example"
                        						  name="seat" maxlength="10" id="2seat"
                        						  placeholder="請輸入乘坐人數" required/><span id="2seatCheck"></span><img src=""></td></tr>
                        						
                        			<tr><td colspan="2"><br/><label for="2subtitle">標語</label></td></tr>
									<tr><td colspan="2">
											<textarea class="form-control" style="resize: none" maxlength="50" id="2subtitle" rows="5" cols="30" name="subtitle" 
													placeholder="標語字數限制50字" required></textarea><span style="left:auto; color:red" id="2subtitleCheck"></span><img src=""></td></tr>
									
									<tr><td colspan="2"><br/><label for="2description">描述</label></td></tr>
									<tr><td colspan="2">
											<textarea class="form-control" style="resize: none" maxlength="200" id="2description" rows="5" cols="30" name="description" 
													placeholder="備註字數限制200字" required></textarea><span style="left:auto; color:red" id="2descriptionCheck"></span><img src=""></td></tr>
									
									
									<tr><td colspan="2" style="text-align:center"><br/><label>圖片修改僅選擇需修改的圖片上傳即可</label></td></tr>
									
									
									<tr><td><label for="2outer">外觀</label></td>
									    <td><label for="2inner">內裝</label></td></tr>
									<tr>
										<td>
											<div class="image">
<!-- 												<img class="myitem" id="2preview_outer" width="200" height="200" /> -->
												<img class="myitem" id="2preview_outer" height="150" />
											</div> 
											<input id="2outer" type="file" name="outerFile" /> 
											<span id="2outerCheck" style="width: 10px;"></span> <img src=""></td>
										<td>
											<div class="image w210">
<!-- 												<img class="myitem" id="2preview_inner" width="200" height="200" /> -->
												<img class="myitem" id="2preview_inner" height="150" />
											</div> 
											<input id="2inner" type="file" name="innerFile" /> 
											<span id="2innerCheck" style="width: 10px;"></span> <img src=""></td></tr><tr></tr>
                        					
                        			<tr class="border-top"><td><label for="2bg">背景</label></td>
                        				<td><label for="2an1">angle_1</label></td></tr>
									<tr>
										<td>
											<div class="image">
<!-- 												<img class="myitem" id="2preview_bg" width="200" height="200" /> -->
												<img class="myitem" id="2preview_bg" height="150" />
											</div> 
											<input id="2bg" type="file" name="backgroundFile" /> 
											<span id="2bgCheck" style="width: 10px;"></span> <img src=""></td>
										<td>
											<div class="image w210">
<!-- 												<img class="myitem" id="2preview_an1" width="200" height="200" /> -->
												<img class="myitem" id="2preview_an1" height="150" />
											</div> 
											<input id="2an1" type="file" name="angle1File" /> 
											<span id="2an1Check" style="width: 10px;"></span> <img src=""></td></tr><tr></tr>
												
														
                        			<tr class="border-top"><td><label for="2an4">angle_4</label></td>
                        				<td><label for="2an7">angle_7</label></td></tr>
									<tr>
										<td>
											<div class="image">
<!-- 												<img class="myitem" id="2preview_an4" width="200" height="200" /> -->
												<img class="myitem" id="2preview_an4" height="150" />
											</div> 
											<input id="2an4" type="file" name="angle4File" /> 
											<span id="2an4Check" style="width: 10px;"></span> <img src=""></td>
										<td>
											<div class="image w210">
<!-- 												<img class="myitem" id="2preview_an7" width="200" height="200" /> -->
												<img class="myitem" id="2preview_an7" height="150" />
											</div> 
											<input id="2an7" type="file" name="angle7File" /> 
											<span id="2an7Check" style="width: 10px;"></span> <img src=""></td></tr><tr></tr>
														
														
                        			<tr class="border-top"><td><label for="2an10">angle_10</label></td>
                        				<td><label for="2an13">angle_13</label></td></tr>
									<tr>
										<td>
											<div class="image">
<!-- 												<img class="myitem" id="2preview_an10" width="200" height="200" /> -->
												<img class="myitem" id="2preview_an10" height="150" />
											</div> 
											<input id="2an10" type="file" name="angle10File" /> 
											<span id="2an10Check" style="width: 10px;"></span> <img src=""></td>
										<td>
											<div class="image w210">
<!-- 												<img class="myitem" id="2preview_an13" width="200" height="200" /> -->
												<img class="myitem" id="2preview_an13" height="150" />
											</div> 
											<input id="2an13" type="file" name="angle13File" /> 
											<span id="2an13Check" style="width: 10px;"></span> <img src=""></td></tr><tr></tr>
														
														
                        			<tr class="border-top"><td><label for="2an16">angle_16</label></td>
                        				<td><label for="2an19">angle_19</label></td></tr>
									<tr>
										<td>
											<div class="image">
<!-- 												<img class="myitem" id="2preview_an16" width="200" height="200" /> -->
												<img class="myitem" id="2preview_an16" height="150" />
											</div> 
											<input id="2an16" type="file" name="angle16File" /> 
											<span id="2an16Check" style="width: 10px;"></span> <img src=""></td>
										<td>
											<div class="image w210">
<!-- 												<img class="myitem" id="2preview_an19" width="200" height="200" /> -->
												<img class="myitem" id="2preview_an19" height="150" />
											</div> 
											<input id="2an19" type="file" name="angle19File" /> 
											<span id="2an19Check" style="width: 10px;"></span> <img src=""></td></tr><tr></tr>						
										
									<tr><td><span style="left: auto;color:red" id="2submitcheck"></span></td></tr>
																							
								</table>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
									data-dismiss="modal">關閉</button>
							<button id="2submit" type="button" data-dismiss="modal"
									class="btn btn-primary">送出</button>
							<button id="2oneKey" type="button" class="btn btn-secondary">一鍵輸入</button>
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
			table = $("#ModelList").DataTable({
				responsive: true,
				
				ajax:{
					url: "/FinalProject/getAllModel",
					dataSrc: ""
				},

				rowId: "modelType",
				
				columns:[					
					{data: "modelType", responsivePriority:1},
					{data: "outerBase64Image", responsivePriority:2, width: 40,
						render: function (data) {
							return "<img src='data:image/png;base64," + data + "' width='120' alt='pic cannot be displayed'/>"
						}},
					{data: "innerBase64Image", responsivePriority:3, width: 40,
						render: function (data) {
							return "<img src='data:image/png;base64," + data + "' width='120' alt='pic cannot be displayed'/>"
						}},
					{data: "backgroundBase64Image", responsivePriority:3, width: 40,
						render: function (data) {
							return "<img src='data:image/png;base64," + data + "' width='120' alt='pic cannot be displayed'/>"
						}},
					{data: "price", responsivePriority:7},
					{data: "engineType", responsivePriority:5},
					{data: "engineDisplacement", responsivePriority:6},
					{data: "power", responsivePriority:10},
					{data: "torque", responsivePriority:11},
					{data: "consumption", responsivePriority:9},
					{data: "seat"},
					{data: "subtitle"},
					{data: "description"},
					{data: "angle1Base64Image", width: 40,
						render: function (data) {
							return "<img src='data:image/png;base64," + data + "' width='120' loading='lazy'  alt='pic cannot be displayed'/>"
						}},
					{data: "angle4Base64Image", width: 40,
						render: function (data) {
							return "<img src='data:image/png;base64," + data + "' width='120' loading='lazy'  alt='pic cannot be displayed'/>"
						}},
					{data: "angle7Base64Image", width: 40,
						render: function (data) {
							return "<img src='data:image/png;base64," + data + "' width='120' loading='lazy'  alt='pic cannot be displayed'/>"
						}},
					{data: "angle10Base64Image", width: 40,
						render: function (data) {
							return "<img src='data:image/png;base64," + data + "' width='120' loading='lazy'  alt='pic cannot be displayed'/>"
						}},
					{data: "angle13Base64Image", width: 40,
						render: function (data) {
							return "<img src='data:image/png;base64," + data + "' width='120' loading='lazy'  alt='pic cannot be displayed'/>"
						}},
					{data: "angle16Base64Image", width: 40,
						render: function (data) {
							return "<img src='data:image/png;base64," + data + "' width='120' loading='lazy'  alt='pic cannot be displayed'/>"
						}},
					{data: "angle19Base64Image", width: 40,
						render: function (data) {
							return "<img src='data:image/png;base64," + data + "' width='120' loading='lazy'  alt='pic cannot be displayed'/>"
						}},
					{data: "modelType", responsivePriority:4}
				],
				
				
				columnDefs:[
					{className: "dt-center", "targets": "_all"},
					{targets: 20,
					orderable: false, // 禁用排序
					defaultContent: "",
					width: "10%",
					render: function (data) {
						return '<button id="' + data + '" onclick="editModal(this.id)"  data-dismiss="modal" class="btn btn-info btn-sm"><i class="fas fa-edit"></i> 修改 </button>'
						+ '<button id="' + data + '" onclick="deleteModal(this.id)"  data-dismiss="modal" class="btn btn-danger btn-sm"><i class="fas fa-trash-alt"></i> 刪除 </button>';
					}
				}],
				
                language: {
                    "emptyTable":     "找不到對應的表格資料",
                    "info":           "目前顯示 _START_ 到 _END_ 筆，共 _TOTAL_筆記錄",
                    "infoEmpty":      "目前顯示 0 到 0 筆，共 0 筆記錄",
                    "lengthMenu":     "每頁顯示 _MENU_ 筆記錄",
                    "processing": "正在載入中...",
                    "paginate": {
                        "previous": " 上一頁 ",
                        "next": " 下一頁 "
                    }
                },
				
				
				responsive: {
					details: {
						display: $.fn.dataTable.Responsive.display.modal({
								header: function (row) {
									var data = row.data();
									return 'Details for car model';
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
		$('#addModelButton').click(function (e) {
			cleanModel() // 清空Model的勾勾叉叉和註解
			$("#form1")[0].reset(); // 新增的model清空
// 			previewImg();	// 啟動 "丟圖秀出預覽圖" function
			$('#addModelModal').modal('show');
			e.preventDefault();
		})		
		
		// "新增"Model 的預覽圖 function
		function previewImg() {
			if (this.files && this.files[0]) {
				let reader = new FileReader();
				// 讀取指定的binary(Blob或File)，將其編碼為base64的data url。讀取操作完成會觸發loadend事件
				reader.readAsDataURL(this.files[0]);
				let prevImg = $(this).prev().children("img")
				reader.onload = function (e) {
					prevImg.prop('src',e.target.result);
				}
			}
		}		
		$("input:file").on('change',previewImg);
		
		
		// 清空 "新增""修改"Model的勾勾叉叉和註解
		function cleanModel(){
			$("table").find("span").html("")
			$("table").find("span").next().prop("src","")
			$("div.image > img").prop("src","")
		}
		
		// 1送出前總檢查  2送出  3一鍵輸入  寫在 adminModel.js裡


		
		// "修改"按鈕抓出資料，叫出 Modal
		function editModal(modelType) {
			cleanModel()
			$('#form2')[0].reset(); // 修改的model清空

			let fillWithOrigin = function (res) {
				$("#2hideId").val(res.modelType);
				$("#2showId").html(res.modelType);
				$("#2price").val(res.price);
				$("#2engineType").val(res.engineType);
				$("#2displacement").val(res.engineDisplacement);
				$("#2power").val(res.power);
				$("#2torque").val(res.torque);
				$("#2consumption").val(res.consumption);
				$("#2seat").val(res.seat);
				$("#2subtitle").val(res.subtitle);
				$("#2description").val(res.description);
				
				$("#2preview_outer").prop("src",'data:image/png;base64,' + res.exterior);
				$("#2outer").val(res.outerFile);
				$("#2preview_inner").prop("src",'data:image/png;base64,' + res.interior);
				$("#2inner").val(res.innerFile);
				$("#2preview_bg").prop("src",'data:image/png;base64,' + res.background);
				$("#2bg").val(res.backgroundFile);
				
				$("#2preview_an1").prop("src",'data:image/png;base64,' + res.angle1);
				$("#2an1").val(res.angle1File);
				$("#2preview_an4").prop("src",'data:image/png;base64,' + res.angle4);
				$("#2an4").val(res.angle4File);
				$("#2preview_an7").prop("src",'data:image/png;base64,' + res.angle7);
				$("#2an7").val(res.angle7File);
				$("#2preview_an10").prop("src",'data:image/png;base64,' + res.angle10);
				$("#2an10").val(res.angle10File);
				$("#2preview_an13").prop("src",'data:image/png;base64,' + res.angle13);
				$("#2an13").val(res.angle13File);
				$("#2preview_an16").prop("src",'data:image/png;base64,' + res.angle16);
				$("#2an16").val(res.angle16File);
				$("#2preview_an19").prop("src",'data:image/png;base64,' + res.angle19);
				$("#2an19").val(res.angle19File);
			}

			findById(modelType, fillWithOrigin)
			$('#editModelModal').modal('show');
			$('#editModelModal').css('overflow-y', 'auto');
		}			
		
		// 啟用"修改"按鈕前置準備，尋找單筆
		function findById(modelType, fillWithOrigin) {
			console.log("findbyid:  "+modelType)
			$.ajax({
				url: "/FinalProject/findByIdModelAPI/" + modelType,
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
				
		// 1送出前總檢查  2一鍵輸入  3確認修改  寫在 adminModel.js裡
		

		// "刪除"按鈕按下後執行
		function deleteModal(modelType) {
			console.log('delete id=' + modelType);
			Swal.fire({
				title: '您確定要刪除嗎?',
				text: "資料將被刪除，此動作無法回復",
				icon: 'warning',
				showCancelButton: true,
				confirmButtonColor: '#3085d6',
				cancelButtonColor: '#d33',
				confirmButtonText: '我確認要刪除!',
				cancelButtonText: '取消動作，返回列表'
			}).then((result) => {
				if (result.isConfirmed) {
					$.ajax({
						url: "/FinalProject/deleteByIdModel/" + modelType,
						method: "POST",
						dataType: "json",
						success: function (res) {
							console.log('delete success');
							table.ajax.reload();
						},
						error: function (err) {
							alert('delete failed' +err)
						}
					});
					Swal.fire(
						'已刪除!',
						'此車型資料已經被刪除',
						'success',
					)
				}
			})
		}

	


			
</script>
<script src="/FinalProject/js/adminModel.js"></script>
</html>