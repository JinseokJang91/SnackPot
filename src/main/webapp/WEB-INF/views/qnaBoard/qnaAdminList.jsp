<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판</title>
<style>
	#boardList{text-align: center;}
    #boardList>tbody>tr:hover{cursor:pointer;}
    
    

    #pagingArea{width:fit-content;margin:auto;}
    /* #pagingArea a{color:black} */
    
   
    #searchForm{
        width:80%;
        margin:auto;
    }
    #searchForm>*{
        float:left;
        margin:5px;
    }
    .select{width:20%;}
    .text{width:53%;}
    .searchBtn{Width:20%;}
    
     .content{
            height: 100vh;
            padding: 50px 0px;
            margin-left: auto;
            margin-right: auto;
            overflow-y: auto;
        }
        
</style>
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

</head>
<body>
	 
<div class="container-fluid">
		<div class="row flex-nowrap">

	<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />

    <div class="content col-8">
        <br><br>
        <div class="innerOuter" >
            <h2>문의게시판</h2>
            <br>
            
            <br>
            <table id="boardList" class="table table-hover" align="center">
                <thead>
                  <tr>
                    <th>글번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일자</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                	<c:forEach items="${list}" var="q">
	                    <tr>
	                        <td>${ q.QNo }</td>
	                        <td>${ q.QTitle }</td>
	                        <td>${ q.name }</td>
	                        <td>${ q.viewDate }
	                        </td>
	                        <td>
	             			 <c:if test="${not empty q.ATitle}">
	                        답변완료
	                        </c:if>
	             			</td>
	             
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            <br>

            <div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${ pi.currentPage ne 1 }">
                			<li class="page-item"><a class="page-link" href="adminList.qna?currentPage=${ pi.currentPage-1 }">Previous</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<c:choose>
	                		<c:when test="${ pi.currentPage ne p }">
                    			<li class="page-item"><a class="page-link" href="adminList.qna?currentPage=${ p }">${ p }</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
	                		</c:otherwise>
	                	</c:choose>
                    </c:forEach>
                    
                    
                    <c:choose>
                		<c:when test="${ pi.currentPage ne pi.maxPage }">
                			<li class="page-item"><a class="page-link" href="adminList.qna?currentPage=${ pi.currentPage+1 }">Next</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="adminList.qna?currentPage=${ pi.currentPage+1 }">Next</a></li>
                		</c:otherwise>
                	</c:choose>
                </ul>
            </div>
            
            <br>
    
           
            <br clear="both"><br>
            
			
            <br><br>
        </div>
        <br><br>
    </div>
    
     <script>
    	$(function(){
    		$("#boardList tbody tr").click(function(){
    			console.log($(this).children().eq(0).text());
    			location.href="answerForm.qna?qno=" + $(this).children().eq(0).text();
    		});
    	});
    </script>
</div>
	</div>

    
</body>
</html>