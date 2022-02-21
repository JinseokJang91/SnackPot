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
.top-img{
    margin-left: 80px;
}
/*검색box 포지션*/
.search-box{
    position: relative;
    margin-bottom: 20px;
    margin-left: 40px;
    text-align: left;

}
/*검색box안에 아이콘을 넣기위한 포지션*/
.search-box i{
    position: absolute;
    left: 210px;
    top: 12px;
    color: rgb(10, 23, 78);
}
#myInput{
	width: 250px;
    display: inline-block;
    border-radius: 20px;
    border: 4px solid rgb(245, 208, 66);
}
/*인기 게시글*/
.fa-fire-alt{
	color: red;
    font-size: 20px;
}
.hotBoard{
    margin-left: 80px;
}
.hotBoard > label > h3{
    font-weight: bold;
    margin-bottom: 20px;
}
#topBoardBody{
    border: 1px solid lightgray;
}
/*글쓰기 , 조회 버튼*/
.writerBtn{
 	 background-color: rgb(10, 23, 78);
    color: white;
    border-style: none;
  	height: 30px;
    width: 90px;
    border-radius: 10px;
}
.readBtn{
    background-color: rgb(245, 208, 66);
    color: white;
    border-style: none;
  	height: 30px;
    width: 90px;
    border-radius: 10px;

}
/*댓글 색깔*/

.recolor{
  color: red;
}
/*페이지*/
#pagingArea{
  padding-left: 590px;

}
.page-link{
  border-color: white;
  color: rgb(10, 23, 78);
}
.page-link:hover{
  border-color: white;
  color: rgb(245, 208, 66);
  background-color: white;
}

</style>
<body>
<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	<div class="container-fluid">
    <div class="content" style="padding-left: 3%; padding-right: 3%;">		
		<div class="top-img">
			<label><h4>[ ${loginUser.comName} ]</h4></label>
		</div>
	
		<!--인기글-->
		<div class="hotBoard">
			<i class="fas fa-fire-alt"></i> <label><h4>인기 게시글</h4></label>
		</div>

		<!--인기글 table-->
		<table class="table table-borderless" id="cmnt">
			<thead>
				<tr style="text-align: center;">
					<th style="width: 10%">no.</th>
					<th style="width: 57%">제목</th>
					<th style="width: 10%">조회수</th>
					<th style="width: 5.5%">추천수</th>
					<th style="width: 10%">비추천수</th>
				</tr>
			</thead>
			<tbody id="topBoardBody">
				<c:forEach items="${topList}" var="t">
				<tr style="text-align: center; ">
					<td>${t.communityNo}</td>
					<td>${t.title}</td>
					<td>${t.views}</td>
					<td>${t.recommend}</td>
					<td>${t.n_recommend}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
		<br>
		<br>

		<!--제목 찾기 부트스트랩(filter)-->
		<form action="search.cm" method="post" id="searchForm"> 
		<div class="search-box">
			<input class="form-control" id="myInput" name="title" type="text" placeholder="제목" >
			<a class="searchBtn"><i class="fas fa-search" onclick="document.getElementById('searchForm').submit();"></i></a>
		</div>
		</form>
		
		<!--커뮤니티 게시판-->
		<table class="table" id="cmnt">
			<thead>
				<tr style="text-align: center; ">
					<th style="width: 10%">no.</th>
					<th style="width: 57%">제목</th>
					<th style="width: 5.5%">추천수</th>
					<th style="width: 5.5%">조회수</th>
					<th style="width: 10%">작성일</th>
				</tr>
			</thead>
			<tbody id="myTable">
			<c:forEach items="${list}" var="c">
		<!-- <c:if test="${c.comCode eq loginUser.comCode }">	</c:if> -->	
				<tr style="text-align: center; ">
					<td>${c.communityNo }</td>
					<c:if  test="${ !empty c.originName }">
					<td >${c.title}&nbsp;&nbsp;<label class="recolor">[${c.reCount}]</label>&nbsp;&nbsp;<i class="far fa-image"></i></td>
					</c:if>
					
					<c:if  test="${ empty c.originName }">
					<td>${c.title}&nbsp;&nbsp;<label class="recolor">[${c.reCount}]</label></td>
					</c:if>		
					<td>${c.recommend }</td>
					<td>${c.views }</td>
					<td>${c.writerDate }</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<br><br>
		<div class="board-Btn">
			<button class="writerBtn" onclick="writer()">글쓰기</button>
			<button class="readBtn" onclick="myWriter()">내글보기</button>
		</div>
		
		 <div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${ pi.currentPage ne 1 }">
                			<li class="page-item"><a class="page-link" href="list.cm?currentPage=${ pi.currentPage-1 }"><i class="fas fa-angle-double-left"></i></a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href=""><i class="fas fa-angle-double-left"></i></a></li>
                		</c:otherwise>
                	</c:choose>
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
                    	<c:choose>
	                		<c:when test="${ pi.currentPage ne p }">
                    			<li class="page-item"><a class="page-link" href="list.cm?currentPage=${ p }">${ p }</a></li>
	                		</c:when>
	                		<c:otherwise>
	                			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
	                		</c:otherwise>
	                	</c:choose>
                    </c:forEach>
                    <c:choose>
                		<c:when test="${ pi.currentPage ne pi.maxPage }">
                			<li class="page-item"><a class="page-link" href="list.cm?currentPage=${ pi.currentPage+1 }"><i class="fas fa-angle-double-right"></i></a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item disabled"><a class="page-link" href="list.cm?currentPage=${ pi.currentPage+1 }"><i class="fas fa-angle-double-right"></i></a></li>
                		</c:otherwise>
                	</c:choose>
                </ul>
            </div>
            <br clear="both"><br>
	</div>
  </div>
</body>
<script>
    	$(function(){
    		$("#cmnt tbody tr").click(function(){
    			location.href="detail.cm?cno=" + $(this).children().eq(0).text();
    		});
    	});
    	
    	function writer(){
    		location.href="enrollForm.cm";
    	}
    	
    	function myWriter(){
    		location.href="myWriter.cm";
    	}
    
    	
</script>

</html>