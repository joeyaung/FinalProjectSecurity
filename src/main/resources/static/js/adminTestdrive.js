let flagDate1 = true;
let flagCarmod1 = true;
let flagLoc1 = true;
let flagLocsit1 = true;
// let flagSales = true;
let flagName1 = true;
let flagGender1 = true;
let flagConTim1 = true;
let flagMail1 = true;
let flagTel1 = true;


//  date
function checkDate(){
    
    let dateObj = document.getElementById("1date");
    let dateObjDate = new Date(dateObj.value)
    let today = new Date()

    // 選擇日為空值，則"請選擇日期"
    if(dateObj.value == ""){
        console.log("dateObj.value = "+ dateObj.value)
        $('#1dateCheck').html("<img src ='/FinalProject//images/error.png' style='width: 22px'>請選擇日期");
        flagDate1 = false;
    // 選擇日<=今天，則...   
    } else if(dateObjDate.getTime() <= today.getTime()){
        console.log("select day = "+dateObjDate.getTime())
        console.log("today = "+today.getTime())
        $('#1dateCheck').html("<img src ='/FinalProject//images/error.png' style='width: 22px'>日期不能早於一日內");
        flagDate1 = false;
    // 此外，移除錯誤訊息
    } else{
        $('#1dateCheck').html('');
        flagDate1 = true;
    }
}



// carmod

function checkCarmod(){
    let carmodObj = document.getElementById("1carmod");

    // 如果 carmod 的值跟預設一樣，錯誤
    if (carmodObj.value == document.getElementById("1carmoddef").value){
        $('#1carmodCheck').html("<img src ='/FinalProject//images/error.png' style='width: 22px'>請選擇車型");
        flagCarmod1 = false;
    // 反之，移除錯誤訊息
    } else{
    	$('#1carmodCheck').html('');
        flagCarmod1 = true;
    }
}



// loc

function checkLoc(){
    let locObj = document.getElementById("1loc");

    // 如果 loc 的值跟預設一樣，錯誤
    if (locObj.value == document.getElementById("1locdef").value){
        $('#1locCheck').html("<img src ='/FinalProject//images/error.png' style='width: 22px'>請選擇地區");
        flagLoc1 = false;
    // 反之，移除錯誤訊息
    } else{
        $('#1locCheck').html('');
        flagLoc1 = true;
    }
}



// locsit

function checkLocsit(){

    let locsitObj = document.getElementById("1locsit");

    // 如果 locsit 的值跟預設一樣，錯誤
    if (locsitObj.value == document.getElementById("1locsitdef").value){
        $('#1locsitCheck').html("<img src ='/FinalProject//images/error.png' style='width: 22px'>請選擇服務據點");
        flagLocsit1 = false;
    // 反之，移除錯誤訊息
    } else{
        $('#1locsitCheck').html('');
        flagLocsit1 = true;
    }
}



// name

function checkName(){

    let nameObj = document.getElementById("1name");

    // 如果 name 的值為空或長度小於2
    if (nameObj.value.trim() == "" || nameObj.value.trim().length <= 1){
        $('#1nameCheck').html("<img src ='/FinalProject//images/error.png' style='width: 22px'>請輸入姓名(姓名不可小於2個字元)");
        flagName1 = false;
    } else{
        $('#1nameCheck').html('');
        flagName1 = true;
    }

}


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
        $('#1gendCheck').html("<img src ='/FinalProject//images/error.png' style='width: 22px'>請點選性別");
    }else{
        $('#1gendCheck').html('');           
    }
}
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
    // 是否有input標記，初始為無
    flagConTim1 = false;
    // 迭代 該群組，若有其中一項被勾選(checked)，input標記改為真
    for (let i = 0; i < Total_Obj.length; i++) {
        if (Total_Obj[i].checked) {
            flagConTim1 = true;
        } 
    }
    // 最終，若input標記為假，不OK；若為真OK
    if(flagConTim1 == false) {
        $('#1contimCheck').html("<img src ='/FinalProject//images/error.png' style='width: 22px'>請選擇聯絡時段");
    }else{
        $('#1contimCheck').html('');  
    }
}



//  E-mail

function checkMail(){

    let mailObj = document.getElementById("1mail");
    let re = /^.+@.+$/g;
    // 如果 mail 為空值
    if (mailObj.value.trim() == ""){
        $('#1mailCheck').html("<img src ='/FinalProject//images/error.png' style='width: 22px'>請輸入電子信箱");
        flagMail1 = false;
    //如果 mail 不合規則
    } else if(re.test(mailObj.value) == false){
        $('#1mailCheck').html("<img src ='/FinalProject//images/error.png' style='width: 22px'>請輸入有效的電子信箱");
        flagMail1 = false;
    }else{
        $('#1mailCheck').html('');
        flagMail1 = true;
    }
}



//  tel

function checkTel(){

    let telObj = document.getElementById("1tel");
    let re = /^\d{7,12}$/g;
    // 如果 tel 為空值
    if (telObj.value.trim() == ""){
        $('#1telCheck').html("<img src ='/FinalProject//images/error.png' style='width: 22px'>請輸入連絡電話");
        flagTel1 = false;
    //如果 tel 不合規則
    } else if(re.test(telObj.value) == false){
        $('#1telCheck').html("<img src ='/FinalProject//images/error.png' style='width: 22px'>請輸入有效的電話號碼(9-12碼數字)");
        flagTel1 = false;
    }else{
        $('#1telCheck').html('');
        flagTel1 = true;
    }
}


//  一鍵輸入
$('#1oneKey').on('click', function(){
    $('#1date').val('2021-12-21');
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
    checkCarmod();
    checkLoc();
    checkLocsit();
    
    checkName();
    checkGender();
    checkConTim();
    checkMail();
    checkTel();
    
    if (flagDate1 && flagCarmod1 && flagLoc1 && flagLocsit1 && flagName1 && 
    	flagGender1 && flagConTim1 && flagMail1 && flagTel1){
        return true;
    } else{
        document.getElementById("1submitcheck").innerHTML = "表單資料不齊全或含有無效內容，請重新檢查";
        Swal.fire('表單資料不齊全或含有無效內容，請重新檢查')        
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
            $("#form1")[0].reset();
            table.ajax.reload();
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
	document.getElementById("1opt11").disabled = "true";
	document.getElementById("1opt12").disabled = "true";
	document.getElementById("1opt21").disabled = "true";
	document.getElementById("1opt22").disabled = "true";
	document.getElementById("1opt31").disabled = "true";
	document.getElementById("1opt32").disabled = "true";
	document.getElementById("1opt41").disabled = "true";
	document.getElementById("1opt42").disabled = "true";

    if(locObj1.value==document.getElementById("1opt1").value){
        document.getElementById("1opt11").disabled = "";
        document.getElementById("1opt12").disabled = "";


    }else if(locObj1.value==document.getElementById("1opt2").value){
        document.getElementById("1opt21").disabled = "";
        document.getElementById("1opt22").disabled = "";


    }else if(locObj1.value==document.getElementById("1opt3").value){
        document.getElementById("1opt31").disabled = "";
        document.getElementById("1opt32").disabled = "";

    }else if(locObj1.value==document.getElementById("1opt4").value){
        document.getElementById("1opt41").disabled = "";
        document.getElementById("1opt42").disabled = "";

    }
}

// 畫面載入時先執行一次 locsit連動
 $(document).ready(function(){
   toLocsit1();
   toLocsit2();
   
   $("#1datetimepicker").datepicker({
    orientation: "bottom",
    dateFormat: 'yy-mm-dd',
	startDate: '+1d',
  });
  
  $("#2datetimepicker").datepicker({
    orientation: "bottom",
    dateFormat: 'yy-mm-dd',
	startDate: '+1d',
  });
   
});



//以下是  editModal
//以下是  editModal
//以下是  editModal






let flagDate2 = true;
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
    let dateObjDate = new Date(dateObj.value)
    let today = new Date()

    // 選擇日為空值，則"請選擇日期"
    if(dateObj.value == ""){
        console.log("dateObj.value = "+ dateObj.value)
        $('#2dateCheck').html("<img src ='/FinalProject//images/error.png' style='width: 22px'>請選擇日期");
        flagDate2 = false;
    // 選擇日<=今天，則...   
    } else if(dateObjDate.getTime() <= today.getTime()){
        console.log("select day = "+dateObjDate.getTime())
        console.log("today = "+today.getTime())
        $('#2dateCheck').html("<img src ='/FinalProject//images/error.png' style='width: 22px'>日期不能早於一日內");
        flagDate2 = false;
    // 此外，移除錯誤訊息
    } else{
        $('#2dateCheck').html('');
        flagDate2 = true;
    }
}



// carmod

function checkCarmod2(){
    let carmodObj = document.getElementById("2carmod");

    // 如果 carmod 的值跟預設一樣，錯誤
    if (carmodObj.value == document.getElementById("2carmoddef").value){
        console.log("carmodObj.value = "+carmodObj.value)
        $('#2carmodCheck').html("<img src ='/FinalProject//images/error.png' style='width: 22px'>請選擇車型");
        flagCarmod2 = false;
    // 反之，移除錯誤訊息
    } else{
    	$('#2carmodCheck').html('');
        flagCarmod2 = true;
    }
}



// loc

function checkLoc2(){
    let locObj = document.getElementById("2loc");

    // 如果 loc 的值跟預設一樣，錯誤
    if (locObj.value == document.getElementById("2locdef").value){
        console.log("locObj.value = "+locObj.value)
        $('#2locCheck').html("<img src ='/FinalProject//images/error.png' style='width: 22px'>請選擇地區");
        flagLoc2 = false;
    // 反之，移除錯誤訊息
    } else{
        $('#2locCheck').html('');
        flagLoc2 = true;
    }
}



// locsit

function checkLocsit2(){
    let locsitObj = document.getElementById("2locsit");

    // 如果 locsit 的值跟預設一樣，錯誤
    if (locsitObj.value == document.getElementById("2locsitdef").value){
        console.log("locsitObj.value = "+locsitObj.value)
        $('#2locsitCheck').html("<img src ='/FinalProject//images/error.png' style='width: 22px'>請選擇服務據點");
        flagLocsit2 = false;
    // 反之，移除錯誤訊息
    } else{
        $('#2locsitCheck').html('');
        flagLocsit2 = true;
    }
}


// sales
function checkSale2(){
	
	// 如果 sale 的值為空或長度小於2
	if($('#2sale').val().trim() == '' || $('#2sale').val().trim().length<=2){
		$('#2saleCheck').html("<img src ='/FinalProject//images/error.png' style='width: 22px'>請輸入業務姓名");
        flagSales2 = false;
	} else{
        $('#2saleCheck').html('');
        flagSales2 = true;
    }
}
$('#2sale').on('blur',checkSale2);

// name

function checkName2(){

    let nameObj = document.getElementById("2name");

    // 如果 name 的值為空或長度小於2
    if (nameObj.value.trim() == "" || nameObj.value.trim().length <= 1){
        $('#2nameCheck').html("<img src ='/FinalProject//images/error.png' style='width: 22px'>請輸入姓名(姓名不可小於2個字元)");
        flagName2 = false;
    } else{
        $('#2nameCheck').html('');
        flagName2 = true;
    }
}


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
        $('#2gendCheck').html("<img src ='/FinalProject//images/error.png' style='width: 22px'>請點選性別");
    }else{
        $('#2gendCheck').html('');           
    }
}
//$("#tdcheckbox > div > input").each(function() {
//	$('#radio_button').is(':checked')
//
//if ($('input[name=gender]:checked').length > 0) {
//    // do something here
//}



//  方便的聯絡時間  checkbox
function checkConTim2() {
    // 取得timCli的 3個元素群組
    let Total_Obj = document.getElementsByName('timCli');
    // 是否有input標記，初始為無
    flagConTim2 = false;
    // 迭代 該群組，若有其中一項被勾選(checked)，input標記改為真
    for (let i = 0; i < Total_Obj.length; i++) {
        if (Total_Obj[i].checked) {
            flagConTim2 = true;
        } 
    }
    // 最終，若input標記為假，不OK；若為真OK
    if(flagConTim2 == false) {
        $('#2contimCheck').html("<img src ='/FinalProject//images/error.png' style='width: 22px'>請選擇聯絡時段");
    }else{
        $('#2contimCheck').html('');  
    }
}



//  E-mail

function checkMail2(){

    let mailObj = document.getElementById("2mail");
    let re = /^.+@.+$/g;
    // 如果 mail 為空值
    if (mailObj.value.trim() == ""){
        console.log("mailObj.value = "+mailObj.value)
        $('#2mailCheck').html("<img src ='/FinalProject//images/error.png' style='width: 22px'>請輸入電子信箱");
        flagMail2 = false;
    //如果 mail 不合規則
    } else if(re.test(mailObj.value) == false){
        console.log("mailObj.value = "+mailObj.value)
        $('#2mailCheck').html("<img src ='/FinalProject//images/error.png' style='width: 22px'>請輸入有效的電子信箱");
        flagMail2 = false;
    }else{
        $('#2mailCheck').html('');
        flagMail2 = true;
    }
}



//  tel

function checkTel2(){

    let telObj = document.getElementById("2tel");
    let re = /^\d{7,12}$/g;
    // 如果 tel 為空值
    if (telObj.value.trim() == ""){
        console.log("telObj.value = "+telObj.value)
        $('#2telCheck').html("<img src ='/FinalProject//images/error.png' style='width: 22px'>請輸入連絡電話");
        flagTel2 = false;
    //如果 tel 不合規則
    } else if(re.test(telObj.value) == false){
        console.log("telObj.value = "+telObj.value)
        $('#2telCheck').html("<img src ='/FinalProject//images/error.png' style='width: 22px'>請輸入有效的電話號碼(9-12碼數字)");
        flagTel2 = false;
    }else{
        $('#2telCheck').html('');
        flagTel2 = true;
    }

}


//  一鍵輸入
$('#2oneKey').on('click', function(){
    $('#2date').val('2021-09-18');
    $('#2carmoddef').next().children(":last").prev().prop('selected',true)
    $('#2opt3').prop('selected',true)
   	toLocsit2();
    $('#2opt31').prop('selected',true)
    $('#2name').val('張展航');
    $('#2flexRadio1').prop('checked',true)
    $('#2inlineCheckbox2').prop('checked',true);
    $('#2mail').val('eeit2905@gmail.com');
    $('#2tel').val('0976355678');
    $('#2comm').val('');
}).on('dblclick', function(){
    $('#2date').val('2021-10-04');
    $('#2carmoddef').next().children(":first").next().prop('selected',true)
    $('#2opt1').prop('selected',true)
   	toLocsit2();
    $('#2opt12').prop('selected',true)
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
    checkCarmod2();
    checkLoc2();
    checkLocsit2();
    checkSale2();
    
    checkName2();
    checkGender2();
    checkConTim2();
    checkMail2();
    checkTel2();
    
    if (flagDate2 && flagCarmod2 && flagLoc2 && flagLocsit2 
    && flagSales2 && flagName2 && flagGender2 && flagConTim2 
    && flagMail2 && flagTel2){
        return true;
    } else{
        Swal.fire('表單資料不齊全或含有無效內容，請重新檢查')        
        return false;
    }
}

// 點"送出"先執行總檢查，再執行送出的Ajax
$("#2submit").click(function (e) {			
//    var formData = new FormData(document.getElementById("form2"));
    if (checkAll2() == true) {
        editTesdrive();
    } else
        e.stopPropagation();
});


// "確認修改"按鈕，儲存資料
//$("#2submit").click(
	function editTesdrive () {
		var editTestdriveFormData = new FormData($('#form2')[0]);
		console.log('確認修改click')				
		$.ajax({
			url: "/FinalProject/updateTestdriveAPI",
			method: "POST",
			data: editTestdriveFormData,
			contentType: false,
			processData: false,
			success: function (res) {
				console.log('edit success');
				$("#form2")[0].reset();   // 修改的model清空
				table.ajax.reload();     // data table刷新
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
	document.getElementById("2opt11").disabled = "true";
	document.getElementById("2opt12").disabled = "true";
	document.getElementById("2opt21").disabled = "true";
	document.getElementById("2opt22").disabled = "true";
	document.getElementById("2opt31").disabled = "true";
	document.getElementById("2opt32").disabled = "true";
	document.getElementById("2opt41").disabled = "true";
	document.getElementById("2opt42").disabled = "true";

    if(locObj2.value==document.getElementById("2opt1").value){
        document.getElementById("2opt11").disabled = "";
        document.getElementById("2opt12").disabled = "";


    }else if(locObj2.value==document.getElementById("2opt2").value){
        document.getElementById("2opt21").disabled = "";
        document.getElementById("2opt22").disabled = "";


    }else if(locObj2.value==document.getElementById("2opt3").value){
        document.getElementById("2opt31").disabled = "";
        document.getElementById("2opt32").disabled = "";

    }else if(locObj2.value==document.getElementById("2opt4").value){
        document.getElementById("2opt41").disabled = "";
        document.getElementById("2opt42").disabled = "";

    }
}







