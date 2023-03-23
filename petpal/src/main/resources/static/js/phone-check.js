//휴대폰 번호 인증
var code2 = "";
$("#phoneChk").click(function(){
   alert("인증번호 발송이 완료되었습니다.\n휴대폰에서 인증번호 확인을 해주십시오.");
   var phone = $("#phone").val();   
   
   
   $.ajax({
        type:"GET",
        url:"/member/phoneCheck?phone=" + phone,
        cache : false,
        success:function(data){
          
           console.log(data);
           
           $("#phone2").on("propertychange change keyup paste input",function(){
              var phone2 = $("#phone2").val();
              console.log(phone2);
              
              if(data == phone2){
                 $(".successPhoneChk").css("color","green");
                 $(".successPhoneChk").text("유효한 인증번호 입니다.");

              }else{
                 $(".successPhoneChk").text("유효한 번호를 입력해주세요.");
                   $(".successPhoneChk").css("color","red")
              }
           });
          
        
        }
    });
});
