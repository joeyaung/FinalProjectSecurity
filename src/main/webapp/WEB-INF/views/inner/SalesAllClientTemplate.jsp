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

    <!-- Custom styles for this template-->
    <link href="/FinalProject/css/sb-admin-2.min.css" rel="stylesheet" />
    
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.25/css/dataTables.bootstrap5.min.css">
    

    <link rel="stylesheet" href="/FinalProject/css/inner/sales/salesMain.css">

    <script src='https://cdnjs.cloudflare.com/ajax/libs/vue/2.6.7/vue.js' integrity='sha512-y/+zR8ZRJXvRWVRuhPbjSpGNIv2yG9hePHeWYEb5RPcciLwlyG0ZGd6JsiT9+sFtTON9FrDs+07ZzepwatYX1Q==' crossorigin='anonymous'></script>
    
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
          <a class="nav-link" href="/FinalProject/inner/sales">
            <i class="fas fa-fw fa-tachometer-alt"></i>
            <span>顧客管理系統</span></a
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
              <div class="input-group" id="app">
                <input
                  type="text"
                  class="form-control bg-light border-0 small"
                  placeholder="Search for..."
                  aria-label="Search"
                  aria-describedby="basic-addon2"
                  v-model="queryString"
                />
                <div class="input-group-append">
                  <button class="btn btn-primary" type="button">
                    <i class="fas fa-search fa-sm"></i>
                  </button>
                </div>
                <div class="container ps-absolute">
                  <div class="row pd-t-1-custom" v-for="(client, index) in queryClient" v-if="showDropDown">
                    <div class="col-12">
                      <a :href="'/FinalProject/inner/sales/ClientInfo?cli='+client.id" target="_blank">{{ client.name }}</a>
                    </div>
                  </div>
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
                  <input type="text" v-model="queryString">
                    <div class="input-group">
                      <input
                        type="text"
                        class="form-control bg-light border-0 small"
                        placeholder="Search for..."
                       
                        v-model="queryString"
                      />
                      <div class="input-group-append">
                        <button class="btn btn-primary" type="button" @click="query">
                          <i class="fas fa-search fa-sm"></i>
                        </button>
                      </div>
                    </div>
                  
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
                  <a class="dropdown-item" href="/FinalProject/inner/profile/${empId}">
                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                    Profile
                  </a>
                  
                  <div class="dropdown-divider"></div>
                  <a
                    class="dropdown-item"
                    href="/FinalProject/logout"
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
            <h1 class="h3 text-gray-800">顧客列表 - ${ stage }</h1>
            <hr class="sidebar-divider" />

            
            <div class="card shadow mb-4">
              <div class="card-body">
                <table id="allClients" class="table table-striped" style="width:100%">
                  <thead>
                    <tr class="text-lg">
                        <th>銷售階段</th>
                        <th>姓名</th>
                        <th>電子信箱</th>
                        <th>電話</th>
                        <th>地區</th>
                        <th>最後更新時間</th>
                        <th></th>
                    </tr>
                </thead>
                 
              </table>
                  
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
    
    <%
        String stage = (String) request.getAttribute("stage");

        switch(stage) {
            case "All":
                out.println("<script src='/FinalProject/js/inner/SalesAllClient.js'></script>");
                break;
            case "New":
                out.println("<script src='/FinalProject/js/inner/SalesNewClient.js'></script>");
                break;
            case "Attempt to Engaged":
                out.println("<script src='/FinalProject/js/inner/SalesATEClient.js'></script>");
                break;
            case "Engaged":
                out.println("<script src='/FinalProject/js/inner/SalesEngagedClient.js'></script>");
                break;
            case "Test Drive":
                out.println("<script src='/FinalProject/js/inner/SalesTDClient.js'></script>");
                break;
            case "Follow up":
                out.println("<script src='/FinalProject/js/inner/SalesFUClient.js'></script>");
                break;
            case "Long Term":
                out.println("<script src='/FinalProject/js/inner/SalesLTClient.js'></script>");
                break;
            case "Ordered":
                out.println("<script src='/FinalProject/js/inner/SalesOrderClient.js'></script>");
                break;
            case "Closed Lost":
                out.println("<script src='/FinalProject/js/inner/SalesCLClient.js'></script>");
                break;
            default:
            	out.println("<script src='/FinalProject/js/inner/SalesAllClient.js'></script>");
        }
    %>
    
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.25/js/dataTables.bootstrap5.min.js"></script>
  </body>
</html>
