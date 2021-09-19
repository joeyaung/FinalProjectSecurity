let flagModelType1 = true;
let flagPrice1 = true;
let flagEngineType1 = true;
let flagDisplacement1 = true;
let flagPower1 = true;

let flagTorque1 = true;
let flagConsumption1 = true;
let flagSeat1 = true;
let flagSubtitle1 = true;
let flagDescription1 = true;

let flag1outer = true;
let flag1inner = true;
let flag1bg = true;
let flag1an1 = true;
let flag1an4 = true;
let flag1an7 = true;
let flag1an10 = true;
let flag1an13 = true;
let flag1an16 = true;
let flag1an19 = true;

function checkModelType(){
    if ($('#1modelType').val().trim()==""){
		$("#1modelTypeCheck").html('請輸入車型名稱').css('color', 'red');
		$("#1modelTypeCheck").next().attr("src", "/FinalProject/images/error.png");
		flagModelType1 = false;
	} else {	
		$("#1modelTypeCheck").html("");
    	$("#1modelTypeCheck").next().attr("src", "/FinalProject/images/check.png");
		flagModelType1 = true;
	}
}
$('#1modelType').on('blur',checkModelType);

function checkPrice(){
	let re = /^[1-9]\d{6,}/g;

    if ($('#1price').val().trim()==""){
		$("#1priceCheck").html('請輸入建議售價').css('color', 'red');
		$("#1priceCheck").next().attr("src", "/FinalProject/images/error.png");
		flagPrice1 = false;
	//如果 價錢 不合規則(非數字或10萬以內)
	} else if(!re.test($('#1price').val().trim())){
    	$("#1priceCheck").html("輸入價格過低，請確認是否誤植").css('color', 'red');
		$("#1priceCheck").next().attr("src", '/FinalProject/images/error.png');
		flagPrice1 = false;
    } else {	
		$("#1priceCheck").html("");
    	$("#1priceCheck").next().attr("src", "/FinalProject/images/check.png");
		flagPrice1 = true;
	}
}
$('#1price').on('blur',checkPrice);

function checkEngineType(){
    if ($('#1engineType').val().trim()==""){
		$("#1engineTypeCheck").html('請輸入引擎類型').css('color', 'red');
		$("#1engineTypeCheck").next().attr("src", "/FinalProject/images/error.png");
		flagEngineType1 = false;
	} else {	
		$("#1engineTypeCheck").html("");
    	$("#1engineTypeCheck").next().attr("src", "/FinalProject/images/check.png");
		flagEngineType1 = true;
	}
}
$('#1engineType').on('blur',checkEngineType);

function checkDisplacement(){
    if ($('#1displacement').val().trim()==""){
		$("#1displacementCheck").html('請輸入排氣量').css('color', 'red');
		$("#1displacementCheck").next().attr("src", "/FinalProject/images/error.png");
		flagDisplacement1 = false;
	} else {	
		$("#1displacementCheck").html("");
    	$("#1displacementCheck").next().attr("src", "/FinalProject/images/check.png");
		flagDisplacement1 =  true;
	}
}
$('#1displacement').on('blur',checkDisplacement);

function checkPower(){
    if ($('#1power').val().trim()==""){
		$("#1powerCheck").html('請輸入馬力').css('color', 'red');
		$("#1powerCheck").next().attr("src", "/FinalProject/images/error.png");
		flagPower1 = false;
	} else {	
		$("#1powerCheck").html("");
    	$("#1powerCheck").next().attr("src", "/FinalProject/images/check.png");
		flagPower1 = true;
	}
}
$('#1power').on('blur',checkPower);

function checkTorque(){
    if ($('#1torque').val().trim()==""){
		$("#1torqueCheck").html('請輸入扭力').css('color', 'red');
		$("#1torqueCheck").next().attr("src", "/FinalProject/images/error.png");
		flagTorque1 = false;
	} else {	
		$("#1torqueCheck").html("");
    	$("#1torqueCheck").next().attr("src", "/FinalProject/images/check.png");
		flagTorque1 = true;
	}
}
$('#1torque').on('blur',checkTorque);

function checkConsumption(){
    if ($('#1consumption').val().trim()==""){
		$("#1consumptionCheck").html('請輸入油耗').css('color', 'red');
		$("#1consumptionCheck").next().attr("src", "/FinalProject/images/error.png");
		flagConsumption1 = false;
	} else {	
		$("#1consumptionCheck").html("");
    	$("#1consumptionCheck").next().attr("src", "/FinalProject/images/check.png");
		flagConsumption1 = true;
	}
}
$('#1consumption').on('blur',checkConsumption);

function checkSeat(){
    if ($('#1seat').val().trim()==""){
		$("#1seatCheck").html('請輸入乘坐人數').css('color', 'red');
		$("#1seatCheck").next().attr("src", "/FinalProject/images/error.png");
		flagSeat1 = false;
	} else {	
		$("#1seatCheck").html("");
    	$("#1seatCheck").next().attr("src", "/FinalProject/images/check.png");
		flagSeat1 = true;
	}
}
$('#1seat').on('blur',checkSeat);

function checkSubtitle(){
    if ($('#1subtitle').val().trim()==""){
		$("#1subtitleCheck").html('請輸入標語').css('color', 'red');
		$("#1subtitleCheck").next().attr("src", "/FinalProject/images/error.png");
		flagSubtitle1 = false;
	} else {	
		$("#1subtitleCheck").html("");
    	$("#1subtitleCheck").next().attr("src", "/FinalProject/images/check.png");
		flagSubtitle1 = true;
	}
}
$('#1subtitle').on('blur',checkSubtitle);

function checkDescription(){
    if ($('#1description').val().trim()==""){
		$("#1descriptionCheck").html('請輸入描述').css('color', 'red');
		$("#1descriptionCheck").next().attr("src", "/FinalProject/images/error.png");
		flagDescription1 = false;
	} else {	
		$("#1descriptionCheck").html("");
    	$("#1descriptionCheck").next().attr("src", "/FinalProject/images/check.png");
		flagDescription1 =  true;
	}
}
$('#1description').on('blur',checkDescription);

function checkOuter(){
    if ($('#1outer').val()==""){
		$("#1outerCheck").html('請上傳檔案').css('color', 'red');
		$("#1outerCheck").next().attr("src", "/FinalProject/images/error.png");
		flag1outer = false;
	} else {	
		$("#1outerCheck").html("");
    	$("#1outerCheck").next().attr("src", "/FinalProject/images/check.png");
		flag1outer = true;
	}
}

function checkInner(){
    if ($('#1inner').val()==""){
		$("#1innerCheck").html('請上傳檔案').css('color', 'red');
		$("#1innerCheck").next().attr("src", "/FinalProject/images/error.png");
		flag1inner = false;
	} else {	
		$("#1innerCheck").html("");
    	$("#1innerCheck").next().attr("src", "/FinalProject/images/check.png");
		flag1inner = true;
	}
}

function checkbg(){
    if ($('#1bg').val()==""){
		$("#1bgCheck").html('請上傳檔案').css('color', 'red');
		$("#1bgCheck").next().attr("src", "/FinalProject/images/error.png");
		flag1bg = false;
	} else {	
		$("#1bgCheck").html("");
    	$("#1bgCheck").next().attr("src", "/FinalProject/images/check.png");
		flag1bg = true;
	}
}

function checkan1(){
    if ($('#1an1').val()==""){
		$("#1an1Check").html('請上傳檔案').css('color', 'red');
		$("#1an1Check").next().attr("src", "/FinalProject/images/error.png");
		flag1an1 = false;
	} else {	
		$("#1an1Check").html("");
    	$("#1an1Check").next().attr("src", "/FinalProject/images/check.png");
		flag1an1 = true;
	}
}


function checkan4(){
    if ($('#1an4').val()==""){
		$("#1an4Check").html('請上傳檔案').css('color', 'red');
		$("#1an4Check").next().attr("src", "/FinalProject/images/error.png");
		flag1an4  = false;
	} else {	
		$("#1an4Check").html("");
    	$("#1an4Check").next().attr("src", "/FinalProject/images/check.png");
		flag1an4  = true;
	}
}

function checkan7(){
    if ($('#1an7').val()==""){
		$("#1an7Check").html('請上傳檔案').css('color', 'red');
		$("#1an7Check").next().attr("src", "/FinalProject/images/error.png");
		flag1an7 = false;
	} else {	
		$("#1an7Check").html("");
    	$("#1an7Check").next().attr("src", "/FinalProject/images/check.png");
		flag1an7  = true;
	}
}

function checkan10(){
    if ($('#1an10').val()==""){
		$("#1an10Check").html('請上傳檔案').css('color', 'red');
		$("#1an10Check").next().attr("src", "/FinalProject/images/error.png");
		flag1an10 = false;
	} else {	
		$("#1an10Check").html("");
    	$("#1an10Check").next().attr("src", "/FinalProject/images/check.png");
		flag1an10 = true;
	}
}

function checkan13(){
    if ($('#1an13').val()==""){
		$("#1an13Check").html('請上傳檔案').css('color', 'red');
		$("#1an13Check").next().attr("src", "/FinalProject/images/error.png");
		flag1an13 = false;
	} else {	
		$("#1an13Check").html("");
    	$("#1an13Check").next().attr("src", "/FinalProject/images/check.png");
		flag1an13 = true;
	}
}

function checkan16(){
    if ($('#1an16').val()==""){
		$("#1an16Check").html('請上傳檔案').css('color', 'red');
		$("#1an16Check").next().attr("src", "/FinalProject/images/error.png");
		flag1an16 = false;
	} else {	
		$("#1an16Check").html("");
    	$("#1an16Check").next().attr("src", "/FinalProject/images/check.png");
		flag1an16 = true;
	}
}

function checkan19(){
    if ($('#1an19').val()==""){
		$("#1an19Check").html('請上傳檔案').css('color', 'red');
		$("#1an19Check").next().attr("src", "/FinalProject/images/error.png");
		flag1an19 = false;
	} else {	
		$("#1an19Check").html("");
    	$("#1an19Check").next().attr("src", "/FinalProject/images/check.png");
		flag1an19 = true;
	}
}


// "新增"總檢查
function checkAll1() {
	checkModelType();
    checkPrice();
    checkEngineType();
    checkDisplacement();
    checkPower();
    
    checkTorque();
    checkConsumption();
    checkSeat();
    checkSubtitle();
    checkDescription();
    checkOuter(); checkInner(); checkbg();
	checkan1(); checkan4(); checkan7();
	checkan10(); checkan13(); checkan16(); checkan19();
	
	if(flagModelType1 && flagPrice1 && flagEngineType1 && flagDisplacement1 && flagPower1 &&
	  flagTorque1  && flagConsumption1 && flagSeat1 && flagSubtitle1 && flagDescription1 &&
	  flag1outer && flag1inner && flag1bg && flag1an1 && flag1an4 && flag1an7 && flag1an10 &&
	  flag1an13 && flag1an16 && flag1an19 ){
		$('#1submitcheck').html('')
		return true;
	} else {
		$('#1submitcheck').html("車型資料不齊全，請重新檢查");
		return false;
	}
}
		
		
		
//  "送出"點擊時先執行  總檢查  再執行  Ajax
$("#1submit").click(function (e) {			
	var formData = new FormData(document.getElementById("form1"));
		if (checkAll1() == true) {
			$.ajax({
    	    	url: "/FinalProject/addModel",
    	    	method: "POST",
    	    	data: formData,
		        contentType: false, // NEEDED, DON'T OMIT THIS (requires jQuery 1.6+)
		        processData: false, // NEEDED, DON'T OMIT THIS
		        "mimeType": "multipart/form-data",
	 			success: function (response) {
	        		console.log("Ajax add success")
	            	$("#form1")[0].reset(); // 新增的model清空
	            	table.ajax.reload();	// data table刷新
	        	},
	        	error: function (err) {
	            	console.log(err);
	        	}
	    	});
		} else 
	        e.stopPropagation();
});



//一鍵輸入
$('#1oneKey').on('click', function(){
    $('#1modelType').val('etron');
    $('#1price').val('3050000');
    $('#1engineType').val('非同步式雙電動馬達');
    $('#1displacement').val('0');
    $('#1power').val('313');
    $('#1torque').val('664');
    $('#1consumption').val('26.2 (WLTP)');
    $('#1seat').val('4');
    $('#1subtitle').val('Audi e-tron 為您佈局的純電生活圈，實踐純電生活的全能電旅，詮釋純電設計之美');
    $('#1description').val("Audi 首款純電 SUV。Audi e-tron 剛柔並濟、動靜皆宜，既有 Audi quattro 智慧型恆時四輪傳動系統的絕佳循跡性與動態操控表現，" + 
    		"以及讓您完全沈浸在純電座駕專屬的寧靜氛圍。Audi 為您佈局的純電生活圈，就從您的家中開始！Audi 與電動充電合作夥伴 Noodoe 合作，提供您家用充電軟硬體的整合，輕鬆接軌純電生活");
})





// 以下  修改  的Validation

let flagPrice2 = true;
let flagEngineType2 = true;
let flagDisplacement2 = true;
let flagPower2 = true;

let flagTorque2 = true;
let flagConsumption2 = true;
let flagSeat2 = true;
let flagSubtitle2 = true;
let flagDescription2 = true;


function checkPrice2(){
	let re = /^[1-9]\d{6,}/g;
console.log($('#2price').val())
    if ($('#2price').val().trim()==""){
		$("#2priceCheck").html('請輸入建議售價').css('color', 'red');
		$("#2priceCheck").next().attr("src", "/FinalProject/images/error.png");
		flagPrice2 = false;
	//如果 價錢 不合規則(非數字或100萬以內)
	} else if(!re.test($('#2price').val().trim())){
    	$("#2priceCheck").html("輸入價格過低，請確認是否誤植").css('color', 'red');
		$("#2priceCheck").next().attr("src", '/FinalProject/images/error.png');
		flagPrice2 = false;
    } else {	
		$("#2priceCheck").html("");
    	$("#2priceCheck").next().attr("src", "/FinalProject/images/check.png");
		flagPrice2 = true;
	}
}
$('#2price').on('blur',checkPrice);

function checkEngineType2(){
    if ($('#2engineType').val().trim()==""){
		$("#2engineTypeCheck").html('請輸入引擎類型').css('color', 'red');
		$("#2engineTypeCheck").next().attr("src", "/FinalProject/images/error.png");
		flagEngineType2 = false;
	} else {	
		$("#2engineTypeCheck").html("");
    	$("#2engineTypeCheck").next().attr("src", "/FinalProject/images/check.png");
		flagEngineType2 = true;
	}
}
$('#2engineType').on('blur',checkEngineType);

function checkDisplacement2(){
    if ($('#2displacement').val().trim()==""){
		$("#2displacementCheck").html('請輸入排氣量').css('color', 'red');
		$("#2displacementCheck").next().attr("src", "/FinalProject/images/error.png");
		flagDisplacement2 = false;
	} else {	
		$("#2displacementCheck").html("");
    	$("#2displacementCheck").next().attr("src", "/FinalProject/images/check.png");
		flagDisplacement2 =  true;
	}
}
$('#2displacement').on('blur',checkDisplacement);

function checkPower2(){
    if ($('#2power').val().trim()==""){
		$("#2powerCheck").html('請輸入馬力').css('color', 'red');
		$("#2powerCheck").next().attr("src", "/FinalProject/images/error.png");
		flagPower2 = false;
	} else {	
		$("#2powerCheck").html("");
    	$("#2powerCheck").next().attr("src", "/FinalProject/images/check.png");
		flagPower2 = true;
	}
}
$('#2power').on('blur',checkPower);

function checkTorque2(){
    if ($('#2torque').val().trim()==""){
		$("#2torqueCheck").html('請輸入扭力').css('color', 'red');
		$("#2torqueCheck").next().attr("src", "/FinalProject/images/error.png");
		flagTorque2 = false;
	} else {	
		$("#2torqueCheck").html("");
    	$("#2torqueCheck").next().attr("src", "/FinalProject/images/check.png");
		flagTorque2 = true;
	}
}
$('#2torque').on('blur',checkTorque);

function checkConsumption2(){
    if ($('#2consumption').val().trim()==""){
		$("#2consumptionCheck").html('請輸入油耗').css('color', 'red');
		$("#2consumptionCheck").next().attr("src", "/FinalProject/images/error.png");
		flagConsumption2 = false;
	} else {	
		$("#2consumptionCheck").html("");
    	$("#2consumptionCheck").next().attr("src", "/FinalProject/images/check.png");
		flagConsumption2 = true;
	}
}
$('#2consumption').on('blur',checkConsumption);

function checkSeat2(){
    if ($('#2seat').val().trim()==""){
		$("#2seatCheck").html('請輸入乘坐人數').css('color', 'red');
		$("#2seatCheck").next().attr("src", "/FinalProject/images/error.png");
		flagSeat2 = false;
	} else {	
		$("#2seatCheck").html("");
    	$("#2seatCheck").next().attr("src", "/FinalProject/images/check.png");
		flagSeat2 = true;
	}
}
$('#2seat').on('blur',checkSeat);

function checkSubtitle2(){
    if ($('#2subtitle').val().trim()==""){
		$("#2subtitleCheck").html('請輸入標語').css('color', 'red');
		$("#2subtitleCheck").next().attr("src", "/FinalProject/images/error.png");
		flagSubtitle2 = false;
	} else {	
		$("#2subtitleCheck").html("");
    	$("#2subtitleCheck").next().attr("src", "/FinalProject/images/check.png");
		flagSubtitle2 = true;
	}
}
$('#2subtitle').on('blur',checkSubtitle);

function checkDescription2(){
    if ($('#2description').val().trim()==""){
		$("#2descriptionCheck").html('請輸入描述').css('color', 'red');
		$("#2descriptionCheck").next().attr("src", "/FinalProject/images/error.png");
		flagDescription2 = false;
	} else {	
		$("#2descriptionCheck").html("");
    	$("#2descriptionCheck").next().attr("src", "/FinalProject/images/check.png");
		flagDescription2 =  true;
	}
}
$('#2description').on('blur',checkDescription);


// "新增"總檢查
function checkAll2() {
    checkPrice2();
    checkEngineType2();
    checkDisplacement2();
    checkPower2();
    
    checkTorque2();
    checkConsumption2();
    checkSeat2();
    checkSubtitle2();
    checkDescription2();
	
	if( flagPrice2 && flagEngineType2 && flagDisplacement2 && flagPower2 &&
	  flagTorque2 && flagConsumption2 && flagSeat2 && flagSubtitle2 && flagDescription2 ){
		$('#2submitcheck').html('')
		return true;
	} else {
		$('#2submitcheck').html("車型資料不齊全，請重新檢查");
		return false;
	}
}

		
//  "送出"點擊時先執行  總檢查  再執行  Ajax
	$("#2submit").click(function (e) {			
		var formData2 = new FormData(document.getElementById("form2"));
		if (checkAll2() == true) {
			$.ajax({
    	    	url: "/FinalProject/updateModel",
    	    	method: "POST",
    	    	data: formData2,
		        contentType: false, // NEEDED, DON'T OMIT THIS (requires jQuery 1.6+)
		        processData: false, // NEEDED, DON'T OMIT THIS
		        "mimeType": "multipart/form-data",
	 			success: function (response) {
	        		console.log("Ajax update success")
	            	$("#form2")[0].reset(); // 新增的model清空
	            	table.ajax.reload();	// data table刷新
	        	},
	        	error: function (err) {
	            	console.log(err);
	        	}
	    	});
		} else {
	        e.stopPropagation();
		}
	});











