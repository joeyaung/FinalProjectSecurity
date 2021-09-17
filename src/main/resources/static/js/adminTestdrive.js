// 未成功給 admin 端加上Vue 先comment掉
//var vueAll = new Vue({
//    el: '#vueAll',
//    data: {
//        vueTime1: '',
//        vueTime2: ''
//    },
//    methods:{     
//	// driveTime Modal連動給input值
//   		setTime(index){
//   		let rows = $("#timeTable tr");
//   		let row = $("#timeTable tr")[index];
//   		
//   		for (let i = 0; i < $("#timeTable tr").length; i++) {
//   			$("#timeTable tr")[i].classList.remove("selected-Time");
//   		}
//   		row.classList.add("selected-Time");
//    	this.vueTime1=index+9;
//   	}   
//  } 
//})


let flagDate1 = true;
let flagDriveTime1 = true;
let flagCarmod1 = true;
let flagLoc1 = true;
let flagLocsit1 = true;

let flagName1 = true;
let flagGender1 = true;
let flagConTim1 = true;
let flagMail1 = true;
let flagTel1 = true;


//  date
function checkDate(){
    
    let dateObj = document.getElementById("1date");

    // 選擇日為空值，則"請選擇日期"
    if(dateObj.value == ""){
    	$("#1dateCheck").html("請選擇日期").css('color', 'red');
		$("#1dateCheck").next().attr("src", '/FinalProject/images/error.png');
        flagDate1 = false;
    	
    // 此外，移除錯誤訊息
    } else{
    	$("#1dateCheck").html("");
    	$("#1dateCheck").next().attr("src", '');
        flagDate1 = true;
    }
}
$('#1date').on('blur',checkDate);


//  driveTime
function checkDriveTime(){
    
    // 選擇日為空值，則"請選擇日期"
    if( $('#1driveTime').val() == ""){
    	$("#1driveTimeCheck").html("請選擇時間").css('color', 'red');
		$("#1driveTimeCheck").next().attr("src", '/FinalProject/images/error.png');
        flagDriveTime1 = false;
    	
    // 此外，移除錯誤訊息
    } else{
    	$("#1driveTimeCheck").html("");
    	$("#1driveTimeCheck").next().attr("src", '');
        flagDriveTime1 = true;
    }
}
$('#1driveTime').on('blur',checkDriveTime);


// carmod

function checkCarmod(){
    let carmodObj = document.getElementById("1carmod");

    // 如果 carmod 的值跟預設一樣，錯誤
    if (carmodObj.value == document.getElementById("1carmoddef").value){
    	$("#1carmodCheck").html("請選擇車型").css('color', 'red');
		$("#1carmodCheck").next().attr("src", '/FinalProject/images/error.png');
        flagCarmod1 = false;
    	
    // 反之，移除錯誤訊息
    } else{
    	$("#1carmodCheck").html("");
    	$("#1carmodCheck").next().attr("src", '');
        flagCarmod1 = true;
    }
}
$('#1carmod').on('blur',checkCarmod);


// loc

function checkLoc(){
    let locObj = document.getElementById("1loc");

    // 如果 loc 的值跟預設一樣，錯誤
    if (locObj.value == document.getElementById("1locdef").value){
    	$("#1locCheck").html("請選擇地區").css('color', 'red');
		$("#1locCheck").next().attr("src", '/FinalProject/images/error.png');
        flagLoc1 = false;

    // 反之，移除錯誤訊息
    } else{
    	$("#1locCheck").html("");
    	$("#1locCheck").next().attr("src", '');
        flagLoc1 = true;
    }
}
$('#1loc').on('blur',checkLoc);


// locsit

function checkLocsit(){

    let locsitObj = document.getElementById("1locsit");

    // 如果 locsit 的值跟預設一樣，錯誤
    if (locsitObj.value == document.getElementById("1locsitdef").value){
    	$("#1locsitCheck").html("請選擇服務據點").css('color', 'red');
		$("#1locsitCheck").next().attr("src", '/FinalProject/images/error.png');
        flagLocsit1 = false;
    	
    // 反之，移除錯誤訊息
    } else{
    	$("#1locsitCheck").html("");
    	$("#1locsitCheck").next().attr("src", '');
        flagLocsit1 = true;
    	
    }
}
$('#1locsit').on('blur',checkLocsit);


// name

function checkName(){

    let nameObj = document.getElementById("1name");

    // 如果 name 的值為空或長度小於2
    if (nameObj.value.trim() == "" || nameObj.value.trim().length <= 1){
    	$("#1nameCheck").html("請輸入姓名(姓名不可少於2個字元)").css('color', 'red');
		$("#1nameCheck").next().attr("src", '/FinalProject/images/error.png');
        flagName1 = false;
    
    } else{
    	$("#1nameCheck").html("");
    	$("#1nameCheck").next().attr("src", '');
        flagName1 = true;
    }
}
$('#1name').on('blur',checkName);



// Gender

function checkGender() {
    // 取得gendCli的 3個元素群組
    let Total_Obj = document.getElementsByName('gendCli');
    // flag 改為 false
    flagGender1=false;
    // 迭代 該群組，若有其中一項被勾選(checked)，flag 改為真
    for (let i = 0; i < Total_Obj.length; i++) {
        if (Total_Obj[i].checked) {
            flagGender1=true;
        } 
    }
    
    // 最終，若flag標記為假，不OK；若為真OK
    if(flagGender1 == false) {
    	$("#1gendCheck").html("請點選性別").css('color', 'red');
        $("#1gendCheck").next().attr("src", '/FinalProject/images/error.png');
    
    }else{
    	$("#1gendCheck").html("");
    	$("#1gendCheck").next().attr("src", '');
    }
}
//其他jQuery檢查語法
//$("#tdcheckbox > div > input").each(function() {
//	$('#radio_button').is(':checked')
//
//if ($('input[name=gender]:checked').length > 0) {
//    // do something here
//}


//  方便的聯絡時間  checkbox
function checkConTim() {
    // 取得timCli的 3個元素群組
    let Total_Obj = document.getElementsByName('timCli');
    // 是否有input，flag 初始為無
    flagConTim1 = false;
    // 迭代 該群組，若有其中一項被勾選(checked)，flag改為真
    for (let i = 0; i < Total_Obj.length; i++) {
        if (Total_Obj[i].checked) {
            flagConTim1 = true;
        } 
    }
    // 最終，若flag為假，不OK；若為真OK
    if(flagConTim1 == false) {
    	$("#1contimCheck").html("請選擇聯絡時段").css('color', 'red');
        $("#1contimCheck").next().attr("src", '/FinalProject/images/error.png');
    
    }else{
    	$("#1contimCheck").html("");
    	$("#1contimCheck").next().attr("src", '');
    }
}



//  E-mail

function checkMail(){

    let mailObj = document.getElementById("1mail");
    let re = /^.+@.+$/g;
    // 如果 mail 為空值
    if (mailObj.value.trim() == ""){
    	$("#1mailCheck").html("請輸入電子信箱").css('color', 'red');
		$("#1mailCheck").next().attr("src", '/FinalProject/images/error.png');
        flagMail1 = false;
        
    //如果 mail 不合規則
    } else if(re.test(mailObj.value) == false){
    	$("#1mailCheck").html("請輸入有效的電子信箱").css('color', 'red');
		$("#1mailCheck").next().attr("src", '/FinalProject/images/error.png');
        flagMail1 = false;
        
    }else{
    	$("#1mailCheck").html("");
    	$("#1mailCheck").next().attr("src", '');
        flagMail1 = true;
    }
}
$('#1mail').on('blur',checkMail);



//  tel

function checkTel(){

    let telObj = document.getElementById("1tel");
    let re = /^\d{9,12}$/g;
    // 如果 tel 為空值
    if (telObj.value.trim() == ""){
    	$("#1telCheck").html("請輸入連絡電話").css('color', 'red');
		$("#1telCheck").next().attr("src", '/FinalProject/images/error.png');
        flagTel1 = false;
    
    //如果 tel 不合規則
    } else if(re.test(telObj.value) == false){
    	$("#1telCheck").html("請輸入有效的電話號碼(9-12碼數字)").css('color', 'red');
		$("#1telCheck").next().attr("src", '/FinalProject/images/error.png');
        flagTel1 = false;
    	
    }else{
    	$("#1telCheck").html("");
        $("#1telCheck").next().attr("src", '');
        flagTel1 = true;
    }
}
$('#1tel').on('blur',checkTel);



//  一鍵輸入
$('#1oneKey').on('click', function(){
    $('#1date').val('2021-11-21');
    $('#1driveTime').val('13');
    $('#1carmoddef').next().children(":last").prev().prop('selected',true)
    $('#1opt2').prop('selected',true)
   	toLocsit1();
    $('#1opt21').prop('selected',true)
    $('#1name').val('張程婉');
    $('#1flexRadio2').prop('checked',true)
    $('#1inlineCheckbox2').prop('checked',true);
    $('#1mail').val('eeit2905@gmail.com');
    $('#1tel').val('0921220068');
    $('#1comm').val('');
}).on('dblclick', function(){
    $('#1date').val('2021-10-14');
    $('#1driveTime').val('11');
    $('#1carmoddef').next().children(":first").next().prop('selected',true)
    $('#1opt1').prop('selected',true)
   	toLocsit1();
    $('#1opt12').prop('selected',true)
    $('#1name').val('林暮光');
    $('#1flexRadio1').prop('checked',true)
    $('#1inlineCheckbox3').prop('checked',true);
    $('#1mail').val('eeit2905@gmail.com');
    $('#1tel').val('0976212488');
    $('#1comm').val('');
})


// 總檢查
function checkAll1(){
    checkDate();
    checkDriveTime();
    checkCarmod();
    checkLoc();
    checkLocsit();
    
    checkName();
    checkGender();
    checkConTim();
    checkMail();
    checkTel();
    
    if (flagDate1 && flagDriveTime1 && flagCarmod1 && flagLoc1 && flagLocsit1 && flagName1 && 
    	flagGender1 && flagConTim1 && flagMail1 && flagTel1){
    	document.getElementById("1submitcheck").innerHTML = "";
        return true;
    } else{
        document.getElementById("1submitcheck").innerHTML = "表單資料不齊全或含有無效內容，請重新檢查";
        return false;
    }
}

// 點"送出"先執行總檢查，再執行送出的Ajax
$("#1submit").click(function (e) {			
    var formData = new FormData(document.getElementById("form1"));
    if (checkAll1() == true) {
        addTesdrive(formData);
    } else
        e.stopPropagation();
});

// 送出的Ajax
function addTesdrive(formData){
    $.ajax({
        url: "/FinalProject/addTestdrive",
        method: "POST",
        data: formData,
        contentType: false, // NEEDED, DON'T OMIT THIS (requires jQuery 1.6+)
        processData: false, // NEEDED, DON'T OMIT THIS
        "mimeType": "JSON/form-data",
        success: function (response) {
            $("#form1")[0].reset(); // 新增的model清空
            table.ajax.reload();	// data table刷新
            changeComment();		// calender刷新
        },
        error: function (err) {
            console.log(err);
            alert('insert failed:' + err);
        }
    });
}


// loc locsit 連動

let locObj1 = document.getElementById("1loc");

locObj1.addEventListener("change",toLocsit1)
function toLocsit1(){

	$("#1locsitdef").nextAll().css('display','none');
	$("#1locsit").val($("#1locsitdef").val()) ;
<<<<<<< Updated upstream

=======
>>>>>>> Stashed changes
	if( $("#1loc").val() == $("#1opt1").val() ){
        $("#1opt11").css('display','block');
        $("#1opt12").css('display','block');

    } else if ( $("#1loc").val() == $("#1opt2").val() ){
        $("#1opt21").css('display','block');
        $("#1opt22").css('display','block');

    } else if ( $("#1loc").val() == $("#1opt3").val() ){
        $("#1opt31").css('display','block');
        $("#1opt32").css('display','block');

    } else if ( $("#1loc").val() == $("#1opt4").val() ){
        $("#1opt41").css('display','block');
        $("#1opt42").css('display','block');
        
    } else if ( $("#1loc").val() == $("#1opt5").val() ){
        $("#1opt51").css('display','block');
        $("#1opt52").css('display','block');
    }
}

// 畫面載入時先執行一次 locsit連動
 $(document).ready(function(){
   toLocsit1();
   toLocsit2();
  
   $("#1date").datepicker({
    format: 'yyyy-mm-dd',
    orientation: "bottom",
	startDate: '+1d',
   });
   $("#2date").datepicker({
    format: 'yyyy-mm-dd',
    orientation: "bottom",
	startDate: '+1d',
   });
   
   $("#inputAddOnIcon").on("click",function(){
   	$("#1date").focus();
   });
   $("#inputAddOnIcon2").on("click",function(){
   	$("#2date").focus();
   });
   
   //載入時，顯示 data table，隱藏calender
   $("#Testdrive1").css('display','block');
   $("#Testdrive2").css('display','none');
});

 $('#toggle-event').change(function() {
 	
 	if(this.checked) { 
	 	$("#Testdrive1").css('display','block'); 
   		$("#Testdrive2").css('display','none'); 
   		$("#fas-Cal").css('color','#2f3542')
    } else {
	 	$("#Testdrive1").css('display','none'); 
   		$("#Testdrive2").css('display','block'); 
   		$("#fas-Cal").css('color','#5bc0de')
    }
 });



//以下是  editModal
//以下是  editModal
//以下是  editModal



let flagDate2 = true;
let flagDriveTime2 = true;
let flagCarmod2 = true;
let flagLoc2 = true;
let flagLocsit2 = true;
let flagSales2 = true;

let flagName2 = true;
let flagGender2 = true;
let flagConTim2 = true;
let flagMail2 = true;
let flagTel2 = true;


//  date
function checkDate2(){
    
    let dateObj = document.getElementById("2date");

    // 選擇日為空值，則"請選擇日期"
    if(dateObj.value == ""){
    	$("#2dateCheck").html("請選擇日期").css('color', 'red');
		$("#2dateCheck").next().attr("src", '/FinalProject/images/error.png');
        flagDate2 = false;
    	
    // 此外，移除錯誤訊息
    } else{
    	$("#2dateCheck").html("");
    	$("#2dateCheck").next().attr("src", '');
        flagDate2 = true;
    }
}
$('#2date').on('blur',checkDate2);



//  driveTime
function checkDriveTime2(){
    
    // 選擇日為空值，則"請選擇日期"
    if( $('#2driveTime').val() == ""){
    	$("#2driveTimeCheck").html("請選擇時間").css('color', 'red');
		$("#2driveTimeCheck").next().attr("src", '/FinalProject/images/error.png');
        flagDriveTime2 = false;
    	
    // 此外，移除錯誤訊息
    } else{
    	$("#2driveTimeCheck").html("");
    	$("#2driveTimeCheck").next().attr("src", '');
        flagDriveTime2 = true;
    }
}
$('#2driveTime').on('blur',checkDriveTime2);




// carmod

function checkCarmod2(){
    let carmodObj = document.getElementById("2carmod");

    // 如果 carmod 的值跟預設一樣，錯誤
    if (carmodObj.value == document.getElementById("2carmoddef").value){
    	$("#2carmodCheck").html("請選擇車型").css('color', 'red');
		$("#2carmodCheck").next().attr("src", '/FinalProject/images/error.png');
        flagCarmod2 = false;
        
    // 反之，移除錯誤訊息
    } else{
    	$("#2carmodCheck").html("");
    	$("#2carmodCheck").next().attr("src", '');
        flagCarmod2 = true;
    }
}
$('#2carmod').on('blur',checkCarmod2);


// loc

function checkLoc2(){
    let locObj = document.getElementById("2loc");

    // 如果 loc 的值跟預設一樣，錯誤
    if (locObj.value == document.getElementById("2locdef").value){
    	$("#2locCheck").html("請選擇地區").css('color', 'red');
		$("#2locCheck").next().attr("src", '/FinalProject/images/error.png');
        flagLoc2 = false;
        
    // 反之，移除錯誤訊息
    } else{
    	$("#2locCheck").html("");
    	$("#2locCheck").next().attr("src", '');
        flagLoc2 = true;
    }
}
$('#2loc').on('blur',checkLoc2);


// locsit

function checkLocsit2(){
    let locsitObj = document.getElementById("2locsit");

    // 如果 locsit 的值跟預設一樣，錯誤
    if (locsitObj.value == document.getElementById("2locsitdef").value){
    	$("#2locsitCheck").html("請選擇服務據點").css('color', 'red');
		$("#2locsitCheck").next().attr("src", '/FinalProject/images/error.png');
        flagLocsit2 = false;
        
    // 反之，移除錯誤訊息
    } else{
    	$("#2locsitCheck").html("");
    	$("#2locsitCheck").next().attr("src", '');
        flagLocsit2 = true;
    }
}
$('#2locsit').on('blur',checkLocsit2);

// sales
function checkSale2(){
	
	// 如果 sale 的值為空或長度小於2
	if($('#2sale').val().trim() == '' || $('#2sale').val().trim().length<=2){
		$("#2saleCheck").html("請輸入業務姓名").css('color', 'red');
		$("#2saleCheck").next().attr("src", '/FinalProject/images/error.png');
        flagSales2 = false;
        
	} else{
        $('#2saleCheck').html('');
        $("#2saleCheck").next().attr("src", '');
        flagSales2 = true;
    }
}
$('#2sale').on('blur',checkSale2);

// name

function checkName2(){
    let nameObj = document.getElementById("2name");

    // 如果 name 的值為空或長度小於2
    if (nameObj.value.trim() == "" || nameObj.value.trim().length <= 1){
    	$("#2nameCheck").html("請輸入姓名(姓名不可少於2個字元)").css('color', 'red');
		$("#2nameCheck").next().attr("src", '/FinalProject/images/error.png');
        flagName2 = false;
        
    } else{
    	$("#2nameCheck").html("");
    	$("#2nameCheck").next().attr("src", '');
        flagName2 = true;
    }
}
$('#2name').on('blur',checkName2);


// Gender

function checkGender2() {
    // 取得gendCli的 3個元素群組
    let Total_Obj = document.getElementsByName('gendCli');
    // flag 改為 false
    flagGender2=false;
    // 迭代 該群組，若有其中一項被勾選(checked)，flag 改為真
    for (let i = 0; i < Total_Obj.length; i++) {
        if (Total_Obj[i].checked) {
            flagGender2=true;
        } 
    }
    
    // 最終，若flag標記為假，不OK；若為真OK
    if(flagGender2 == false) {
    	$("#2gendCheck").html("請點選性別").css('color', 'red');
        $("#2gendCheck").next().attr("src", '/FinalProject/images/error.png');
    }else{
    	$("#2gendCheck").html("");
    	$("#2gendCheck").next().attr("src", '');       
    }
}



//  方便的聯絡時間  checkbox
function checkConTim2() {
    // 取得timCli的 3個元素群組
    let Total_Obj = document.getElementsByName('timCli');
    // 是否有input，flag 初始為無
    flagConTim2 = false;
    // 迭代 該群組，若有其中一項被勾選(checked)，flag 改為真
    for (let i = 0; i < Total_Obj.length; i++) {
        if (Total_Obj[i].checked) {
            flagConTim2 = true;
        } 
    }
    // 最終，若flag為假，不OK；若為真OK
    if(flagConTim2 == false) {
    	$("#2contimCheck").html("請選擇聯絡時段").css('color', 'red');
        $("#2contimCheck").next().attr("src", '/FinalProject/images/error.png');

    }else{
    	$("#2contimCheck").html("");
    	$("#2contimCheck").next().attr("src", '');
    }
}



//  E-mail

function checkMail2(){

    let mailObj = document.getElementById("2mail");
    let re = /^.+@.+$/g;
    // 如果 mail 為空值
    if (mailObj.value.trim() == ""){
		$("#2mailCheck").html("請輸入電子信箱").css('color', 'red');
		$("#2mailCheck").next().attr("src", '/FinalProject/images/error.png');
        flagMail2 = false;
    
    //如果 mail 不合規則
    } else if(re.test(mailObj.value) == false){
    	$("#2mailCheck").html("請輸入有效的電子信箱").css('color', 'red');
		$("#2mailCheck").next().attr("src", '/FinalProject/images/error.png');
        flagMail2 = false;
        
    }else{
    	$("#2mailCheck").html("");
    	$("#2mailCheck").next().attr("src", '');
        flagMail2 = true;
    }
}
$('#2mail').on('blur',checkMail2);



//  tel

function checkTel2(){

    let telObj = document.getElementById("2tel");
    let re = /^\d{9,12}$/g;
    // 如果 tel 為空值
    if (telObj.value.trim() == ""){
    	$("#2telCheck").html("請輸入連絡電話").css('color', 'red');
		$("#2telCheck").next().attr("src", '/FinalProject/images/error.png');
        flagTel2 = false;
        
    //如果 tel 不合規則
    } else if(re.test(telObj.value) == false){
    	$("#2telCheck").html("請輸入有效的電話號碼(9-12碼數字)").css('color', 'red');
		$("#2telCheck").next().attr("src", '/FinalProject/images/error.png');
        flagTel2 = false;
        
    }else{
    	$("#2telCheck").html("");
        $("#2telCheck").next().attr("src", '');
        flagTel2 = true;
    }
}
$('#2tel').on('blur',checkTel2);


//  一鍵輸入
$('#2oneKey').on('click', function(){
    $('#2date').val('2021-09-18');
    $('#2driveTime').val('14');
    $('#2carmoddef').next().children(":last").prev().prop('selected',true)
    $('#2opt3').prop('selected',true)
   	toLocsit2();
    $('#2opt31').prop('selected',true)
    $('#2sale').val('Alex');
    $('#2name').val('張展航');
    $('#2flexRadio1').prop('checked',true)
    $('#2inlineCheckbox2').prop('checked',true);
    $('#2mail').val('eeit2905@gmail.com');
    $('#2tel').val('0976355678');
    $('#2comm').val('');
}).on('dblclick', function(){
    $('#2date').val('2021-10-04');
    $('#2driveTime').val('15');
    $('#2carmoddef').next().children(":first").next().prop('selected',true)
    $('#2opt1').prop('selected',true)
   	toLocsit2();
    $('#2opt12').prop('selected',true);
    $('#2sale').val('Eric');
    $('#2name').val('林淑惠');
    $('#2flexRadio2').prop('checked',true)
    $('#2inlineCheckbox3').prop('checked',true);
    $('#2mail').val('eeit2905@gmail.com');
    $('#2tel').val('0976212488');
    $('#2comm').val('');
})


// 總檢查
function checkAll2(){
    checkDate2();
    checkDriveTime2();
    checkCarmod2();
    checkLoc2();
    checkLocsit2();
    checkSale2();
    
    checkName2();
    checkGender2();
    checkConTim2();
    checkMail2();
    checkTel2();
    
    if (flagDate2 && flagDriveTime2 && flagCarmod2 && flagLoc2 
    && flagLocsit2 && flagSales2 && flagName2 && flagGender2 && 
    flagConTim2 && flagMail2 && flagTel2){
    	document.getElementById("2submitcheck").innerHTML = "";
        return true;
    } else{
    	document.getElementById("2submitcheck").innerHTML = "表單資料不齊全或含有無效內容，請重新檢查";
        return false;
    }
}

// 點"送出"先執行總檢查，再執行送出的Ajax
$("#2submit").click(function (e) {			
    var formData2 = new FormData(document.getElementById("form2"));
    if (checkAll2() == true) {
        editTesdrive(formData2);
    } else
        e.stopPropagation();
});


// "確認修改"按鈕，儲存資料
//$("#2submit").click(
	function editTesdrive (formData2) {
//		var editTestdriveFormData = new FormData($('#form2')[0]);
		$.ajax({
			url: "/FinalProject/updateTestdriveAPI",
			method: "POST",
			data: formData2,
			contentType: false,
			processData: false,
			success: function (res) {
				$("#form2")[0].reset();		// 修改的model清空
				table.ajax.reload();		// data table刷新
				changeComment();			// calender刷新
			},
			error: function (err) {
				alert('update failed' + err);
			}
		});
	}


// loc locsit 連動

let locObj2 = document.getElementById("2loc");

locObj2.addEventListener("change",toLocsit2)
function toLocsit2(){

	$("#2locsitdef").nextAll().css('display','none');
	$("#2locsit").val($("#2locsitdef").val()) ;
<<<<<<< Updated upstream
  
=======
>>>>>>> Stashed changes
	if( $("#2loc").val() == $("#2opt1").val() ){
        $("#2opt11").css('display','block');
        $("#2opt12").css('display','block');

    } else if ( $("#2loc").val() == $("#2opt2").val() ){
        $("#2opt21").css('display','block');
        $("#2opt22").css('display','block');

    } else if ( $("#2loc").val() == $("#2opt3").val() ){
        $("#2opt31").css('display','block');
        $("#2opt32").css('display','block');

    } else if ( $("#2loc").val() == $("#2opt4").val() ){
        $("#2opt41").css('display','block');
        $("#2opt42").css('display','block');
        
    } else if ( $("#2loc").val() == $("#2opt5").val() ){
        $("#2opt51").css('display','block');
        $("#2opt52").css('display','block');
    }
}




// 以下Calender的
// 以下Calender的
// 以下Calender的
// 以下Calender的



        // 建立 資訊欄
        document.getElementById("dateComment").innerHTML = `日期選擇中...`

        // 建立 年 選項
        for (i = 2021; i <= 2025; i++) {
            let opt = document.createElement("option")
            opt.value = i
            opt.innerHTML = i
            document.getElementById("idYear").appendChild(opt)
        }
        // console.log(document.getElementById("idYear").lastChild) //確認lastChild是年份
        document.getElementById("idYear").firstChild.selected = true //設為預設

        // 建立 月 選項
        for (i = 1; i <= 12; i++) {
            let opt = document.createElement("option")
            let optText = document.createTextNode(i)
            opt.appendChild(optText)
            opt.setAttribute("value", i)

            document.getElementById("idMonth").appendChild(opt)
        }
        document.getElementById("idMonth").lastChild.selected = true //設為預設

        // 綁定事件
        document.getElementById("idYear").addEventListener("change", changeComment)
        document.getElementById("idMonth").addEventListener("change", changeComment)


        // 修改  資訊欄  以及  表格
        function changeComment() {
            // 修改資訊欄文字
            let yCom = ~~document.getElementById("idYear").value
            let mCom = ~~document.getElementById("idMonth").value
            document.getElementById("dateComment").innerHTML =
                yCom +`年`+ mCom +`月 的預約試駕表單`
            $('#titleBE').html((mCom-1)+'月預約試駕資訊');
            $('#titleAF').html((mCom+1)+'月預約試駕資訊');


            // 載入 表頭
            for(item of document.querySelectorAll("#idThead")){
                item.innerHTML=`<td>Sun</td><td>Mon</td><td>Tue</td><td>Wed</td>
                <td>Thu</td><td>Fri</td><td>Sat</td>`
            }

            
            
            $.ajax({
				url: "/FinalProject/getAllTestdrive/",
				method: "GET",
				dataType: "json",
				success: function (data) {

			// 修改表格
            let str = "<tr>"
            let calendF = new Date(yCom, mCom - 1, 1).getDay() //該月第一天星期幾
            // 補滿前面的td
            for (let j = 0; j < calendF; j++) {
                str += "<td></td>"
            }
            // 取得月的二位文字
            mCom<10 ? '0' + mCom : '' + mCom;
            // 該月最後一天的  日  期 
            let lastDay = new Date(yCom, mCom, 0).getDate()
            
			for (let i = 1; i <= lastDay; i++) {
             		i<10 ? dCom="0"+i : dCom=""+i 
					str += "<td id='"+ yCom + "-" + mCom + "-"+ dCom +"' onclick=dayModal(this.id) )>"+ i +"";
						
					data.forEach(function(item){
						let driveY = ~~(item.driveDate.slice(0,4))
						let driveM = ~~(item.driveDate.slice(5,7))
						let driveD = ~~(item.driveDate.slice(8))
						if( i==driveD && mCom==driveM && yCom==driveY){
							str += "<br/><kbd id="+item.formId+" class='kbd' onclick='event.stopPropagation();recordModal(this.id)'>"+item.formId.slice(0,5)+"..</kbd>"
			            }
					});
					str += `</td>`
                	if (new Date(yCom, mCom - 1, i).getDay() == 6) {
                    	str += "</tr><tr>"
                	}
            }

             // 該月最後一天並補滿td
             let calendL = new Date(yCom, mCom - 1, lastDay).getDay()
             for (let j = 0; j < 6 - calendL; j++) {
                  str += "<td></td>"
             }
             // 將以上資訊寫入
             str += "</tr>"
             document.getElementById("idTbody").innerHTML = str
                    
                    
                    
                    
                    
                    // 表格BE   前一個月
                    let strBE = "<tr>"
                    let calendFBE = new Date(yCom, mCom - 2, 1).getDay()
                    for (let j = 0; j < calendFBE; j++) {
                        strBE += "<td></td>"
                    }
                 	// 取得月的二位文字
                 	let mComBE = mCom -1
                    mComBE < 10 ? '0' + mComBE : '' + mComBE;
                 	// 該月最後一天的  日  期
                    let lastDayBE = new Date(yCom, mComBE, 0).getDate()
                    for (let i = 1; i <= lastDayBE; i++) {
                    	i<10 ? dCom="0"+i : dCom=""+i 
                        strBE += `<td`
						data.forEach(function(item){
							let driveY = ~~(item.driveDate.slice(0,4))
							let driveM = ~~(item.driveDate.slice(5,7))
							let driveD = ~~(item.driveDate.slice(8))
							if( i==driveD && mComBE==driveM && yCom==driveY){
								strBE += " style='background-color: #cedcec' "
	                		}
						});
                        strBE += `>` + i +`</td>`
                        if (new Date(yCom, mComBE - 1, i).getDay() == 6) {
                            strBE += "</tr><tr>"
                        }
                    }
                    let calendLBE = new Date(yCom, mComBE - 1, lastDayBE).getDay()
                    for (let j=0; j< 6-calendLBE ; j++) {
                        strBE += "<td></td>"
                    }
                    strBE += "</tr>"
                    document.getElementById("idTbodyBE").innerHTML = strBE
                    
                    
                    
                    // 表格AF    後一個月
            		let strAF = "<tr>"
            		let calendFAF = new Date(yCom, mCom, 1).getDay()
            		for (let j = 0; j < calendFAF; j++) {
            		    strAF += "<td></td>"
            		}
            		// 取得月的二位文字
                 	let mComAF = mCom +1
                    mComAF < 10 ? '0' + mComAF : '' + mComAF;
                    // 該月最後一天的  日  期
            		let lastDayAF = new Date(yCom, mComAF, 0).getDate()
            		for (let i = 1; i <= lastDayAF; i++) {
                    	i<10 ? dCom="0"+i : dCom=""+i 
                        strAF += `<td`
						data.forEach(function(item){
							let driveY = ~~(item.driveDate.slice(0,4))
							let driveM = ~~(item.driveDate.slice(5,7))
							let driveD = ~~(item.driveDate.slice(8))
							if( i==driveD && mComAF==driveM && yCom==driveY){
								strAF += " style='background-color: #cedcec' "
	                		}
						});
                        strAF += `>` + i +`</td>`
                        if (new Date(yCom, mComAF - 1, i).getDay() == 6) {
                            strAF += "</tr><tr>"
                        }
                    }
            		let calendLAF = new Date(yCom, mComAF -1, lastDayAF).getDay()
            		for (let j=0; j < 6-calendLAF ; j++) {
            		    strAF += "<td></td>"
            		}
            		strAF += "</tr>"
            		document.getElementById("idTbodyAF").innerHTML = strAF

				},
				error: function (err) {
					alert(err)
				}
			});
            
        }	
	
	
	// 月曆中 單筆資料的model叫出
	function recordModal(formId) {
		let showOnModel = function (res) {
			$("#3formId").html(res.formId);
			$("#3date").html(res.driveDate);
			$("#3driveTime").html(res.driveTime);
			$("#3carmod").html(res.carMod);
			$("#3loc").html(res.driveLoc);
			$("#3locsit").html(res.driveLocSit);
			$("#3sale").html(res.sales);
			$("#3formTime").html(res.formTime);
			$("#3name").html(res.nameCli);
			$("#3gend").html(res.gendCli);
			$("#3timCli").html(res.timCli);
			$("#3mail").html(res.mailCli);
			$("#3tel").html(res.telCli);
			$("#3comm").html(res.remark);
			$("#3operate").children().prop("id",res.formId);
		}

		findByIdCalend(formId, showOnModel)
		$('#recordModal').modal('show');
		$('#recordModal').css('overflow-y', 'auto');
	}		
	
	
	// 尋找單筆Calender
	function findByIdCalend(formId, showOnModel) {
		console.log("findbyid:  "+formId)
		$.ajax({
			url: "/FinalProject/findByIdTestdriveAPI/" + formId,
			method: "GET",
			dataType: "json",
			success: function (res) {
				console.log("findbyid success")	
				showOnModel(res)
			},
			error: function (err) {
				alert(err)
			}
		});
	}		
		
			
	
	// 叫出時間表
// 	function dayModal(){
// 		let theDay = $('#date').val()
	function dayModal(theDay){
		// 塞入modal header 所選日期
		$('#modalheader').html(theDay);
		// 清空 modal
		$('#timeTable tr').removeClass('table-secondary');
		$('#timeTable').find('tr td:last-child').html('');
		// Ajax抓當日值
		$.ajax({
				url: "/FinalProject/findByDriveDateAPI/" + theDay,
				method: "GET",
				dataType: "json",
				success: function (response) {
		// 值塞入欄位
					if (response.data == "fail"){
						return;
					}
					let data = response.data;
					data.forEach(function(item){
						for(let i=10; i<20; i++){
							if(item.driveTime == i){
								$('#Time'+i).html(item.formId).parent().addClass('table-secondary');
							}
						}
					});
				},
				error: function (err) {
					alert(err)
				}
			});
		
		
		// show modal
		$('#dayModal').modal('show');
		$('#dayModal').css('overflow-y', 'auto');
	}
	












