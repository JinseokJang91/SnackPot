<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판</title>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>

  
<style>
/*#contentArea {
	width: 100%
}*/


  .content{
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
       
       
   #btn3{

        color: #F5D042;
        background-color: #0A174E;
        float: right;
 }
         
        


#contentArea * {
	margin: 5px
}
</style>
</head>
<body>


	<jsp:include page="../common/menubar.jsp" />

	<div class="content col-8">
		<br>
		<br>
		<div class="innerOuter">
			<h2>게시글 상세보기</h2>
			<br> <br>
			<br>
			<table id="contentArea" align="center" class="table">
				<tr>
					<th width="100">제목</th>
					<td colspan="3">${q.QTitle }</td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${ q.name }</td>
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

			<c:if test="${ loginUser.memId eq q.writer }">
				<div align="center">
					<button class="btn" onclick="postFormSubmit(1);" id="btn1">수정하기</button>
					<button class="btn" onclick="postFormSubmit(2);" id="btn2">삭제하기</button>
				</div>

				<form id="postForm" action="" method="post">
					<input type="hidden" name="qno" value="${ q.QNo }"> 
					<input type="hidden" name="fileName" value="${ q.changeName }">
				</form>
				<script>
					function postFormSubmit(num) {
						var postForm = $("#postForm");
						if (num == 1) {
							postForm.attr("action", "updateForm.qna");
						} else {
							postForm.attr("action", "delete.qna");
						}
						postForm.submit();
					}
				</script>
			</c:if>
			
		
			<br>
			<br>

			<c:if test="${not empty q.ATitle}">
			
			<table id="contentArea" align="center" class="table">
				<tr>
					<th width="100">답변제목</th>
					<td colspan="3">${q.ATitle }</td>
				</tr>
		
				<tr>
					<th>내용</th>
					<td colspan="3"></td>
				</tr>
			
				<tr>
					<td colspan="4"><p style="height: 150px">
							
					
							<br>
							${ q.AContent }
						</p></td>
				</tr>
			</table>
			
			</c:if>
			<div>
			
			 <button class="btn" id="btn3" onclick="location.href='list.qna';">목록으로</button>
			
			</div>
			
			</div>
			</div>
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>