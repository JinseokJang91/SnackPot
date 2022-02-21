<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구독회사정보 조회</title>
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
    .eBtn{
    	width: 80px;
    	height: 30px;
    	border: none;
    	background-color: rgb(94, 94, 94);
    	color: white;
    	border-radius: 5px;
    }
    .bold{
    	font-weight: bold;
    	margin-bottom: 30px;
    }
    .l1{
    	margin-left: 32px;
    }
    .l3{
    	margin-left: 5px;
    }
    .l4{
    	margin-left: 16px;
    }
    #l5{
    	margin-left: 52px;
    }
    #ll1{
    	margin-left: 58px;
    }
     #ll2{
    	margin-left: 104px;
    }
     #ll3{
    	margin-left: 16px;
    }
     #ll4{
    	margin-left: 52px;
    }
     #ll5{
    	margin-left: 125px;
    }
    .msg{
    	width: 500px;
    	height: 70px;
    }
</style>
</head>
<body>
<div class="container-fluid">
<div class="row flex-nowrap">
<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>


<div class="container" id="outer">
<h5 id="title">${comName} 구독정보 조회 - <label id="value">간식</label></h5><br><br>
<input type="button" class="eBtn" id="snackBtn" value="간식">&emsp;&emsp;
<input type="button" class="eBtn" id="birthBtn" value="생일">
<br><br><br><br>

<div id="snackDiv">

<c:set var="sSub" value="${sSub }"/>
<c:choose>
<c:when test="${sSub eq null }">
<label>구독이 활성화 되어있지 않습니다.</label>
</c:when>
<c:when test="${sSub ne null }">
<label class="bold">간식 예산</label>&emsp;&emsp;<label class="l1">${sSub.budget }원</label><br>
<label class="bold">간식 비율</label>&emsp;&emsp;<label class="l1">스낵 ${sSub.snackRatio }% 음료  ${sSub.drinkRatio }% 간편식  ${sSub.retortRatio }% </label><br>
<label class="bold">선택 카테고리</label>&emsp;&emsp;<label id="l2">스낵류 - ${changeKor.snackCategory }</label><br>
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<label class="l3">음료 - ${changeKor.drinkCategory }</label><br>
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<label class="l3">간편식 - ${changeKor.retortCategory }</label><br>
<label class="bold">선호하는 맛</label>&emsp;&emsp;<label class="l4">${changeKor.preferTaste }</label><br>
<label class="bold">싫어하는 향</label>&emsp;&emsp;<label class="l4">${changeKor.dislikeFlavour }</label><br>
<label class="bold">배송 예정일</label>&emsp;&emsp;<label class="l4">매월 ${sSub.deliveryDate }일</label><br>
<label class="bold">결제일</label>&emsp;&emsp;<label id="l5">매월 ${setSDate }일</label>
</c:when>
</c:choose>
 
</div>

<div id="birthDiv" style="display: none;">


<c:set var="bSub" value="${bSub }"/>
<c:choose>
<c:when test="${bSub eq null }">
<label>구독이 활성화 되어있지 않습니다.</label>
</c:when>
<c:when test="${bSub ne null }">
<label class="bold">1인당 최대 금액</label>&emsp;&emsp;<label id="ll1">${bSub.per_amount }원</label><br>
<label class="bold">발송 시점</label>&emsp;&emsp;<label id="ll2">${bSub.sending_time }</label><br>
<label class="bold">선물 선택 알림 메세지</label>&emsp;&emsp;<input type="text" id="ll3" class="msg" value="${bSub.notification_msg }" readonly><br><br>
<label class="bold">결제일</label>&emsp;&emsp;<label id="ll5">매월 ${setBDate }일</label>
</c:when>
</c:choose>


</div>

</div>


</div>
</div>
<script>
//간식 버튼
$("#snackBtn").on('click', function() {
    
	$("#value").text("간식");
    $("#birthDiv").hide();
    $("#snackDiv").show();

});

//생일 버튼
$("#birthBtn").on('click', function() {
    
	$("#value").text("생일");
    $("#birthDiv").show();
    $("#snackDiv").hide();

});
</script>
</body>
</html>