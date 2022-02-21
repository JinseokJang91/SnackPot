<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구독 회사 정보</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<style>
    th{
        text-align: center;
        background-color: lightgray
    }
    td{
        text-align: center;
    }
    #tdiv{
    	height: 500px;
        overflow-y: scroll;
    }
    #outer{
        margin-top: 30px;
    }
    #title{
    	font-weight: bold;
    }
    .subBtn{
    	width: 120px;
    	height: 30px;
    	border: none;
    	background-color: rgb(94, 94, 94);
    	color: white;
    	border-radius: 5px;
    	margin-right: -40px;
    }
    .empBtn{
    	width: 80px;
    	height: 30px;
    	border: none;
    	background-color: rgb(94, 94, 94);
    	color: white;
    	border-radius: 5px;
    }
    #empty{
    	text-align: center;
    	margin-top: 50px;
    }
</style>
</head>
<body>
<div class="container-fluid">
<div class="row flex-nowrap">
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>

<div class="container" id="outer">
<h5 id="title">구독회사 정보</h5><br><br><br><br>


<div id="tdiv">
<table class="table table-hover" id="empList">
    <thead>
        <tr>
            <th>No.</th>
            <th>회사명</th>
            <th>주소</th>
            <th>회사코드</th>
            <th colspan="2"></th>
        </tr>
    </thead>
    <tbody>
    
    <c:forEach items="${list}" var="com" varStatus="st">
        <tr>
            <td>${st.index +1}</td>
            <td>${com.comName}</td>
            <td>${com.comAddress}</td>
            <td>${com.comCode}</td>
            <td><input type="button" class="subBtn" value="구독정보"></td>
            <td><input type="button" class="empBtn" value="사원"></td>
        </tr>
     </c:forEach>
    </tbody>
    
</table>
<c:if test="${empty list }">
    <h5 id="empty">현재 담당 중인 회사가 존재하지 않습니다.</h5>
</c:if>
</div>


</div>
</div>
</div>
<script>
//클릭한 행의 회사코드 가져오기
$(".subBtn").click(function(){ 
      var modifyBtn = $(this);
       
      var tr = modifyBtn.parent().parent();
      var td = tr.children();
      
      var comName = td.eq(1).text();
      var comCode = td.eq(3).text();
      
      $.ajax({
  		url: "searchCompany.sn",
  		type:"post",
  		data:{
  			comCode : comCode,
  			comName : comName
  			},
  		success:function(result){
  			if(result == "ok"){
  				location.href="<%=request.getContextPath()%>/selectCompany.sn"
  			}
  		},
  		error:function(){
  			console.log("서버통신실패");
  		}
  	})
      
});

$(".empBtn").click(function(){ 
	var empBtn = $(this);
    
    var tr = empBtn.parent().parent();
    var td = tr.children();
     
    var comName = td.eq(1).text();
    var comCode = td.eq(3).text();
    
    $.ajax({
		url: "searchEmp.sn",
		type:"post",
		data:{
  			comCode : comCode,
  			comName : comName
  			},
		success:function(result){
			if(result == "ok"){
				location.href="<%=request.getContextPath()%>/selectEmp.sn"
			}
		},
		error:function(){
			console.log("서버통신실패");
		}
	})
});
</script>
</body>
</html>