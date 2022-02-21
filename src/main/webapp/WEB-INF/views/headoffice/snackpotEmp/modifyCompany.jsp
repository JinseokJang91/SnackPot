<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>담당 거래처 수정</title>
<!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
   <style>
    th{
        text-align: center;
        background-color: lightgray
    }
    td{
        text-align: center;
    }
    #tdiv{
    	height: 400px;
        overflow-y: scroll;
    }
    #outer{
        margin-top: 30px;
    }
    #search{
    	width: 25px;
    	border: none;
    	background: none;
    }
    #icon{
   		width: 25px;
    }
    #searchdiv{
    	margin-left: 880px;
    	margin-bottom: 30px;
    }
    #enrollBtn{
    	margin-left: 1010px;
    	padding: 10px;
    	border: none;
    	background-color: rgb(94, 94, 94);
    	color: white;
    	border-radius: 5px;
    	margin-top: 10px;
    }
    #title{
    	font-weight: bold;
    }
    .modifyBtn{
    	width: 60px;
    	height: 30px;
    	border: none;
    	background-color: rgb(94, 94, 94);
    	color: white;
    	border-radius: 5px;
    }
    .deleteBtn{
    	width: 60px;
    	height: 30px;
    	border: none;
    	background-color: rgb(94, 94, 94);
    	color: white;
    	border-radius: 5px;
    }
    #bth{
    	width: 120px;
    }
    #comth{
    	width: 500px;
    }
    #outline{
        text-align: center;
    }
    #content{
        display: inline-block;
        margin-top: -20px;
    }
    #btnDiv{
    	margin-top: 30px;
    }
    #cancel{
   	 	background-color: rgb(224, 224, 224);
    	color: dark;
    }
    #enter{
    	background-color: rgb(94, 94, 94);
    	color: white;
    }
    .eBtn{
    	width: 100px;
    	padding: 10px;
    	border: none;
    	border-radius: 5px;
    }
    #sample{
    	font-size: 13px;
    }
</style>
</head>
<body>
<div class="container-fluid">
<div class="row flex-nowrap">
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>

<div class="container" id="outer">
<h5 id="title">담당 거래처 수정</h5><br>
<div id="tdiv">
<table class="table table-hover" id="empList">
    <thead>
        <tr>
            <th>No.</th>
            <th>회사명</th>
            <th>주소</th>
            <th>간식구독</th>
            <th>생일구독</th>
            <th>담당자</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="emp" varStatus="st">
        <tr>
            <td>${st.index +1}</td>
            <td>${emp.comName}</td>
            <td>${emp.comAddress}</td>
            <td>${emp.snackStatus}</td>
            <td>${emp.birthStatus}</td>
            <td>${emp.sempNum}</td>
        </tr>
     </c:forEach>
    </tbody>
</table>
</div>

<div id="outline">
<div id="content">
<label id="sample">입력예시 : 카카오, 네이버 (회사, 회사 ...)</label><br><br>
<label>${semp.sempName} 사원의 담당 거래처</label>&emsp;<input type="text" name="comName" value="${sempComName}"><br>
<input type="hidden" name="sempNum" value="${semp.sempNum}">
<div id="btnDiv">
<input class="eBtn" id="cancel" type="button" value="취소" onclick="location='<%=request.getContextPath()%>/empCompanyList.sn'">&emsp;&emsp;&emsp;
<input class="eBtn" id="enter" type="button" value="수정" onclick="modify();">
</div>

</div>
</div>

</div>
</div>
</div>
<script>
function modify(){
	var comName = $("input[name='comName']");
	var sempNum = $("input[name='sempNum']");
	if(comName.val().trim() == ""){
		alert("수정할 회사명을 입력하세요");
		return false;
	}else{
		$.ajax({
			url: "updateCompany.sn",
			type:"post",
			data:{
				comName : comName.val(),
				sempNum : sempNum.val()
			},
			success:function(result){
				if(result == "Y"){
					alert("수정되었습니다.");
					document.location.href="empCompanyList.sn";
					return;
				}else{
					alert("회사를 찾을 수 없습니다. 올바른 회사명을 입력해주세요.");
					comName.focus();
					return false;
				}
			},
			error:function(){
				console.log("서버통신실패");
			}
		})
	}
	
}
</script>
</body>
</html>