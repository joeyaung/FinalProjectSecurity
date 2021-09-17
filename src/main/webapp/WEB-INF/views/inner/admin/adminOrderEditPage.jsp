<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-TW">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />

    <title>Audi - 內部</title>

    <!-- Custom fonts for this template-->
    <link
      href="/FinalProject/vendor/fontawesome-free/css/all.min.css"
      rel="stylesheet"
      type="text/css"
    />
    <link
      href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
      rel="stylesheet"
    />

    <!-- Vue.js 2.6.7 -->
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.6.7/vue.js"
      integrity="sha512-y/+zR8ZRJXvRWVRuhPbjSpGNIv2yG9hePHeWYEb5RPcciLwlyG0ZGd6JsiT9+sFtTON9FrDs+07ZzepwatYX1Q=="
      crossorigin="anonymous"
    ></script>

    <!-- Custom styles for this template-->
    <link href="/FinalProject/css/sb-admin-2.min.css" rel="stylesheet" />

    <!-- JQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>

    <!-- DataTable lib -->
    <link
      rel="stylesheet"
      type="text/css"
      href="https://cdn.datatables.net/1.11.0/css/jquery.dataTables.css"
    />

    <script
      type="text/javascript"
      charset="utf8"
      src="https://cdn.datatables.net/1.11.0/js/jquery.dataTables.js"
    ></script>
    <link
      rel="stylesheet"
      href="/FinalProject/css/inner/admin/product/adminOrderEditPage.css"
    />
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

							<!-- Nav Item - User Information -->
							<li class="nav-item dropdown no-arrow">
								<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
									data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									<span class="mr-2 d-none d-lg-inline text-gray-600 small">${ empName }</span>
									<img class="img-profile rounded-circle"
										src="/FinalProject/images/svg/undraw_profile.svg" />
								</a>
								<!-- Dropdown - User Information -->
								<div class="
                    dropdown-menu dropdown-menu-right
                    shadow
                    animated--grow-in
                  " aria-labelledby="userDropdown">
				  <a class="dropdown-item" href="/FinalProject/inner/profile/${empId}">
                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                    Profile
                  </a>
									
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
										<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
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
            <div class="container">
              <div class="row">
                <div class="col-6">
                  <h1 class="h3 text-gray-800">
                    訂單編號: # {{ backend_order_info.id }}
                  </h1>
                </div>
                <div class="col-6 fl-right">
                  <button
                    class="btn-cancel"
                    :disabled="backend_order_info.stage == '訂單已取消'"
                    @click="cancelOrder"
                    v-show="!isSendingCancel"
                  >
                    取消訂單<i class="fas fa-trash-alt"></i>
                  </button>
                  <button
                    class="btn-cancel"
                    :disabled="backend_order_info.stage == '訂單已取消'"
                    @click="cancelOrder"
                    v-show="isSendingCancel"
                  >
                    <img
                      src="/FinalProject/images/loading.gif"
                      height="40px"
                      alt="loading"
                    />
                  </button>
                </div>
              </div>
            </div>
            <hr class="sidebar-divider" />

            <!-- Edit Body -->
            <div class="card shadow mb-4">
              <div class="card-body">
                <!-- Order Stage Progress Bar -->
                <div class="container text-center">
                  <div class="row">
                    <div class="col-12">
                      <div class="progress h-2rem">
                        <div
                          class="progress-bar text-2rem"
                          role="progressbar"
                          style="width: 33%"
                          aria-valuenow="50"
                          aria-valuemin="0"
                          aria-valuemax="100"
                          id="stageProgressBar"
                          v-show="backend_order_info.stage != '訂單已取消'"
                        >
                          {{ backend_order_info.stage }}...
                        </div>
                        <div
                          class="progress-bar text-2rem"
                          role="progressbar"
                          style="width: 100%; background-color: #ff7f50"
                          aria-valuenow="100"
                          aria-valuemin="0"
                          aria-valuemax="100"
                          id="stageProgressBar"
                          v-show="backend_order_info.stage == '訂單已取消'"
                        >
                          {{ backend_order_info.stage }}
                        </div>
                      </div>
                      <hr class="dividor hr-custom" />
                    </div>
                  </div>
                </div>
                <!-- Order Body -->
                <div class="container">
                  <div class="row">
                    <div class="col-12">
                      <!-- Order Details -->
                      <div class="col-12">
                        <div class="container">
                          <div class="row">
                            <div class="col-6 fs-15 mg-1">
                              <span
                                >訂購人:
                                {{ backend_order_info.member.fullName }}</span
                              >
                            </div>
                            <div class="col-6 fs-15 mg-1">
                              <span
                                >電話:
                                {{ backend_order_info.member.phone }}</span
                              >
                            </div>
                            <div class="col-6 fs-15 mg-1">
                              <span
                                >電子郵件:
                                {{ backend_order_info.member.username }}</span
                              >
                            </div>
                            <div class="col-6 fs-15 mg-1">
                              <span
                                >付款方式: {{ backend_order_info.method }}</span
                              >
                            </div>
                            <div class="col-6 fs-15 mg-1">
                              <span>送貨地址: {{ shippingFullAddress }}</span>
                            </div>
                            <div
                              class="col-6 fs-15 mg-1"
                              v-show="backend_order_info.stage != '訂單已取消'"
                            >
                              <label for="stage" class="fs-15">訂單狀態:</label>
                              <select
                                name="stage"
                                id=""
                                class="select-custom fs-15"
                                v-model="backend_order_info.stage"
                                @change="changeStage"
                              >
                                <option value="準備中">準備中</option>
                                <option value="已出貨">已出貨</option>
                                <option value="完成訂單">完成訂單</option>
                              </select>
                            </div>
                          </div>
                        </div>
                      </div>
                      <hr class="dividor hr-custom" />
                    </div>
                    <div class="container">
                      <div class="row">
                        <div class="col-12">
                          <div class="container">
                            <div class="row text-center">
                              <div class="col-2 align-center">編號</div>
                              <div class="col-2 align-center">名稱</div>
                              <div class="col-2 align-center">縮圖</div>
                              <div class="col-2 align-center">單位價格</div>
                              <div class="col-2 align-center">數量</div>
                              <div class="col-2 align-center">總價格</div>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div
                        class="row"
                        v-for="(item, index) in backend_order_info.orderDetail"
                      >
                        <div class="col-12">
                          <div class="container">
                            <div class="row text-center">
                              <div class="col-2 align-center">
                                <span>{{ index + 1 }}</span>
                              </div>
                              <div class="col-2 align-center">
                                <span>{{ item.product.name }}</span>
                              </div>
                              <div class="col-2 align-center">
                                <img
                                  :src="item.product.imgPath"
                                  alt=""
                                  class="img-product"
                                />
                              </div>
                              <div class="col-2 align-center">
                                <span>{{
                                  dollorFormat(item.pricePerUnit)
                                }}</span>
                              </div>
                              <div class="col-2 align-center">
                                <span>x {{ item.quantity }}</span>
                              </div>
                              <div class="col-2 align-center">
                                <span>{{
                                  dollorFormat(
                                    item.pricePerUnit * item.quantity
                                  )
                                }}</span>
                              </div>
                            </div>
                            <hr class="dividor" />
                          </div>
                        </div>
                      </div>

                      <div class="row">
                        <div class="col-12">
                          <div class="container">
                            <div class="row text-center">
                              <div class="col-2 align-center"></div>
                              <div class="col-2 align-center"></div>
                              <div class="col-2 align-center"></div>
                              <div class="col-2 align-center"></div>
                              <div class="col-2 align-center">
                                <span>總金額:</span>
                              </div>
                              <div class="col-2 align-center">
                                <span>{{
                                  dollorFormat(backend_order_info.totalAmount)
                                }}</span>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
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
    <div
      class="modal fade"
      id="logoutModal"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
            <button
              class="close"
              type="button"
              data-dismiss="modal"
              aria-label="Close"
            >
              <span aria-hidden="true">×</span>
            </button>
          </div>
          <div class="modal-body">
            Select "Logout" below if you are ready to end your current session.
          </div>
          <div class="modal-footer">
            <button
              class="btn btn-secondary"
              type="button"
              data-dismiss="modal"
            >
              Cancel
            </button>
            <a class="btn btn-primary" href="/FinalProject/logout">Logout</a>
          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript-->

    <script src="/FinalProject/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/FinalProject/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/FinalProject/js/sb-admin-2.js"></script>

    <!-- Page level custom scripts -->
    <script src="/FinalProject/js/inner/admin/product/adminOrderEditPageMain.js"></script>
  </body>
</html>
