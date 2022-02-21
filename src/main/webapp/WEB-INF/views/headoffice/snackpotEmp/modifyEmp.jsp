<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 계정 변경</title>
<!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
	#outer{
        margin-top: 30px;
    }
    #title{
    	font-weight: bold;
    }
    #outline{
        text-align: center;
    }
    #content{
        display: inline-block;
        margin-top: 50px;
    }
    label{
    	margin-left: -120px;
    }
    input{
    	width: 280px;
    	height: 40px;
    	margin-bottom: 20px;
    }
    .i1{
    	position: relative;
    	left: 16px;
    }
    .i2{
    	position: relative;
    	left: 8px;
    }
    .l1{
    	position: relative;
    	left: -16px;
    }
    .l2{
    	position: relative;
    	left: -8px;
    }
    .eBtn{
    	width: 100px;
    	padding: 10px;
    	border: none;
    	border-radius: 5px;
    }
    #btnDiv{
    	margin-left: -100px;
    	margin-top: 50px;
    }
    #cancel{
   	 	background-color: rgb(224, 224, 224);
    	color: dark;
    }
    #enter{
    	background-color: rgb(94, 94, 94);
    	color: white;
    }
</style>
</head>
<body>
<div class="container-fluid">
<div class="row flex-nowrap">
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>


<div class="container" id="outer">

<h5 id="title">사원 계정 변경</h5><br>
<form id="modifyEmpForm" action="updateEmp.sn">
<div id="outline">
<div id="content">
<label>사원번호</label>&emsp;&emsp;&emsp;<input type="text" name="sempNum" value="${semp.sempNum }" readonly><br>
<label>사원이름</label>&emsp;&emsp;&emsp;<input type="text" name="sempName" value="${semp.sempName }"><br>
<label class="l1">부서</label>&emsp;&emsp;&emsp;<input class="i1" type="text" name="sempDept" value="${semp.sempDept }"><br>
<label class="l1">직급</label>&emsp;&emsp;&emsp;<input class="i1" type="text" name="sempJob" value="${semp.sempJob }"><br>
<label class="l2">이메일</label>&emsp;&emsp;&emsp;<input class="i2" type="email" name="sempEmail" value="${semp.sempEmail }"><br>
<div id="btnDiv">
<input class="eBtn" id="cancel" type="button" value="취소" onclick="location='<%=request.getContextPath()%>/empList.sn'">&emsp;&emsp;&emsp;
<input class="eBtn" id="enter" type="button" value="수정" onclick="modify();">
</div>
</div>
</div>
</form>

</div>


</div>
</div>
<script>
function modify(){
	var sempName = $("input[name='sempName']");
	var sempDept = $("input[name='sempDept']");
	var sempJob = $("input[name='sempJob']");
	var sempEmail = $("input[name='sempEmail']");
	if(sempName.val().trim() == ""){
		alert("사원이름을 입력하세요");
		return false;
	}else if(sempDept.val().trim() == ""){
		alert("부서를 입력하세요");
		return false;
	}else if(sempJob.val().trim() == ""){
		alert("직급을 입력하세요");
		return false;
	}else if(sempEmail.val().trim() == ""){
		alert("이메일을 입력하세요");
		return false;
	}else{
		$("#modifyEmpForm").submit();
		return true;
	}
	
}

</script>
</body>
</html>