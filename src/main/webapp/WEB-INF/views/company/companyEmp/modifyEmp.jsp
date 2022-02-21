<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 변경</title>
<!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
	#outer{
        margin-top: 10px;
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
    #checkNumBtn{
    	padding: 5px;
        background-color: rgb(255, 255, 255);
        border-color: rgb(245, 208, 66);
        border-style: solid;
        font-weight: bold;
        color: rgb(10, 23, 78);
    }
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
<div class="container" id="outer">

<h5 id="title">사원 관리</h5><br>
<form id="modifyEmpForm" action="updateEmp.em">
<div id="outline">
<div id="content">
<label>사원번호</label>&emsp;&emsp;&emsp;<input type="text" name="cempNum" value="${cemp.cempNum }" readonly><br><br>
<label>사원이름</label>&emsp;&emsp;&emsp;<input type="text" name="cempName" value="${cemp.cempName }"><br><br>
<label class="l1">부서</label>&emsp;&emsp;&emsp;<input class="i1" type="text" name="cempDept" value="${cemp.cempDept }"><br><br>
<label class="l1">직급</label>&emsp;&emsp;&emsp;<input class="i1" type="text" name="cempJob" value="${cemp.cempJob }"><br><br>
&emsp;<label class="l1">휴대폰번호</label>&emsp;<input type="tel" class="input" name="cempPhone"  maxlength="11" value="${cemp.cempPhone }"><br><br>
<label class="l2">이메일</label>&emsp;&emsp;&emsp;<input class="i2" type="email" name="cempEmail" value="${cemp.cempEmail }"><br><br>
<label>생일</label>&emsp;&emsp;&emsp;&emsp;&emsp;<input type="text" name="birth" value="${cemp.birth }" placeholder="숫자 8자리"><br>
<div id="btnDiv">
<input class="eBtn" id="cancel" type="button" value="취소" onclick="location='<%=request.getContextPath()%>/empManage.em'">&emsp;&emsp;&emsp;
<input class="eBtn" id="enter" type="button" value="수정" onclick="modify();">
</div>
</div>
</div>
</form>

</div>


<script>
function modify(){
	var cempNum = $("input[name='cempNum']");
	var cempName = $("input[name='cempName']");
	var cempDept = $("input[name='cempDept']");
	var cempJob = $("input[name='cempJob']");
	var cempPhone = $("input[name='cempPhone']");
	var cempEmail = $("input[name='cempEmail']");
	var birth = $("input[name='birth']");
	var b = $("input[name='birth']").val();
	if(cempNum.val().trim() == ""){
		alert("사원번호를 입력하세요");
		return false;
	}else if(cempName.val().trim() == ""){
		alert("사원이름을 입력하세요");
		return false;
	}else if(cempDept.val().trim() == ""){
		alert("부서를 입력하세요");
		return false;
	}else if(cempJob.val().trim() == ""){
		alert("직급을 입력하세요");
		return false;
	}else if(cempPhone.val().trim() == ""){
		alert("휴대폰번호를 입력하세요");
		return false;
	}else if(cempEmail.val().trim() == ""){
		alert("이메일을 입력하세요");
		return false;
	}else if(birth.val().trim() == ""){
		alert("생일을 입력하세요");
		return false;
	}else if(b.length>8 || b.length<8){
		alert("생일을 8자리로 입력해주세요");
		return false;
	}else{
		$("#modifyEmpForm").submit();
		return true;
	}
	
}

</script>
</body>
</html>