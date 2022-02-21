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
            margin-top: 130px;
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
		#backBtn{
	            background-color: darkgray;
	            border: none;
	            width: 300px;
	            height: 60px;
	            margin: 10px;
	            color: white;
	            font-size: 15px;
	            font-weight: bold;
	    }
    </style>
</head>
<body>
        <div id="outer">
            <div id="inner">
                <h1 id="title">FIND PW</h1><br>
                <input type="text" class="input" id="sempNum" name="sempNum" placeholder=" 사원번호" maxlength="8"><br>
                <input type="text" class="input" id="sempName" name="sempName" placeholder=" 이름" maxlength="4"><br>
                <input type="text" class="input" id="sempEmail" name="sempEmail" placeholder=" 이메일"><br>
                <button type="button" id="findPwBtn" onclick="findPw();">비밀번호 찾기</button><br>
                <button type="button" id="backBtn" onclick="location='<%=request.getContextPath()%>/login.sn'">취소</button>
            </div>
        </div>
</body>
<script>

//사원번호 
$("#sempNum").keyup(function(event){
    var inputVal = $(this).val();
    $(this).val(inputVal.replace(/[^0-9]/g,''));
});

function findPw(){
	var sempNum = $("input[name=sempNum]");
	var sempName = $("input[name=sempName]");
	var sempEmail = $("input[name=sempEmail]");
	if(sempNum.val()==""){
		alert("사원번호를 입력해주세요");
		return false;
	}else if(sempName.val()==""){
		alert("이름을 입력해주세요");
		return false;
	}else if(sempEmail.val()==""){
		alert("이메일을 입력해주세요");
		return false;
	}
	$.ajax({
		url: "findPwSelect.sn",
		type:"post",
		data:{
			sempNum : sempNum.val(),
			sempName : sempName.val(),
			sempEmail : sempEmail.val()
		},
		success:function(result){
			if(result>0){
				alert("인증에 성공하였습니다.");
				location.href="<%=request.getContextPath()%>/modifyNewPw.sn"
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