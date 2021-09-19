<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-TW">
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>首頁</title>
    <link rel="icon" type="image/x-icon" href="/FinalProject/images/favicon.png?v=2" />
    <!-- Font Awesome icons (free version)-->
    <script
      src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
      crossorigin="anonymous"
    ></script>
    <!-- Google fonts-->
    <link
      href="https://fonts.googleapis.com/css?family=Varela+Round"
      rel="stylesheet"
    />
    <link
      href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
      rel="stylesheet"
    />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="/FinalProject/css/index.css" rel="stylesheet" />
    <link rel="stylesheet" href="/FinalProject/css/account.css" />
    <link rel="stylesheet" href="/FinalProject/css/loading.css" />
    <!-- Page Level js lib -->
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.6.7/vue.js"
      integrity="sha512-y/+zR8ZRJXvRWVRuhPbjSpGNIv2yG9hePHeWYEb5RPcciLwlyG0ZGd6JsiT9+sFtTON9FrDs+07ZzepwatYX1Q=="
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"
      integrity="sha512-n/4gHW3atM3QqRcbCn6ewmpxcLAHGaDjpEBu4xZd47N0W2oQ+6q7oc3PXstrJYXcbNU1OHdQ1T7pAP+gi5Yu8g=="
      crossorigin="anonymous"
    ></script>
    
  </head>

  <body id="page-top">
    <!-- Navigation-->
    <nav
      class="navbar navbar-expand-lg navbar-light fixed-top navbar-shrink"
      id="mainNav"
    >
      <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="/FinalProject"
          ><img src="/FinalProject/images/audi-logo.png" alt="logo"
        /></a>
        <button
          class="navbar-toggler navbar-toggler-right"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarResponsive"
          aria-controls="navbarResponsive"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          Menu
          <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ms-auto">
            <li class="nav-item">
              <a class="nav-link" href="/FinalProject/TestDrive">試駕體驗</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/FinalProject/News">最新消息</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#signup">了解車型</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/FinalProject/Events">活動</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/FinalProject/products">精品商城</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#signup">展示中心</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/FinalProject/account">會員專區</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <!-- 以上不要動 -->
    <!-- 這裡開始加你們的東西 -->
    <!-- About -->
    <section class="account-section text-center pd-bottom-2rem" id="app" v-cloak>
      <div class="container px-4 px-lg-5">
        <div class="row gx-4 gx-lg-5 justify-content-center">
          <div class="user-title-container">
            <h1 id="userH1">Hello, <span id="username">游聿民</span></h1>
            <div class="user-nav">
              <ul>
                <li><a href="/FinalProject/logout">登出</a></li>
                <li><a href="/FinalProject/account/setting">設定</a></li>
                <li><a href="/FinalProject/account/event">活動管理</a></li>
                <li><a href="/FinalProject/account">首頁</a></li>
              </ul>
            </div>
            <hr style="width: 100%; margin-top: 60px" />
          </div>
        </div>
        <div class="row row-pd-1" v-for="(order, index) in orders">
          <div class="col-12">
            <div class="card card-shadow">
              <div class="card-header text-left">
                <div class="container">
                  <div class="row">
                    <div class="col-6">
                      <span> 訂單編號: # {{ order.order_id }} </span>
                    </div>
                    <div class="col-6 text-right">
                      <span> 訂單狀態: {{ order.order_stage }} </span>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card-body">
                <h5 class="card-title">訂單詳情</h5>
                <div class="card-body-desc container">
                  <div
                    class="row"
                    v-for="(detail) in order.order_details.slice(0,order.order_limit)"
                  >
                    <div class="col-3">
                      <img :src="detail.imgPath" alt="" class="card-image" />
                    </div>
                    <div class="col-3 justify-content-center al-center">
                      <span class="">{{ detail.name }}</span>
                    </div>
                    <div class="col-3 justify-content-center al-center">
                      <span>X {{ detail.quantity }}</span>
                    </div>
                    <div class="col-3 justify-content-center al-center">
                      <span
                        >{{
                          dollorFormated(
                            detail.price_per_unit * detail.quantity
                          )
                        }}
                        元</span
                      >
                    </div>
                    <hr class="divider" />
                  </div>
                  <div class="row" v-if="order.order_details.length > 3">
                    <div
                      class="col-12 text-right"
                      @click="toggleOrderShowMore($event, index)"
                    >
                      <span class="text-right" v-if="!order.showMore"
                        ><a href="#">...更多</a></span
                      >
                      <span class="text-right" v-if="order.showMore"
                        ><a href="#">收合</a></span
                      >
                    </div>
                  </div>
                </div>
              </div>
              <div class="card-footer text-muted">
                <div class="container">
                  <div class="row">
                    <div class="col-4">
                      <span>{{ order.update_time }}</span>
                    </div>
                    <div class="col-4">
                      <a
                        :href="'/FinalProject/account?id='+order.order_id"
                        class="nav-link-custom"
                        v-show="!order.showAction"
                        @click="toggleShowAction(index, $event)"
                        >訂單操作</a
                      >
                      <a
                        :href="'/FinalProject/account?id='+order.order_id"
                        class="nav-link-custom"
                        v-show="order.showAction"
                        @click="toggleShowAction(index, $event)"
                        ><i class="fas fa-times"></i
                      ></a>
                    </div>
                    <div class="col-4">
                      <span
                        >總計: {{ dollorFormated(order.totalAmount) }}元</span
                      >
                    </div>
                  </div>
                  <transition name="fade">
                    <div class="row mg-top-1" v-show="order.showAction">
                      <div class="col-12">
                        <button
                          class="btn btn-primary pd-0"
                          v-if="order.order_stage=='準備中'"
                          @click="cancelOrder(index)"
                        >
                          取消訂單
                        </button>
                        <button
                          class="btn btn-primary pd-0"
                          v-if="!order.isSub"
                          @click="changeSubStatus(index, true)"
                        >
                          訂閱通知
                        </button>
                        <button
                          class="btn btn-primary pd-0"
                          v-if="order.isSub"
                          @click="changeSubStatus(index, false)"
                        >
                          取消訂閱
                        </button>
                      </div>
                    </div>
                  </transition>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row row-pd-1" v-if="orders.length==0">
          <div class="col-12">
            <span>目前尚無訂單</span>
          </div>
        </div>
      </div>
    </section>

    <!-- 以下不要動 -->
    <!-- Footer-->
    <footer
      class="footer bg-black small text-center text-white-50 footer-custom"
    >
      <div class="container px-4 px-lg-5">
        Copyright &copy; 資策會第五組專題報告 2021
      </div>
    </footer>

    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/template.js"></script>
    <script src="/FinalProject/js/account/accountMain.js"></script>
  </body>
</html>
