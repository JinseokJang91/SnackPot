<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
    <script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<title>발송 리스트</title>
</head>
<style>
	#birthContainer{
    	margin-top: 12px;
    }
    #birthCard{
    	height: 777px;
    	overflow-y: scroll;
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
        width: 16%;
    }
    #sendingTab p {
    	border: none;
    	margin: 1px;
    }
    #sendingTab>li{
    	width: 100%;
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
    #birthCard > .card-body{
        height: 100%;
    }
    #sending_expected_table{
    	border: 1px solid lightgray;
    }
    .tableHead{
    	background: rgb(255, 227, 114);
    }
    .tableBody{
    	background: rgb(252, 248, 238);
    }
    #saveGiftList{
    	float: right;
    	border: none;
   		outline: none;
    	background-color: rgb(10, 23, 78);
    	color: rgb(245, 208, 66);
    }
    #saveGiftList:hover{
    	border: none;
   		outline: none;
    	background-color: rgb(245, 208, 66);
    	color: rgb(10, 23, 78);
    	font-weight: bold;
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
		
		$("#sendListTitle").html(presentYear + "년 " + (presentMonth+1) + "월 발송 예정 리스트");
	});
</script>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>

	<div><h4 id="sendListTitle"></h4></div>
	<section id="birthSection">
    	<div class="container-fluid" id="birthContainer">
    		<div class="card text-center" id="birthCard">
	            <div class="card-header" id="tabArea">
	                <ul class="nav nav-tabs card-header-tabs" id="sendingTab">
	                    <li class="nav-item" id="sendingListTab">
	                        <p class="nav-link"><b>발송 리스트</b></p>
	                    </li>
	                </ul>
	                <button type="button" class="btn btn-dark" id="updateBtn" onclick="updateRow();">선택 수정</button>                
	                <button type="button" class="btn btn-dark" data-toggle="modal" data-target="#sending_insert">추가하기</button>
	                <button type="button" class="btn btn-dark" onclick="deleteRow();">선택 삭제</button>                
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
	                            <th scope="col">선물리스트</th>
	                        </tr>
	                    </thead>
	                    <tbody class="tableBody">
	                   		<c:set var="sendListChk" value="${list }"/>
	                   		<c:set var="birthSubsChk" value="${birthSubsChk }"/>
	                   		<c:if test ="${birthSubsChk > 0}">
		                   		<c:choose>
		                   			<c:when test="${empty sendListChk }">
		                   				<tr><td colspan="8">사원 정보가 등록되지 않았거나 불러오는데 실패했습니다.</td></tr>
		                   			</c:when>
		                   			<c:when test="${!empty sendListChk }">
		                   				<c:forEach items="${ list }" var="sendList" varStatus="status">
											<c:set var="num" value="${ num+1 }" />
					                        <tr>
					                            <td><input type="checkbox" name="sendingChk" value="${sendList.cempSeq }"></td>
					                           	<td>${ num }</td>
												<td>${sendList.cempDept }</td>
								                <td>${sendList.cempJob }</td>
								                <td>${sendList.cempName }</td>
								                <td>${sendList.cempPhone }</td>
								                <td>${sendList.cempBirth }</td>
								                <td>${sendList.sendMsgDate }</td>
								                <td style="width:15%;">
								                <select class="custom-select" name="selectGiftList">
								                <c:forEach items="${ giftFolder }" var="folderList" varStatus="folderStatus">
												<option value="${folderList.glistNo }"<c:if test="${folderList.glistNo eq sendList.glistNo }">selected="selected"</c:if>>
												${folderList.glistName }(${folderList.folderGiftCount })
												</option>
												</c:forEach>
												</select>
								                </td>
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
	                </table><br>
	                
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
                                        <label for="deptName" class="col-form-label col-sm-3">부서명</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="cempDept" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="deptName" class="col-form-label col-sm-3">직급명</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="cempJob" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="deptName" class="col-form-label col-sm-3">사원명</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="cempName" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="deptName" class="col-form-label col-sm-3">전화번호</label>
                                        <div class="col-sm-9">
                                            <input type="text" class="form-control" id="cempPhone" placeholder="'-' 빼고 입력" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="deptName" class="col-form-label col-sm-3">이메일</label>
                                        <div class="col-sm-9">
                                            <input type="email" class="form-control" id="cempEmail" placeholder="example@email" required>
                                        </div>
                                    </div>
                                    <div class="form-group row">
                                        <label for="deptName" class="col-form-label col-sm-3">생일날짜</label>
                                        <div class="col-sm-9">
                                            <input type="date" class="form-control" id="cempBirth" required>
                                        </div>
                                    </div>                                                                
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                                    <button type="submit" id="insertSendListBtn" class="btn btn-primary">추가</button>
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
                                    <button type="submit" id="updateSendListBtn" class="btn btn-primary">수정</button>
                                </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <div id="btnArea">
		        <button type="button" class="btn btn-dark" onclick="history.back(-1)">이전으로</button>
		        <button type="button" class="btn btn-dark" id="saveGiftList">선물리스트 저장</button>
	        </div>
    	</div>
    	<input type="hidden" id="comCodeInput" name="comCode" value="${loginUser.comCode }">
    </section>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
        
	<script>
		<%-- 화면 로딩 시 탭 css 설정 --%>
		window.onload = function() {
		    $("#sendingListTab").css("background-color", "rgb(250, 211, 55)").css("color","black");
		    $("#sendingListTab").css("box-shadow", "1px 0 15px 1px whitesmoke inset");
		    $("#tabArea").css("padding-bottom", 4);
		}
		
		$(function(){
			<%-- 선물리스트 저장 버튼 클릭 시 실행 함수 --%>
			$(document).on('click','#saveGiftList', function(){
				var selectArray = new Array();
				
				$("select[name='selectGiftList'] option:selected").each(function(index){
					var glistNo = $(this).val();
					var cempSeq = $(this).parents("td").siblings().eq(0).children().val();

					selectArray.push(glistNo);
					selectArray.push(cempSeq);
				});

				$.ajax({
					url: "updateGiftList.birth",
					type: "POST",
					traditional: true,
					data:{
						selectArray: selectArray
					},
					success: function(result){
						alert("선물리스트가 성공적으로 저장되었습니다.");
						location.replace("sendList.birth");
					},
					error: function(error){
						console.log(error);
					}
				});	
			});
		});
		
		$(function(){
			<%-- 전체 체크 설정 --%>
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
		
		function deleteRow(){
			
			var chkArr = new Array();
			var list = $("input[name='sendingChk']");
			<%-- 체크된 항목 추출 --%>
			for(var i=0; i<list.length; i++){
				if(list[i].checked){
					chkArr.push(list[i].value);
				}
			}
			<%-- 체크된 항목 삭제 --%>
			if(chkArr.length == 0){
				alert("선택된 항목이 없습니다.");
			}
			else{
				var chk = confirm("정말 삭제하시겠습니까?( 삭제 인원 수 : " + chkArr.length + " 명 )");
				if(chk == true){
					$.ajax({
						url : "delSendList.birth",
						dataType: "json",
						type : 'POST',
						traditional : true,
						data : {
							chkArr : chkArr
						},
						success : function(data){
							if(data == chkArr.length){
								alert(chkArr.length + "명이 리스트에서 삭제되었습니다.");
								location.replace("sendList.birth");
							}else{
								alert("삭제하는데 실패했습니다.")
							}
						},
						error : function(error){
							console.log(error);
						}
					});
				}
			}
		}
		
		$(function(){
			var comCode = $("#comCodeInput").val();
			
			<%-- 새로운 사원 정보(발송리스트) 입력 --%>
			$("#insertSendListBtn").click(function(){
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
					if(empMonth == thisMonth + 1){
						$.ajax({		            				
							url : "insSendList.birth",
							type : "POST",
							data:{
								cempNum : cempNum,
								comCode: comCode,
								cempDept : cempDept,
								cempJob : cempJob,
								cempName : cempName,
								cempPhone : cempPhone,
								cempEmail : cempEmail,
								cempBirth : cempBirth
							},
							success : function(result){
								if(result > 0){
									alert("발송 리스트에 추가 등록되었습니다.");
									location.replace("sendList.birth");
								}else{
									alert("발송 리스트 등록 실패!");
								}
							},
							error : function(error){
								console.log(error);
							}
						});
					}else{
						alert((thisMonth + 1)+"월 생일자인 사원만 등록이 가능합니다.");
					}
				}
			});
		});
		
		<%-- 수정하는 경우 나타나는 modal 함수 --%>
		function updateRow(){
			var chkArr = new Array();
			var list = $("input[name='sendingChk']");
			var cempSeq;
			<%-- 체크된 항목 확인 --%>
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
					url : "selectEmpOne2.birth",
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
		
		$(function(){
			$("#updateSendListBtn").click(function(){
				<%-- String으로 출력된 생일날짜를 다시 Date 형식으로 변환 --%>
				var cempBirthSdf = new Date($("#cBirth").val());
				var cempBirth_final = new Date(+cempBirthSdf + 3240 * 10000).toISOString().split("T")[0];
				
				$.ajax({
					url : "updSendList.birth",
					type : "POST",
					data:{
						cempSeq : $("#cSeq").val(),
						cempNum : $("#cNum").val(),
						cempDept : $("#cDept").val(),
						cempJob : $("#cJob").val(),
						cempName : $("#cName").val(),
						cempPhone : $("#cPhone").val(),
						cempEmail : $("#cEmail").val(),
						cempBirth : cempBirth_final
					},
					success : function(result){
						if(result > 0){
							alert("해당 사원 정보가 변경되었습니다.");
							location.replace("sendList.birth");
						}else{
							alert("발송리스트 수정 실패!");
						}
					},
					error : function(error){
						console.log(error);
					}
					
				});
			});
		});
	</script>
</body>
</html>