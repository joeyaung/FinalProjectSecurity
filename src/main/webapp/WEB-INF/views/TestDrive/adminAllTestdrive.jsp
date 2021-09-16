<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-TW">

<head>
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>Audi - 試駕表單總覽</title>
  <link rel="icon" type="image/x-icon" href="images/favicon.png" />
  		<!-- Bootstrap core JavaScript-->
		<script src="/FinalProject/vendor/jquery/jquery.min.js"></script>
		<script src="/FinalProject/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

		<!-- Core plugin JavaScript-->
		<script src="/FinalProject/vendor/jquery-easing/jquery.easing.min.js"></script>

		<!-- Custom scripts for all pages-->
		<script src="/FinalProject/js/sb-admin-2.js"></script>

		<!-- Page level custom scripts -->
		<script src="/FinalProject/js/inner/chart-area-demo.js"></script>
		<script src="/FinalProject/js/inner/chart-pie-demo.js"></script>

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
		
		<!-- Page level plugins -->
		<link rel="stylesheet" href="/FinalProject/css/adminTestdrive.css"/>
		<!-- Page level custom scripts -->	
		<!-- toggleButton -->
		<link href="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/css/bootstrap4-toggle.min.css" rel="stylesheet">
		<script src="https://cdn.jsdelivr.net/gh/gitbrent/bootstrap4-toggle@3.6.1/js/bootstrap4-toggle.min.js"></script>
		
		<!--font awesome-->
		<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
			integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
			crossorigin="anonymous" />

		<!--buttons css-->
		<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.7.1/css/buttons.dataTables.min.css">
			
		<!-- date picker -->
		<script
      		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"
      		integrity="sha512-D7wym1iXOnyjJbX5hKh84TRFqnXTd7Qc0biqMOmoKgTRRZjUznfgM4Fk8Ta7x8Wp3o8HyKLb3A2kgxq1S6/4fA=="
      		crossorigin="anonymous"></script>
    	<link
     		rel="stylesheet"
      		href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css"
      		integrity="sha512-Fppbdpv9QhevzDE+UHmdxL4HoW8HantO+rC8oQB2hCofV+dWV2hePnP5SgiWR1Y1vbJeYONZfzQc5iII6sID2Q=="
      		crossorigin="anonymous"/>
      		
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
			<li class="nav-item"><a class="nav-link"
				href="/FinalProject/inner"> <i
					class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider" />

			<!-- Heading -->
			<div class="sidebar-heading">Analytics</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseTwo"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="fas fa-users"></i> <span>Client</span>
			</a>
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Clients:</h6>
						<a class="collapse-item" href="buttons.html">Overview</a> <a
							class="collapse-item" href="cards.html">Curent Stage</a>
					</div>
				</div></li>

			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseUtilities"
				aria-expanded="true" aria-controls="collapseUtilities">
					<i class="fas fa-id-card-alt"></i> <span>Employee</span>
			</a>
				<div id="collapseUtilities" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Employee:</h6>
						<a class="collapse-item" href="utilities-color.html">Overview</a>
						<a class="collapse-item" href="utilities-border.html">Sales</a>
					</div>
				</div></li>

			<!-- Divider -->
			<hr class="sidebar-divider" />

			<!-- Heading -->
			<div class="sidebar-heading">FUNCTIONS</div>

			<!-- Nav Item - 新增員工 -->
			<li class="nav-item"><a class="nav-link" href="/FinalProject/inner/admin/addEmployee"> <i
				class="fas fa-user-plus"></i> <span>新增員工</span></a></li>

			<!-- Nav Item - 試駕總覽 -->
			<li class="nav-item active"><a class="nav-link" href="/FinalProject/admin/edit/testdrive"> <i 
				class="fas fa-car"></i> <span>試駕總覽</span></a></li>
				
			<!-- Nav Item - 車型總覽 -->
			<li class="nav-item"><a class="nav-link" href="/FinalProject/admin/edit/model"> <i
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
        <div class="container-fluid" id="vueAll">
          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">試駕表單總覽 Test Drive DashBoard</h1>
          <p class="mb-4">試駕表單表格檢視</p>
<!--[暫時][測試] 	此行刪除(包含) -->
            <i class="fas fa-calendar-minus" id="fas-Cal"></i>
			<input id="toggle-event" type="checkbox" checked data-toggle="toggle" data-on="點擊改以月曆顯示" data-off="點擊改以表格顯示" 
				data-onstyle="primary" data-offstyle="info" data-size="sm">
            <i class="fas fa-table"></i>
<!--[暫時][測試] 	此行刪除(包含) -->

          <!-- Content Row -->
            <!-- 以下開始替換成你們的內容
                    可放表格, 圖表, 要填的 form 之類的~ -->
          <!-- "新增"按鈕 -->          
		  <br/><br/><button id="addTestdriveButton" type="submit" class="btn btn-primary" >新增試駕表單</button> 
          <div class="row" id="Testdrive1">
            	
				
				<!--Data Table -->
            	<table id="TestdriveList" class="table table-striped table-bordered nowrap" style="width: 100%">
                    <thead>
                      <tr>
                        <th>表單編號</th>
                        <th>試駕日期</th>
                        <th>試駕時間</th>
                        <th>試駕車種</th>
                        <th>試駕地區</th>
                        <th>試駕據點</th>
                        <th>業務人員</th>
                        <th>填表時間</th>
                        <th>顧客姓名</th>
                        <th>顧客稱謂</th>
                        <th>聯絡時間</th>
                        <th>Email</th>
                        <th>聯絡電話</th>
                        <th>備註</th>
                        <th>操作</th>
                      </tr>
                    </thead>
                    <tbody id="tbody_showform">
                      
                    </tbody>
                  </table>
		  </div>

		  <!--  以下 Calender 的 DOM -->
		  <div class="row" id="Testdrive2">
          <br/>
		  <div class="div_calend">
        	<div class="year_month">
            	<select name="year" id="idYear"></select>年
            	<select name="month" id="idMonth"></select>月
				<h3 id="dateComment" style="margin-top:1%"></h3>
        	</div>
        	<table class="table_calend">
              <thead class="table table-striped thead_calend" id="idThead">

              </thead>
              <tbody id="idTbody" class="tbody_calend"></tbody>
        	</table>
        	
        	<table class="tableS_calend" style="float: right">
        	  <thead class="theadS_hw5"><tr><th id="titleBE" colspan="7" 
        	  	style="text-align:center"></th></tr></thead>
              <thead class="theadS_hw5" id="idThead">

              </thead>
              <tbody id="idTbodyBE" class="tbodyS_hw5"></tbody>
        	</table>
        	
        	<table class="tableS_calend" style="float: right">
        	  <thead class="theadS_hw5"><tr><th id="titleAF" colspan="7" 
        	  	style="text-align:center"></th></tr></thead>
              <thead class="theadS_hw5" id="idThead">

              </thead>
              <tbody id="idTbodyAF" class="tbodyS_hw5"></tbody>
        	</table>
    	  </div>
          
          </div>
		  
          <!-- End of Content Row -->
          
          
          
          <!-- "新增表單"的互動視窗 Modal -->
		  <div class="modal fade" tabindex="-1" role="dialog" id="addTestdriveModal">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">新增試駕表單</h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">

						<form id="form1">

							<table class="box">
								<tr><td><label for="1date">賞車日期</label></td></tr>
								<tr>
									<td><div class="input-group date" id="1datetimepicker">
                          		    <input type="text" class="form-control" name="driveDate" id="1date"/>
                          		    <span class="input-group-addon color-blue" id="inputAddOnIcon">
                            		<span class="glyphicon glyphicon-calendar">
                              		  <i class="fas fa-calendar-minus"></i></span>
                          			</span></div><span id="1dateCheck"></span><img src=""></td></tr>
												
								<tr><td><label for="1driveTime">賞車時間:</label></td>
								<tr>
									<td><input class="form-control" type="text" aria-label="default input example" 
                      					  maxlength="5" id="1driveTime" onclick="driveTimeModal()" 
                      					  name="driveTime" :value=vueTime1>
                      				<span id="1driveTimeCheck"></span><img src=""></td></tr>
												
								<tr><td><label for="1carmod">試駕車種</label></td></tr>
								<tr>
									<td><select class="form-select"
                        						aria-label="Default select example"
                       							name="carMod" id="1carmod" required>
                        					<option id="1carmoddef" selected disabled>請選擇客戶想試駕的汽車型號</option>
                        					<optgroup label="A series">
                         					 <option>A3</option>
                         					 <option>A4</option>
                         					 <option>A5</option>
                        					</optgroup>
                        					<optgroup label="Q series">
                         					 <option>Q3</option>
                        					</optgroup>
                      					</select><span id="1carmodCheck"></span><img src=""></td></tr>
									
								<tr><td><label for="1loc">試駕地區</label></td></tr>
								<tr>
									<td><select class="form-select"
											    aria-label="Default select example"
												name="driveLoc" id="1loc" required>
										  <option id="1locdef" selected disabled>請選擇地區</option>
										  <option value="臺北市" id="1opt1">臺北市</option>
										  <option value="桃園市" id="1opt2">桃園市</option>
										  <option value="臺中市" id="1opt3">臺中市</option>
										  <option value="高雄市" id="1opt4">高雄市</option>
										  <option value="宜蘭縣" id="1opt5">宜蘭縣</option>
										</select><span id="1locCheck"></span><img src=""></td></tr>
								
								<tr><td><label for="1locsit">試駕據點</label></td></tr>
								<tr>
									<td><select class="form-select"
												aria-label="Default select example"
												name="driveLocSit" id="1locsit">
										  <option id="1locsitdef" selected disabled>請選擇據點</option>
										  <option value="內湖" id="1opt11">內湖展示中心</option>
										  <option value="大安" id="1opt12">大安展示中心</option>
										  <option value="平鎮" id="1opt21">平鎮展示中心</option>
										  <option value="桃園" id="1opt22">桃園展示中心</option>
										  <option value="北屯" id="1opt31">北屯展示中心</option>
										  <option value="南屯" id="1opt32">南屯展示中心</option>
										  <option value="左營" id="1opt41">左營展示中心</option>
										  <option value="鼓山" id="1opt42">鼓山展示中心</option>
										  <option value="五結" id="1opt51">五結展示中心</option>
										  <option value="羅東" id="1opt52">羅東展示中心</option>
										</select><span id="1locsitCheck"></span><img src=""></td></tr>
                  

								<tr><td><label for="1name">姓名</label></td></tr>
								<tr>
									<td><input class="form-control"
										       type="text" aria-label="default input example"
                        					   name="nameCli" maxlength="10" id="1name"
                        					   placeholder="請輸入客戶姓名" required/><span id="1nameCheck"></span><img src=""></td></tr>
								
								<tr><td><label>稱謂</label></tr>
								<tr>
									<td><div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="gendCli"
												  id="1flexRadio1" value="先生"/>
												  <label class="form-check-label" for="1flexRadio1">先生</label></div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio"name="gendCli" 
												  id="1flexRadio2" value="小姐"/>
												  <label class="form-check-label" for="1flexRadio2">小姐</label></div>
										<div class="form-check form-check-inline">
											<input class="form-check-input" type="radio" name="gendCli"
												  id="1flexRadio3" value="其他"/>
												  <label class="form-check-label" for="1flexRadio3">其他</label></div>
										<span id="1gendCheck"></span><img src=""></td></tr>
													  
								<tr><td><label>客戶方便的聯絡時間</label></tr>
								<tr>
									<td><div class="form-check form-check-inline">
                        				  <input class="form-check-input" type="checkbox"
                          					  id="1inlineCheckbox1" value="早" name="timCli"/>
                        					  <label class="form-check-label" for="1inlineCheckbox1">
                      							  早上(8:00-12:00)</label></div>
                      					<div class="form-check form-check-inline">
                      						<input class="form-check-input" type="checkbox"
                      						  id="1inlineCheckbox2" value="午" name="timCli"/>
                      						  <label class="form-check-label" for="1inlineCheckbox2">
                      							  下午(13:00-17:00)</label></div>
                    					<div class="form-check form-check-inline">
                      						<input class="form-check-input" type="checkbox"
                        					  id="1inlineCheckbox3" value="晚" name="timCli"/>
                      						  <label class="form-check-label" for="1inlineCheckbox3">
                      								  晚上(18:00-22:00)</label></div><span id="1contimCheck"></span><img src=""></td></tr>
                      			
                      			<tr><td><label for="1mail">E-mail</label></td></tr>
								<tr>
									<td><input class="form-control"
											  type="email" aria-label="default input example"
											  name="mailCli" maxlength="35" id="1mail" placeholder="請輸入電子信箱"
											  required/><span id="1mailCheck"></span><img src=""></td></tr>
								
								<tr><td><label for="1tel">聯絡電話</label></td></tr>
								<tr>
									<td><input class="form-control" 
											type="text" aria-label="default input example"
											name="telCli" maxlength="13" id="1tel"
											placeholder="請輸入連絡電話" required/><span id="1telCheck"></span><img src=""></td></tr>
								
								<tr><td><label for="1comm">備註</label></td></tr>
								<tr>
									<td><textarea class="form-control" style="resize: none" maxlength="200" id="1comm" rows="5" cols="30" name="remark" 
									placeholder="備註200字以內"></textarea><span style="left:auto; color:red" id="1submitcheck"></span></td></tr>
							</table>
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">關閉</button>
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
            

			<!-- "修改表單"的互動視窗 Modal -->
			<div class="modal fade" tabindex="-1" role="dialog" id="editTestdriveModal">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">修改試駕表單</h4>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">

							<form id="form2">

								<table class="box">
									<input type="hidden" id="2formId" name="formId">
									<input type="hidden" id="2formTime" name="formTime">
									<tr><td><label id="2showId"></label></td></tr>
									<tr><td><label for="2date">賞車日期</label></td></tr>
									<tr>
										<td><div class="input-group date" id="2datetimepicker">
                    						<input type="text" class="form-control" name="driveDate" id="2date"/>
              								<span class="input-group-addon color-blue" id="inputAddOnIcon2">
               							  		<span class="glyphicon glyphicon-calendar">
                              					    <i class="fas fa-calendar-minus"></i></span>
                          						</span></div><span id="2dateCheck"></span><img src=""></td></tr>
																								
									<tr><td><label for="2driveTime">賞車時間:</label></td>
									<tr>
										<td>
                      					  <input class="form-control" type="text" aria-label="default input example" 
                      						  maxlength="5" id="2driveTime" onclick="driveTimeModal2(date)" 
                      						  name="driveTime" :value=vueTime2>
                      						  <span id="2driveTimeCheck"></span><img src=""></td></tr>
												
									<tr><td><label for="2carmod">試駕車種</label></td></tr>
									<tr>
										<td><select
                        						 class="form-select"
                        						 aria-label="Default select example"
                       							 name="carMod" id="2carmod" required>
                        					 	<option id="2carmoddef" selected disabled>請選擇您想試駕的汽車型號</option>
                        						<optgroup label="A series">
                         						 <option>A3</option>
                         						 <option>A4</option>
                         						 <option>A5</option>
                        					    </optgroup>
                        					    <optgroup label="Q series">
                         						 <option>Q3</option>
                        						</optgroup>
                      						</select><span id="2carmodCheck"></span><img src=""></td></tr>
									<tr><td><label for="2loc">試駕地區</label></td></tr>
									<tr>
										<td><select
											  class="form-select"
											  aria-label="Default select example"
											  name="driveLoc" id="2loc" required>
											  <option id="2locdef" selected disabled>請選擇地區</option>
											  <option value="臺北市" id="2opt1">臺北市</option>
											  <option value="桃園市" id="2opt2">桃園市</option>
											  <option value="臺中市" id="2opt3">臺中市</option>
											  <option value="高雄市" id="2opt4">高雄市</option>
											  <option value="宜蘭縣" id="2opt5">宜蘭縣</option>
											</select><span id="2locCheck"></span><img src=""></td></tr>
									<tr><td><label for="2locsit">試駕據點</label></td></tr>
									<tr>
										<td><select
											  class="form-select"
											  aria-label="Default select example"
											  name="driveLocSit" id="2locsit">
											  <option id="2locsitdef" selected disabled>請選擇據點</option>
											  <option value="內湖" id="2opt11">內湖展示中心</option>
											  <option value="大安" id="2opt12">大安展示中心</option>
											  <option value="平鎮" id="2opt21">平鎮展示中心</option>
											  <option value="桃園" id="2opt22">桃園展示中心</option>
											  <option value="北屯" id="2opt31">北屯展示中心</option>
											  <option value="南屯" id="2opt32">南屯展示中心</option>
											  <option value="左營" id="2opt41">左營展示中心</option>
											  <option value="鼓山" id="2opt42">鼓山展示中心</option>
											  <option value="五結" id="2opt51">五結展示中心</option>
											  <option value="羅東" id="2opt52">羅東展示中心</option>
											</select><span id="2locsitCheck"></span><img src=""></td></tr>
                  
									<tr><td><label for="2sale">業務人員</label></td></tr>
									<tr>
										<td><input class="form-control"
												  type="text" aria-label="default input example"
												  name="sales" maxlength="10" id="2sale"
												  required /><span id="2saleCheck"></span><img src=""></td></tr>
									<tr><td><label for="2name">姓名</label></td></tr>
									<tr>
										<td><input class="form-control"
												  type="text" aria-label="default input example"
                        						  name="nameCli" maxlength="10" id="2name" placeholder="請輸入姓名" 
                        						  required /><span id="2nameCheck"></span><img src=""></td></tr>
									<tr><td><label>稱謂</label></tr>
									<tr>
										<td><div class="form-check form-check-inline">
												  <input class="form-check-input" type="radio" name="gendCli"
												  id="2flexRadio1" value="先生"/>
												  <label class="form-check-label" for="2flexRadio1">先生</label></div>
											<div class="form-check form-check-inline">
												  <input class="form-check-input" type="radio" name="gendCli" 
												  id="2flexRadio2" value="小姐" />
												  <label class="form-check-label" for="2flexRadio2">小姐</label></div>
											<div class="form-check form-check-inline">
												  <input class="form-check-input" type="radio" name="gendCli"
												  id="2flexRadio3" value="其他" />
												  <label class="form-check-label" for="2flexRadio3">其他</label></div>
											<span id="2gendCheck"></span><img src=""></td></tr>
													  
									<tr><td><label>客戶方便的聯絡時間</label></tr>
									<tr>
										<td id="tdcheckbox"><div class="form-check form-check-inline">
                        					<input class="form-check-input" type="checkbox"
                          							  id="2inlineCheckbox1" value="早" name="timCli"/>
                        							  <label class="form-check-label" for="2inlineCheckbox1">
                      								  早上(8:00-12:00)</label></div>
                      								  <div class="form-check form-check-inline">
                      				 		<input class="form-check-input" type="checkbox"
                      								  id="2inlineCheckbox2" value="午" name="timCli"/>
                      								  <label class="form-check-label" for="2inlineCheckbox2">
                      								  下午(13:00-17:00)</label></div>
                    								  <div class="form-check form-check-inline">
                      						<input class="form-check-input" type="checkbox"
                        							  id="2inlineCheckbox3" value="晚" name="timCli"/>
                      								  <label class="form-check-label" for="2inlineCheckbox3">
                      								  晚上(18:00-22:00)</label></div><span id="2contimCheck"></span><img src=""></td></tr>
                      				<tr><td><label for="2mail">E-mail</label></td></tr>
									<tr>
										<td><input class="form-control"
													  type="email" aria-label="default input example"
													  name="mailCli" maxlength="35" id="2mail" placeholder="請輸入電子信箱"
													  required/><span id="2mailCheck"></span><img src=""></td></tr>
									<tr><td><label for="2tel">聯絡電話</label></td></tr>
									<tr>
										<td><input class="form-control"
													type="text" aria-label="default input example"
													name="telCli" maxlength="13" id="2tel"
													placeholder="請輸入連絡電話" required/><span id="2telCheck"></span><img src=""></td></tr>
									<tr><td><label for="2comm">備註</label></td></tr>
									<tr>
										<td><textarea class="form-control" style="resize: none" maxlength="200"id="2comm" rows="5" cols="30" name="remark" 
										placeholder="備註200字以內"></textarea><span style="left: auto; color:red" id="2submitcheck"></td></tr>
								  </table>
							  </form>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default"
											data-dismiss="modal">關閉</button>
										<button id="2submit" type="button" data-dismiss="modal"
											class="btn btn-primary">確認修改</button>
										<button id="2oneKey" type="button" class="btn btn-secondary">一鍵輸入</button>
									</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						<!-- /.modal -->
		
		
		  <!-- 月曆的單筆視窗 Modal -->
          <div class="modal fade" tabindex="-1" role="dialog" id="recordModal">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">Details for test drive form</h4>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span></button></div>
										
						<div class="modal-body">
							<table class="dateTimeTable table table-hover" id="recordTable">
								<tr><td>表單編號:</td>
									<td id="3formId"></td></tr>
								<tr><td>試駕日期:</td>
									<td id="3date"></td></tr>
								<tr><td>試駕時間:</td>
									<td id="3driveTime"></td></tr>
								<tr><td>試駕車種:</td>
									<td id="3carmod"></td></tr>
								<tr><td>試駕地區:</td>
									<td id="3loc"></td></tr>
								<tr><td>試駕據點:</td>
									<td id="3locsit"></td></tr>
								<tr><td>業務人員:</td>
									<td id="3sale"></td></tr>
								<tr><td>填表時間:</td>
									<td id="3formTime"></td></tr>
								<tr><td>顧客姓名:</td>
									<td id="3name"></td></tr>
								<tr><td>顧客稱謂:</td>
									<td id="3gend"></td></tr>
								<tr><td>聯絡時間:</td>
									<td id="3timCli"></td></tr>
								<tr><td>Email:</td>
									<td id="3mail"></td></tr>
								<tr><td>聯絡電話:</td>
									<td id="3tel"></td></tr>
								<tr><td>備註:</td>
									<td id="3comm"></td></tr>
								<tr><td>操作:</td>
									<td id="3operate">
									<button onclick="editModal(this.id)" data-dismiss="modal" class="btn btn-info btn-sm"><i class="fas fa-edit"></i> 修改 </button>
									<button onclick="deleteModal(this.id)" data-dismiss="modal" class="btn btn-danger btn-sm"><i class="fas fa-trash-alt"></i> 刪除 </button>
									</td></tr>
							</table>

						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->		
		
		
		
		  <!-- "當日預約時段"的互動視窗 Modal -->
          <div class="modal fade" tabindex="-1" role="dialog" id="dayModal">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">日預約時段表</h4>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span></button></div>
						<div class="modal-body">

							<table class="dateTimeTable table table-hover" id="timeTable" style="text-align:center">
								<thead><tr class="time-window table-primary"><th>時段</th>
									<th id="modalheader"></th></tr></thead>
								<tr class="time-window"><td>10:00-11:00</td>
									<td @click="setTime('10')" id="Time10"></td></tr>
								<tr class="time-window"><td>11:00-12:00</td>
									<td @click="setTime('11')" id="Time11"></td></tr>
								<tr class="time-window"><td>12:00-13:00</td>
									<td @click="setTime('12')" id="Time12"></td></tr>
								<tr class="time-window"><td>13:00-14:00</td>
									<td @click="setTime('13')" id="Time13"></td></tr>
								<tr class="time-window"><td>14:00-15:00</td>
									<td @click="setTime('14')" id="Time14"></td></tr>
								<tr class="time-window"><td>15:00-16:00</td>
									<td @click="setTime('15')" id="Time15"></td></tr>
								<tr class="time-window"><td>16:00-17:00</td>
									<td @click="setTime('16')" id="Time16"></td></tr>
								<tr class="time-window"><td>17:00-18:00</td>
									<td @click="setTime('17')" id="Time17"></td></tr>
								<tr class="time-window"><td>18:00-19:00</td>
									<td @click="setTime('18')" id="Time18"></td></tr>
								<tr class="time-window"><td>19:00-20:00</td>
									<td @click="setTime('19')" id="Time19"></td></tr>
							</table>

						</div>
						<div class="modal-footer">
							<button id="" type="button" data-dismiss="modal" class="btn btn-primary">關閉</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
          

		  <!-- 天氣預報 Modal -->
          <div class="modal fade" tabindex="-1" role="dialog" id="weatherModal">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">試駕日天氣預報<img src="/FinalProject/images/cwb_gov.png" height="50px" alt="" /></h4>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span></button></div>
										
						<div class="modal-body" style="font-size: 1.2em">
							<div class="container-fluid">
						    	<div class="row">
      							<div class="col-md-6 column-head">地點</div>
      							<div class="col-md-6 ml-auto column-head">時間</div>
      							<div class="col-md-6" id="weather_loc">暫時查無資料</div>
      							<div class="col-md-6 ml-auto" id="weather_time">暫時查無資料</div>
    						</div>
    						<br/>
						    <div class="row">
						    	<div class="col-md-12 column-head">降雨機率</div>
						    	<div class="col-md-6" style="display: flex; align-items: center;" id="weather_rain"></div>
      							<div class="col-md-6 ml-auto"><img id="weather_rainImg" src="" height="100px" alt="" /></div>
						    </div>
						    <div class="row">
							      <div class="col-md-12 column-head">當日溫度</div>
							      <div class="col-md-4">最高溫度(°C)</div>
							      <div class="col-md-4 ml-auto">平均溫度(°C)</div>
      							  <div class="col-md-4 ml-auto">最低溫度(°C)</div>
							      <div class="col-md-4" id="weather_tempMax">30度</div>
							      <div class="col-md-4" id="weather_tempAvg">25度</div>
      							  <div class="col-md-4 ml-auto" id="weather_tempMin">20度</div>
						    </div>
						    <br/>
							<div class="row" style="margin-bottom: 5%">
							      <div class="col-md-12 column-head">綜合描述</div>
							      <div class="col-md-12 ml-auto" id="weather_sum" ></div>
						    </div>

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
<script>

		var table;
		$(function () {
			createdatatable();
		});
		//datatable 
		function createdatatable() {
			table = $("#TestdriveList").DataTable({
				responsive: true,
				
				ajax:{
					url: "/FinalProject/getAllTestdrive",
					dataSrc: ""
				},

// 				rowId: "formId",
				
				columns:[					
					{data: "formId", responsivePriority:1},
					{data: "testDriveApointment.driveDate", responsivePriority:2,
						render: function ( data, type, row ) {
							let today = new Date();  
							let dataDate = new Date(row.driveDate);
							let differenceInDay = (dataDate-today) / (1000 * 3600 * 24);
							if(differenceInDay<3){
								return `<span style="color:red; cursor: pointer" id="`+ row.driveLoc +`%`+ row.driveDate +`" onclick="forecast(this.id)" title="距離今天還有`+Math.ceil(differenceInDay)+`天">` 
								+ row.driveDate + `</span>`;
							}
							return row.driveDate
						}
					},
					{data: "driveTime", responsivePriority:3},
					{data: "carMod"},
					{data: "driveLoc", responsivePriority:4},
					{data: "driveLocSit", responsivePriority:5},
					{data: "sales"},
					{data: "formTime", responsivePriority:6},
					{data: "nameCli", responsivePriority:7},
					{data: "gendCli"},
					{data: "timCli", responsivePriority:12},
					{data: "mailCli", responsivePriority:10},
					{data: "telCli", responsivePriority:11},
					{data: "remark"},
					{data: "formId", responsivePriority:9}
				],
				
				
				columnDefs:[{
					targets: 14,
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
				
//                 dom: '<lfB<t>ip>',
//                 buttons: [
//                 	{
//                         text: '<i class="glyphicon glyphicon-save-file" title="另存為excel檔"></i>',
//                         extend: 'excel'
//                     }, {
//                         text: '<i class="glyphicon glyphicon-list-alt" title="另存為csv檔"></i>',
//                         extend: 'csv'
//                     }, {
//                         text: '<i class="glyphicon glyphicon-file" title="另存為pdf檔"></i>',
//                         extend: 'pdf'
//                     }
//                 ],
				
				
				responsive: {
					details: {
						display: $.fn.dataTable.Responsive.display.modal({
								header: function (row) {
									var data = row.data();
									return 'Details for test drive form';
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
		$('#addTestdriveButton').click(function (e) {
			e.preventDefault();
			$("#form1")[0].reset();// 新增的model清空
			$("#1submitcheck").html("");
			$('#addTestdriveModal').modal('show');
		})		
		
		// 1送出前總檢查 2一鍵輸入  3送出  寫在 adminTestdrive.js裡
		
		
		// "修改"按鈕抓出資料，叫出 Modal
		function editModal(formId) {
			$('#form2')[0].reset(); // 修改的model清空

			let fillWithOrigin = function (res) {
				$("#2showId").html("表單編號:　　" + res.formId);
				$("#2formId").val(res.formId);
				$("#2formTime").val(res.formTime);
				$("#2date").val(res.driveDate);
				$("#2driveTime").val(res.driveTime);
				$("#2carmod").val(res.carMod);
				$("#2loc").val(res.driveLoc);
				toLocsit2();
				$("#2locsit").val(res.driveLocSit);
				$("#2sale").val(res.sales);
				$("#2name").val(res.nameCli);
				$("[name=gendCli]").val([res.gendCli]);
				$("#tdcheckbox > div > input").each(function() {
					if(res.timCli.includes(this.value)){
						$(this).prop("checked",true);
					}
				});
				$("#2mail").val(res.mailCli);
				$("#2tel").val(res.telCli);
				$("#2comm").val(res.remark);
			}

			findById(formId, fillWithOrigin)
			$('#editTestdriveModal').modal('show');
			$('#editTestdriveModal').css('overflow-y', 'auto');
		}			
		
		// 啟用"修改"按鈕前置準備，尋找單筆
		function findById(formId, fillWithOrigin) {
			$.ajax({
				url: "/FinalProject/findByIdTestdriveAPI/" + formId,
				method: "GET",
				dataType: "json",
				success: function (res) {
					fillWithOrigin(res)
				},
				error: function (err) {
					alert(err)
				}
			});
		}		
				
		// 1送出前總檢查  2一鍵輸入  3確認修改  寫在 adminTestdrive.js裡
		

		// "刪除"按鈕按下後執行
		function deleteModal(formId) {
			console.log('delete id=' + formId);
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
						url: "/FinalProject/deleteByIdTestdriveAPI/" + formId,
						method: "POST",
						dataType: "json",
						success: function (res) {
							console.log('delete success');
							table.ajax.reload();
							changeComment();
						},
						error: function (err) {
							alert('delete failed' +err)
						}
					});
					Swal.fire(
						'已刪除!',
						'這筆表單已經被刪除',
						'success',
					)
				}
			})
		}
		
		
		// "天氣預報"按鈕按下後執行
		function forecast(data) {
			console.log('In function');
			console.log(data);
			driveLoc=data.slice(0,3)
			driveDate=data.slice(4)
			console.log(driveLoc);
			console.log(encodeURI(driveLoc));
			console.log(encodeURIComponent(driveLoc));
			console.log(driveDate);
			let westherUri="https://opendata.cwb.gov.tw/api/v1/rest/datastore/F-D0047-091?Authorization=CWB-62E818DB-3A6D-494E-B2DB-59F163F487C7&locationName="+encodeURI(driveLoc)+"&timeFrom="+driveDate+"T00%3A00%3A00";
			console.log(westherUri);
					$.ajax({
						url: westherUri,
						method: "GET",
						dataType: "json",
						success: function (res) {
							
							$('#weather_loc').html(res.records.locations[0].location[0].locationName)
							$('#weather_time').html(res.records.locations[0].location[0].weatherElement[0].time[0].startTime + ' 至\n' +
									res.records.locations[0].location[0].weatherElement[0].time[0].endTime)
							// 降雨機率有值
							if(res.records.locations[0].location[0].weatherElement[0].time[0].elementValue[0].value){
								$('#weather_rain').html(res.records.locations[0].location[0].weatherElement[0].time[0].elementValue[0].value + '%')
								// 一降雨機率 放上圖片
								if(res.records.locations[0].location[0].weatherElement[0].time[0].elementValue[0].value < 40){
									$('#weather_rainImg').attr("src", '/FinalProject/images/weather-sunny.png');
								} else if(res.records.locations[0].location[0].weatherElement[0].time[0].elementValue[0].value >= 40 &&
										res.records.locations[0].location[0].weatherElement[0].time[0].elementValue[0].value < 70) {
									$('#weather_rainImg').attr("src", '/FinalProject/images/weather-cloudy.png');
								} else if(res.records.locations[0].location[0].weatherElement[0].time[0].elementValue[0].value >= 70){
									$('#weather_rainImg').attr("src", '/FinalProject/images/weather-rainy.png');
								}
							} else {
								$('#weather_rain').html("暫無資訊")
							}
							
							// 平均溫
							if(res.records.locations[0].location[0].weatherElement[1].time[0].elementValue[0].value){
								$('#weather_tempAvg').html(res.records.locations[0].location[0].weatherElement[1].time[0].elementValue[0].value)
							} else {
								$('#weather_tempAvg').html("暫無資訊")
							}
							
							// 最高溫
							if(res.records.locations[0].location[0].weatherElement[12].time[0].elementValue[0].value){
								$('#weather_tempMax').html(res.records.locations[0].location[0].weatherElement[12].time[0].elementValue[0].value)
							} else {
								$('#weather_tempMax').html("暫無資訊")
							}
							
							// 最低溫
							if(res.records.locations[0].location[0].weatherElement[8].time[0].elementValue[0].value){
								$('#weather_tempMin').html(res.records.locations[0].location[0].weatherElement[8].time[0].elementValue[0].value)
							} else {
								$('#weather_tempMin').html("暫無資訊")
							}
							
							// 綜合描述
							if(res.records.locations[0].location[0].weatherElement[10].time[0].elementValue[0].value){
								$('#weather_sum').html(res.records.locations[0].location[0].weatherElement[10].time[0].elementValue[0].value)
							} else {
								$('#weather_sum').html("暫無資訊")
							}
							
							$('#weatherModal').modal('show');
							
							table.ajax.reload();
						},
						error: function (err) {
							alert('Get Weather Forecast failed' +err)
						}
					});
				}
	


			
</script>
<!-- <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script> -->
<script src="/FinalProject/js/adminTestdrive.js"></script>
</html>