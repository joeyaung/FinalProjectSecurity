let flagDate = true;
let flagCarmod = true;
let flagLoc = true;
let flagLocsit = true;
// let flagSales = true;
let flagName = true;
let flagGender = true;
let flagConTim = true;
let flagMail = true;
let flagTel = true;
let flagToS = true;

//  date
function checkDate(){
    
    let dateObj = document.getElementById("date");
    let dateObjDate = new Date(dateObj.value)
    let today = new Date()

    // 選擇日為空值，則"請選擇日期"
    if(dateObj.value == ""){
        document.getElementById("dateCheck").innerHTML = "<img src ='/FinalProject//images/error.png' style='width: 22px'>請選擇日期";
        flagDate = false;
        $('#date').addClass('valid-false');
    // 選擇日<=今天，則...   
    } else if(dateObjDate.getTime() <= today.getTime()){
        document.getElementById("dateCheck").innerHTML = "<img src ='/FinalProject//images/error.png' style='width: 22px'>日期不能早於一日內";
        flagDate = false;
        $('#date').addClass('valid-false');
    // 此外，移除錯誤訊息
    } else{
        document.getElementById("dateCheck").innerHTML = "";
        flagDate = true;
        $('#date').removeClass('valid-false');
    }
}
$('#date').on('blur',checkDate);


// carmod

function checkCarmod(){
    let carmodObj = document.getElementById("carmod");

    // 如果 carmod 的值跟預設一樣，錯誤
    if (carmodObj.value == document.getElementById("carmoddef").value){
        console.log("carmodObj.value = "+carmodObj.value)
        document.getElementById("carmodCheck").innerHTML = "<img src ='/FinalProject//images/error.png' style='width: 22px'>請選擇車型";
        flagCarmod = false;
        carmodObj.classList.add("valid-false");
    // 反之，移除錯誤訊息
    } else{
        document.getElementById("carmodCheck").innerHTML = "";
        flagCarmod = true;
        carmodObj.classList.remove("valid-false");
    }
}
$('#carmod').on('blur',checkCarmod);


// loc

function checkLoc(){
    let locObj = document.getElementById("loc");

    // 如果 loc 的值跟預設一樣，錯誤
    if (locObj.value == document.getElementById("locdef").value){
        document.getElementById("locCheck").innerHTML = "<img src ='/FinalProject//images/error.png' style='width: 22px'>請選擇地區";
        flagLoc = false;
        locObj.classList.add("valid-false");
    // 反之，移除錯誤訊息
    } else{
        document.getElementById("locCheck").innerHTML = "";
        flagLoc = true;
        locObj.classList.remove("valid-false");
    }
}
$('#loc').on('blur',checkLoc);


// locsit

function checkLocsit(){

    let locsitObj = document.getElementById("locsit");

    // 如果 locsit 的值跟預設一樣，錯誤
    if (locsitObj.value == document.getElementById("locsitdef").value){
        document.getElementById("locsitCheck").innerHTML = "<img src ='/FinalProject//images/error.png' style='width: 22px'>請選擇服務據點";
        flagLocsit = false;
        locsitObj.classList.add("valid-false");
    // 反之，移除錯誤訊息
    } else{
        document.getElementById("locsitCheck").innerHTML = "";
        flagLocsit = true;
        locsitObj.classList.remove("valid-false");
    }
}
$('#locsit').on('blur',checkLocsit);


// name

function checkName(){

    let nameObj = document.getElementById("name");

    // 如果 name 的值為空或長度小於2
    if (nameObj.value == "" || nameObj.value.length <= 1){
        document.getElementById("nameCheck").innerHTML = "<img src ='/FinalProject//images/error.png' style='width: 22px'>請輸入姓名(姓名不可少於2個字元)";
        flagName = false;
        nameObj.classList.add("valid-false");
    } else{
        document.getElementById("nameCheck").innerHTML = "";
        flagName = true;
        nameObj.classList.remove("valid-false");
    }
}
$('#name').on('blur',checkName);


// Gender

function checkGender() {
    // 取得gendCli的 3個元素群組
    let Total_Obj = document.getElementsByName('gendCli');
    // 是否有input的標記，初始為無
    let gendInput=false;
    // 迭代 該群組，若有其中一項被勾選(checked)，input標記改為真
    for (let i = 0; i < Total_Obj.length; i++) {
        if (Total_Obj[i].checked) {
            gendInput=true;
        } 
    }
    // 最終，若input標記為假，不OK；若為真OK
    if(gendInput == false) {
        gendCheck.innerHTML = "<img src ='/FinalProject//images/error.png' style='width: 22px'>請點選性別";
        flagGender = false;
        $('#flexRadio1').addClass("valid-false");
        $('#flexRadio2').addClass("valid-false");
        $('#flexRadio3').addClass("valid-false");
    }else{
        gendCheck.innerHTML = "";       
        flagGender = true;
        $('#flexRadio1').removeClass("valid-false");
        $('#flexRadio2').removeClass("valid-false");
        $('#flexRadio3').removeClass("valid-false");
    }
}
$('#flexRadio1').parent().parent().on('blur',checkGender);






//  方便的聯絡時間  checkbox
function checkConTim() {
    // 取得timCli的 3個元素群組
    let Total_Obj = document.getElementsByName('timCli');
    // 是否有input標記，初始為無
    let ConTimInput=false;
    // 迭代 該群組，若有其中一項被勾選(checked)，input標記改為真
    for (let i = 0; i < Total_Obj.length; i++) {
        if (Total_Obj[i].checked) {
            ConTimInput=true;
        } 
    }
    // 最終，若input標記為假，不OK；若為真OK
    if(ConTimInput == false) {
        document.getElementById("contimCheck").innerHTML = "<img src ='/FinalProject//images/error.png' style='width: 22px'>請選擇聯絡時段";
        flagConTim = false;
        $('#inlineCheckbox1').addClass("valid-false");
        $('#inlineCheckbox2').addClass("valid-false");
        $('#inlineCheckbox3').addClass("valid-false");
    }else{
        document.getElementById("contimCheck").innerHTML = "";       
        flagConTim = true;
        $('#inlineCheckbox1').removeClass("valid-false");
        $('#inlineCheckbox2').removeClass("valid-false");
        $('#inlineCheckbox3').removeClass("valid-false");
    }
}
$('#inlineCheckbox1').parent().parent().on('blur',checkConTim);



//  E-mail

function checkMail(){

    let mailObj = document.getElementById("mail");
    let re = /^.+@.+$/g;
    // 如果 mail 為空值
    if (mailObj.value == ""){
        console.log("mailObj.value = "+mailObj.value)
        document.getElementById("mailCheck").innerHTML = "<img src ='/FinalProject//images/error.png' style='width: 22px'>請輸入電子信箱";
        flagMail = false;
        mailObj.classList.add("valid-false");
//        $('#mail').addClass('valid-false');
    //如果 mail 不合規則
    } else if(re.test(mailObj.value) == false){
        console.log("mailObj.value = "+mailObj.value)
        document.getElementById("mailCheck").innerHTML = "<img src ='/FinalProject//images/error.png' style='width: 22px'>請輸入有效的電子信箱";
        flagMail = false;
        mailObj.classList.add("valid-false");
//        $('#mail').addClass('valid-false');
    }else{
        document.getElementById("mailCheck").innerHTML = "";
        flagMail = true;
        mailObj.classList.remove("valid-false");
//        $('#mail').removeClass('valid-false');
    }
}
document.getElementById("mail").addEventListener('blur',checkMail)
//$('#mail').on('blur',checkMail);


//  tel

function checkTel(){

    let telObj = document.getElementById("tel");
    let re = /^\d{8,12}$/g;
    // 如果 tel 為空值
    if (telObj.value == ""){
        document.getElementById("telCheck").innerHTML = "<img src ='/FinalProject//images/error.png' style='width: 22px'>請輸入連絡電話";
        flagTel = false;
        $('#tel').addClass('valid-false');
    //如果 tel 不合規則
    } else if(re.test(telObj.value) == false){
        document.getElementById("telCheck").innerHTML = "<img src ='/FinalProject//images/error.png' style='width: 22px'>請輸入有效的電話號碼(9-12碼數字)";
        flagTel = false;
        $('#tel').addClass('valid-false');
    }else{
        document.getElementById("telCheck").innerHTML = "";
        flagTel = true;
        $('#tel').removeClass('valid-false');
    }
}
$('#tel').on('blur',checkTel);


// ToS

function checkToS(){
	if($('#ToS').prop("checked")){
		flagToS = true;
		$('#ToS').removeClass("valid-false");
	} else {
		flagToS = false;
		$('#ToS').addClass("valid-false");
	}
}
$('#ToS').on('click',checkToS);


// submit-btn 送出檢查

$("#addForm").on('submit', function(e){
    e.preventDefault();
    checkAll();
});

function checkAll(){
    checkDate();
    checkCarmod();
    checkLoc();
    checkLocsit();
    
    checkName();
    checkGender();
    checkConTim();
      checkMail();
    checkTel();
    checkToS();
    
    if (flagDate && flagCarmod && flagLoc && flagLocsit && flagName && flagGender && flagConTim && flagMail && flagTel && flagToS){
        document.getElementById("subchk").innerHTML = "";
        document.getElementById("addForm").submit();
        
//        setTimeout(() => {
//              document.getElementById("changedForm").submit();
//          }, 1000);
        
        return true;
    } else{
        document.getElementById("subchk").innerHTML = "表單資料不齊全或含有無效內容，請重新檢查";
        Swal.fire('表單資料不齊全或含有無效內容，請重新檢查')        
        return false;
    }
}


// loc locsit 連動

let locObj = document.getElementById("loc");

locObj.addEventListener("change",toLocsit)
function toLocsit(){
	document.getElementById("opt11").disabled = "true";
	document.getElementById("opt12").disabled = "true";
	document.getElementById("opt21").disabled = "true";
	document.getElementById("opt22").disabled = "true";
	document.getElementById("opt31").disabled = "true";
	document.getElementById("opt32").disabled = "true";
	document.getElementById("opt41").disabled = "true";
	document.getElementById("opt42").disabled = "true";

    if(locObj.value==document.getElementById("opt1").value){
        document.getElementById("opt11").disabled = "";
        document.getElementById("opt12").disabled = "";


    }else if(locObj.value==document.getElementById("opt2").value){
        document.getElementById("opt21").disabled = "";
        document.getElementById("opt22").disabled = "";


    }else if(locObj.value==document.getElementById("opt3").value){
        document.getElementById("opt31").disabled = "";
        document.getElementById("opt32").disabled = "";

    }else if(locObj.value==document.getElementById("opt4").value){
        document.getElementById("opt41").disabled = "";
        document.getElementById("opt42").disabled = "";

    }
}

// 畫面載入時先執行一次
 $(document).ready(function(){
	   toLocsit();
	    });




//  彈出視窗
$('#btn_bookf').on('click',function(){
    Swal.fire({
        imageUrl: '/FinalProject//images/terms.png',
        imageHeight: 600,
        imageAlt: '服務條款與隱私權政策'
      })

})


//  一鍵輸入
$('#onekey').on('click', function(){
    $('#date').val('2021-11-02');
    $('#carmoddef').next().children(":last").prop('selected',true)
    $('#opt4').prop('selected',true)
   	toLocsit();
    $('#opt42').prop('selected',true)
    $('#name').val('王健瑋');
    $('#flexRadio1').prop('checked',true)
    $('#inlineCheckbox1').prop('checked',true);
    $('#mail').val('eeit2905@gmail.com');
    $('#tel').val('0921222357');
    $('#comm').val('遇雨取消');
}).on('dblclick', function(){
    $('#date').val('2021-12-25');
    $('#carmoddef').next().children(":first").prop('selected',true)
    $('#opt3').prop('selected',true)
   	toLocsit();
    $('#opt32').prop('selected',true)
    $('#name').val('徐婷珍');
    $('#flexRadio2').prop('checked',true)
    $('#inlineCheckbox1').prop('checked',true);
    $('#inlineCheckbox2').prop('checked',true);
    $('#mail').val('eeit2905@gmail.com');
    $('#tel').val('0976212488');
    $('#comm').val('');
})

// search 送出檢查
$("#search").on('submit', function(){

    console.log(0)
    if($('#search-input').val().trim().length<8){
    console.log(1)
    	$('#search-input').addClass("valid-false");
    	Swal.fire('請輸入欲查詢表單編號')
    	return false;
    } else if($('#search-input').val().trim().length>10){
    console.log(2)
    	$('#search-input').removeClass("valid-false");
//	    $('#search').submit();
	    return true;
    }
});
$('#search-input').on('blur', checkSearch);
function checkSearch(){
        console.log(0)
    if($('#search-input').val().trim().length<8){
    console.log(1)
    	$('#search-input').addClass("valid-false");
    	Swal.fire('請輸入欲查詢表單編號')
    	return false;
    } else if($('#search-input').val().trim().length>10){
    console.log(2)
    	$('#search-input').removeClass("valid-false");
//	    $('#search').submit();
	    return true;
	}
}




// 單筆查詢 送出檢查

$('#queryOneForm').on('submit',function(){
			console.log($('#queryById').val().trim())
	if($('#queryById').val().trim() == ""){
		$('#quechk').text('請輸入欲查詢表單編號');
			console.log($('#quechk').val())
		Swal.fire('請輸入欲查詢表單編號')        
        return false;
	} else{
		$('#quechk').text('');
		$('#queryOneForm').submit();
		return true;
	}
})



////email檢查
//var vmmail = new Vue({
//    el: '#vmmail',
//    data: {
//        vuemail: ''
//    }
//})



















