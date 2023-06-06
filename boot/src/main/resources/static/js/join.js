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


$('select[name=area1]').click(function(){
    if($('select[name=area1]').val() == '지역 선택'){
        $('#area1Msg').html('지역을 선택해주세요.');
        $('#area2Msg').html('시/군/구를 선택해주세요.');
        $(this).css('border', '2px solid red');
        $('select[name=area2]').css('border', '2px solid red');
    }
    else{
        $('#area1Msg').html('');
        $(this).css('border', '2px solid #8041D9');
    }
});

$('select[name=area2]').click(function(){
    if($('select[name=area2]').val() == 0){
        $('#area2Msg').html('시/군/구를 선택해주세요.');
        $(this).css('border', '2px solid red');
    }else{
        $('#area2Msg').html('');
        $(this).css('border', '2px solid #8041D9');
    }
});

$('input[name=address2]').keyup(function(){
    const addressRegex = /^[가-힣0-9-\s]*$/;
    const addressVal = $(this).val();

    if(addressVal.length<10){
      $('#areaMsg').html('상세 주소를 자세히 입력해주세요.');
      $(this).css('border', '2px solid red');
    }else if(!addressRegex.test(addressVal)){
      $('#areaMsg').html('주소는 한글, 숫자만 입력 가능합니다.');
      $(this).css('border', '2px solid red');
    }else{
      $('#areaMsg').html('');
      $(this).css('border', '2px solid #8041D9');
    }
  });

  $('.access').click(function() {
    if ($(this).prop('id') === 'accessAll') {
      $('.access').prop('checked', $(this).prop('checked'));
    } else {
      var allChecked = true;
      $('.access:not(#accessAll)').each(function() {
        if (!$(this).prop('checked')) {
          allChecked = false;
        }
      });
      $('#accessAll').prop('checked', allChecked);
    }
  

    });

	$("input[name='access']").change(function() {
	  if($("input[name='access'][value='만 14세	이상입니다.']").is(':checked') 
	     && $("input[name='access'][value='서비스 이용약관에 동의합니다.']").is(':checked') 
	     && $("input[name='access'][value='개인정보 수집/이용에 동의합니다.']").is(':checked') 
	     && $("input[name='access'][value='개인정보 제3자 제공에 동의합니다.']").is(':checked')) {
	    $('#accessMsg').html('');
	  } else {	  
	  	$('#accessMsg').html('필수 동의 사항을 체크해주세요.');	
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
            const emailRegex = /^[a-z0-9]+@[^\s@]+\.[^\s@]+$/;
            //const nicknameRegex = /^[a-zA-Z0-9]+$/;
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
                        $("#passidMsg").html('아이디(이메일)를 입력해주세요.');
                        $("#passidMsg").css("color","red");
                    }
                    else if(!emailRegex.test(keyword))
                    {
                        $("#passidMsg").html('사용할 수 없는 형식 입니다.');
                        $("#passidMsg").css('color','red');
                    }
                    else if(res.check){
                        $("#passidMsg").html('사용할 수 없는 이메일형식 입니다.');
                        $("#passidMsg").css('color','red');
                    } 
                    else{
                        $("#passidMsg").html('사용할 수 있는 이메일형식 입니다.');
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


    // 탭바 스크립트
  //우편번호
  function sample6_execDaumPostcode() {
      new daum.Postcode({
          oncomplete: function(data) {
              // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
  
              // 각 주소의 노출 규칙에 따라 주소를 조합한다.
              // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
              var addr = ''; // 주소 변수
  
              //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
              if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                  addr = data.roadAddress;
              } else { // 사용자가 지번 주소를 선택했을 경우(J)
                  addr = data.jibunAddress;
              }
  
              // 우편번호와 주소 정보를 해당 필드에 넣는다.
              document.getElementById('sample6_postcode').value = data.zonecode;
              document.getElementById("sample6_address").value = addr;
              // 커서를 상세주소 필드로 이동한다.
              document.getElementById("sample6_detailAddress").focus();
          }
      }).open();
  }


  