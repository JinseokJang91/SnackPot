<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>SnackPot</title>
			 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">  <!--스타일 cdn?-->
            <!-- jQuery library -->
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> <!--jQuery연결하는 CDN-->
            <!-- Popper JS -->
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
            <!-- Latest compiled JavaScript -->
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
    </head>
<style>
/*메뉴바 아래 드롭다운 메뉴바(스낵류 , 음료 , 간편식) */
.dropdown:hover .wish-menu { 
   display: block;
   margin-top: 0;
   margin-left: 150px;
}
.wish-nav-link {
  color: black;
  font-size: 15px;
  font-weight: bolder;
}
.wish-navbar{
  justify-content: center;
}
/*스낵류 ,음료 , 간편식 드롭다운 메뉴바*/
.nav-item.dropdown.snack>label{
	margin-left: 190px;	
}
/*스낵류 ,음료 , 간편식 드롭다운 메뉴바 색*/
.nav-item.dropdown.snack>label>.wish-nav-link{
	color : black;
}
/*스낵류 ,음료 , 간편식 드롭다운 메뉴바 마우스 오버*/
.nav-item.dropdown.snack>label>.wish-nav-link:hover{
	color :rgb(245, 208, 66);
}
/*상세보기 메뉴바 (상위 카테고리 안의 하위 카테고리)*/
.detail-menu{
  text-align: center;
}
.dropdown-menu.wish-menu>.dropdown-item:hover{
	background-color: rgb(245, 208, 66);
	
}
.btn-group> .btn-outline{
border-color : lightgray;
padding : 5px 70px;
}
.btn-outline:hover{
background-color: rgb(245, 208, 66);
}

/*간식리스트 card*/
.row{
padding: 20px 60px;
}
.col{
	padding: 4px;

}
.card{
border: none;
position: relative;
}
.prodContain{
	padding: 0 3% 0 3%;
}

/*간식 이미지*/
.card-img-top{
width: 50px;
height: 185px;
padding-left : 20px;
padding-right : 20px;
}
.card-img-top:hover{
  opacity: 0.5;
}
.card-body{
height:70px;
margin-bottom : -10px;
}
.card-title{
font-weight: bold;
}
.card-text{
	margin-left:21px;
}

/*간식위시리스트 버튼*/
.wishBtn{
position: absolute;
width: 80px;
height: 75px;
left: 34%;
top: 70px;
text-align: center;
opacity: 0;
transition: opacity .35e ease;
border-radius: 50%;
border-style: none;
background-color: white;

}
.card:hover .wishBtn{
opacity: 1;

}
.blank{
  font-size: 40px;
  color: black;
}
.wishBtn:hover{
  background-color: red;
}
.wishBtn:hover .blank{
  color: white;
}

/*메뉴 랭크*/
.rank li {
float: right;
margin: 20px  0px;
list-style: none;
text-align: center;
}
.rank li > a {
   margin-right: 50px;
}
.justify-content-center{
   margin-left: 30%;
   height: 35px;
}
/*메뉴바 아래 메뉴바*/
.ctg > .dropdown-menu {
  background-color: white;
  
}
.ctg > .dropdown-menu > .dropdown-item {
  color: black;
   
}


</style>
<body>
 <jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
	<!-- 메뉴바 아래  큰 드롭 카테고리-->
 <nav class="navbar navbar-expand-xl bg-light wi " >
  <ul class="navbar-nav mr-auto justify-content-center ">
      <li class="nav-item dropdown snack"> 
      <label><a class="nav-link wish-nav-link" data-toggle="dropdown" href="#" role="button" >스낵류</a></label>
    <label class="ctg">
        <div class="dropdown-menu wish-menu"> 
          <a class="dropdown-item" href="list.pro?dtc=1">스낵</a> 
          <a class="dropdown-item" href="list.pro?dtc=2">파이/비스켓</a> 
          <a class="dropdown-item" href="list.pro?dtc=3">초콜릿</a>
          <a class="dropdown-item" href="list.pro?dtc=4">사탕</a>
          <a class="dropdown-item" href="list.pro?dtc=5">젤리</a>
          <a class="dropdown-item" href="list.pro?dtc=6">껌</a>
          <a class="dropdown-item" href="list.pro?dtc=7">시리얼바</a>
      </div>
  </label>  
    </li>
    <li class="nav-item dropdown snack"> <!-- 큰카테고리 : 2 -->
     <label><a class="nav-link wish-nav-link" data-toggle="dropdown" href="#" role="button" >음료</a></label>
  <label class="ctg">
      <div class="dropdown-menu wish-menu "> 
          <a class="dropdown-item" href="list.drink?dtc=8">탄산음료</a> 
          <a class="dropdown-item" href="list.drink?dtc=9">이온음료</a> 
          <a class="dropdown-item" href="list.drink?dtc=10">과일음료수</a>
          <a class="dropdown-item" href="list.drink?dtc=11">에너지음료</a>
          <a class="dropdown-item" href="list.drink?dtc=12">유산균</a>
          <a class="dropdown-item" href="list.drink?dtc=13">커피</a>
      </div>
  </label>
    </li>
    <li class="nav-item dropdown snack">  <!-- 큰카테고리 : 3 -->
      <label><a class="nav-link wish-nav-link" data-toggle="dropdown" href="#" role="button" >간편식</a></label>
  <label class="ctg">
      <div class="dropdown-menu wish-menu"> 
          <a class="dropdown-item" href="list.food?dtc=14">컵라면</a> 
          <a class="dropdown-item" href="list.food?dtc=15">핫도그/소시지</a> 
          <a class="dropdown-item" href="list.food?dtc=16">계란</a>
          <a class="dropdown-item" href="list.food?dtc=17">시리얼</a>
          <a class="dropdown-item" href="list.food?dtc=18">컵밥</a>
      </div>
  </label>
    </li>
  </ul>
</nav>
<br>
<br>
 <!-- 세부 카테고리 버튼 -->
    <!-- 스낵 -->
    <c:if test="${ctdNo eq '1'}">
      <div class="detail-menu">
        <div class="btn-group">
          <button type="button" class="btn btn-outline" onclick ="location.href='list.pro?dtc=1'">스낵</button>
          <button type="button" class="btn btn-outline" onclick ="location.href='list.pro?dtc=2'">파이/비스켓</button>
          <button type="button" class="btn btn-outline" onclick ="location.href='list.pro?dtc=3'">초콜릿</button>
          <button type="button" class="btn btn-outline" onclick ="location.href='list.pro?dtc=4'">사탕</button>
          <button type="button" class="btn btn-outline" onclick ="location.href='list.pro?dtc=5'">젤리</button>
          <button type="button" class="btn btn-outline" onclick ="location.href='list.pro?dtc=6'">껌</button>
          <button type="button" class="btn btn-outline" onclick ="location.href='list.pro?dtc=7'">시리얼바</button>
        </div>
      </div>
    </c:if>
    
      <!-- 음료 -->
      <c:if test="${ctdNo eq '2'}">
      <div class="detail-menu">
        <div class="btn-group">
          <button type="button" class="btn btn-outline" onclick ="location.href='list.drink?dtc=8'">탄산음료</button>
          <button type="button" class="btn btn-outline" onclick ="location.href='list.drink?dtc=9'">이온음료</button>
          <button type="button" class="btn btn-outline" onclick ="location.href='list.drink?dtc=10'">과일음료</button>
          <button type="button" class="btn btn-outline" onclick ="location.href='list.drink?dtc=11'">에너지음료</button>
          <button type="button" class="btn btn-outline" onclick ="location.href='list.drink?dtc=12'">유산균음료</button>
          <button type="button" class="btn btn-outline" onclick ="location.href='list.drink?dtc=13'">커피</button>
        </div>
      </div>
      </c:if>
      
      <!-- 간편식 -->
      <c:if test="${ctdNo eq '3'}">
      <div class="detail-menu">
        <div class="btn-group">
          <button type="button" class="btn btn-outline" onclick ="location.href='list.food?dtc=14'">컵라면</button>
          <button type="button" class="btn btn-outline" onclick ="location.href='list.food?dtc=15'">핫도그/소시지</button>
          <button type="button" class="btn btn-outline" onclick ="location.href='list.food?dtc=16'">계란</button>
          <button type="button" class="btn btn-outline" onclick ="location.href='list.food?dtc=17'">시리얼</button>
          <button type="button" class="btn btn-outline" onclick ="location.href='list.food?dtc=18'">컵밥</button>
        </div>
      </div>
      </c:if>
   
      <!-- 랭킹순위
     <ul class="rank">
        <li><a>판매인기순</a></li>
        <li><a>높은가격순</a></li>
        <li><a>낮은가격순</a></li>
      </ul>
       -->
  <br><br>
 <!-- 상품정렬 -->
 <div class="prodContain" >
  <div class="row row-cols-xl-5">
   <c:forEach items="${list}" var="p">
      <div class="col">
        <div class="card border-0">
          <img class="card-img-top" src="${ pageContext.servletContext.contextPath }/resources/images/${p.changeName}">
          <div class="card-body">
            <P class="card-title">${p.snackName }</P>
          </div>
           <p class="card-text">${p.releasePrice}원</p>
           <span class="wishButton">
  			    <!--<button class="wishBtn" value="${p.snackNo}" onclick="wishAdd(this.value)">위시</button>--> 
           <button class="wishBtn" value="${p.snackNo}" onclick="wishAdd(this.value)"><i class="blank far fa-heart"></i></button>     
          </span>
        </div>
      </div>
      </c:forEach>
  </div>
</div>
</body>
<script type="text/javascript">
 function wishAdd(val){
   var wishSnackNo = val;
    console.log(wishSnackNo)
   //간식번호를 보내서 wishlist에 저장하기
   $.ajax({
     url : "insert.wish",
     data : {
       wishSnackNo : wishSnackNo
     },
     type : "post",
     success : alert('위시리스트에  담았습니다.')
   })
 } 	
</script>
</html>
  