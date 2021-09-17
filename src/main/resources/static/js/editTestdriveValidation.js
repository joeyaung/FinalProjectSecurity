
var vueAll = new Vue({
    el: '#vueAll',
    data: {
        vueTime: ''
    },
    methods:{     
	// driveTime Modal連動給input值
   		setTime(index){
//    	this.vueTime=timeNo;
    	
    	let rows = $("#timeTable tr");
   		let row = $("#timeTable tr")[index];
   		
   		for (let i = 0; i < $("#timeTable tr").length; i++) {
   			$("#timeTable tr")[i].classList.remove("selected-Time");
   		}
   		row.classList.add("selected-Time");
    	this.vueTime=index+9;
    	
   	}   
  } 
})



let flagDate = true;
let flagTime = true;
let flagCarmod = true;
let flagLoc = true;
let flagLocsit = true;

let flagName = true;
let flagGender = true;
let flagConTim = true;
let flagMail = true;
let flagTel = true;


// date圖案點擊有反應
$("#inputAddOnIcon").on("click",function(){
	$("#date").focus();
});



//  date
function checkDate(){
    let dateObj = document.getElementById("date");

    // 選擇日為空值，則"請選擇日期"
    if(dateObj.value == ""){
        $("#dateCheck").html("請選擇日期").css('color', '#a16468');
		$("#dateCheck").next().attr("src", '/FinalProject/images/error.png');
        flagDate = false;
        $('#date').removeClass('is-valid').addClass('is-invalid');
        
    // 此外，移除錯誤訊息
    } else{
        $("#dateCheck").html("");
    	$("#dateCheck").next().attr("src", '');
        flagDate = true;
        $('#date').removeClass('is-invalid').addClass('is-valid');
    }
}
$('#date').on('blur',checkDate);


//  driveTime
function checkTime(){
    
    // 選擇時間有值，則OK
    if($('#driveTime').val()){
    	$("#driveTimeCheck").html("");
    	$("#driveTimeCheck").next().attr("src", '');
        flagTime = true;
        $('#driveTime').removeClass('is-invalid').addClass('is-valid');

    // 此外，"請選擇日期後選擇時間"
    } else{
    	$("#driveTimeCheck").html("請選擇日期後選擇時間").css('color', '#a16468');
		$("#driveTimeCheck").next().attr("src", '/FinalProject/images/error.png');
        flagTime = false;
        $('#driveTime').removeClass('is-valid').addClass('is-invalid');
    }
}
$('#driveTime').on('blur',checkTime);


// carmod
function checkCarmod(){
    let carmodObj = document.getElementById("carmod");

    // 如果 carmod 的值跟預設一樣，錯誤
    if (carmodObj.value == document.getElementById("carmoddef").value){
        
        $("#carmodCheck").html("請選擇車型").css('color', '#a16468');
		$("#carmodCheck").next().attr("src", '/FinalProject/images/error.png');
        flagCarmod = false;
        $('#carmod').removeClass('is-valid').addClass('is-invalid');
    // 反之，移除錯誤訊息
    } else{
    	$("#carmodCheck").html("");
    	$("#carmodCheck").next().attr("src", '');
        flagCarmod = true;
        $('#carmod').removeClass('is-invalid').addClass('is-valid');
    }
}
$('#carmod').on('blur',checkCarmod);


// loc

function checkLoc(){
    let locObj = document.getElementById("loc");

    // 如果 loc 的值跟預設一樣，錯誤
    if (locObj.value == document.getElementById("locdef").value){
        $("#locCheck").html("請選擇地區").css('color', '#a16468');
		$("#locCheck").next().attr("src", '/FinalProject/images/error.png');
        flagLoc = false;
        $('#loc').removeClass('is-valid').addClass('is-invalid');
    
    // 反之，移除錯誤訊息
    } else{
    	$("#locCheck").html("");
    	$("#locCheck").next().attr("src", '');
        flagLoc = true;
        $('#loc').removeClass('is-invalid').addClass('is-valid');
    }
}
$('#loc').on('blur',checkLoc);


// locsit

function checkLocsit(){
    let locsitObj = document.getElementById("locsit");

    // 如果 locsit 的值跟預設一樣，錯誤
    if (locsitObj.value == document.getElementById("locsitdef").value){
        $("#locsitCheck").html("請選擇服務據點").css('color', '#a16468');
		$("#locsitCheck").next().attr("src", '/FinalProject/images/error.png');
        flagLocsit = false;
        $('#locsit').removeClass('is-valid').addClass('is-invalid');
    
    // 反之，移除錯誤訊息
    } else{
    	$("#locsitCheck").html("");
    	$("#locsitCheck").next().attr("src", '');
        flagLocsit = true;
        $('#locsit').removeClass('is-invalid').addClass('is-valid');
    }
}
$('#locsit').on('blur',checkLocsit);


// name

function checkName(){

    // 如果 name 的值為空或長度小於2
    if ($('#name').val() == "" || $('#name').val().length <= 1){ 	
    	
    	$("#nameCheck").html("請輸入姓名(姓名不可少於2個字元)").css('color', '#a16468');
		$("#nameCheck").next().attr("src", '/FinalProject/images/error.png');
        flagName = false;
        $('#name').removeClass('is-valid').addClass('is-invalid');
    } else{
    
    	$("#nameCheck").html("");
    	$("#nameCheck").next().attr("src", '');
        flagName = true;
        $('#name').removeClass('is-invalid').addClass('is-valid');
    }
}
$('#name').on('blur',checkName);


// Gender

function checkGender() {
    // 取得gendCli的 3個元素群組
    let Total_Obj = document.getElementsByName('gendCli');
    // flag 初始為 假
    flagGender = false;
    // 迭代 該群組，若有其中一項被勾選(checked)，flag改為真
    for (let i = 0; i < Total_Obj.length; i++) {
        if (Total_Obj[i].checked) {
            flagGender = true;
        } 
    }
    // 最終，若 flag 為假，不OK；若為真OK
    if(flagGender == false) {
    	
    	$("#gendCheck").html("請點選性別").css('color', '#a16468');
        $("#gendCheck").next().attr("src", '/FinalProject/images/error.png');

    }else{
        $("#gendCheck").html("");
    	$("#gendCheck").next().attr("src", '');
    }
}



//  方便的聯絡時間  checkbox
function checkConTim() {
    // 取得timCli的 3個元素群組
    let Total_Obj = document.getElementsByName('timCli');
    // flag，初始為假
    flagConTim = false;
    // 迭代 該群組，若有其中一項被勾選(checked)，flag改為真
    for (let i=0; i<Total_Obj.length; i++) {
        if (Total_Obj[i].checked) {
            flagConTim = true;
        } 
    }
    // 最終，若flag為假，不OK；若為真OK
    if(flagConTim == false) {
    
    	$("#contimCheck").html("請選擇聯絡時段").css('color', '#a16468');
        $("#contimCheck").next().attr("src", '/FinalProject/images/error.png');
    
    }else{
    	$("#gendCheck").html("");
    	$("#gendCheck").next().attr("src", '');
    }
}



//  E-mail

function checkMail(){

    let mailObj = document.getElementById("mail");
    let re = /^.+@.+$/g;
    // 如果 mail 為空值
    if (mailObj.value == ""){
        $("#mailCheck").html("請輸入電子信箱").css('color', '#a16468');
		$("#mailCheck").next().attr("src", '/FinalProject/images/error.png');
        
        flagMail = false;
        $('#mail').removeClass('is-valid').addClass('is-invalid');
        
    //如果 mail 不合規則
    } else if(re.test(mailObj.value) == false){
        $("#mailCheck").html("請輸入有效的電子信箱").css('color', '#a16468');
		$("#mailCheck").next().attr("src", '/FinalProject/images/error.png');

        flagMail = false;
        $('#mail').removeClass('is-valid').addClass('is-invalid');

    }else{
    	$("#mailCheck").html("");
    	$("#mailCheck").next().attr("src", '');
    	
        flagMail = true;
        $('#mail').removeClass('is-invalid').addClass('is-valid');
    }
}
$('#mail').on('blur',checkMail);



//  tel

function checkTel(){

    let telObj = document.getElementById("tel");
    let re = /^\d{9,12}$/g;
    // 如果 tel 為空值
    if (telObj.value == ""){
        $("#telCheck").html("請輸入連絡電話").css('color', '#a16468');
		$("#telCheck").next().attr("src", '/FinalProject/images/error.png');
        
        flagTel = false;
        $('#tel').removeClass('is-valid').addClass('is-invalid');

    //如果 tel 不合規則
    } else if(re.test(telObj.value) == false){
    	$("#telCheck").html("請輸入有效的電話號碼(9-12碼數字)").css('color', '#a16468');
		$("#telCheck").next().attr("src", '/FinalProject/images/error.png');

        flagTel = false;
        $('#tel').removeClass('is-valid').addClass('is-invalid');

    }else{
        $("#telCheck").html("");
        $("#telCheck").next().attr("src", '');
        
        flagTel = true;
        $('#tel').removeClass('is-invalid').addClass('is-valid');
    }
}
$('#tel').on('blur',checkTel);



// idsubmit

document.getElementById("changedForm").addEventListener('submit', function(e){
    e.preventDefault();
    checkAll();
});

function checkAll(){
    checkDate();
    checkTime();
    checkCarmod();
    checkLoc();
    checkLocsit();
    
    checkName();
    checkGender();
    checkConTim();
    checkMail();
    checkTel();
    
    if (flagDate && flagTime && flagCarmod && flagLoc && flagLocsit && flagName 
    && flagGender && flagConTim && flagMail && flagTel){
        document.getElementById("submitcheck").innerHTML = "";
        
        Swal.fire({
            icon: 'success',
            title: '修改完成',
            showConfirmButton: false,
            timer: 1500
          });
          setTimeout(() => {
              document.getElementById("changedForm").submit();
          }, 1000);
          
        return true;
    } else{
        $("#submitcheck").html("表單資料不齊全或含有無效內容，請重新檢查").css('color', '#a16468');
        Swal.fire('表單資料不齊全或含有無效內容，請重新檢查');

        return false;
    }
}


// loc locsit 連動

let locObj = document.getElementById("loc");

locObj.addEventListener("change",toLocsit)
function toLocsit(){
	
	$("#locsitdef").nextAll().css('display','none');
	$("#locsit").val($("#locsitdef").val()) ;
<<<<<<< Updated upstream

=======
>>>>>>> Stashed changes
	if( $("#loc").val() == $("#opt1").val() ){
        $("#opt11").css('display','block');
        $("#opt12").css('display','block');

    } else if ( $("#loc").val() == $("#opt2").val() ){
        $("#opt21").css('display','block');
        $("#opt22").css('display','block');

    } else if ( $("#loc").val() == $("#opt3").val() ){
        $("#opt31").css('display','block');
        $("#opt32").css('display','block');

    } else if ( $("#loc").val() == $("#opt4").val() ){
        $("#opt41").css('display','block');
        $("#opt42").css('display','block');
        
    } else if ( $("#loc").val() == $("#opt5").val() ){
        $("#opt51").css('display','block');
        $("#opt52").css('display','block');
    }
	
}


// date driveTime連動
$('#date').on('change',toTime)
function toTime(){
	if($('#date').val()){
		$('#driveTime').prop('disabled',false)
	} else {
		$('#driveTime').prop('disabled',true)
	} 
}


// 畫面載入時先執行一次
$(document).ready(function(){
	toLocsit();
	toTime();

	$("#date").datepicker({
    	orientation: "bottom",
    	format: 'yyyy-mm-dd',
		startDate: '+1d',
    });
});
	    
//  服務條款_彈出視窗
$('#idPrivate').on('click',function(){
    Swal.fire({
        imageUrl: '/FinalProject/images/PrivatePolicy.png',
        imageHeight: 600,
        imageAlt: '服務條款與隱私權政策'
      })
})	    
	    


// 叫出時間表
function driveTimeModal(){
	let theDay = $('#date').val()
	
	// 塞入modal header 所選日期
	$('#modalheader').html($('#date').val());
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
							$('#Time'+i).html("此時段已被預約").parent().addClass('table-secondary');
						}
						if(i == $('#driveTime').val()){
							$('#Time'+i).html("").parent().removeClass('table-secondary').addClass('selected-Time');
						}
					}
				});
			},
			error: function (err) {
				alert(err)
			}
		});
	
	
	// show modal
	$('#driveTimeModal').modal('show');
	$('#driveTimeModal').css('overflow-y', 'auto');
}




