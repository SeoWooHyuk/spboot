var keyword = ""; 
	var pageindexjs = "1"; // 검색어 변수
	
	function fn_search(){
    keyword = $('.searchTerm').val(); // 검색어 저장
    $("#pageIndex").val("1");
    viewsallselect.viewsallselectajax(); // 게시판 조회
	}

	function fn_go_page(pageNo) {
	pageindexjs = pageNo.toString();
	$("#pageIndex").val(pageNo);
	viewsallselect.viewsallselectajax(); 
	}

	
	var viewsallselect = {
		// 최초 실행
		init: function(){
			viewsallselect.bind();  // 이벤트 바인딩
			viewsallselect.viewsallselectajax();    // 게시판 조회
		},
		// 이벤트 바인딩
		bind: function(){
			// 이벤트 바인딩 코드 작성
		
        // 엔터키 입력 시
        $('.searchTerm').on('keyup', function(e) {
            if (e.keyCode == 13/* 엔터키 */) {
                fn_search();
				
            }
        });


		},
		// 게시판 조회 ajax 호출
		viewsallselectajax: function(){
			var submitObj = new Object();
			console.log(pageindexjs);
			submitObj.searchKeyword= keyword ;
			submitObj.pageIndex = pageindexjs;
			$.ajax({
				url: '/viewsallselectajax',
				type: 'post',
				contentType: "application/json;charset=UTF-8",
				dataType: 'json',
				data: JSON.stringify(submitObj),
				success: function(res) {
					if (res.boardMap) {
						viewsallselect.bootstrap();
						viewsallselect.drawBoardList(res);
						viewsallselect.drawtoboardcount(res);
					}
				},
				error: function(xhr, status, error) {
					console.error(error);
				}
			});
		},
		// 게시판 조회 데이터 html 로 화면에 그려주기
		drawBoardList: function(data){
			var html = '';
			$.each( data.boardMap.boardList, function(i){
				//console.log(i);
				html += '<tr>';
				html += '    <td></td>';
				html += '    <td>'+i+'</td>';
				html += '    <td> <a href="viewdetail?boardnum='+data.boardMap.boardList[i].boardnum+'">' +data.boardMap.boardList[i].title+ '<a>  </td>';
				html += '    <td>'+data.boardMap.boardList[i].id+'</td>';
				html += '    <td>'+data.boardMap.boardList[i].date+'</td>';
				html += '</tr>';
			});
			$("#tbody_boardList").html(html);
		},

		drawtoboardcount: function(data){

			//console.log(data.pagination); 
			const totCnt = data.totalPagewrite.totCnt;  //총게시글수 
			const totalPageCnt = data.totalPagewrite.totalPageCnt;
			var html = '총게시물 ' + totCnt + '/  (페이지' +pageindexjs + '/' + totalPageCnt+')' ;
		
			$("#toboardcount").html(html);
		},

		bootstrap: function() {
		var thisIndex = pageindexjs;
		var $paginationLinks = $(".pagination li a");
		$paginationLinks.each(function() {
			var $this = $(this);
			var linkIndex = $this.parent().index();
			var linkPageNo = $this.attr("title");
			if (linkPageNo === thisIndex && !$this.parent().hasClass("active")) {
			$paginationLinks.parent().removeClass("active");
			$this.parent().addClass("active");
			}
		}); 
		}

	}
	
	$(function(){
		viewsallselect.init();
	});
