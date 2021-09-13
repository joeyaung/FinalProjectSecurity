<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-TW">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Audi - 預約試駕</title>
    <link rel="icon" type="image/x-icon" href="images/favicon.png" />
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
    <link href="css/index.css" rel="stylesheet" />
    <link rel="stylesheet" href="./css/bookForm.css" />
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
      integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
      crossorigin="anonymous"
    ></script>
    
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
      
      
      
    <style>

    
    
    </style>

      
  </head>

  <body id="page-top">
    <!-- Navigation-->
    <nav
      class="navbar navbar-expand-lg navbar-light fixed-top navbar-shrink"
      id="mainNav"
    >
      <div class="container px-4 px-lg-5">
        <a class="navbar-brand" href="/FinalProject/"
          ><img src="images/audi-logo.png" alt="logo"
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
              <a class="nav-link" href="/FinalProject/Model">了解車型</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/FinalProject/Events">活動</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="#signup">精品商城</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="/FinalProject/center">展示中心</a>
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
        <div class="row gx-4 gx-lg-5 justify-content-center" id="vueAll">
        
          <div class="col-lg-10 image-holder-custom">

            <header>
            	<div class="season" id='season'>
            	  <img src="/FinalProject/images/scrolling/1spring.jpg" class="spring" alt="">
            	  <img src="/FinalProject/images/scrolling/2summer.jpg" class="summer" alt="">
            	  <img src="/FinalProject/images/scrolling/3autumn.jpg" class="autumn" alt="">
            	  <img src="/FinalProject/images/scrolling/5winter.jpg" class="winter" alt="">
              </div>
              <div class="car">
             	  <img src="/FinalProject/images/scrolling/17-1.png" class="spring" alt="" >
             	  <img src="/FinalProject/images/scrolling/17-2.png" class="summer" alt="" >
            	  <img src="/FinalProject/images/scrolling/17-3.png" class="autumn" alt="" >
            	  <img src="/FinalProject/images/scrolling/17-4.png" class="winter" alt="" >
              </div>
            </header>
		    <h3 style='z-index: 40;'>BOOK A TEST DRIVE</h3>

          </div>
        
        
          <div class="col-lg-10 po-re" id="bookformPage">
          
            <div class="row">
              <div class="col-12 po-re">
                <div class="search-book-form-custom">
                  	
                    <div class="row-custom">
                    	<input
                    	  class="form-control form-control-sm search-input-custom"
                    	  id="search-input" type="text"
                    	  name="findById"
                    	  maxlength="15"
                    	  aria-label=".form-control-sm example"
                     	  placeholder=" "/>
                    	<label for="search-input">輸入表單編號</label>
                    	<button id="searchBtn" class="btn btn-primary search-icon-btn-custom inside-custom">
                      		<i class="fas fa-search"></i>
                    	</button>
                	</div>
                 
                </div>
              </div>
            </div>
            
            <h2 class="h_bookf">預約賞車/試駕</h2>
            <!-- 	<form action="ControllerServlet" method="post" id="idfSub"> -->
            <form action="addForm" method="post" id="addForm" novalidate="novalidate">
              <table class="table_bookf" >
                <tbody>
                  <tr>
                    <td><label for="date">賞車日期:</label></td>
                    <td>
                      <div class="form-group">
                        <div class="input-group date" id="datetimepicker1">
                          <input type="text" class="form-control" name="driveDate" id="date"/>
                          <span class="input-group-addon color-blue" id="inputAddOnIcon">
                            <span class="glyphicon glyphicon-calendar">
                              <i class="fas fa-calendar-minus"></i></span>
                          </span></div></div><span id="dateCheck"></span><img src=""></td></tr>
                  
                  <tr>
                    <td><label for="driveTime">賞車時間:</label></td>
                    <td>
                      	<input class="form-control" type="text" 
                      	aria-label="default input example" maxlength="5" id="driveTime"
                      	onclick="driveTimeModal()" name="driveTime" v-model="vueTime">
                   		<span id="driveTimeCheck"></span><img src=""></td></tr>
                  
                  <tr>
                    <td><label for="carmod">試駕車種:</label></td>
                    <td>
                      <select
                        class="form-select"
                        aria-label="Default select example"
                        name="carMod"
                        id="carmod"
                        required>
                        
                        <option id="carmoddef" selected disabled>請選擇您想試駕的汽車型號</option>
                        <optgroup label="A series">
                          <option>A3</option>
                          <option>A4</option>
                          <option>A5</option>
                          <option>A6</option>
                        </optgroup>
                        <optgroup label="Q series">
                          <option>Q3</option>
                          <option>Q5</option>
                        </optgroup>
                      </select><span id="carmodCheck"></span><img src=""></td></tr>

                  <tr>
                    <td><label for="loc">試駕地區:</label></td>
                    <td>
                      <select
                        class="form-select"
                        aria-label="Default select example"
                        name="driveLoc"
                        id="loc"
                        required>
                        <option id="locdef" selected disabled>請選擇地區</option>
                        <option value="臺北市" id="opt1">臺北市</option>
                        <option value="桃園市" id="opt2">桃園市</option>
                        <option value="臺中市" id="opt3">臺中市</option>
                        <option value="高雄市" id="opt4">高雄市</option>
                      </select><span id="locCheck"></span><img src=""></td></tr>
                      
                  <tr>
                    <td><label for="locsit">試駕據點:</label></td>
                    <td>
                      <select
                        class="form-select"
                        aria-label="Default select example"
                        name="driveLocSit"
                        id="locsit">
                        <option id="locsitdef" selected disabled>請選擇據點</option>
                        <option value="內湖" id="opt11">內湖服務站</option>
                        <option value="大安" id="opt12">大安服務站</option>
                        <option value="中壢" id="opt21">中壢服務站</option>
                        <option value="八德" id="opt22">八德服務站</option>
                        <option value="大里" id="opt31">大里服務站</option>
                        <option value="七期" id="opt32">七期服務站</option>
                        <option value="鼓山" id="opt41">鼓山服務站</option>
                        <option value="左營" id="opt42">左營服務站</option>
                      </select><span id="locsitCheck"></span><img src=""></td></tr>

                  <tr>
                    <td><label for="name">姓名:</label></td>
                    <td>
                      <input
                        class="form-control" type="text"
                        aria-label="default input example"
                        name="nameCli" maxlength="10"
                        id="name"
                        placeholder="請輸入姓名"
                        required/>
                      <span id="nameCheck"></span><img src=""></td></tr>

                  <tr>
                    <td><label>稱謂:</label></td>
                    <td>
                      <div class="form-check form-check-inline">
                        <input
                          class="form-check-input pointer-custom"
                          type="radio" name="gendCli"
                          id="flexRadio1" value="先生"/>
                        <label class="form-check-label pointer-custom" for="flexRadio1"
                        >先生</label></div>
                          
                      <div class="form-check form-check-inline">
                        <input
                          class="form-check-input pointer-customm"
                          type="radio" name="gendCli"
                          id="flexRadio2" value="小姐"/>
                        <label class="form-check-label pointer-custom" for="flexRadio2"
                        >小姐</label></div>
                          
                      <div class="form-check form-check-inline">
                        <input
                          class="form-check-input pointer-custom"
                          type="radio" name="gendCli"
                          id="flexRadio3" value="其他"/>
                        <label class="form-check-label pointer-custom" for="flexRadio3"
                        >其他</label></div>
                      <span id="gendCheck"></span><img src=""></td></tr>

                  <tr>
                    <td><label for="contim">您方便的聯絡時間:</label></td>
                    <td>
                      <div class="form-check form-check-inline">
                        <input
                          class="form-check-input pointer-custom" type="checkbox"
                          id="inlineCheckbox1" value="早"
                          name="timCli"/>
                        <label class="form-check-label pointer-custom" for="inlineCheckbox1"
                          >早上(8:00-12:00)</label></div>
                          
                      <div class="form-check form-check-inline">
                        <input
                          class="form-check-input pointer-custom" type="checkbox"
                          id="inlineCheckbox2" value="午"
                          name="timCli"/>
                        <label class="form-check-label pointer-custom" for="inlineCheckbox2"
                          >下午(13:00-17:00)</label>
                      </div>
                      <div class="form-check form-check-inline">
                        <input
                          class="form-check-input pointer-custom" type="checkbox"
                          id="inlineCheckbox3" value="晚"
                          name="timCli"/>
                        <label class="form-check-label pointer-custom" for="inlineCheckbox3"
                          >晚上(18:00-22:00)</label></div><span id="contimCheck"></span><img src=""></td></tr>

                  <tr>
                    <td><label for="mail">E-mail:</label></td>
                    <td>
                      <input
                        class="form-control"
                        type="email"
                        aria-label="default input example"
                        name="mailCli"
                        maxlength="35"
                        id="mail" 
                        placeholder="請輸入電子信箱"
                        required/><span id="mailCheck"></span><img src=""></td></tr>

                  <tr>
                    <td><label for="tel">聯絡電話:</label></td>
                    <td>
                      <input
                        class="form-control"
                        type="text"
                        aria-label="default input example"
                        name="telCli"
                        maxlength="13"
                        id="tel"
                        placeholder="請輸入連絡電話"
                        required/><span id="telCheck"></span><img src=""></td></tr>

                  <tr>
                    <td><label for="comm">備註:</label></td>
                    <td>
                      <textarea
                        class="form-control"
                        style="resize: none"
                        maxlength="200"
                        id="comm"
                        rows="5"
                        cols="30"
                        name="remark"
                        placeholder="備註200字以內"></textarea></td></tr>

                  <tr>
                    <td colspan="2">
                      <div class="disclaimer_bookf">
                        <label><input type="checkbox" name="ToS" id="ToS" 
                        class="form-check-input pointer-custom" required 
                        >當您點擊"送出"表示您已閱讀</label>、瞭解並同意接受
                        <a href="./PrivacyPolicy" target="_blank" rel="noopener noreferrer">本公司服務條款</a>
                        之所有內容。您將經由此表單提供您的個人資料給網站，並同意 Audi AG 汽車在遵守本公司
                        <a href="./PrivacyPolicy" target="_blank" rel="noopener noreferrer">隱私權政策</a>下，透過您提供的資訊與您聯絡。
                      </div>
                    </td>
                  </tr>
                </tbody>
              </table>
              <div class="div">
                <span id="submitcheck" style="font-weight:bold;"></span>
              </div>
              <div class="div">
                <button class="btn btn-primary wh-40" id="submit-btn">送出</button>
                <input type="button" id="onekey" class="btn btn-secondary wh-40 onekey" value="一鍵輸入">
              </div>
            </form>
          </div>
          
          
          
          
          
          <div class="col-lg-10 po-re" id="booksearchPage">
          <h2 class="h_booku">試駕表單查詢結果</h2>
          <div class="po-re bor-lef-custom">
            <form action="updateTestdrive" method="post">
              
              <table class="table_booku">
                <tbody id="tbody_showform">
                    <tr>
                    	<td>表單編號</td>
                    	<td>賞車日期時間</td>
                    	<td>試駕車種</td>
                    	<td>試駕地區</td>
                    	<td>試駕據點</td>
                    	<td>業務人員</td>
                    </tr>
                    <tr class="client-data" id="firstRow">
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                    </tr>  
                    <tr>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                    </tr>
                    <tr>
                    	<td>姓名</td>
                    	<td>稱謂</td>
                    	<td>聯絡時間</td>
                    	<td>E-mail</td>
                    	<td>聯絡電話</td>
                    	<td>備註</td>
                    </tr>
                    <tr class="client-data" id="secondRow">
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                      <td></td>
                    </tr>
                </tbody>
              </table>
              <br/>
              <h6 class="formTime"></h6>
              <h6 style="text-align:center" id="puzzleHint">請先解鎖此拼圖再點擊<kbd style="background-color: #1cabc4">修改</kbd></h6>
              <input type="hidden" name="formId" id="hiddenId">
              <button class="btn btn-info wh-40 forward" id="update-custom">修改</button>
            </form>
              
              <div id="outerCaptcha">
              	<div id="captcha"><div id="handle"><span></span></div></div>
              </div>
              
              <button id="TestDrive" class="btn btn-warning wh-40 back">返回預約賞車</button>
          </div>
        </div>
          
          
          
          
          
          
          
          
                    
          <div class="modal fade" tabindex="-1" role="dialog" id="driveTimeModal">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">請選擇時段</h4>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
										</button></div>
						<div class="modal-body">

							<table class="dateTimeTable table table-hover" id="timeTable">
								<thead><tr class="time-window table-primary"><th>時段</th>
									<th id="modalheader"></th></tr></thead>
								<tr class="time-window" v-for="(index) in 10">
									<td>{{ index + 9 }}:00-{{ index + 10}}:00</td>
									<td @click="setTime(index)" :id="'Time'.concat(index+9)"></td>
								</tr>
							</table>

						</div>
						<div class="modal-footer">
							<button id="" type="button" data-bs-dismiss="modal"
								class="btn btn-primary">確認</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
          
          
          
          
          
        </div>
      </div>
    </section>

    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.14/dist/vue.js"></script>
    <script src="/FinalProject/js/addTestdriveValidation.js"></script>
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
    <script src="js/template.js"></script>
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
  </body>
</html>
