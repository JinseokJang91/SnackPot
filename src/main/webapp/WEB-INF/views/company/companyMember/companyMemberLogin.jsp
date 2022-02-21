<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구독회사 멤버 로그인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 <link rel="stylesheet" href="resources/css/companyMemberLogin.css?after">
</head>
<body>
  <jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
        <div id="outer">
            <div id="inner">
            	<form id="loginForm" action="loginMember.co" method="POST">
                <h1 id="title">LOGIN</h1><br>
                <input type="text" class="input" id="memId" name="memId" placeholder=" 아이디" minlength="4" maxlength="16"><br>
                <input type="password" class="input" id="memPw" name="memPw" placeholder=" 비밀번호" minlength="8" maxlength="16" autocomplete="new-password"><br>
                <div id="find"><a href="findId.co">아이디 찾기</a><label>&nbsp | &nbsp</label><a href="findPw.co">비밀번호 찾기</a><br><br></div>
                <button type="button" id="loginBtn" onclick="login();">로그인</button><br>
                </form>
                <button type="button" id="enrollBtn" onclick="location='<%=request.getContextPath()%>/enrollForm.co'">회원가입</button>
            </div>
        </div>
    
</body>
<script>
function login(){
	var memId = $("input[name='memId']");
	var memPw = $("input[name='memPw']");
	if(memId.val().trim() == ""){
		alert("아이디를 입력하세요");
		return false;
	}else if(memPw.val().trim() == ""){
		alert("비밀번호를 입력하세요");
		return false;
	}else{
		$("#loginForm").submit();
		return true;
	}
	
}
</script>
</html>