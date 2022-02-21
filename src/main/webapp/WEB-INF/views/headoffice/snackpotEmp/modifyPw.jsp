<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 비밀번호 변경</title>
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
    #l1{
    	position: relative;
    	left: -17px;
    }
    #i1{
    	position: relative;
    	left: -10px;
    }
    #l2{
    	position: relative;
    	left: 9px;
    }
    #i2{
    	position: relative;
    	left: -7px;
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
<div class="container-fluid">
<div class="row flex-nowrap">
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>


<div class="container" id="outer">

<h5 id="title">사원 비밀번호 변경</h5><br>
<form id="modifyPwForm" action="updatePw.sn">
<div id="outline">
<div id="content">
<label>현재 비밀번호</label>&emsp;&emsp;&emsp;<input id="i2" type="password" name="originPw" placeholder="내용을 입력해주세요."><br>
<label id="l2">새 비밀번호</label>&emsp;&emsp;&emsp;<input type="password" name="sempPw" placeholder="내용을 입력해주세요."><br>
<label id="l1">새 비밀번호 확인</label>&emsp;&emsp;<input id="i1" type="password" name="sempPwCheck" placeholder="내용을 입력해주세요." autocomplete="new-password"><br>
<div id="btnDiv">
<input class="eBtn" id="cancel" type="button" value="취소" onclick="location='<%=request.getContextPath()%>/mainPage.ho'">&emsp;&emsp;&emsp;
<input class="eBtn" id="enter" type="button"  value="변경" onclick="modify();">
</div>
</div>
</div>
</form>

</div>


</div>
</div>
<script>

//비밀번호 
$("input[name='originPw']").keyup(function(event){
    var inputVal = $(this).val();
    $(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
});

//비밀번호 
$("input[name='sempPw']").keyup(function(event){
    var inputVal = $(this).val();
    $(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
});

//비밀번호 확인
$("input[name='sempPwCheck']").keyup(function(event){
    var inputVal = $(this).val();
    $(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
});

function modify(){
	
	var originPw = $("input[name='originPw']");
	var sempPw = $("input[name='sempPw']");
	var sempPwCheck = $("input[name='sempPwCheck']");
	var pw = $("input[name='sempPw']").val();
	if(originPw.val().trim() == "" || sempPw.val().trim() == "" || sempPwCheck.val().trim() == ""){
		alert("비밀번호를 입력하세요");
		return false;
	}else if(sempPw.val() != sempPwCheck.val()){
		alert("비밀번호가 다릅니다");
		memPwCheck.val('');
		memPwCheck.focus();
		return false;
	}else if(pw.length<4){
		alert("비밀번호는 4자리 이상 입력해주세요");
		return false;
	}else{
		$("#modifyPwForm").submit();
		return true;
	}
	
}

</script>
</body>
</html>