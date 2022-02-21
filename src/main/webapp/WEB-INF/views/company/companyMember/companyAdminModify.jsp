<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>구독회사 관리자 정보변경</title>
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
        #btn{
            background-color: rgb(10, 23, 78);
            border: none;
            width: 300px;
            height: 60px;
            margin: 10px;
            color: rgb(245, 208, 66);
            font-size: 15px;
            font-weight: bold;
        }
        #ck{
            font-size: 12px;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
 <form id="adminModifyForm" action="updateAdmin.co" method="POST">
        <div id="outer">
            <div id="inner">
                <h1 id="title">MODIFY</h1><br>
                <div id="modify"><a href="modifyPw.co">비밀번호 변경</a><label>&nbsp | &nbsp</label><a href="changeAdmin.co">담당자 변경</a><label>&nbsp | &nbsp</label><a href="#" onclick="delOk();">회원 탈퇴</a><br><br></div>
                <input type="text" class="input" id="memId" name="memId" value="${ loginUser.memId }" readonly><br>
                <input type="password" class="input" id="memPw" name="memPw" placeholder=" 비밀번호" minlength="10" maxlength="16"><br>
                <input type="password" class="input" id="memPwCheck" name="memPwCheck" placeholder=" 비밀번호 확인" minlength="8" maxlength="16" autocomplete="new-password"><br>
                <input type="text" class="input" id="memName" name="memName" placeholder=" 이름" value="${ loginUser.memName }" maxlength="4"><br>
                <input type="tel" class="input" id="phone" name="memPhone" placeholder=" 휴대폰 번호 (-제외입력)" value="${ loginUser.memPhone }" maxlength="11"><br>
                <input type="text" class="input" name="memEmail" placeholder=" 이메일" value="${ loginUser.memEmail }"><br>       
                <input type="text" class="input" name="comName" placeholder=" 회사명" value="${ loginUser.comName }"><br>
                <input type="text" class="input" name="comAddress" placeholder=" 회사주소" value="${ loginUser.comAddress }"><br>
                <button type="button" id="btn" onclick="modify();">정보수정</button>
            </div>
        </div>
    </form>
<script>

    //휴대폰 번호 
    $("#phone").keyup(function(event){
        var inputVal = $(this).val();
        $(this).val(inputVal.replace(/[^0-9]/gi,''));
    });
    
    //비밀번호 
    $("#memPw").keyup(function(event){
        var inputVal = $(this).val();
        $(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
    });

    //비밀번호 확인
    $("#memPwCheck").keyup(function(event){
        var inputVal = $(this).val();
        $(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
    });

    //이름 
    $(document).ready(function(){

    var replaceChar = /[~!@\#$%^&*\()\-=+_'\;<>0-9\/.\`:\"\\,\[\]?|{}]/gi;
    var replaceNotFullKorean = /[ㄱ-ㅎㅏ-ㅣ]/gi;    

        $("#memName").on("focusout", function() {
            var x = $(this).val();
            if (x.length > 0) {
                if (x.match(replaceChar) || x.match(replaceNotFullKorean)) {
                    x = x.replace(replaceChar, "").replace(replaceNotFullKorean, "");
                }
                $(this).val(x);
            }
            }).on("keyup", function() {
                $(this).val($(this).val().replace(replaceChar, ""));
       });

    });    
    
  //기타 유효성 체크
    function modify(){
		var memPw = $("input[name='memPw']");
		var memPwCheck = $("input[name='memPwCheck']");
		var memName = $("input[name='memName']");
		var memPhone = $("input[name='memPhone']");
		var memEmail = $("input[name='memEmail']");
		var valueCheck = $('input[name="memType"]:checked').val();
		var comName = $("input[name='comName']");
		var comAddress = $("input[name='comAddress']");
		var pw = $("input[name='memPw']").val();
		if(memPw.val().trim() == "" || memPwCheck.val().trim() == ""){
			alert("비밀번호를 입력하세요");
			return false;
		}else if(memPw.val() != memPwCheck.val()){
			alert("비밀번호가 다릅니다");
			memPwCheck.val('');
			memPwCheck.focus();
			return false;
		}else if(memName.val().trim() == ""){
			alert("이름을 입력하세요");
			return false;
		}else if(memPhone.val().trim() == ""){
			alert("휴대폰번호를 입력하세요");
			return false;
		}else if(memEmail.val().trim() == ""){
			alert("이메일을 입력하세요");
			return false;
		}else if(valueCheck=="admin" && comName.val().trim() == ""){
			alert("회사명을 입력하세요");
			return false;
		}else if(valueCheck=="admin" && comAddress.val().trim() == ""){
			alert("회사주소를 입력하세요");
			return false;
		}else{
			$("#adminModifyForm").submit();
			return true;
		}
		
	}
  
  	//탈퇴 가능 여부
  	function delOk(){
		var memId = $("#adminModifyForm input[name=memId]");
		$.ajax({
			url: "selectSubStatus.co",
			type:"post",
			data:{
				memId : memId.val()
			},
			success:function(subStatus){
				if(subStatus == "Y"){
					alert("구독 중엔 탈퇴하실 수 없습니다.");
					return;
				}else{
					if(confirm('탈퇴하시면 귀사 회원들의 모든 정보가 사라집니다. 정말로 탈퇴하시겠습니까?')){
						document.location.href="deleteAdmin.co";
					  }else{
						 return; 
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