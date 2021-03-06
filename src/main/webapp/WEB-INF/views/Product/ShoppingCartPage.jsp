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
    <title>η²Ύεεε</title>

    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="/FinalProject/js/template.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.js"></script>

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

    <!-- Vuejs 2.6.7 -->
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/vue/2.6.7/vue.js"
      integrity="sha512-y/+zR8ZRJXvRWVRuhPbjSpGNIv2yG9hePHeWYEb5RPcciLwlyG0ZGd6JsiT9+sFtTON9FrDs+07ZzepwatYX1Q=="
      crossorigin="anonymous"
    ></script>
    <!-- Page Level css stylesheet -->
    <link rel="stylesheet" href="/FinalProject/css/cartPage.css" />
  </head>

  <body id="page-top">
    <!-- Navigation-->
    <div id="app">
      <nav
        class="navbar navbar-expand-lg navbar-light fixed-top navbar-shrink"
        id="mainNav"
      >
        <div class="container px-4 px-lg-5">
          <a class="navbar-brand" href="/FinalProject/"
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
                <a class="nav-link" href="/FinalProject/TestDrive">θ©¦ι§ι«ι©</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/FinalProject/News">ζζ°ζΆζ―</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/FinalProject/Model">δΊθ§£θ»ε</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/FinalProject/Events">ζ΄»ε</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/FinalProject/products">η²Ύεεε</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/FinalProject/center">ε±η€ΊδΈ­εΏ</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/FinalProject/account">ζε‘ε°ε</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="/FinalProject/product/cart"
                  >θ³Όη©θ»<i class="fas fa-shopping-cart"></i>
                  <span v-if="cart_item_total_quantity != 0">{{
                    cart_item_total_quantity
                  }}</span>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <!-- δ»₯δΈδΈθ¦ε -->
      <!-- ιθ£‘ιε§ε δ½ εηζ±θ₯Ώ -->
      <!-- Header-->
      <header class="bg-lightgray header-padding">
        <div class="container ps-absolute">
          <div class="text-center text-darkgray">
            <h1 class="display-4 fw-bolder">δ½ ηθ³Όη©θ»</h1>
          </div>
        </div>
      </header>
      <!-- Product Section -->

      <section class="py-5">
        <div class="container px-2 px-lg-2 mt-3">
          <div class="row">
            <div class="col-8 ps-relative">
              <!-- <div class="row">
                <div class="col-12">
                  <p>ζζε‘εΈ³θε? <a href="#">ι»ζ­€η»ε₯</a></p>
                </div>
                <hr class="my-4" />
              </div> -->
              <!-- Cart Begin -->
              <div
                class="row gx-5 justify-content-center"
                v-for="(item, index) in cartItem"
              >
                <div class="col-3 justify-content-center">
                  <img
                    class="cart-image-small"
                    :src="item.product.imgPath"
                    :alt="item.product.name"
                  />
                </div>
                <div class="col-3 ps-relative">
                  <p class="jtf-center tx-13rem">{{ item.product.name }}</p>
                </div>
                <div class="col-3 ps-relative">
                  <div class="jtf-center">
                    <span @click="removeFromCart(index)">
                      <i
                        class="fas fa-minus-circle tx-13rem mr-2 hov-pointer"
                      ></i
                    ></span>

                    <span class="tx-18rem">{{ item.quantityInCart }}</span>
                    <span @click="addToCart(index)">
                      <i
                        class="fas fa-plus-circle tx-13rem ml-2 hov-pointer"
                      ></i>
                    </span>
                  </div>
                </div>
                <div class="col-3 ps-relative">
                  <span class="jtf-center tx-13rem">{{
                    dollorFormated(item.product.curPrice * item.quantityInCart)
                  }}</span>
                </div>
                <hr class="my-2 mx-6" />
              </div>
              <div class="row gx-5 my-3 float-right">
                <div class="col-5 ps-relative po-right-2rem wd-250">
                  <span class="tx-13rem" v-if="cart_item_total_quantity != 0"
                    >ηΈ½ιι‘: {{ dollorFormated(cart_item_total_cost) }} ε</span
                  >
                </div>
              </div>
            </div>
            <div class="row text-center" v-if="cart_item_total_quantity == 0">
              <div class="col-12">
                <span>ζ¨ηθ³Όη©θ»ε§ζ²ζεε</span>
              </div>
            </div>
            <div
              class="col-3 mg-4 checkout-container"
              v-if="cart_item_total_quantity != 0"
            >
              <div class="container">
                <div class="row">
                  <div class="col-12">
                    <p>θ«ιΈζη΅εΈ³ζΉεΌ:</p>
                  </div>
                </div>
                <div class="row">
                  <div class="col-12">
                    <div id="paypal-button-container"></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>

    <!-- δ»₯δΈδΈθ¦ε -->
    <!-- Footer-->
    <footer
      class="
        footer
        bg-black
        small
        text-center text-white-50
        fixed-bottom
        px-3
        py-3
      "
    >
      <div class="container px-4 px-lg-5">
        Copyright &copy; θ³η­ζη¬¬δΊη΅ε°ι‘ε ±ε 2021
      </div>
    </footer>
    <script src="/FinalProject/js/product/cartPage.js"></script>
    <script src="https://www.paypal.com/sdk/js?client-id=AcdT7DRp0_suFQ0Ox_P_-YFZwTobRJk4_k2Vy_Ikl1bxD5dBVhHInCEL-PGTVjDuFI7M7arTCHbwfe_p&currency=TWD"></script>
    <script src="/FinalProject/js/product/paypal.js"></script>
  </body>
</html>
