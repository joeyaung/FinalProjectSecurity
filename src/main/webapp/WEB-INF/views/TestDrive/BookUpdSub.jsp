<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.Arrays, java.util.ArrayList"%>
	
<!DOCTYPE html>

<%
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control", "no-cache"); // HTTP 1.1
response.setHeader("Pragma", "no-cache"); // HTTP 1.0
response.setDateHeader("Expires", -1); // Prevents caching at the proxy server
%>

<html lang="zh-TW">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>Audi - 修改表單</title>
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
    <script
      src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.js"
      integrity="sha512-D7wym1iXOnyjJbX5hKh84TRFqnXTd7Qc0biqMOmoKgTRRZjUznfgM4Fk8Ta7x8Wp3o8HyKLb3A2kgxq1S6/4fA=="
      crossorigin="anonymous"
    ></script>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.css"
      integrity="sha512-Fppbdpv9QhevzDE+UHmdxL4HoW8HantO+rC8oQB2hCofV+dWV2hePnP5SgiWR1Y1vbJeYONZfzQc5iII6sID2Q=="
      crossorigin="anonymous"
    />
  </head>

<body id="page-top">
  <!-- Navigation-->
  <nav class="navbar navbar-expand-lg navbar-light fixed-top navbar-shrink" id="mainNav">
    <div class="container px-4 px-lg-5">
      <a class="navbar-brand" href="#page-top"><img src="images/audi-logo.png" alt="logo" /></a>
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
        <div class="col-lg-10 po-re">

          <h2 class="h_bookf">賞車/試駕表單修改</h2>
          <!-- 	<form action="ControllerServlet" method="post" id="idfSub"> -->

			
            <jsp:useBean id="oneTestdrive" class="tw.com.finalproject.naiChuan.TestDrive.TestDriveApointment" scope="session" />
          <form action="updateTestdriveConfirm" method="post" id="changedForm" novalidate="novalidate">
            <table class="table_bookf">
              <tbody>
                <tr>
                  <td><label for="date">賞車日期:</label></td>
                  <td>
                    <div class="form-group">
                      <div class="input-group date" id="datetimepicker1">
                        <input type="text" class="form-control" name="driveDate" id="date" autofocus
                          value="${oneTestdrive.driveDate}" required>
                        <span class="input-group-addon color-blue" id="inputAddOnIcon">
                            <span class="glyphicon glyphicon-calendar"
                              ><i class="fas fa-calendar-minus"></i
                            ></span>
                          </span>
                        </div>
                    </div>
                    <span id="dateCheck"></span><img src="">
                  </td>
                </tr>
                
                <tr>
                    <td><label for="dateTime">賞車時間:</label></td>
                    <td>
                      	<input class="form-control" type="text" id="driveTime"
                      	
                      		 :value=vueTime value="${oneTestdrive.driveTime}" v-model=vueTime
  							:run="!vueTime ? vueTime = ${oneTestdrive.driveTime} : true"
                      	
                      	aria-label="default input example" maxlength="5"
                      	onclick="driveTimeModal(date)" name="driveTime">
                      <span id="driveTimeCheck"></span><img src="">
                    </td>
                  </tr>
                
                <tr>
                  <td><label for="carmod">試駕車種:</label></td>
                  <td>
                    <select class="form-select" aria-label="Default select example" name="carMod" id="carmod" required>
                      <option id="carmoddef" disabled>
                        請選擇您想試駕的汽車型號
                      </option>
                      <optgroup label="A series">
                        <% ArrayList<String> AcarList = new ArrayList<String>(
                            Arrays.asList("A3","A4","A5"));

                            for (int i=0; i < AcarList.size() ; i++){ out.print("<option");
                              if(request.getAttribute("carMod").equals(AcarList.get(i))){ out.print(" selected"); }
                              out.print(">"+AcarList.get(i)+"</option>");
                              }
                              %>
                      </optgroup>
                      <optgroup label="Q series">
                        <% ArrayList<String> QcarList = new ArrayList<String>( Arrays.asList("Q3"));

                            for (int i=0; i < QcarList.size() ; i++){ out.print("<option");
                              if(request.getAttribute("carMod").equals(QcarList.get(i))){ out.print(" selected"); }
                              out.print(">"+QcarList.get(i)+"</option>");
                              }
                              %>
                      </optgroup>
                    </select>
                    <span id="carmodCheck"></span><img src="">
                  </td>
                </tr>

                <tr>
                  <td><label for="loc">試駕地區:</label></td>
                  <td>
                    <select class="form-select" aria-label="Default select example" name="driveLoc" id="loc" required>
                      <option id="locdef" disabled>
                        請選擇地區
                      </option>
                      <% // method 1 // ArrayList<String> cityList = new ArrayList<String>();
                          // cityList.add("台北");cityList.add("桃園");cityList.add("台中");cityList.add("高雄");
                          // method 2
                          ArrayList<String> cityList = new ArrayList<String>( Arrays.asList("臺北市", "桃園市", "臺中市", "高雄市","宜蘭縣"));

                              for (int i=0; i<cityList.size() ; i++){ out.print("<option value='"+cityList.get(i)+"'id='opt"+(i+1)+"'");
									if(request.getAttribute("driveLoc").equals(cityList.get(i))){ 
										out.print("selected"); 
										} 
									out.print(">"+cityList.get(i)+"</option>");
                                }
                                %>
                    </select>
                    <span id="locCheck"></span><img src="">
                  </td>
                </tr>
                <tr>
                  <td><label for="locsit">試駕據點:</label></td>
                  <td>
                    <select class="form-select" aria-label="Default select example" name="driveLocSit" id="locsit">
                      <option id="locsitdef" disabled>
                        請選擇據點
                      </option>
                      <% ArrayList<String> SiteList = new ArrayList<String>(
                          Arrays.asList("內湖","大安","平鎮","桃園","北屯","南屯","左營","鼓山","五結","羅東"));
                          ArrayList<String> SiteId = new ArrayList<String>(
                              Arrays.asList("11","12","21","22","31","32","41","42","51","52"));
                              for (int i=0; i<SiteList.size() ; i++){ out.print("<option value='"+SiteList.get(i)+"'id='opt"+SiteId.get(i)+"'");
						if(request.getAttribute("driveLocSit").equals(SiteList.get(i))){ 
							out.print(" selected"); 
							} 
						out.print(">"+SiteList.get(i)+"展示中心"+"</option>");
                                }
                                %>
                    </select>

                    <span id="locsitCheck"></span><img src="">
                  </td>
                </tr>

                <tr>
                  <td><label for="name">姓名:</label></td>
                  <td><input type="text" class="form-control" name="nameCli" aria-label="default input example"
                      size="10" maxlength="10" id="name" value="${oneTestdrive.nameCli}">
                    <span id="nameCheck"></span><img src="">
                  </td>
                </tr>

                <tr>
                  <td><label>稱謂:</label></td>
                  <td>
                    <% ArrayList<String> gendList = new ArrayList<String>( Arrays.asList("先生", "小姐", "其他"));

                        for (int i=0; i<gendList.size() ; i++){ 
                        	out.print("<div class='form-check form-check-inline'><label><input class='form-check-input' type='radio' name='gendCli' value='"+gendList.get(i)+"'");
					if(request.getAttribute("gendCli").equals(gendList.get(i))){ out.print(" checked"); }
            out.print(">"+gendList.get(i)+"</label></div>");
      }
      %>

      <span id="gendCheck"></span><img src="">
      </td>
      </tr>

      <tr>
        <td><label for="contim">您方便的聯絡時間:</label></td>
        <td>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="早" name="timCli" <%if
              (request.getAttribute("timCli").toString().contains("早")){out.print(" checked");}%>
            />
            <label class="form-check-label" for="inlineCheckbox1">早上(8:00-12:00)</label>
          </div>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" id="inlineCheckbox2" value="午" name="timCli" <%if
              (request.getAttribute("timCli").toString().contains("午")){out.print(" checked");}%>
            />
            <label class="form-check-label" for="inlineCheckbox2">下午(13:00-17:00)</label>
          </div>
          <div class="form-check form-check-inline">
            <input class="form-check-input" type="checkbox" id="inlineCheckbox3" value="晚" name="timCli" <%if
              (request.getAttribute("timCli").toString().contains("晚")){out.print(" checked");}%>
            />
            <label class="form-check-label" for="inlineCheckbox3">晚上(18:00-22:00)</label>
          </div>

          <span id="contimCheck"></span><img src="">
        </td>
      </tr>

      <tr>
        <td><label for="mail">E-mail:</label></td>
        <td>
          <input class="form-control" type="text" aria-label="default input example" name="mailCli" size="20"
            maxlength="35" id="mail" value="${oneTestdrive.mailCli}" required>

          <span id="mailCheck"></span><img src="">
        </td>
      </tr>

      <tr>
        <td><label for="tel">聯絡電話:</label></td>
        <td>
          <input class="form-control" type="text" aria-label="default input example" name="telCli" maxlength="13"
            id="tel" value="${oneTestdrive.telCli}" required>

          <span id="telCheck"></span><img src="">
        </td>
      </tr>

      <tr>
        <td><label for="comm">備註:</label></td>
        <td>
          <textarea class="form-control" id="comm" rows="5" cols="30" name="remark" style="resize: none"
            placeholder="備註200字以內">${oneTestdrive.remark}</textarea>
        </td>
      </tr>
      <tr>
        <td colspan="2">
          <div class="disclaimer_bookf">
           當您點擊<kbd style="background-color: #64a19d">確認修改</kbd>表示您已閱讀、瞭解並同意接受
           <a href="./PrivacyPolicy" target="_blank" rel="noopener noreferrer">本公司服務條款</a
           >之所有內容。您將經由此表單提供您的個人資料給網站，並同意 Audi AG 在遵守本公司<a 
           id="idPrivate" class="btn_bookf">隱私權政策</a>下，透過您提供的資訊與您聯絡。
          </div>
        </td>
      </tr>
      
      </tbody>
      </table>
      <div class="div">
        <span class="errmes_bookf" id="submitcheck"></span>
      </div>

      <input type="hidden" name="formId" value="${oneTestdrive.formId}">
      <input type="hidden" name="sales" value="${oneTestdrive.sales}">
      <input type="hidden" name="formTime" value="${oneTestdrive.formTime}">
      <button class="btn btn-primary wh-40" id="idUpdSub">確認修改</button>


      </form>
      <form action="TestDrive" method="post">
        <button class="btn btn-warning wh-40 back2">返回預約賞車</button>
      </form>
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
  <script src="./js/editTestdriveValidation.js"></script>
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
