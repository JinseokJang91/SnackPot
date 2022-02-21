<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<title>구독회사 담당자 변경</title>
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
        .eBtn{
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
        .check{
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
	<form id="enrollForm" action="changingAdmin.co" method="POST" autocomplete="off">
        <div id="outer">
        <div id="inner">
        <h1 id="title">CHANGE ADMIN</h1><br>
        <input type="radio" class="radioVal" id="origin" value="origin" name="memType" checked><label for="origin">기존 회원</label>&emsp;&emsp;
        <input type="radio" class="radioVal" id="new" value="new" name="memType"><label for="new">새 회원</label><br>
        <div id="originMem">
        &emsp;&emsp;&emsp;<input type="text" class="input" id="originMemId" name="originMemId" placeholder=" 담당자로 변경할 회원의 아이디" minlength="4" maxlength="16">
        <button type="button" class="check" id="idSelectBtn" onclick="selectId();">검색</button><br>
        <input type="button" class="eBtn" id="enterBtn" disabled="disabled" onclick="enter();" value="담당자 등록">
        </div>
        <div id="newAdmin" style="display: none;">
        &emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="input" id="memId" name="memId" placeholder=" 아이디 (영문, 숫자 조합 4~16자리)" minlength="4" maxlength="16">
        <button type="button" class="check" id="idCheckBtn" onclick="checkId();">중복확인</button><br>
        <input type="password" class="input" id="memPw" name="memPw" placeholder=" 비밀번호 (영문, 숫자 조합 8~16자)" minlength="8" maxlength="16" autocomplete="new-password"><br>
        <input type="password" class="input" id="memPwCheck" name="memPwCheck" placeholder=" 비밀번호 확인" minlength="8" maxlength="16" autocomplete="new-password"><br>
        <input type="text" class="input" id="memName" name="memName" placeholder=" 이름" maxlength="4"><br>
        <input type="tel" class="input" id="phone" name="memPhone" placeholder=" 휴대폰 번호 (-제외입력)" maxlength="11"><br>
        <input type="text" class="input" name="memEmail" placeholder=" 이메일"><br>
        <input type="checkbox" id="ck"><label id="ck" for="ck">개인정보 수집 및 이용에 동의합니다.</label><br>
        <input type="button" class="eBtn" id="enrollBtn" name="enrollBtn" disabled="disabled" onclick="enroll();" value="담당자 등록">
        </div>
        </div>
        </div>
    </form>
    <script>

 	//회원여부 체크
    $(".radioVal").on('click', function() {
        var valueCheck = $('input[name="memType"]:checked').val();
        if ( valueCheck == "origin" ) {
            $("#newAdmin").hide();
            $("#originMem").show();
        } else {
            $("#newAdmin").show(); 
            $("#originMem").hide(); 
            
        }
    });
    
    //아이디 검색
    function selectId(){
		var memId = $("#enrollForm input[name=originMemId]");
		if(memId.val()==""){
			alert("아이디를 입력해주세요");
			return false;
		}
		$.ajax({
			url: "selectId.co",
			type:"post",
			data:{memId : memId.val()},
			success:function(id){
				if(id == ""){
					alert("아이디를 찾을 수 없습니다.");
					memName.focus();
				}else{
					alert("아이디 검색에 성공하였습니다.");
					memId.attr("readonly","true");
					$("#enterBtn").removeAttr("disabled");
				}
			},
			error:function(){
				console.log("서버통신실패");
			}
		})
	}
    
    function enter(){
		$("#enrollForm").submit();
    }
    
    //휴대폰 번호 
    $("#phone").keyup(function(event){
        var inputVal = $(this).val();
        $(this).val(inputVal.replace(/[^0-9]/g,''));
    });
    
    //아이디 
    $("#memId").keyup(function(event){
        var inputVal = $(this).val();
        $(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
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
    
    //아이디 중복체크
    function checkId(){
		var memId = $("#enrollForm input[name=memId]");
		if(memId.val()==""){
			alert("아이디를 입력해주세요");
			return false;
		}
		$.ajax({
			url: "idCheck.co",
			type:"post",
			data:{memId : memId.val()},
			success:function(result){
				if(result > 0){
					alert("사용할 수 없는 아이디 입니다.");
					memId.focus();
				}else{
					if(confirm("사용가능한 아이디 입니다. 사용하시겠습니까?")){
						memId.attr("readonly","true");
						$("#enrollBtn").removeAttr("disabled");
					}else{
						memId.focus();
					}
				}
			},
			error:function(){
				console.log("서버통신실패");
			}
		})
	}
    
    //기타 유효성 체크
    function enroll(){
		var memPw = $("input[name='memPw']");
		var memPwCheck = $("input[name='memPwCheck']");
		var memName = $("input[name='memName']");
		var memPhone = $("input[name='memPhone']");
		var memEmail = $("input[name='memEmail']");
		var pw = $("input[name='memPw']").val();
		if(memPw.val().trim() == "" || memPwCheck.val().trim() == ""){
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
		}else if(memName.val().trim() == ""){
			alert("이름을 입력하세요");
			return false;
		}else if(memPhone.val().trim() == ""){
			alert("휴대폰번호를 입력하세요");
			return false;
		}else if(memEmail.val().trim() == ""){
			alert("이메일을 입력하세요");
			return false;
		}else if ($(ck).is(":checked") == false){
			alert("약관에 동의해주세요.")
			return false;
		}else{
			$("#enrollForm").submit();
			return true;
		}
		
	}

</script>
</body>
</html>