
var vueAll = new Vue({
    el: '#vueAll',
    data: {
        vueTime: ''
    },
    methods:{     
	// driveTime Modal連動給input值
   		setTime(index){
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
let flagToS = true;


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
$('#date').on('change',checkDate);


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
$('#driveTime').on('change',checkTime);


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
    if ( locsitObj.value == document.getElementById("locsitdef").value){
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
        
        $('#flexRadio1').removeClass('is-valid').addClass('is-invalid');
        $('#flexRadio2').removeClass('is-valid').addClass('is-invalid');
        $('#flexRadio3').removeClass('is-valid').addClass('is-invalid');
    }else{
        $("#gendCheck").html("");
    	$("#gendCheck").next().attr("src", '');
    	
    	$('#flexRadio1').removeClass('is-invalid').addClass('is-valid');
        $('#flexRadio2').removeClass('is-invalid').addClass('is-valid');
        $('#flexRadio3').removeClass('is-invalid').addClass('is-valid');
    }
}
$('#flexRadio1').parent().parent().on('blur',checkGender);





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
    
    	$('#inlineCheckbox1').removeClass('is-valid').addClass('is-invalid');
        $('#inlineCheckbox2').removeClass('is-valid').addClass('is-invalid');
        $('#inlineCheckbox3').removeClass('is-valid').addClass('is-invalid');
        
    }else{
    	$("#contimCheck").html("");
    	$("#contimCheck").next().attr("src", '');
    
    	$('#inlineCheckbox1').removeClass('is-invalid').addClass('is-valid');
        $('#inlineCheckbox2').removeClass('is-invalid').addClass('is-valid');
        $('#inlineCheckbox3').removeClass('is-invalid').addClass('is-valid');
    }
}
$('#inlineCheckbox1').parent().parent().on('blur',checkConTim);



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


// ToS

function checkToS(){
	if($('#ToS').prop("checked")){
		flagToS = true;
		$('#ToS').removeClass('is-invalid').addClass('is-valid');
		
	} else {
		flagToS = false;
		$('#ToS').removeClass('is-valid').addClass('is-invalid');
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
    checkTime();
    checkCarmod();
    checkLoc();
    checkLocsit();
    
    checkName();
    checkGender();
    checkConTim();
    checkMail();
    checkTel();
    checkToS();
    
    if (flagDate && flagTime && flagCarmod && flagLoc && flagLocsit && flagName 
    && flagGender && flagConTim && flagMail && flagTel && flagToS){
        document.getElementById("submitcheck").innerHTML = "";
        document.getElementById("addForm").submit();
        
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
    
    // 顯示 預約頁面，其他隱藏
    $("#bookformPage").css('display','block'); 
    $("#booksearchPage").css('display','none'); 
    
    //把 修改按鈕 disabled掉
    $('#update-custom').prop('disabled', true);
});


//  一鍵輸入
$('#onekey').on('click', function(){
    $('#date').val('2021-11-02');
    toTime();
    $('#driveTime').val('10');
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
    $('#comm').val('');
}).on('dblclick', function(){
    $('#date').val('2021-10-25');
    toTime();
    $('#driveTime').val('14');
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
    $('#comm').val('需要測試兒童安全座椅好不好裝');
})

$('#ToS').removeClass('is-invalid').addClass('is-valid');

// 單筆查詢 檢查
function checkSearch(){
	let searchLength = $('#search-input').val().trim().length;
    if( 0 < searchLength && searchLength < 11){
    	$('#search-input').removeClass('is-valid').addClass('is-invalid');
    	Swal.fire('請輸入完整欲查詢表單編號')
    	return false;
    } else if( $('#search-input').val().trim().length>10){
    	$('#search-input').removeClass('is-invalid').addClass('is-valid');
	    return true;
	}
}
// 單筆查詢 onblur時執行檢查
$('#search-input').on('blur', checkSearch);

// 單筆查詢 送出的Ajax 
function search(searchFormId){
	$.ajax({
		url: "/FinalProject/findByIdTestdriveAPI/" + searchFormId,
		method: "GET",
		dataType: "json",
		success: function (res) {
			// 還原 單筆查詢 input 為預設值
			$('#search-input').val('')
			$('#search-input').removeClass('is-invalid').removeClass('is-valid')
			
			$("#bookformPage").css('display','none'); 
    		$("#booksearchPage").css('display','block'); 
			
//	成功的話，將值塞入表中
	if(res.formId){
		$("#firstRow :first-child").html(res.formId)
		$("#firstRow :first-child").next().html(res.driveDate +", "+res.driveTime+"點")
		$("#firstRow :first-child").next().next().html(res.carMod)
		$("#firstRow :last-child").prev().prev().html(res.driveLoc)
		$("#firstRow :last-child").prev().html(res.driveLocSit)
		$("#firstRow :last-child").html(res.sales)
		$("#secondRow :first-child").html(res.nameCli)
		$("#secondRow :first-child").next().html(res.gendCli)
		$("#secondRow :first-child").next().next().html(res.timCli)
		$("#secondRow :last-child").prev().prev().html(res.mailCli)
		$("#secondRow :last-child").prev().html(res.telCli)
		$("#secondRow :last-child").html(res.remark)
		$(".formTime").html("填表日期:"+res.formTime)
		$("#hiddenId").val(res.formId)
	}
		
		},
		error: function (err) {
    		Swal.fire('查無資料，請檢查表單編號後再次查詢')
		}
	});
}

// 單筆查詢 送出前檢查 之後呼叫Ajax送出
$("#searchBtn").click(function(){
	if(checkSearch()){
		let searchFormId = $('#search-input').val().trim();
		search(searchFormId);
	} 
});


// 返回預約賞車，還原各分頁為預設值
$("#TestDrive").click(function(){
	// 顯示 預約頁面，其他隱藏
    $("#bookformPage").css('display','block'); 
    $("#booksearchPage").css('display','none'); 
    
    //把 修改按鈕 disabled掉
    $('#update-custom').prop('disabled', true);
    //把 滑鈕顯現、提示字顯現
    captcha.removeClass('passed');
	$('#puzzleHint').css('visibility', 'visible');
	captcha.css('--moved', '0px');
});



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
			dataType: "JSON",
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



//  scroll animation 滾動漸變圖

let startingPoint
const header = document.querySelector('header')

    header.addEventListener('mouseenter',(e) => {
        startingPoint = e.clientX;
        header.classList.add('moving');
    })
    header.addEventListener('mouseout',(e) => {
        header.style.setProperty('--percentage', 0);
        header.classList.remove('moving');
    })


const season = document.getElementById('season')
let leftEmpty = (window.outerWidth - season.offsetWidth)/2

header.addEventListener('mousemove',(e) => {
    // let percentage = 2*(e.clientX - startingPoint) / window.outerWidth ;
    let percentage = Math.abs((e.clientX - startingPoint) / (season.offsetWidth + leftEmpty - startingPoint));
    // console.log((e.clientX - startingPoint) +"###"+(season.offsetWidth)+"###"+percentage)
    header.style.setProperty('--percentage', percentage)
})

let pageH=$('body').height()
let winH=$(window).height()
// let footer = $('footer').outerHeight()

$(window).scroll(function(){
    let winTop=$(this).scrollTop();;
    let scrollPercent=(winTop/(pageH-winH+178));
    // 分母要再加上footer的height
    // console.log(winTop+'**'+pageH+'**'+winH+'**'+(pageH-winH)+'**'+scrollPercent);
    header.style.setProperty('--percentage', scrollPercent)
})



//  拼圖驗證

let shouldMove = false;
const captcha = $('#captcha')
const handle = $('#handle')
const button = $('#handle span')

button.on('mousedown', function(){
	shouldMove = true
})

$(window).on('mousemove', function(e){
	if(shouldMove){
	    const offsetLeft = handle[0].getBoundingClientRect().left
	    const buttonWidth = button[0].getBoundingClientRect().width
	    // 把變數值設定為: 滑鼠X座標 - hander以左的空白 - 滑鈕一半的寬度
		captcha.css('--moved', (e.clientX - offsetLeft - buttonWidth/2)+"px")
	}
})

$(window).on('mouseup', function(e){
	if(shouldMove){
		// 滑鼠X座標 - hander以左的空白 = hander移動的距離值
	    let finalOffset = e.clientX - handle[0].getBoundingClientRect().left
	    console.log(finalOffset)
		
		if(finalOffset >=205 && finalOffset <= 235){ //正確位置為220
			captcha.addClass('passed');
			$('#update-custom').prop('disabled', false);
			$('#puzzleHint').css('visibility', 'hidden');
		} else {	// 沒成功時，改變變數，彈回原點
			captcha.css('--moved', '0px');
		}
		shouldMove = false
	}
})








