<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구독회사 사원등록</title>
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
<form id="insertEmpForm" action="insertEmp.em">
<div id="outline">
<div id="content">&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;&ensp;
<label>사원번호</label>&emsp;&emsp;&emsp;<input type="text" name="cempNum" placeholder="내용을 입력해주세요." onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">&emsp;
<button type="button" id="checkNumBtn" onclick="checkNum();">중복확인</button><br><br>
<label>사원이름</label>&emsp;&emsp;&emsp;<input type="text" name="cempName" placeholder="내용을 입력해주세요."><br><br>
<label class="l1">부서</label>&emsp;&emsp;&emsp;<input class="i1" type="text" name="cempDept" placeholder="내용을 입력해주세요."><br><br>
<label class="l1">직급</label>&emsp;&emsp;&emsp;<input class="i1" type="text" name="cempJob" placeholder="내용을 입력해주세요."><br><br>
&emsp;<label class="l1">휴대폰번호</label>&emsp;<input type="tel" class="input" name="cempPhone" placeholder="'-' 제외" maxlength="11"><br><br>
<label class="l2">이메일</label>&emsp;&emsp;&emsp;<input class="i2" type="email" name="cempEmail" placeholder="내용을 입력해주세요."><br><br>
<label>생일</label>&emsp;&emsp;&emsp;&emsp;&emsp;<input type="text" name="birth" placeholder="숫자 8자리"><br>
<div id="btnDiv">
<input class="eBtn" id="cancel" type="button" value="취소" onclick="location='<%=request.getContextPath()%>/empManage.em'">&emsp;&emsp;&emsp;
<input class="eBtn" id="enter" type="button" disabled="disabled" value="등록" onclick="enroll();">
</div>
</div>
</div>
</form>

</div>
</body>
<script>

function enroll(){
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
		$("#insertEmpForm").submit();
		return true;
	}
	
}

//사원번호 중복체크
function checkNum(){
	var cempNum = $("#insertEmpForm input[name=cempNum]");
	if(cempNum.val()==""){
		alert("사원번호를 입력하세요");
		return false;
	}
	$.ajax({
		url: "checkNum.em",
		type:"post",
		data:{cempNum : cempNum.val()},
		success:function(result){
			if(result > 0){
				alert("이미 존재하는 사원입니다.");
				cempNum.focus();
			}else{
				if(confirm("사용가능한 번호입니다. 등록하시겠습니까?")){
					cempNum.attr("readonly","true");
					$("#enter").removeAttr("disabled");
				}else{
					cempNum.focus();
				}
			}
		},
		error:function(){
			console.log("서버통신실패");
		}
	})
}
</script>
</html>