<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 계정 등록</title>
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

<h5 id="title">사원 계정 등록</h5><br>
<form id="insertEmpForm" action="insertEmp.sn">
<div id="outline">
<div id="content">&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;&ensp;
<label>사원번호</label>&emsp;&emsp;&emsp;<input type="text" name="sempNum" id="sempNum" placeholder="내용을 입력해주세요." onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">&emsp;
<button type="button" id="checkNumBtn" onclick="checkNum();">중복확인</button><br>
<label>사원이름</label>&emsp;&emsp;&emsp;<input type="text" name="sempName" placeholder="내용을 입력해주세요."><br>
<label class="l1">부서</label>&emsp;&emsp;&emsp;<input class="i1" type="text" name="sempDept" placeholder="내용을 입력해주세요."><br>
<label class="l1">직급</label>&emsp;&emsp;&emsp;<input class="i1" type="text" name="sempJob" placeholder="내용을 입력해주세요."><br>
<label class="l2">이메일</label>&emsp;&emsp;&emsp;<input class="i2" type="email" name="sempEmail" placeholder="내용을 입력해주세요."><br>
<label>비밀번호</label>&emsp;&emsp;&emsp;<input type="text" name="sempPw" value="0000"><br>
<div id="btnDiv">
<input class="eBtn" id="cancel" type="button" value="취소" onclick="location='<%=request.getContextPath()%>/empList.sn'">&emsp;&emsp;&emsp;
<input class="eBtn" id="enter" type="button" disabled="disabled" value="등록" onclick="enroll();">
</div>
</div>
</div>
</form>

</div>


</div>
</div>
<script>

//사원번호 
$("#sempNum").keyup(function(event){
    var inputVal = $(this).val();
    $(this).val(inputVal.replace(/[^0-9]/g,''));
});

function enroll(){
	var sempNum = $("input[name='sempNum']");
	var sempName = $("input[name='sempName']");
	var sempDept = $("input[name='sempDept']");
	var sempJob = $("input[name='sempJob']");
	var sempEmail = $("input[name='sempEmail']");
	var sempPw = $("input[name='sempPw']");
	if(sempNum.val().trim() == ""){
		alert("사원번호를 입력하세요");
		return false;
	}else if(sempName.val().trim() == ""){
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
	}else if(sempPw.val().trim() == ""){
		alert("비밀번호를 입력하세요");
		return false;
	}else if(sempPw.val().length<4){
		alert("비밀번호는 4자리 이상 입력해주세요");
		return false;
	}else{
		$("#insertEmpForm").submit();
		return true;
	}
	
}

//사원번호 중복체크
function checkNum(){
	var sempNum = $("#insertEmpForm input[name=sempNum]");
	if(sempNum.val()==""){
		alert("사원번호를 입력하세요");
		return false;
	}
	$.ajax({
		url: "checkNum.sn",
		type:"post",
		data:{sempNum : sempNum.val()},
		success:function(result){
			if(result > 0){
				alert("이미 존재하는 사원입니다.");
				sempNum.focus();
			}else{
				if(confirm("사용가능한 번호입니다. 등록하시겠습니까?")){
					sempNum.attr("readonly","true");
					$("#enter").removeAttr("disabled");
				}else{
					sempNum.focus();
				}
			}
		},
		error:function(){
			console.log("서버통신실패");
		}
	})
}
</script>
</body>
</html>