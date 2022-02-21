<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<title>발송 현황</title>
</head>
<style>
	#birthBody{
		
	}
	#birthSection{
	
	}
	#birthContainer{
    	margin-top: 12px;
    	
    }
    #birthCard{
    	height: 722px;
    	overflow-y: scroll;
    	/*background: rgb(241, 251, 255);*/
    	width: 96%;
    	margin: auto;
    }
    #btnArea{
    	width: 96%;
    	margin: auto;
    }
    #btnArea button{
    	margin-top: 12px;
    }
    #sendingTab>li>p {
        cursor: pointer;
        margin-left: 0;
        width: 100%;
    }
    #sendingTab{
        float: left;
        width: 40%;
    }
    #sendingTab>li{
    	width: 40%;
    }
    #sendingTab p {
    	border: none;
    	margin: 1px;
    }
    #sending_expected, #sending_complete{

        margin-right: 10px;
    }
    #tabArea{
    	padding-top: 20px;
    	padding-left: 10px;
    	border:0;
    }
    #tabArea button{
        float: right;
        margin-left: 3px;
        margin-right: 3px;
    }
    #hiddenBtn{
    	opacity: 0;
    	cursor: default;
    }
    #sending_expected_table, #sending_complete_table{
    	border: 1px solid lightgray;
    }
    .tableHead{
    	background: rgb(255, 227, 114);
    }
    .tableBody{
    	background: rgb(252, 248, 238);
    }
    
    #sendListTitle{
		width: 92%;
		margin: auto;
		color: rgb(10, 23, 78);
    }
    /*footer 조절*/
	html, body{
		height: 100%;
		margin: 0;
		padding: 0;
	}
	section{
		height: auto;
		min-height: 100%;
		padding-bottom: 200px;
	}
	#footer{
		position: relative;
		transform: translateY(-100%);
	}
</style>
<script>
	$(function(){
		<%-- footer 설정 --%>
		$("#footer").css("margin-top","150px");
		
		<%-- 타이틀에 년도, 월 입력 --%>
		var presentDate = new Date();
		var presentYear = presentDate.getFullYear();
		var presentMonth = presentDate.getMonth()+1;
		console.log(presentMonth);
		
		$("#sendListTitle").html(presentYear + "년 " + presentMonth + "월 발송 현황");
	});
</script>
<body id="birthBody">
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
		<%-- 화면 로딩 시 발송 예정 리스트가 먼저 나타나도록 설정, 발송 완료 탭 클릭 시 서로 색 변경 --%>
        <script>
            window.onload = function() {
            	$("#sending_expected").css("background", "rgb(250, 211, 55)");
                $("#sending_complete").css("background", "rgb(250, 233, 165)");
                $("#sending_expected").css("font-weight", "bold");
                $("#sending_complete").css("font-weight", "normal");
                $("#sending_expected").css("color", "black");
                $("#sending_complete").css("color", "black");
                $("#sending_expected").css("box-shadow", "1px 0 15px 1px whitesmoke inset");
                $("#sending_complete").css("box-shadow", "1px 0 15px 1px whitesmoke inset");
    
                $("#sending_expected_table").show();
                $("#sending_complete_table").hide();
                $("#updateBtn").show();
                $("#insertBtn").show();
                $("#deleteBtn").show();
                $("#tabArea").css("padding-bottom", 4);
            }
    
            $(document).ready(function() {
                $("#sending_expected").click(function() {
                	$("#sending_expected").css("background", "rgb(250, 211, 55)");
                    $("#sending_complete").css("background", "rgb(250, 233, 165)");
                    $("#sending_expected").css("font-weight", "bold");
                    $("#sending_complete").css("font-weight", "normal");
                    $("#sending_expected").css("color", "black");
                    $("#sending_complete").css("color", "black");
                    $("#sending_expected").css("box-shadow", "1px 0 15px 1px whitesmoke inset");
                    $("#sending_complete").css("box-shadow", "1px 0 15px 1px whitesmoke inset");
    
                    $("#sending_expected_table").show();
                    $("#sending_complete_table").hide();
                    $("#updateBtn").show();
                    $("#insertBtn").show();
                    $("#deleteBtn").show();
                });
            });
            $(document).ready(function() {
                $("#sending_complete").click(function() {
                	$("#sending_complete").css("background", "rgb(250, 211, 55)");
                    $("#sending_expected").css("background", "rgb(250, 233, 165)");
                    $("#sending_complete").css("font-weight", "bold");
                    $("#sending_expected").css("font-weight", "normal");
                    $("#sending_complete").css("color", "black");
                    $("#sending_expected").css("color", "black");
                    $("#sending_complete").css("box-shadow", "1px 0 15px 1px whitesmoke inset");
                    $("#sending_expected").css("box-shadow", "1px 0 15px 1px whitesmoke inset");
    
                    $("#sending_expected_table").hide();
                    $("#sending_complete_table").show();
                    $("#updateBtn").hide();
                    $("#insertBtn").hide();
                    $("#deleteBtn").hide();
                });
            });
        </script>
    	<div><h4 id="sendListTitle"></h4></div>
    	<section id="birthSection">
    		<div class="container-fluid" id="birthContainer">
    			<div class="card text-center" id="birthCard">
		            <div class="card-header" id="tabArea">
		                <ul class="nav nav-tabs card-header-tabs" id="sendingTab">
		                    <li class="nav-item" id="sending_expected">
		                        <p class="nav-link">발송 예정</p>
		                    </li>
		                    <li class="nav-item" id="sending_complete">
		                        <p class="nav-link">발송 완료</p>
		                    </li>
		                </ul>
		                
		                <button type="button" class="btn btn-dark" id="updateBtn" onclick="updateRow();">선택 수정</button>                
		                <button type="button" class="btn btn-dark" id="insertBtn" data-toggle="modal" data-target="#sending_insert">추가하기</button>
		                <button type="button" class="btn btn-dark" id="deleteBtn" onclick="deleteRow();">선택 삭제</button>
		                <button type="button" class="btn btn-dark" id="hiddenBtn">hidden</button>
		            </div>
		            
		            <div class="card-body">                
		                <%-- 발송 예정 테이블 --%>
		                <table class="table" id="sending_expected_table">
		                    <thead class="tableHead">
		                        <tr>
		                            <th scope="col"><input type="checkbox" id="sendingChk"></th>
		                            <th scope="col">번호</th>
		                            <th scope="col">부서명</th>
		                            <th scope="col">직급명</th>
		                            <th scope="col">사원명</th>
		                            <th scope="col">전화번호</th>
		                            <th scope="col">생일날짜</th>
		                            <th scope="col">발송예정일</th>
		                        </tr>
		                    </thead>
		                    <tbody class="tableBody">
		                   		<c:set var="sendListSts" value="${list }"/>
		                   		<c:set var="birthSubsChk" value="${birthSubsChk }"/>
		                   		<c:if test ="${birthSubsChk > 0}">
			                   		<c:choose>
			                   			<c:when test="${empty sendListSts }">
			                   				<tr><td colspan="8">사원 정보가 등록되지 않았거나 불러오는데 실패했습니다.</td></tr>
			                   			</c:when>
			                   			<c:when test="${!empty sendListSts }">
			                   				<c:forEach items="${ list }" var="sendingSts" varStatus="status">
												<c:set var="num1" value="${ num1+1 }" />
							                        <tr>
							                            <td><input type="checkbox" name="sendingChk" value="${sendingSts.cempSeq }"></td>
							                           	<td>${ num1 }</td>
														<td>${ sendingSts.cempDept }</td>
														<td>${ sendingSts.cempJob }</td>
														<td>${ sendingSts.cempName }</td>
														<td>${ sendingSts.cempPhone }</td>
														<td>${ sendingSts.cempBirth }</td>
														<td>${ sendingSts.sendingMsgDate }</td>
							                        </tr>
			                   				</c:forEach>
			                   				<c:if test="${empty num1 }">
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
		
		                <%-- 추가하기 --%>
		                <div class="modal fade" id="sending_insert" data-backdrop="static" data-keyboard="false" aria-hidden="true">
		                    <div class="modal-dialog">
		                        <div class="modal-content">
		                            <div class="modal-header">
		                                <h5 class="modal-title" id="staticBackdropLabel">추가하기</h5>
		                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                                    <span aria-hidden="true">&times;</span>
		                                </button>
		                            </div>
		                            
		                                <div class="modal-body">
		                                	<div class="form-group row">
		                                        <label for="" class="col-form-label col-sm-3">사원번호</label>
		                                        <div class="col-sm-9">
		                                            <input type="text" class="form-control" id="cempNum" required>
		                                        </div>
		                                    </div>
		                                    <div class="form-group row">
		                                        <label for="" class="col-form-label col-sm-3">부서명</label>
		                                        <div class="col-sm-9">
		                                            <input type="text" class="form-control" id="cempDept" required>
		                                        </div>
		                                    </div>
		                                    <div class="form-group row">
		                                        <label for="" class="col-form-label col-sm-3">직급명</label>
		                                        <div class="col-sm-9">
		                                            <input type="text" class="form-control" id="cempJob" required>
		                                        </div>
		                                    </div>
		                                    <div class="form-group row">
		                                        <label for="" class="col-form-label col-sm-3">사원명</label>
		                                        <div class="col-sm-9">
		                                            <input type="text" class="form-control" id="cempName" required>
		                                        </div>
		                                    </div>
		                                    <div class="form-group row">
		                                        <label for="" class="col-form-label col-sm-3">전화번호</label>
		                                        <div class="col-sm-9">
		                                            <input type="text" class="form-control" id="cempPhone" placeholder="'-' 빼고 입력" required>
		                                        </div>
		                                    </div>
		                                    <div class="form-group row">
		                                        <label for="" class="col-form-label col-sm-3">이메일</label>
		                                        <div class="col-sm-9">
		                                            <input type="email" class="form-control" id="cempEmail" placeholder="example@email" required>
		                                        </div>
		                                    </div>
		                                    <div class="form-group row">
		                                        <label for="" class="col-form-label col-sm-3">생일날짜</label>
		                                        <div class="col-sm-9">
		                                            <input type="date" class="form-control" id="cempBirth" required>
		                                        </div>
		                                    </div>                                                                
		                                </div>
		                                <div class="modal-footer">
		                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		                                    <button type="submit" id="insertSendStsBtn" class="btn btn-primary">추가</button>
		                                </div>
		
		                        </div>
		                    </div>
		                </div>
		
		                <%-- 선택 수정 --%>
		                <div class="modal fade" id="sending_update" data-backdrop="static" data-keyboard="false" aria-hidden="true">
		                    <div class="modal-dialog">
		                        <div class="modal-content">
		                            <div class="modal-header">
		                                <h5 class="modal-title" id="staticBackdropLabel">선택 수정</h5>
		                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                                    <span aria-hidden="true">&times;</span>
		                                </button>
		                            </div>
		                            	<input type="hidden" id="cSeq">
		                                <div class="modal-body">
		                                	<div class="form-group row">
		                                        <label for="" class="col-form-label col-sm-3">사원번호</label>
		                                        <div class="col-sm-9">
		                                            <input type="text" class="form-control" id="cNum" readonly>
		                                        </div>
		                                    </div>                           
		                                    <div class="form-group row">
		                                        <label for="deptName" class="col-form-label col-sm-3">부서명</label>
		                                        <div class="col-sm-9">
		                                            <input type="text" class="form-control" id="cDept">
		                                        </div>
		                                    </div>
		                                    <div class="form-group row">
		                                        <label for="deptName" class="col-form-label col-sm-3">직급명</label>
		                                        <div class="col-sm-9">
		                                            <input type="text" class="form-control" id="cJob">
		                                        </div>
		                                    </div>
		                                    <div class="form-group row">
		                                        <label for="deptName" class="col-form-label col-sm-3">사원명</label>
		                                        <div class="col-sm-9">
		                                            <input type="text" class="form-control" id="cName">
		                                        </div>
		                                    </div>
		                                    <div class="form-group row">
		                                        <label for="deptName" class="col-form-label col-sm-3">전화번호</label>
		                                        <div class="col-sm-9">
		                                            <input type="text" class="form-control" id="cPhone" placeholder="'-' 빼고 입력">
		                                        </div>
		                                    </div>
		                                    <div class="form-group row">
		                                        <label for="deptName" class="col-form-label col-sm-3">이메일</label>
		                                        <div class="col-sm-9">
		                                            <input type="email" class="form-control" id="cEmail" placeholder="example@email">
		                                        </div>
		                                    </div>
		                                    <div class="form-group row">
		                                        <label for="deptName" class="col-form-label col-sm-3">생일날짜</label>
		                                        <div class="col-sm-9">
		                                            <input type="date" class="form-control" id="cBirth" readonly>
		                                        </div>
		                                    </div>                                                                
		                                </div>
		                                <div class="modal-footer">
		                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
		                                    <button type="submit" id="updateSendStsBtn" class="btn btn-primary">수정</button>
		                                </div>
		                            
		                        </div>
		                    </div>
		                </div>
		
		                <%-- 발송 완료 테이블 - ajax로 불러옴 --%>
		                <table class="table" id="sending_complete_table">
		                    <thead class="tableHead">
		                        <tr>
		                            <th scope="col">번호</th>
		                            <th scope="col">부서명</th>
		                            <th scope="col">직급명</th>
		                            <th scope="col">사원명</th>
		                            <th scope="col">전화번호</th>
		                            <th scope="col">생일날짜</th>
		                            <th scope="col">선택완료일</th>
		                        </tr>
		                    </thead>
		                    <tbody class="tableBody" id="completeCursts">
		                    	<c:set var="birthSubsChk" value="${birthSubsChk }"/>
		                   		<c:if test ="${birthSubsChk > 0}">
								<%-- 발송 완료 리스트 들어가는 곳 --%>
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
    		
    		<input type="hidden" id="comCodeInput" name="comCode" value="${loginUser.comCode }">
    	</section>
		
   		<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
        
	<script>
		<%-- 발송 완료 리스트 출력 --%>
		$(function(){
			$(document).on('click', '#sending_complete', function(){
				
				var selectComplete = $("input[name='comCode']").val();
				
				$.ajax({
					url: "completeCursts.birth",
					type: "POST",
					data:{
						comCode : selectComplete
					},
					success: function(list){
						var result = '';

						$.each(list, function(index, item){
							var parsedBirth = dateParse(item.cempBirth);
							var parsedSelectDate = dateParse(item.selectDate);
							var phoneNumber = (item.cempPhone).substring(0, 3) + '-' + (item.cempPhone).substring(3, 7) + '-' + (item.cempPhone).substring(7, 11);
							
							result += '<tr>';
							result += '<td>' + (index+1) + '</td>';
							result += '<td>' + item.cempDept + '</td>';
							result += '<td>' + item.cempJob + '</td>';
							result += '<td>' + item.cempName + '</td>';
							result += '<td>' + phoneNumber + '</td>';
							result += '<td>' + parsedBirth + '</td>';
							result += '<td>' + parsedSelectDate + '</td>';
							result += '</tr>';
						});
						$("#completeCursts").html(result);
						
					},
					error: function(error){
						console.log(error);
					}
				});
				
			});
		});
		<%-- 날짜를 가져와서 년,월,일 추출하는 함수 --%>
		function dateParse(value){
			var y = value.substr(-4);
			var m = value.substr(0,2)-1;
			var d = value.substr(-8,2);
			d = d.replace(" ","");

			var parsed = new Date(y,m,d);
			var result = dateToString(parsed);

			return result;
		}
		<%-- 월, 일이 10보다 작을 때 앞에 0붙여서 출력하기 위한 함수 --%>
		function zeroPlus(value){
			if(value >= 10){
				return value;
			}

			return '0'+value;
		}
		<%-- 날짜를 yyyy-MM-dd 형식으로 출력하기 위한 함수 --%>
		function dateToString(value){
			const year = value.getFullYear();
			const month = zeroPlus(value.getMonth() + 1);
			const day = zeroPlus(value.getDate());
			
			return [year, month, day].join('-');
		}
		
		<%-- 전체 체크 설정 --%>
		$(function(){
	    	var chkRow = $("input[name='sendingChk']");
	    	var rowCount = chkRow.length;
	        $("#sendingChk").click(function(){
	            var chkList = $("input[name='sendingChk']");
	            for(var i=0; i<chkList.length; i++){
	                chkList[i].checked = this.checked;
	            }
	        });
	
	        $("input[name='sendingChk']").click(function(){
	             if($("input[name='sendingChk']:checked").length == rowCount){ <%--각각 체크해서 전체를 다 체크했을 때--%>
	                 $("#sendingChk")[0].checked = true;
	             }else{
	                 $("#sendingChk")[0].checked = false;
	             }
	        });
	    });
		
		<%-- 선택 삭제 함수 설정 --%>
		function deleteRow(){
			var chkArr = new Array();
			var list = $("input[name='sendingChk']");
			for(var i=0; i<list.length; i++){
				if(list[i].checked){
					chkArr.push(list[i].value);
				}
			}
			
			if(chkArr.length == 0){
				alert("선택된 항목이 없습니다.");
			}
			else{
				var chk = confirm("정말 삭제하시겠습니까?( 삭제 인원 수 : " + chkArr.length + " 명 )");
				
				if(chk == true){
					$.ajax({
	    				url : "delSendSts.birth",
	    				dataType: "json",
	    				type : 'POST',
	    				traditional : true,
	    				data : {
	    					chkArr : chkArr
	    				},
	    				success : function(data){
	    					if(data == chkArr.length){
	    						alert(chkArr.length + "명이 리스트에서 삭제되었습니다.");
	    						location.replace("sendingcursts.birth");
	    					}else{
	    						alert("발송 현황 삭제에 실패했습니다.")
	    					}
	    				},
	    				error : function(error){
	    					console.log(error);
	    				}
	    			});
				}
			}
		}
	    
		<%-- 추가하기 함수 설정 --%>
		$(function(){
			
			var comCode = $("#comCodeInput").val();
			
			$("#insertSendStsBtn").click(function(){
				var cempNum = $("#cempNum").val();
				var cempDept = $("#cempDept").val();
				var cempJob = $("#cempJob").val();
				var cempName = $("#cempName").val();
				var cempPhone = $("#cempPhone").val();
				var cempEmail = $("#cempEmail").val();
				var cempBirth = $("#cempBirth").val();
				
				var thisMonth = new Date().getMonth() + 1;
				var empMonth = new Date(cempBirth).getMonth() + 1;
				
				if(cempNum == "" || cempDept == "" || cempJob == "" || cempName == "" || 
						cempPhone == "" || cempEmail == "" || cempBirth == ""){
					alert("모든 항목을 입력해주세요.");
				}else{
					if(empMonth == thisMonth){
						$.ajax({		            				
		    				url : "insSendSts.birth",
		    				type : "POST",
		    				data:{
		    					cempNum : cempNum,
		    					comCode : comCode,
		    					cempDept : cempDept,
		    					cempJob : cempJob,
		    					cempName : cempName,
		    					cempPhone : cempPhone,
		    					cempEmail : cempEmail,
		    					cempBirth : cempBirth
		    				},
		    				success : function(result){
		    					if(result > 0){
									alert("발송 예정 목록에 추가 등록되었습니다.");
									location.replace("sendingcursts.birth");
									
								}else{
									alert("발송 예정 항목 등록에 실패했습니다.");
								}
		    				},
		    				error : function(error){
								console.log(error);
		    				}
		    				
		    			});
					}else{
						alert((thisMonth)+"월 생일자인 사원만 등록이 가능합니다.");
					}
				}
				
			});
		});
		
		<%-- 선택 수정 버튼 클릭 시 해당 객체의 정보를 불러와서 modal에 출력 --%>
		function updateRow(){
			var chkArr = new Array();
			var list = $("input[name='sendingChk']");
			var cempSeq;
			
			for(var i=0; i<list.length; i++){
				if(list[i].checked){
					chkArr.push(list[i].value);
					cempSeq = list[i].value;
				}
			}

			<%-- 체크된 항목이 1개일 때만 modal 실행 --%>
			if(chkArr.length == 1){
				$("#updateBtn").attr("data-toggle","modal").attr("data-target","#sending_update");
				
				$.ajax({
					url : "selectEmpOne.birth",
					type : "POST",
					data:{
						cempSeq : cempSeq
					},
					success : function(result){
						$("#cSeq").val(cempSeq);
						$("#cNum").val(result.cempNum);
						$("#cDept").val(result.cempDept);
						$("#cJob").val(result.cempJob);
						$("#cName").val(result.cempName);
						$("#cPhone").val(result.cempPhone);
						$("#cEmail").val(result.cempEmail);
						$("#cBirth").val(result.cempBirthSdf);
					},
					error : function(error){
						console.log(error);
					}
				});
			}
			else if(chkArr.length == 0){
				alert("수정할 항목을 체크한 후 다시 버튼을 클릭해주세요.");
				$("#updateBtn").removeAttr("data-toggle").removeAttr("data-target");
			}else{
				alert("한 번에 한 개의 항목만 수정이 가능합니다.");
				$("#updateBtn").removeAttr("data-toggle").removeAttr("data-target");
			}
		}
		
		<%-- 선택 수정 버튼을 클릭해 나타나는 modal의 수정 버튼 클릭 시 호출되는 함수 설정 --%>
		$(function(){
			$("#updateSendStsBtn").click(function(){
				
				var cempBirthSdf = new Date($("#cBirth").val());
				var cempBirth_final = new Date(+cempBirthSdf + 3240 * 10000).toISOString().split("T")[0];
				
				var cempSeq = $("#cSeq").val();
				var cempNum = $("#cNum").val();
				var cempDept = $("#cDept").val();
				var cempJob = $("#cJob").val();
				var cempName = $("#cName").val();
				var cempPhone = $("#cPhone").val();
				var cempEmail = $("#cEmail").val();
				
				if(cempDept == "" || cempJob == "" || cempName == "" || 
						cempPhone == "" || cempEmail == ""){
					alert("모든 항목을 입력해주세요.");
				}else{

					$.ajax({
						
						url : "updSendSts.birth",
						type : "POST",
						data:{
							cempSeq : cempSeq,
							cempNum : cempNum,
							cempDept : cempDept,
							cempJob : cempJob,
							cempName : cempName,
							cempPhone : cempPhone,
							cempEmail : cempEmail,
							cempBirth : cempBirth_final
						},
						success : function(result){
							if(result > 0){
								alert("해당 사원 정보가 변경되었습니다.");
								location.replace("sendingcursts.birth");
								
							}else{
								alert("발송 예정 항목 수정 실패!");
							}
						},
						error : function(error){
							console.log(error);
						}
						
					});
				}
			});
		});
	</script>
</body>
</html>