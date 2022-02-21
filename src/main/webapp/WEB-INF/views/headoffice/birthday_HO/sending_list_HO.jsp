<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
    <script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<title>발송 리스트(본사)</title>
</head>
<style>
    #birthCard{
    	height: 81%;
    	width: 96%;
    	margin: auto;
    	overflow: scroll;
    }
	#sendingTab>li>p {
		font-weight: bold;
        margin-left: 0;
        width: 100%;
    }
    #sendingTab{
        width: 16%;
    }
    #sendingTab p {
    	border: none;
    	margin: 1px;
    }
    #sendingTab>li{
    	width: 100%;
    	float: left;
    	margin-left: 10px;
    }
	#tabArea{
		padding-top: 20px;
    	padding-left: 0;
    	padding-bottom: 0;
    	border-bottom: 0;
	}
	#sendingListTab{
		background-color: rgb(194, 192, 192);
		color: black;
		box-shadow: 1px 0 2px 1px whitesmoke inset;
	}
	#btnArea{
    	width: 96%;
    	margin: auto;
    }
    #btnArea button{
    	margin-top: 12px;
    	float: right;
    }
    
    #sListTitleDiv{
    	margin-bottom: 5px;
    }
    #sendListTitle{
		width: 94%;
		margin: auto;
		color: rgb(10, 23, 78);
    }
</style>
<body>
	<script>
		$(function(){
			var presentDate = new Date();
			var presentYear = presentDate.getFullYear();
			var presentMonth = presentDate.getMonth()+1;
			
			$("#sendListTitle").html(presentYear + "년 " + (presentMonth+1) + "월 발송 예정 리스트");
		});
	</script>
	<section class="birthSection">
		<div class="container-fluid" id="birthContainer">
			<div class="row flex-nowrap">
				<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
				
				<div class="col-10">
					<br><br>
					<div id="sListTitleDiv"><h4 id="sendListTitle"></h4></div>
					<div class="card text-center" id="birthCard">
						<div class="card-header" id="tabArea">
					        <ul class="nav nav-tabs card-header-tabs" id="sendingTab">
					            <li class="nav-item" id="sendingListTab">
					                <p class="nav-link">발송 리스트</p>
					            </li>	            
					        </ul>               
					    </div>
					    <div class="card-body">
						    <table class="table">
						        <thead style="background-color:rgb(194, 192, 192);">
						            <tr>
						                <th scope="col">번호</th>
						                <th scope="col">부서명</th>
						                <th scope="col">직급명</th>
						                <th scope="col">사원명</th>
						                <th scope="col">전화번호</th>
						                <th scope="col">생일날짜</th>
						                <th scope="col">발송예정일</th>
						            </tr>            
						        </thead>
						        <tbody>
						       		<c:set var="sendListChk" value="${list }"/>
						       		<c:set var="birthSubsChk" value="${birthSubsChk }"/>
						       		<c:if test ="${birthSubsChk > 0}">
						            	<c:choose>
						                   	<c:when test="${empty sendListChk }">
						                   		<tr><td colspan="8">사원 정보가 등록되지 않았거나 불러오는데 실패했습니다.</td></tr>
						                   	</c:when>
						                   	<c:when test="${!empty sendListChk }">
						                   		<c:forEach items="${list }" var="sendList">
										        	<c:set var="num" value="${num+1 }"/>
										            <tr>
										                <td>${num }</td>
										                <td>${sendList.cempDept }</td>
										                <td>${sendList.cempJob }</td>
										                <td>${sendList.cempName }</td>
										                <td>${sendList.cempPhone }</td>
										                <td>${sendList.cempBirth }</td>
										                <td>${sendList.sendMsgDate }</td>
										            </tr>
									            </c:forEach>
						                   			<c:if test="${empty num }">
						                   				<tr><td colspan="8">발송 예정인 사원이 없습니다.</td></tr>
						                   			</c:if>
						                   	</c:when>
						                </c:choose>
							        </c:if>
				                   	<c:if test ="${birthSubsChk <= 0}">
				                   		<tr><td colspan="8">구독 정보가 존재하지 않습니다.</td></tr>
				                   	</c:if>
						        </tbody>
						    </table>
						</div>
					</div>
					<div id="btnArea">
						<button type="button" class="btn btn-dark" onclick="history.back(-1)">이전으로</button>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>