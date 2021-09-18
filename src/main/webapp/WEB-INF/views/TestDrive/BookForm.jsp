<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-TW">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Audi - 預約試駕</title>
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
    <link href="css/index.css" rel="stylesheet" />
    <link rel="stylesheet" href="/FinalProject/css/bookForm.css" />
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
              <a class="nav-link" href="/FinalProject/products">精品商城</a>
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
                        </optgroup>
                        <optgroup label="Q series">
                          <option>Q3</option>
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
                        <option value="宜蘭市" id="opt5">宜蘭市</option>
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
                        <option value="內湖" id="opt11">內湖展示中心</option>
                        <option value="大安" id="opt12">大安展示中心</option>
                        <option value="平鎮" id="opt21">平鎮展示中心</option>
                        <option value="桃園" id="opt22">桃園展示中心</option>
                        <option value="北屯" id="opt31">北屯展示中心</option>
                        <option value="南屯" id="opt32">南屯展示中心</option>
                        <option value="左營" id="opt41">左營展示中心</option>
                        <option value="鼓山" id="opt42">鼓山展示中心</option>
                        <option value="五結" id="opt51">五結展示中心</option>
                        <option value="羅東" id="opt52">羅東展示中心</option>
                      </select><span id="locsitCheck"></span><img src=""></td></tr>
                  <tr id="maptr" style="display:none;"><td colspan="2"><iframe id="map" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.0386609911966!2d121.58029721448172!3d25.066678743135757!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442ac80629b002b%3A0x7d52e35df8c6135e!2zMTE05Y-w5YyX5biC5YWn5rmW5Y2A5paw5rmW5LiJ6LevMjg46Jmf!5e0!3m2!1szh-TW!2stw!4v1631847181010!5m2!1szh-TW!2stw" width="800" height="200" style="border:0;" allowfullscreen="" loading="lazy"></iframe></td></tr>

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
<script>
$("#locsit").on('change',function(){

$("#maptr").css('display','contents');

if($("#locsit").val() == "內湖"){
$("#map").prop('src', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3614.038804349811!2d121.58029721500692!3d25.066673883957154!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442ac80629b002b%3A0x7d52e35df8c6135e!2zMTE05Y-w5YyX5biC5YWn5rmW5Y2A5paw5rmW5LiJ6LevMjg46Jmf!5e0!3m2!1szh-TW!2stw!4v1631841378426!5m2!1szh-TW!2stw')
} else if($("#locsit").val() == "大安"){
$("#map").prop('src', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3615.231423882283!2d121.54521835073966!3d25.026219183897393!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442aa2dec7cccbf%3A0x4817ddfdf8bce9eb!2zMTA25Y-w5YyX5biC5aSn5a6J5Y2A5Zub57at6LevMjA45be3MTAtMuiZnw!5e0!3m2!1szh-TW!2stw!4v1631841519404!5m2!1szh-TW!2stw')
} else if($("#locsit").val() == "平鎮"){
$("#map").prop('src', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3618.9310598196157!2d121.20795015082189!3d24.900333083956745!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3468232c6c3fc6ab%3A0x750d21a65e8c94bc!2zMzI05qGD5ZyS5biC5bmz6Y6u5Y2A5Y2X6LGQ6LevMuiZnw!5e0!3m2!1szh-TW!2stw!4v1631842088533!5m2!1szh-TW!2stw')
} else if($("#locsit").val() == "桃園"){
$("#map").prop('src', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3616.7414748606507!2d121.32045385082321!3d24.974908983921473!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x34681ec2fbe4424f%3A0x86a6a26f278e38eb!2zMzMw5qGD5ZyS5biC5qGD5ZyS5Y2A5qi55LuB5LiJ6KGXMjjomZ8!5e0!3m2!1szh-TW!2stw!4v1631842179251!5m2!1szh-TW!2stw')
} else if($("#locsit").val() == "北屯"){
$("#map").prop('src', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3640.0717313548475!2d120.67332895080897!3d24.16921698430801!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x346917d730553f8d%3A0x5d1a96f7fa803736!2zNDA05Y-w5Lit5biC5YyX5Y2A5bGx6KW_6Lev5LqM5q61MjnomZ8!5e0!3m2!1szh-TW!2stw!4v1631842314779!5m2!1szh-TW!2stw')
} else if($("#locsit").val() == "南屯"){
$("#map").prop('src', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3640.6435681591197!2d120.59544335080867!3d24.149152484317746!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x34693e67f1bb7b5f%3A0xe02c3cd9d7b393db!2zNDA45Y-w5Lit5biC5Y2X5bGv5Y2A57K-56eR5Lit6LevMTjomZ8!5e0!3m2!1szh-TW!2stw!4v1631842373302!5m2!1szh-TW!2stw')
} else if($("#locsit").val() == "左營"){
$("#map").prop('src', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3681.542557190806!2d120.2986379507838!3d22.670837985059425!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x346e05088c4b8091%3A0xe552cce8f4b4a8b0!2zODEz6auY6ZuE5biC5bem54ef5Y2A5paw6I6K5LiA6LevMzA26Jmf!5e0!3m2!1szh-TW!2stw!4v1631842456043!5m2!1szh-TW!2stw')
} else if($("#locsit").val() == "鼓山"){
$("#map").prop('src', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3682.1349522558858!2d120.28107655078333!3d22.648756485070678!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x346e0444fa6067d1%3A0x2ca84555c115ed4c!2zODA06auY6ZuE5biC6byT5bGx5Y2A6b6N5rC05LiA6KGXMjHomZ8!5e0!3m2!1szh-TW!2stw!4v1631842554405!5m2!1szh-TW!2stw')
} else if($("#locsit").val() == "五結"){
$("#map").prop('src', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3624.5437209360193!2d121.78934595081842!3d24.7082070840481!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3467e599d60a8dcd%3A0x3a4da8f1736f0c9a!2zMjY45a6c6Jit57ij5LqU57WQ6YSJ5LiJ5ZCJ5Lit6LevMzTomZ8!5e0!3m2!1szh-TW!2stw!4v1631842668327!5m2!1szh-TW!2stw')
} else if($("#locsit").val() == "羅東"){
$("#map").prop('src', 'https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3625.389346320668!2d121.76615375081798!3d24.67913918406187!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3467e67f01608451%3A0x56327841408f1664!2zMjY15a6c6Jit57ij576F5p2x6Y6u5YWs5q2j6LevMTg46Jmf!5e0!3m2!1szh-TW!2stw!4v1631842730515!5m2!1szh-TW!2stw')
}
});
</script>
  </body>
</html>
