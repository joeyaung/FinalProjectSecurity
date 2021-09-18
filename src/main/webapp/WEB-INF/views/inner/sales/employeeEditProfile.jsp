<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>
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
    <link rel="icon" type="image/x-icon" href="/FinalProject/images/favicon.png?v=2" />

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
    <link rel="stylesheet" href="/FinalProject/css/addEmployeePage.css" />
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
                  <a
                    class="dropdown-item"
                    href="/FinalProject/inner/profile/${empId}"
                  >
                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                    Profile
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
          <div class="container-fluid" id="app">
            <!-- Page Heading -->
            <h1 class="h3 text-gray-800">員工資料</h1>
            <hr class="sidebar-divider" />

            <!-- DataTales Example -->
            <div class="card shadow mb-4">
              <div class="card-body">
                <form>
                  <div class="row text-center mg-1r">
                    <div class="col-6 mb-3 mb-sm-0">
                      <label for="fullname" class="text-lg">姓名</label><br />
                      <input
                        type="text"
                        name="fullname"
                        class="form-control form-control-user"
                        v-model="employeeInput.fullName"
                      /><br />
                    </div>
                    <div class="col-6 mb-3 mb-sm-0">
                      <label for="empemail" class="text-lg">公司郵件</label
                      ><br />
                      <input
                        type="email"
                        name="empemail"
                        class="form-control form-control-user"
                        v-model="employeeInput.username"
                        disabled
                      /><br />
                    </div>
                  </div>
                  <div class="row text-center mg-1r">
                    <div class="col-6 mb-3 mb-sm-0">
                      <label for="empphone" class="text-lg">電話</label><br />
                      <input
                        type="text"
                        name="empphone"
                        class="form-control form-control-user"
                        v-model="employeeInput.phone"
                      /><br />
                    </div>
                    <div class="col-6 mb-3 mb-sm-0">
                      <label for="emptitle" class="text-lg">職稱</label><br />
                      <input
                        type="text"
                        name="emptitle"
                        class="form-control form-control-user"
                        v-model="employeeInput.title"
                      /><br />
                    </div>
                  </div>
                  <div class="row text-center mg-1r">
                    <div class="col-12 mb-3 mb-sm-0">
                      <label for="department" class="text-lg">部門</label><br />
                      <select
                        name="department"
                        class="form-control form-control-user"
                        v-model="employeeInput.department"
                        disabled
                      >
                        <option value="Sales">業務</option>
                        <option value="Delivery">交車</option>
                        <option value="Service">客服</option>
                        <option value="Admin">總部</option>
                      </select>
                    </div>
                  </div>
                  <div class="row text-center mg-1r">
                    <div class="col-6 mb-3 mb-sm-0">
                      <label for="location" class="text-lg">工作地點</label
                      ><br />
                      <select
                        name="location"
                        class="form-control form-control-user"
                        v-model="employeeInput.location"
                      >
                        <option value="" disabled selected>
                          Please select one Location.
                        </option>
                        <c:forEach items="${locations}" var="list">
                          <option value="${list}">${list}</option>
                        </c:forEach>
                      </select>
                    </div>
                    <div class="col-6 mb-3 mb-sm-0">
                      <label for="sal" class="text-lg">薪資/月</label><br />
                      <input
                        type="text"
                        name="sal"
                        class="form-control form-control-user"
                        v-model="employeeInput.salary"
                        disabled
                      /><br />
                    </div>
                  </div>
                  <div class="row text-center mg-1r">
                    <div class="col-12 mb-3 mb-sm-0">
                      <label for="password" class="text-lg">重設密碼</label
                      ><br />
                      <input
                        type="password"
                        name="password"
                        class="form-control form-control-user"
                        v-model="employeeInput.password"
                      /><br />
                    </div>
                  </div>
                  <div class="row text-center mg-1r">
                    <div class="col-12">
                      <hr class="sidebar-dividor" />
                      <button
                        class="btn btn-block btn-primary text-lg"
                        id="addEmpSubmitbtn"
                        @click="submitUpdateProfile($event)"
                      >
                        <span v-show="!isSending"> 修改 </span>
                        <img
                          src="/FinalProject/images/loading.gif"
                          alt=""
                          v-if="isSending"
                          width="30px"
                        />
                      </button>
                    </div>
                  </div>
                </form>
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
    <script src="/FinalProject/vendor/jquery/jquery.min.js"></script>
    <script src="/FinalProject/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/FinalProject/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/FinalProject/js/sb-admin-2.js"></script>

    <!-- Page level custom scripts -->
    <script src="/FinalProject/js/inner/sales/employeeEditProfiles.js"></script>
  </body>
</html>
