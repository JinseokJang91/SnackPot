<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>구독회사 멤버 비밀번호 변경</title>
<style>
        #outer{
            text-align: center;
        }
        #inner{
            display: inline-block;
        }
        #title{
            color: rgb(245, 208, 66);
        }
        .input{
            background-color: rgb(246, 242, 225);
            border: none;
            width: 300px;
            height: 40px;
            margin: 10px;
        }
        #modifyBtn{
            background-color: rgb(10, 23, 78);
            border: none;
            width: 300px;
            height: 60px;
            margin: 10px;
            color: rgb(245, 208, 66);
            font-size: 15px;
            font-weight: bold;
        }
        #exitBtn{
            background-color: rgb(255, 255, 255);
            border-color: rgb(245, 208, 66);
            border-style: solid;
            width: 300px;
            height: 58px;
            margin: 10px;
            font-size: 15px;
            font-weight: bold;
        }

    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>

        <div id="outer">
            <div id="inner"> 
            <form id="modifyPwForm" action="updatePw.co" method="POST">
                <h1 id="title">MODIFY</h1><br>
                <input type="password" class="input" id="originPw" name="originPw" placeholder=" 현재 비밀번호" minlength="10" maxlength="16"><br>
                <input type="password" class="input" id="memPw" name="memPw" placeholder=" 새 비밀번호 (영문, 숫자 조합 8~16자)" minlength="8" maxlength="16"><br>
                <input type="password" class="input" id="memPwCheck" name="memPwCheck" placeholder=" 새 비밀번호 확인" minlength="8" maxlength="16" autocomplete="new-password"><br>
                <button type="button" id="modifyBtn" onclick="updatePw();">비밀번호 변경하기</button><br>
             </form>
             <button type="button" id="exitBtn" onclick="location='<%=request.getContextPath()%>/main.co'">다음에 변경하기</button>
            </div>
        </div>
<script>

//비밀번호 
$("input[name='originPw']").keyup(function(event){
    var inputVal = $(this).val();
    $(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
});

//비밀번호 
$("input[name='memPw']").keyup(function(event){
    var inputVal = $(this).val();
    $(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
});

//비밀번호 확인
$("input[name='memPwCheck']").keyup(function(event){
    var inputVal = $(this).val();
    $(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
});

//유효성 체크
function updatePw(){
	var originPw = $("input[name='originPw']");
	var memPw = $("input[name='memPw']");
	var memPwCheck = $("input[name='memPwCheck']");
	var pw = $("input[name='memPw']").val();
	if(originPw.val().trim() == "" || memPw.val().trim() == "" || memPwCheck.val().trim() == ""){
		alert("비밀번호를 입력하세요");
		return false;
	}else if(memPw.val() != memPwCheck.val()){
		alert("비밀번호가 다릅니다");
		memPwCheck.val('');
		memPwCheck.focus();
		return false;
	}else if(pw.length<8 || pw.length>16){
		alert("비밀번호는 8자에서 16자 이내로 입력해주세요");
		return false;
	}else{
		$("#modifyPwForm").submit();
		return true;
	}
	
}
</script>
</body>
</html>