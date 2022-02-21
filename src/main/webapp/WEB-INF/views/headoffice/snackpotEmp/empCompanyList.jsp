<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>담당 거래처 관리</title>
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
    #search{
    	width: 25px;
    	border: none;
    	background: none;
    }
    #icon{
   		width: 25px;
    }
    #searchdiv{
    	margin-left: 880px;
    	margin-bottom: 30px;
    }
    #enrollBtn{
    	margin-left: 1010px;
    	padding: 10px;
    	border: none;
    	background-color: rgb(94, 94, 94);
    	color: white;
    	border-radius: 5px;
    	margin-top: 10px;
    }
    #title{
    	font-weight: bold;
    }
    .modifyBtn{
    	width: 60px;
    	height: 30px;
    	border: none;
    	background-color: rgb(94, 94, 94);
    	color: white;
    	border-radius: 5px;
    }
    .deleteBtn{
    	width: 60px;
    	height: 30px;
    	border: none;
    	background-color: rgb(94, 94, 94);
    	color: white;
    	border-radius: 5px;
    }
    #bth{
    	width: 120px;
    }
    #comth{
    	width: 500px;
    }
</style>
</head>
<body>
<div class="container-fluid">
<div class="row flex-nowrap">
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>

<div class="container" id="outer">
<h5 id="title">담당 거래처 관리</h5><br>
<div id="tdiv">
<table class="table table-hover" id="empList">
    <thead>
        <tr>
            <th>No.</th>
            <th>이름</th>
            <th>사원번호</th>
            <th id="comth">담당거래처</th>
            <th id="bth"></th>
        </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="emp" varStatus="st">
        <tr>
            <td>${st.index +1}</td>
            <td>${emp.sempName}</td>
            <td>${emp.sempNum}</td>
            <td>${emp.sempComCode}</td>
            <td><input type="button" class="modifyBtn" value="수정"></td>
        </tr>
     </c:forEach>
    </tbody>
</table>
</div>
</div>
</div>
</div>
<script>
//클릭한 행의 사원번호 가져오기
$(".modifyBtn").click(function(){ 
      
      var modifyBtn = $(this);
       
      var tr = modifyBtn.parent().parent();
      var td = tr.children();
       
      var sempNum = td.eq(2).text();
      var sempComName = td.eq(3).text();
      
      $.ajax({
  		url: "modifyCom.sn",
  		type:"post",
  		data:{
  			sempNum : sempNum,
  			sempComName : sempComName
  			},
  		success:function(result){
  			if(result == "ok"){
  				location.href="<%=request.getContextPath()%>/modifyCompany.sn"
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