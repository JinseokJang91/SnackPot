<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구독직원 정보 조회</title>
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
        overflow-y: auto;
    }
    #outer{
        margin-top: 30px;
    }
    #title{
    	font-weight: bold;
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
    	margin-top: -20px;
    }
</style>
</head>
<body>
<div class="container-fluid">
<div class="row flex-nowrap">
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>


<div class="container" id="outer">
<h5 id="title">${comName} 사원 조회</h5><br><br><br><br>
<div id="tdiv">
<table class="table table-hover" id="empList">
    <thead>
        <tr>
            <th>&emsp;No.</th>
            <th>&emsp;이름</th>
            <th>&emsp;사원번호</th>
            <th>&emsp;부서</th>
            <th>&emsp;직급</th>
            <th>&emsp;&ensp;휴대폰 번호</th>
            <th>&emsp;&emsp;&emsp;이메일</th>
            <th>&emsp;&emsp;생일</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="emp" varStatus="st">
        <tr>
            <td>${st.index +1}</td>
            <td>${emp.cempName}</td>
            <td>${emp.cempNum}</td>
            <td>${emp.cempDept}</td>
            <td>${emp.cempJob}</td>
            <td>${emp.cempPhone}</td>
            <td>${emp.cempEmail}</td>
            <td>${emp.cempBirth}</td>
        </tr>
     </c:forEach>
    </tbody>
</table>
</div>
</div>


</div>
</div>
</body>
</html>