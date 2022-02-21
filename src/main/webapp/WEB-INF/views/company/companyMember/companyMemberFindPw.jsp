<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>구독회사 멤버 비밀번호 찾기</title>
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
        #findPwBtn{
            background-color: rgb(10, 23, 78);
            border: none;
            width: 300px;
            height: 60px;
            margin: 10px;
            color: rgb(245, 208, 66);
            font-size: 15px;
            font-weight: bold;
        }

    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
        <div id="outer">
            <div id="inner">
                <h1 id="title">FIND PW</h1><br>
                <input type="text" class="input" id="memId" name="memId" placeholder=" 아이디" minlength="4" maxlength="16"><br>
                <input type="text" class="input" id="memName" name="memName" placeholder=" 이름" maxlength="4"><br>
                <input type="tel" class="input" id="phone" name="memPhone" placeholder=" 휴대폰 번호 (-제외입력)" maxlength="11"><br>
                <button type="button" id="findPwBtn" onclick="findPw();">비밀번호 찾기</button><br>
            </div>
        </div>
</body>
<script>
function findPw(){
	var memId = $("input[name=memId]");
	var memName = $("input[name=memName]");
	var memPhone = $("input[name=memPhone]");
	if(memId.val()==""){
		alert("아이디를 입력해주세요");
		return false;
	}else if(memName.val()==""){
		alert("이름을 입력해주세요");
		return false;
	}else if(memPhone.val()==""){
		alert("휴대폰 번호를 입력해주세요");
		return false;
	}
	$.ajax({
		url: "findMemPw.co",
		type:"post",
		data:{
			memId : memId.val(),
			memName : memName.val(),
			memPhone : memPhone.val()
		},
		success:function(result){
			if(result>0){
				alert("인증에 성공하였습니다.");
				location.href="<%=request.getContextPath()%>/modifyNewPw.co"
			}else{
				alert("인증에 실패하였습니다.");	
			}
		},
		error:function(){
			console.log("서버통신실패");
		}
	})
}
</script>
</html>