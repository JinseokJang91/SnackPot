<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>snackPotCommunity</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
</head>
<style>
.top-img{
   margin-left: 130px;
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
  	margin-left: 130px;

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
    height: 45px;
    width: 90px;
    border-radius: 10px;
}

</style>
<body>
<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	<div class="content" style="padding-left: 3%; padding-right: 3%;">
		
		<div class="top-img">
			<label><h4>[ ${loginUser.comName} ]</h4></label>
		</div>
		<!--인기글-->
		<div class="hotBoard">
			<i class="fas fa-fire-alt"></i> <label><h5>인기 게시글</h5></label>
		</div>

		<!--인기글 table-->
		<table class="table table-borderless" id="cmnt" style=" margin: auto;">
			<thead>
				<tr style="text-align: center;">
					<th >No.</th>
					<th>제목</th>
					<th>조회수</th>
					<th>추천수</th>
				</tr>
			</thead>
			<tbody id="topBoardBody">
				<td colspan="5"  style="text-align: center; ">
				    <div style="height: 100px; text-align: center; padding-top: 30px;" ><h4>인기게시글이 없습니다.</h4></div>
                </td>
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
		<table class="table" id="cmnt" style=" margin: auto;">
			<thead>
				<tr style="text-align: center;">
					<th>No.</th>
					<th>제목</th>
					<th>작성일</th>
					<th>추천</th>
					<th>조회</th>
				</tr>
			</thead>
			<tbody id="myTable">
				<tr>
					<td colspan="5"><div style="height: 150px; text-align: center; padding-top: 70px;" ><h3>게시글을 등록해주세요.</h3></div></td>
				</tr>
			</tbody>
		</table>
        <hr>
		<div class="board-Btn">
			<button class="writerBtn" onclick="writer()">글쓰기</button>
		</div>
		
            <br clear="both"><br>
	</div>
</div>
</body>
<script>	
    	function writer(){
    		location.href="enrollForm.cm";
    	}
  	
</script>
</html>