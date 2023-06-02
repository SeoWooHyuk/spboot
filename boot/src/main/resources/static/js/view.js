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
			fn_search();
        });


		},
		// 게시판 조회 ajax 호출
		viewsallselectajax: function(){
			var submitObj = new Object();
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
						viewsallselect.bootstrap(); //페이지 자바스크립트 처리
						viewsallselect.drawBoardList(res);
						viewsallselect.drawtoboardcount(res);
						viewsallselect.pagindata(res);
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
			const totalPageCnt = data.totalPagewrite.totalPageCnt; //총페이지 수
			var html = '총게시물 ' + totCnt + '/  (페이지' +pageindexjs + '/' + totalPageCnt+')' ;
		
			$("#toboardcount").html(html);
		},

		pagindata: function(data){
			
			let prev = data.pagination.xprev;
			let next = data.pagination.xnext;
			let startDate = data.pagination.firstRecordIndex;
			let endDate = data.pagination.lastPageNoOnPageList;
			let html ='';

				html +=    '<div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">';    
				html +=    '<ul class="pagination">'; 
			if(prev){
				html +=    '<li class="paginate_button page-item previous" id="dataTable_previous">';    
				html +=    '<a href="javascript:void(0);" onclick="fn_go_page(${'+startDate - 1+'}); return false;" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li>';    
			}

			for (var num=1; num<=endDate; num++) {
				html += '<li class="paginate_button page-item">';  
				html += '<a href="javascript:void(0);" onclick="fn_go_page('+num+'); return false;" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link" title="'+num+'">'+num+'</a></li>'
			}

			if(next){
				html +=    '<li class="paginate_button page-item next" id="dataTable_next">';    
				html +=    ' <a href="javascript:void(0);" onclick="fn_go_page('+endDate + 1+'); return false;" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Next</a></li>';    
			}
				html +=    '</ul>'
				html +=    '</div>'


			$("#pageing").html(html);


			let thisIndex = pageindexjs; //페이지리스트내가 클릭한 위치
			console.log(thisIndex);
			$(".pagination li").each(function() {
			  var thistitle = $(this).find("a").attr("title");
			  if (thistitle == thisIndex) {
				$(".pagination li").removeClass("active");
				$(this).addClass("active");
			  }
			});

		},

		bootstrap: function() {

/*
		let thisIndex = pageindexjs; //페이지리스트내가 클릭한 위치
		console.log(thisIndex);
		let $paginationLinks = $(".pagination li a");
		$paginationLinks.each(function() {
			let $this = $(this);
			let linkIndex = $this.parent().index();
			let linkPageNo = $this.attr("title");
			if (linkPageNo === thisIndex && !$this.parent().hasClass("active")) {
			$paginationLinks.parent().removeClass("active");
			$this.parent().addClass("active");
			}
		}); 
*/


		}

	}
	
	$(function(){
		viewsallselect.init();
	});
