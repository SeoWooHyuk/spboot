$(document).ready(function(){
  const form = document.getElementById('join_form');
  form.addEventListener('submit', e => {
      e.preventDefault();

      const data = new FormData(form);
      const param = JSON.stringify(Object.fromEntries(data));

      fetch('/joininsert', {
          method: 'POST',
          body: param,
          headers: {
              'Content-Type': 'application/json'
          }
      })
      .then(response => {
          debugger;
          if (response.status == 200) {
              window.location.href = '/login';
              alert("회원가입 성공")
          } else {
              alert("회원가입 실패")
          }
      })
      .catch(error => console.log(error))
  });



  $('input[name=pw]').keyup(function(){
    var pw = $('input[name=pw]').val();
    var regexNum = /[0-9]/; // 숫자 포함 여부를 검사하는 정규표현식
    var regexLower = /[a-z]/; // 영문 소문자 포함 여부를 검사하는 정규표현식
    var regexSpecial = /[~!@#$%^&*()_+|<>?:{}]/; // 특수문자 포함 여부를 검사하는 정규표현식
    if(pw.length < 8){
        $('#passMsg').html('필수 정보입니다.');
        $(this).css('border', '2px solid red');
    } else if(!regexNum.test(pw) || !regexLower.test(pw) || !regexSpecial.test(pw)){
        $('#passMsg').html('비밀번호는 숫자, 소문자, 특수문자가 각 1자 이상 입력되어야 합니다.');
        $(this).css('border', '2px solid red');
    }else{
        $('#passMsg').html('');
        $(this).css('border', '2px solid #8041D9');
    }
});


$('input[name=pw2]').keyup(function(){
    if($('input[name=pw2]').val().length<8){
        $('#pass2Msg').html('필수 정보입니다.');
        $(this).css('border', '2px solid red');
     }
    else if($('input[name=pw]').val() != $('input[name=pw2]').val()){
        $('#pass2Msg').html('비밀번호가 일치하지 않습니다.');
        $(this).css('border', '2px solid red');
    }else{
        $('#pass2Msg').html('');
        $(this).css('border', '2px solid #8041D9');
    }
});

});


$(document).ready(function(){
  
    var keyword="";

	var infojoinselect = {
		// 최초 실행
		init: function(){
			infojoinselect.bind();  // 이벤트 바인딩
			infojoinselect.infojoinselectajax();    // 게시판 조회
		},
		// 이벤트 바인딩
		bind: function(){
			// 이벤트 바인딩 코드 작성
		
      
        $('#id').on('keyup', function(e) {

            keyword = $('input[name=id]').val();
            console.log(keyword);
            infojoinselect.infojoinselectajax();  
        });

		},
		// 게시판 조회 ajax 호출
		infojoinselectajax: function(){
			$.ajax({
				url: '/infojoinselectajax',
				type: 'post',
				contentType: "application/json;charset=UTF-8",
				dataType: 'json',
                data: JSON.stringify(keyword),
				success: function(res) {
                    console.log(res.check);

                    if(keyword ==  "")
                    {
                        $("#passidMsg").html('아이디를 입력해주세요.');
                        $("#passidMsg").css("color","red");
                    }
                    else if(res.check){
                        $("#passidMsg").html('사용할 수 없는 아이디 입니다.');
                        $("#passidMsg").css('color','red');
                    } 
                    else{
                        $("#passidMsg").html('사용할 수 있는 아이디 입니다.');
                        $("#passidMsg").css('color','green');
                    } 

                
				},
				error: function(xhr, status, error) {
					console.error(error);
				}
			});
		},
	
	}
	
	$(function(){
		infojoinselect.init();
	});
 
});