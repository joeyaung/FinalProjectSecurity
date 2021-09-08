<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html lang="zh-TW">

  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>最新消息</title>

    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../js/template.js"></script>
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>

    <link rel="icon" type="image/x-icon" href="../images/favicon.ico" />

    <!-- Bootstrap 4 message board js-->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
      integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
      crossorigin="anonymous"></script>

    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
    <link
      href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
      rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="../css/index.css" rel="stylesheet" />

    <!-- Bootstrap 4 message board css-->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
      integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <style>
      .news_li {
        color:black;
        list-style-type: none;
        text-align: left;
      }

      #title_li {
        font-size: 20px;
      }

      #seemore_btn {
        background-color: black;
        color:black;
        border: none;
      }

      .msg_title {
        color: black;
      }

      nav input {
				border: 0;
				background-color: #003C9D;
				color: #fff;
				border-radius: 10px;
				cursor: pointer;
			}

			nav input:hover {
				color: #003C9D;
				background-color: #fff;
				border: 2px #003C9D solid;
			}
      .bg-gray-custom {
				background: linear-gradient(to bottom, #ced6e0 0%, rgba(206, 214, 224, 0.4) 75%, rgba(206, 214, 224, 0.6) 100%);
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
              <a class="nav-link" href="#signup">精品商城</a>
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
    <section class="about-section text-center bg-gray-custom pd-2rem">
			<div class="container px-4 px-lg-5">
				<div class="row gx-4 gx-lg-5 justify-content-center">
				  <div class="col-lg-10 po-re">
					<h2 class="h_bookf" style="color:black;">最新消息</h2>
            <p class="text-white-50">

            <div id="container">
              <nav style="margin-top: 100px">
                <input type="button" id="secondHalfYear" class="2021070120211231"
                  value="2021年07-12月" style="width: 150px; height: 50px;"> <input type="button"
                  id="firstHalfYear" class="2021010120210630" value="2021年01-06月"
                  style="width: 150px; height: 50px;">
                <input type="button" id="secondHalfYear2020" class="2020070120201231"
                  value="2020年07-12月" style="width: 150px; height: 50px;">
              </nav>

              </br> </br>

              <ul id="user_newslist">

              </ul>
              <!-- message board 留言板功能尚待完成 -->
              <!-- create message -->
              <!-- <h3 style="color: white;">發佈留言</h3>
              <form action="#">
                <div class="row form-group">
                  <input type="text" class="form-control" placeholder="標題" />
                </div>
                <div class="row form-group">
                  <textarea rows="3" class="form-control" style="resize: vertical" placeholder="正文"></textarea>
                </div>
                <input class="btn btn-primary text-right pull-right" type="submit" value="送出" />
              </form> -->


              <!-- list of messages -->
              <!-- <h3 style="color: white;">留言列表</h3>
              <ul class="list-group">
                <li class="list-group-item">

                  <div class="media">

                    <div class="media-heading">
                      <h3>title</h3>
                      <h5>content</h5>
                    </div>

                    <span>creation time:xxx</span>
                    <!-- delete message button-->
                    <!-- <div class="media-right media-middle pull-right">
                      <form action="#">
                        <button class="btn btn-danger" type="submit">刪除</button>
                      </form>
                    </div> -->
                        <!-- modify message button-->
                    <!-- <div class="media-right media-middle pull-right">
                      <button type="button" class="btn btn-primary editButton" data-toggle="modal">編輯</button>
                    </div>

                  </div>

                </li>
              </ul> -->


            </div>

          </div>
        </div>
        <!-- <img class="img-fluid" src="../images/audi-etron.png" alt="..." /> -->
    </section>

    <!-- 以下不要動 -->
    <!-- Footer-->
    <footer class="footer bg-black small text-center text-white-50">
      <div class="container px-4 px-lg-5">
        Copyright &copy; 資策會第五組專題報告 2021
      </div>
    </footer>


  </body>
  <script>
    //display details of the selected news
    $(document).ready(function () {
      const queryString = window.location.search;
      const urlParams = new URLSearchParams(queryString);
      const newsId = urlParams.get('newsId');
      $.ajax({
        url: "/FinalProject/findNewsById/" + newsId,
        method: "GET",
        dataType: "json",
        success: function (data) {
          var list = "";
          list += "<li class='news_li'><h2>" + data.uploadDate + "</h2></li><li class='news_li'><h1>"
            + data.title + "</h1></li></br><li class='news_li'><img src='data:image/png;base64,"
            + data.image + "' width='563' height='350' alt='pic cannot be displayed'/></li></br><li class='news_li'>"
            + data.subtitle + "</li></br><li class='news_li'>"
            + data.content + "</li></br><li class='news_li'>"
            + data.remarks + "</li></br></br><a href='/FinalProject/News'><i class='fas fa-arrow-alt-circle-left'></i></a></br></br></br>";
          $("#user_newslist").html(list);
        },
        error: function (err) {
          alert(err)
        }
      });

//      $.ajax({
//       url: "/FinalProject/getAllMessage",
//        method: "GET",
//        dataType: "json",
//        success: function(data){
//          var list = "";
//          $.each(data, function(index,item){
//            console.log(item.msg_title);
//            list += "<li class='list-group-item'><div class='media'><div class='media-heading'><h3>" 
//              + item.msg_title + "</h3><h5>"
//                +item.msg_content +
//                "</h5></div><span>creation time:"
//                  +item.creation_date+
//                  "</span> <div class='media-right media-middle pull-right'><form action='#'><button class='btn btn-danger' type='submit'>刪除</button></form></div><div class='media-right media-middle pull-right'><button type='button' class='btn btn-primary editButton' data-toggle='modal'>編輯</button></div></div></li>";
//          
//          })
//           
//          $(".list-group").html(list);
//        },
//          error: function (err) {
//          alert(err)
//        }
//      });


      $("#secondHalfYear,#firstHalfYear,#secondHalfYear2020")
						.click(
							function () {
								var res = $(this).attr("class")
								var start;
								var end;
								start = res.substring(0, 8);
								end = res.substring(8);
								$
									.ajax({
										url: "/FinalProject/sortByUploadDate/"
											+ start
											+ "/"
											+ end,
										method: "GET",
										dataType: "json",
										success: function (data) {
											var list = "";
											$
												.each(
													data,
													function (
														index,
														item) {
														list += "<li class='news_li'><img src='data:image/png;base64,"
															+ item.image + "' width='563' height='350' alt='pic cannot be displayed'/></li><li class='news_li' id='title_li'><strong>"
															+ item.title
															+ "</strong></li>"
															+ "<li class='news_li'>"
															+ item.subtitle
															+ "...<a href='News/OneNews?newsId="
															+ item.newsId
															+ "'>更多資訊<input id='newsId' type='hidden' value=" + item.newsId + "><i class=‘fas fa-angle-right’></i></a></li></br></br>";
													});
											$("#user_newslist")
												.html(list);
										},
										error: function (err) {
											alert('Cannot find any news uploaded during the period');
										}

									});
                });

      
    });

  </script>

  </html>

  </html>