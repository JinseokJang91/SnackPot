<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판</title>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>


.content {
	height: 100vh;
	padding: 50px 0px;
	margin-left: auto;
	margin-right: auto;
	overflow-y: auto;
}

       #btn1{

        color: #F5D042;
        background-color: #0A174E;
 }
 
   #btn2{

        color: #F5D042;
        background-color: #0A174E;
 }
        
        }
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row flex-nowrap">

	<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />

	<div class="content col-8">
		<br>
		<br>

			<h2>문의 답변 작성</h2>
			<br> <br>
			<br>
			<table id="contentArea" align="center" class="table">
				<tr>
					<th width="100">제목</th>
					<td colspan="3">${q.QTitle }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${ q.writer }</td>
					<th>작성일</th>
					<td>${ q.viewDate }</td>
				</tr>

				<tr>
					<th>내용</th>
					<td colspan="3"></td>
				</tr>
				<c:if test="${ !empty q.changeName }">
				
				<tr>
				<td>
				
					<img src="${ pageContext.servletContext.contextPath }/resources/upload_files/qnaAttachment/${q.changeName}" width="500px">
				</td>
				
				</tr>
							</c:if>
							<c:if test="${ empty q.changeName }">
									
							</c:if>
				<tr>
					<td colspan="4"><p style="height: 150px">
							
					
							<br>
							${ q.QContent }
						</p></td>
				</tr>
			</table>
			<br>
		
		
		  
			<h2>답변</h2>
            <br>
			
            <form id="answerForm" method="post" action="answerInsert.qna" enctype="multipart/form-data">
                <table id="contentArea" align="center" class="table">
                    <tr>
                        <th><label for="title">제목</label></th>
                        <td><input type="text" id="title" class="form-control" name="aTitle" required></td>
                    </tr>

                    <tr>
                        <th colspan="2"><label for="content">내용</label></th>
                    </tr>
                    <tr>
                        <th colspan="2"><textarea class="form-control" required name="aContent" id="content" rows="10" style="resize:none;"></textarea></th>
                    </tr>
                </table>
                <br>

                <div align="center">
                <input type="hidden" value="${q.QNo}" name="qNo">
                    <button type="submit" class="btn" id="btn1">등록하기</button>
                    <button type="reset" class="btn" id="btn2" onclick="javascript:history.go(-1);">취소하기</button>
                </div>
            </form>
        </div>
			
			
	
			
		</div>	
	</div>

</body>
</html>