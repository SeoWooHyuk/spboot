
 $(document).ready(function() { // html 문서가 다 로딩 되면
    $("#login_button").click(function() { // 로그인 버튼이 눌렸을때
        let username = $("#id").val(); // 사용자 id를 가져와서
        $.ajax({ // 서버로 보내서 기존 세션이 존재하는지 (중복인지) 검사해준다.
            url : "/checkUserajax",
            method : "get",
            contentType: "application/json;charset=UTF-8",
            dataType : "json",
            data : {
                id : username,
            },
            success : function(result){
           
                if(result == false) {
                    $('#login-form').submit();
                }else{
                    let check = confirm(
                        "이미 로그인된 아이디가있습니다 로그인하시겠습니까??"
                    );
                    if(check) {
                        $('#login-form').submit();
                    }
                }          
            }
            ,
			error: function(xhr, status, error) {
					console.error(error);
			}
        })
    })
})