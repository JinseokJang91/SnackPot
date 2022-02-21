<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>구독회사 멤버 아이디 찾기</title>
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
        #findIdBtn{
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
 <form id="findIdForm" method="POST">
        <div id="outer">
            <div id="inner">
                <h1 id="title">FIND ID</h1><br>
                <input type="text" class="input" id="memName" name="memName" placeholder=" 이름" maxlength="4"><br>
                <input type="tel" class="input" id="phone" name="memPhone" placeholder=" 휴대폰 번호 (-제외입력)" maxlength="11"><br>
                <button type="button" id="findIdBtn" onclick="findId();">아이디 찾기</button><br>
            </div>
        </div>
    </form>
    
<script>
	function findId(){
		var memName = $("#findIdForm input[name=memName]");
		var memPhone = $("#findIdForm input[name=memPhone]");
		if(memName.val()==""){
			alert("이름을 입력해주세요");
			return false;
		}else if(memPhone.val()==""){
			alert("휴대폰 번호를 입력해주세요");
			return false;
		}
		$.ajax({
			url: "findIdSelect.co",
			type:"post",
			data:{
				memName : memName.val(),
				memPhone : memPhone.val()
			},
			success:function(id){
				if(id == ""){
					alert("아이디를 찾을 수 없습니다.");
					memName.focus();
				}else{
					alert("회원님의 아이디는 " + id + " 입니다.");	
					document.location.href="login.co";
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