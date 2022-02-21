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
    .hidden{display:none; visibility: collapse;}
    
     #addBtn{
 
        float: right;
        color: #F5D042;
        background-color: #0A174E;
        
        
        
       
 }
 
 .my.pagination > .active > a, 
.my.pagination > .active > span, 
.my.pagination > .active > a:hover, 
.my.pagination > .active > span:hover, 
.my.pagination > .active > a:focus, 
.my.pagination > .active > span:focus {
  background: red;
  border-color: red;
}
</style>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>

</head>
<body>
	 

    <jsp:include page="../common/menubar.jsp"/>

    <div class="content">
        <br><br>
        <div class="innerOuter" style="padding:5% 10%;">
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
                    <th class="hidden"></th>
                  </tr>
                </thead>
                <tbody>
                	<c:forEach items="${list}" var="q">
	                    <tr>
	                        <td>${ q.QNo }</td>
	                        <td>${ q.QTitle }</td>
	                        <td>${ q.name }</td>
	                        <td>${ q.viewDate }</td>
	             			<td>
	             			 <c:if test="${not empty q.ATitle}">
	                        답변완료
	                        </c:if>
	             			</td>
	             			<td class="hidden">${q.writer}</td>
	                    </tr>
                    </c:forEach>
                </tbody>
            </table>
            <br>

            <div id="pagingArea">
                <ul class="pagination my">
                	<c:choose>
                		<c:when test="${ pi.currentPage ne 1 }">
                			<li class="page-item"><a class="page-link" href="list.qna?currentPage=${ pi.currentPage-1 }">이전</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="">이전</a></li>
                		</c:otherwise>
                	</c:choose>
                	
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<c:choose>
	                		<c:when test="${ pi.currentPage ne p }">
                    			<li class="page-item"><a class="page-link" href="list.qna?currentPage=${ p }">${ p }</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
	                		</c:otherwise>
	                	</c:choose>
                    </c:forEach>
                    
                    
                    <c:choose>
                		<c:when test="${ pi.currentPage ne pi.maxPage }">
                			<li class="page-item"><a class="page-link" href="list.qna?currentPage=${ pi.currentPage+1 }">다음</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="list.qna?currentPage=${ pi.currentPage+1 }">다음</a></li>
                		</c:otherwise>
                	</c:choose>
                </ul>
            </div>
            
            <br>
            <c:if test="${ !empty loginUser }">
            	<a class="btn" style="float:right" href="enrollForm.qna" id="addBtn">글쓰기</a>
            </c:if>
           
            <br clear="both"><br>
            
			
            <br><br>
        </div>
        <br><br>
    </div>
    
    <c:if test="${ !empty loginUser }">
    
    
    <script>
    
	//var writer = $("#boardList tbody tr").children().eq(5).text();
	var loginUser = '${loginUser.getMemId()}';
	console.log("로그인 유저 " + loginUser);
	
     
    	$(function(){
    		
    		$("#boardList tbody tr").click(function(){
    			var writer = $(this).children().eq(5).text();
    			console.log("작성자 : " + writer);
    			if(writer == loginUser){
    			console.log($(this).children().eq(0).text());
    			location.href="detail.qna?qno=" + $(this).children().eq(0).text();
    		}
    		});
    	});
    </script>
    
    
    
    </c:if>
    
     

    <jsp:include page="../common/footer.jsp"/>
</body>
</html>