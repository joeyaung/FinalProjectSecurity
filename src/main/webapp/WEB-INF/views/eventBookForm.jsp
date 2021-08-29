<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html lang="zh-TW">

  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>活動報名</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/template.js"></script>
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

    <link rel="icon" type="image/x-icon" href="../images/favicon.ico" />

    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
    <link
      href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
      rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../css/index.css" rel="stylesheet" />
    <style>
      .table_booku thead tr th {
        padding: 0rem 0.5rem;
      }

      .table_bookf tbody tr td {
        padding: 0.8rem 0;
        color: white;
        text-align: justify;
      }

      #idfSub>table>tbody>tr>td {
        padding: 0.8rem 0;
      }

      #page-top>section>div>div>div>table>tbody>tr>td {
        padding: 0.4rem 0;

      }

      .table_bookf {
        margin: auto;
        text-align: center;
      }
    </style>
  </head>

  <body id="page-top">
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-light fixed-top navbar-shrink" id="mainNav">
      <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="/FinalProject/"><img src="/FinalProject/images/audi-logo.png" alt="logo" /></a>
        <button class="navbar-toggler navbar-toggler-right" type="button" data-bs-toggle="collapse"
          data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false"
          aria-label="Toggle navigation">
          Menu <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
          <ul class="navbar-nav ms-auto">
            <li class="nav-item"><a class="nav-link" href="/FinalProject/TestDrive">試駕體驗</a></li>
            <li class="nav-item"><a class="nav-link" href="/FinalProject/News">最新消息</a></li>
            <li class="nav-item"><a class="nav-link" href="#signup">了解車型</a>
            </li>
            <li class="nav-item"><a class="nav-link" href="/FinalProject/Events">活動</a>
            </li>
            <li class="nav-item"><a class="nav-link" href="#signup">精品商城</a>
            </li>
            <li class="nav-item"><a class="nav-link" href="#signup">展示中心</a>
            </li>
            <li class="nav-item"><a class="nav-link" href="/FinalProject/account">會員專區</a></li>
          </ul>
        </div>
      </div>
    </nav>
    <!-- 以上不要動 -->
    <!-- 這裡開始加你們的東西 -->
    <!-- About -->

    <section class="about-section text-center bg-gray-custom pd-2rem">
      <div class="container px-4 px-lg-5">
        <div class="row gx-4 gx-lg-5 justify-content-center">
          <div class="col-lg-10 po-re">

            <h2 class="h_bookf" style="color: white;">報名活動</h2>
            <!-- 	<form action="ControllerServlet" method="post" id="idfSub"> -->

            <form id="event_form">
              <table class="table_bookf">
                <tbody>
                  <tr>
                    <td><label for="name">姓名:</label></td>
                    <td>
                      <div class="form-group">

                        <input class="form-control" type="text" aria-label="default input example" name="name"
                          maxlength="10" id="name" placeholder="請輸入姓名" required>

                        <div id="validationServer02Feedback" class="invalid-feedback">
                          姓名欄位不可為空白
                        </div>


                      </div>

                    </td>
                  </tr>

                  <tr>
                    <td><label for="gender">性別:</label></td>
                    <td>
                      <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="gender" id="flexRadioDefault1" value="先生" />
                        <label class="form-check-label" for="flexRadioDefault1"></label>
                        先生
                        </label>
                      </div>
                      <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="gender" id="flexRadioDefault2" value="小姐"
                          checked />
                        <label class="form-check-label" for="flexRadioDefault2">
                          小姐
                        </label>
                      </div>
                      <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="gender" id="flexRadioDefault3" value="其他"
                          checked />
                        <label class="form-check-label" for="flexRadioDefault3">
                          其他
                        </label>
                      </div>
                    </td>
                  </tr>

                  <tr>
                    <td><label for="idnumber">身份證字號:</label></td>
                    <td>
                      <div class="form-group">

                        <input class="form-control" type="text" aria-label="default input example" name="id_number"
                          maxlength="10" id="idnumber" placeholder="請輸入身分證字號" required>

                        <div id="id_validation" class="invalid-feedback"></div>

                      </div>

                    </td>
                  </tr>


                  <tr>
                    <td><label for="phone">行動電話:</label></td>
                    <td>
                      <input class="form-control" type="text" aria-label="default input example" name="phone"
                        maxlength="13" id="phone" placeholder="請輸入連絡電話" required />

                      <div id="phone_validation" class="invalid-feedback"></div>

          </div>
          </td>
          </tr>

          <tr>
            <td><label for="email">Email:</label></td>
            <td>
              <input class="form-control" type="email" aria-label="default input example" name="email" maxlength="35"
                id="email" placeholder="請輸入電子信箱" required />

              <div id="email_validation" class="invalid-feedback"></div>

        </div>
        </td>
        </tr>
        <tr>
          <td><label for="message">備註:</label></td>
          <td>
            <textarea class="form-control" id="message" rows="5" cols="30" name="message" placeholder="備註200字以內"
              style="height: 88px;"></textarea>
          </td>
        </tr>

        </tbody>


        </table>

        </br>
        </br>


        <div class="div" style="text-align: center;">

          <button type="button" class="btn btn-primary wh-40" id="submitid">送出</button>
          <input type="button" id="shortcut" class="btn btn-secondary wh-40 onekey" value="一鍵輸入">
        </div>

        </form>


      </div>
      </div>
      </div>
    </section>

    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>


    <!-- 以下不要動 -->
    <!-- Footer-->
    <footer class="footer bg-black small text-center text-white-50">
      <div class="container px-4 px-lg-5">
        Copyright &copy; 資策會第五組專題報告 2021
      </div>
    </footer>

    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/template.js"></script>
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
  </body>
  <script>
    $(document).ready(function () {

      //將event_id值透過 input hidden type傳至add form controller
      const queryString = window.location.search;
      const urlParams = new URLSearchParams(queryString);
      const event_id = urlParams.get('event_id');

      var el = '<input type="hidden" name="event_id" value=' + event_id + '></input>';
      $('#event_form').append(el);

      //Add Event Registration function
      $("#submitid").click(function (e) {

        var formData = new FormData(document.getElementById("event_form"));

        var object = {};
        formData.forEach(function (value, key) {
          object[key] = value;
        });
        var json = JSON.stringify(object);

        // console.log(formData)
        localStorage.setItem('formData', json);
        window.location.href = "BookEventConfirmation";

      });

      //Execute Add Event

      function addevent(formData) {
        $.ajax({
          url: "/FinalProject/Events/addEventForm",
          method: "POST",
          data: formData,
          contentType: false, /// NEEDED, DON'T OMIT THIS (requires jQuery 1.6+)
          processData: false, // NEEDED, DON'T OMIT THIS
          "mimeType": "multipart/form-data",
          success: function (data) {
            console.log(data);
          },
          error: function (err) {
            console.log(err);
            alert('Registration failed:' + err);
          }
        });

      }




      //姓名欄位驗證
      $("#name").blur(function () {
        if ($("#name").val() != "") {
          $("#name").removeClass("form-control is-invalid");
          $("#name").addClass("form-control is-valid");

        } else {
          $("#name").removeClass("form-control is-valid");
          $("#name").addClass("form-control is-invalid");


        }
      });
      //身分證字號欄位驗證
      $("#idnumber").blur(function () {
        var warning1 = '身分證字號為必填欄位'
        var warning2 = '身分證格式不正確'
        var id = $("#idnumber").val()
        if (id == '') {
          $("#idnumber").addClass("form-control is-invalid");
          $("#id_validation").html(warning1);

          console.log('id is blank')
        } else if (checkTwID(id) == false) {
          $("#idnumber").addClass("form-control is-invalid");
          $("#id_validation").html(warning2);
          // console.log('id wrong format')
        }
        else {
          $("#idnumber").removeClass("form-control is-invalid");
          $("#validationServer02Feedback").val('');
          $("#idnumber").addClass("form-control is-valid");

        }

      });
      //email欄位驗證
      $("#email").blur(function () {
        var warn1 = 'email為必填欄位';
        var warn2 = 'email格式不正確';
        var email = $("#email").val();

        if (email == '') {
          $("#email").addClass("form-control is-invalid");
          $("#email_validation").html(warn1);
        } else if (IsEmail(email) == false) {
          $("#email").addClass("form-control is-invalid");
          $("#email_validation").html(warn2);
        }
        else {
          $("#email").removeClass("form-control is-invalid");
          $("#email_validation").val('');
          $("#email").addClass("form-control is-valid");
        }
      });
      //手機號碼驗證
      $("#phone").blur(function () {
        var warn1 = '手機號碼為必填欄位';
        var warn2 = '手機號碼格式不正確';
        var phone = $("#phone").val();

        if (phone == '') {
          $("#phone").addClass("form-control is-invalid");
          $("#phone_validation").html(warn1);
        } else if (checkPhone(phone) == false) {
          $("#phone").addClass("form-control is-invalid");
          $("#phone_validation").html(warn2);
        }
        else {
          $("#phone").removeClass("form-control is-invalid");
          $("#phone_validation").val('');
          $("#phone").addClass("form-control is-valid");
          console.log('correct number');
        }
      });

      //Event sign up form Autofill 
      $("#shortcut")
        .click(
          function () {

            var text1 = "王美麗";
            text1 = $("#name").val(text1);
            $('input[name="gender"]')[1].checked = true;
            var text3 = "B223789765";
            text3 = $("#idnumber").val(text3);
            var text4 = "0989876567";
            text4 = $("#phone").val(text4);

            var text5 = "Prettywang@yahoo.com";
            text5 = $("#email").val(text5);

            var text6 = "我會帶小孩一起去";
            text6 = $("#message").val(text6);
          })



    });
    //身分證格式驗證
    function checkTwID(id) {
      re = /^[A-Z]\d{9}$/;
      if (re.test(id))
        return true;
      else
        return false;
    }
    //email格式驗證
    function IsEmail(email) {
      var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
      if (!regex.test(email)) {
        return false;
      } else {
        return true;
      }
    }
    //手機號碼格式驗證
    function checkPhone(phone) {

      var regex = /^(09)[0-9]{8}$/;

      if (!regex.test(phone)) {
        return false;
      } else {
        return true;
      }
    }


  </script>

  </html>