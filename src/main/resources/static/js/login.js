$("#clientInputEmail").change(function () {
  $("#emailBlock > span").remove();
  let inputNode = $("#clientInputEmail");
  let hasEmail = isEmailExits(inputNode.val());
});

// Check if email exits
function isEmailExits(email) {
  let url = `http://localhost:8080/FinalProject/api/v1/member/isExits/${email}`;

  $.ajax({
    url: url,
    success: function (res) {
      if (res == "no") {
        failHandler();
      }
    },
    error: function () {
      failHandler();
    },
  });
}

function failHandler() {
  let errNode = document.createElement("span");
  errNode.innerText = "查無此用戶, 請確認電子郵件";
  errNode.style.color = "#ff4757";
  $("#clientInputEmail").css("border", "1px solid #ff4757");
  $("#emailBlock").append(errNode);
}

$(".btn-register").on("click", function (event) {
  event.preventDefault();
  window.location="http://localhost:8080/FinalProject/register";
});
