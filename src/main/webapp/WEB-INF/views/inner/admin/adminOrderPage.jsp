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
      href="/FinalProject/css/inner/admin/product/adminOrderMain.css"
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

				<!-- Divider -->
				<hr class="sidebar-divider my-0" />

				<!-- Nav Item - Dashboard -->
				<li class="nav-item active">
					<a class="nav-link" href="/FinalProject/inner">
						<i class="fas fa-fw fa-tachometer-alt"></i>
						<span>Dashboard</span></a>
				</li>

				<!-- Divider -->
				<hr class="sidebar-divider" />

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
            <div
              class="modal-overlay"
              style="display: block"
              v-show="newProductModule.showModal"
              @click="hideNewProductModal"
            ></div>
            <!-- Page Heading -->
            <h1 class="h3 text-gray-800">訂單管理</h1>
            <hr class="sidebar-divider" />

            <!-- DataTales Example -->
            <div class="card shadow mb-4">
              <div class="card-body">
                
                <table
                  id="productsTable"
                  class="display text-center"
                  style="width: 100%"
                >
                  <thead>
                    <tr>
                      <th>訂單編號</th>
                      <th>付款方法</th>
                      <th>第三方 ID</th>
                      <th>訂購人</th>
                      <th>電子郵件</th>
                      <th>電話</th>
                      <th>總金額</th>
                      <th>訂購時間</th>
                      <th>訂單狀態</th>
                    </tr>
                  </thead>
                </table>
              </div>
            </div>

            <!-- New Product Form -->
            <transition name="fade">
              <div
                class="card shadow mb-4 ps-modal newProductModal"
                v-if="newProductModule.showModal"
              >
                <div class="card-body">
                  <div class="container">
                    <!-- Close Tab -->

                    <!-- Header -->
                    <div class="row">
                      <div class="col-12">
                        <h4 class="h4">新增產品</h4>
                        <hr />
                      </div>
                    </div>
                    <!-- Body -->
                    <div class="row text-center">
                      <div class="col-12">產品名稱</div>
                      <div class="col-12">
                        <input
                          type="text"
                          class="product-input-form"
                          placeholder="請輸入產品名稱..."
                          v-model="newProductModule.formData.name"
                        />
                      </div>
                    </div>
                    <div class="row text-center">
                      <div class="col-12">產品圖片</div>
                      <div class="col-12">
                        <div class="form-group">
                          <div class="input-group shadow">
                            <span
                              class="
                                input-group-text
                                px-3
                                text-muted
                                image-left-icon
                              "
                              ><i class="fas fa-image fa-lg"></i
                            ></span>
                            <input
                              type="file"
                              class="d-none"
                              id="imageFileInput"
                              v-on:change="imageFileCheck($event);imageChoosen($event)"
                            />
                            <input
                              type="text"
                              class="form-control form-control-lg"
                              placeholder="Upload Image"
                              v-model="newProductModule.formData.image_path"
                              disabled
                            />
                            <button
                              class="
                                browse
                                btn btn-primary
                                px-4
                                image-right-btn
                              "
                              type="button"
                              @click="focusFileInput"
                            >
                              <i class="fas fa-image"></i> 瀏覽檔案
                            </button>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row text-center">
                      <div class="col-12">售價</div>
                      <div class="col-12">
                        <input
                          class="product-input-form"
                          type="number"
                          min="1"
                          step="any"
                          name="price"
                          placeholder="請輸入售價"
                          v-model="newProductModule.formData.origin_price"
                        />
                      </div>
                    </div>
                    <div class="row text-center">
                      <div class="col-12">庫存</div>
                      <div class="col-12">
                        <input
                          class="product-input-form"
                          type="number"
                          min="1"
                          step="any"
                          name="quantityInStock"
                          placeholder="請輸入庫存數量"
                          v-model="newProductModule.formData.quantity_in_stock"
                        />
                      </div>
                    </div>
                    <div class="row text-center mg-2">
                      <div class="col-3 al-center">
                        <span>是否特價</span>
                        <i
                          @click="toggleIsOnSale"
                          :class="newProductModule.formData.isOnSale ? 'fas fa-toggle-on tg-btn' : 'fas fa-toggle-off tg-btn'"
                        ></i>
                      </div>
                    </div>
                    <div
                      class="row text-center"
                      v-show="newProductModule.formData.isOnSale"
                    >
                      <div class="col-12">特價價格</div>
                      <div class="col-12">
                        <input
                          class="product-input-form"
                          type="number"
                          min="1"
                          step="any"
                          name="salesPrice"
                          placeholder="請輸入特價價格..."
                          v-model="newProductModule.formData.sale_price"
                        />
                      </div>
                    </div>
                    <div class="row text-center">
                      <div class="col-12">標籤</div>
                      <div class="col-12">
                        <input
                          type="text"
                          class="product-input-form"
                          placeholder="請輸入標籤..."
                          v-model="newProductModule.formData.tagsInput"
                          v-on:keyup.enter="onTagsEnter"
                        />
                        <div class="row text-left mg-l-1">
                          <div
                            class="tag"
                            v-for="(tag, index) in newProductModule.formData.tags"
                          >
                            <span>{{ tag }}</span>
                            <span class="remove-tag" @click="removeTag(index)"
                              ><i class="fas fa-times-circle"></i
                            ></span>
                          </div>
                        </div>
                      </div>
                      <div class="col-12">
                        <hr />
                      </div>
                    </div>
                    <div class="row text-center">
                      <div class="col-12">
                        <button
                          class="btn btn-info wd-100 sb-btn"
                          @click="submitProductForm"
                        >
                          提交
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </transition>
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
    <script src="/FinalProject/js/inner/admin/product/adminOrderMain.js"></script>
  </body>
</html>
