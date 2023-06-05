$(document).ready(function() {
    // 페이지에 진입할 때, jQuery AJAX로 세션 정보를 가져옴
    $.get('/loginsession', function(response) {
      // 세션이 유효하지 않은 경우, 리다이렉트 처리
      if (response === 'invalid_session') {
        alert('다른 사용자가 로그인 하였습니다.\n다시 로그인해 주세요.')
        location.reload();  // 화면 리로드
      }
      else{
        location.href = "/view";
      }
    });
  });