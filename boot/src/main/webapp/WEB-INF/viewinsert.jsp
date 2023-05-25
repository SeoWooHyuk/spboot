<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>공지사항</title>
	<link rel="stylesheet" type="text/css" href="css/board_deatil.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
</head>
<script type="text/javascript">
$(document).ready(function() {

    $('#write').on('keyup', function() {
        $('#test_cnt').html("("+$(this).val().length+" / 100)");
 
        if($(this).val().length > 100) {
            $(this).val($(this).val().substring(0, 100));
            $('#test_cnt').html("(100 / 100)");
        }
    });
});

</script>
 <body>

   	<h1 style="text-align:center; margin-bottom: 5px; margin-top: 30px;" class="con">게시글 작성</h1>
	<form action="viewinsert_ok" method="post" >
    <input type="hidden" name=id  size=50   value='${sessionid}' required>           
	<section class="article-detail table-common con row"> 	
        <table class="cell" border="1">
            <colgroup>
                <col width="100px">
            </colgroup>
            <tbody>
             <!-- //의미없는 파일 -->
             	<th>제목 <span style="color: red;">*</span> </th>
                <tr class="article-title">
                    <td colspan="3"><input type=text name=title style="width: 100%; height: 32px; border: 2px solid #8041D9; " size=50  required></td>
                </tr>
                 <th>게시글 <span style="color: red;  ">*</span> <div id="test_cnt" style="float:right;">(0 / 100)</div></th>
                <tr class="article-body">
                    <td colspan="4"><textarea id="write" name="writes" style="width: 100%; height: 500px; border: 2px solid #8041D9; resize : none; font-size: 1.0em;" required></textarea> </td> 
	            </tr>
	       </tbody>
	    </table>
	</section>    
	<div class="ass">
	 	<input type="file" name="file1" id = "file1" style="border:none;" multiple">
	 </div>
	<div class="ass">
        <input type="button" id="moc" value="목록"  onclick="location.href= 'views'" >
        <input type="submit" id="submi" value="문의 작성" > 
    </div>
    </form>
    
</body>
</html>
