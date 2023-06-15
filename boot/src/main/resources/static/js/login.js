
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
 
 
 $(document).ready(function() { // html 문서가 다 로딩 되면

    let lgbutton = document.getElementById("login_button");

    $(document).on("keyup", function(event) {     // 모든 페이지에서 keyup이벤트를 받도록 등록
        if (event.key === "Enter" && $("#pw").is(":focus")) {  // 키가 엔터키이고 현재 입력중인 요소가 비밀번호 입력칸인 경우
            event.preventDefault(); // 엔터키의 기본 동작을 막습니다.
            $("#login_button").click(); // 로그인 버튼을 클릭한 것으로 간주하여 클릭 이벤트를 발생시킵니다.
            return false;
        }
    });
    
	lgbutton.onclick = function(){
        send();
    }
 
	function send(){
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
	}


})