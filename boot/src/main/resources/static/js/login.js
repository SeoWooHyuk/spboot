
 $(document).ready(function() { // html 문서가 다 로딩 되면
    $("#login_button").click(function() { // 로그인 버튼이 눌렸을때

        /*테스트용 */
        // searchParams = searchParams = new URLSearchParams(location.search);
        // const urlParams = new URL(location.href).searchParams;
        // const name = urlParams.get('err');
        // console.log(name)

        // function setParamsTest(selector, category) {
        //     const url = new URL(window.location);
        //     url.searchParams.set(category, selector);
        //     window.history.pushState({}, "", url);
        //     window.location.reload();
        // }

        let username = $("#id").val(); // 사용자 id를 가져와서
        let pw = $("#pw").val(); // 사용자 id를 가져와서
        if(username == "")
        {
            alert("아이디를 입력하세요")
        }else if(pw == ""){
            alert("비밀번호를 입력하세요");
        }
    
 
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
                    $('#login-form').submit();
			}
        })
    })
})