<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>snackPotCommunity</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
</head>
<style>
.recolor{
  color: red;
}
/*페이지*/
#pagingArea{
  padding-left: 590px;

}
.page-link {
  border-color: white;
  color: rgb(10, 23, 78);
}
.page-link:hover{
  border-color: white;
  color: rgb(245, 208, 66);
  background-color: white;
}
/*홈버튼*/
.CmntBtn{
    background-color: rgb(245, 208, 66);
    color: white;
    border-style: none;
    height: 30px;
    width: 30px;
    border-radius: 7px;
    margin-bottom: 10px;

}
</style>
<body>
<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
<div class="content" style="padding-left: 3%; padding-right: 3%;">
<table class="table" id="cmnt">
			<thead>
				<tr style="text-align: center;">
					<th style="width: 10%">no.</th>
					<th style="width: 50%">제목</th>
					<th style="width: 10%">조회수</th>
					<th style="width: 5.5%">추천수</th>
					<th style="width: 5.8%">비추천수</th>
					<th style="width: 10%">작성일</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${list}" var="c">
				<tr style="text-align: center;">
					<td>${c.communityNo }</td>
					<c:if  test="${ !empty c.originName }">
					<td >${c.title}&nbsp;&nbsp;<label class="recolor">[${c.reCount}]</label>&nbsp;&nbsp;<i class="far fa-image"></i></td>
					</c:if>
					
					<c:if  test="${ empty c.originName }">
					<td>${c.title}&nbsp;&nbsp;<label class="recolor">[${c.reCount}]</label></td>
					</c:if>		
					<td>${c.views }</td>
					<td>${c.recommend }</td>
					<td>${c.n_recommend }</td>
					<td>${c.writerDate }</td>
				</tr>
			</c:forEach>
			</tbody>
			<button class="CmntBtn" onclick="CmntBtn()"><i class="fas fa-home"></i></button>
	</table>
	 <div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${ pi.currentPage ne 1 }">
                			<li class="page-item"><a class="page-link" href="myWriter.cm?currentPage=${ pi.currentPage-1 }"><i class="fas fa-angle-double-left"></i></a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href=""><i class="fas fa-angle-double-left"></i></a></li>
                		</c:otherwise>
                	</c:choose>
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<c:choose>
	                		<c:when test="${ pi.currentPage ne p }">
                    			<li class="page-item"><a class="page-link" href="myWriter.cm?currentPage=${ p }">${ p }</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
	                		</c:otherwise>
	                	</c:choose>
                    </c:forEach>
                    <c:choose>
                		<c:when test="${ pi.currentPage ne pi.maxPage }">
                			<li class="page-item"><a class="page-link" href="myWriter.cm?currentPage=${ pi.currentPage+1 }"><i class="fas fa-angle-double-right"></i></a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="myWriter.cm?currentPage=${ pi.currentPage+1 }"><i class="fas fa-angle-double-right"></i></a></li>
                		</c:otherwise>
                	</c:choose>
                </ul>
            </div>
        <br clear="both"><br>
    </div>
</body>
<script>

    	$(function(){
    		$("#cmnt tbody tr").click(function(){
    			location.href="detail.cm?cno=" + $(this).children().eq(0).text();
    		});
    	});   	
    	
    	function CmntBtn(){
    		location.href="list.cm";
    	}
    	
</script>
</html>