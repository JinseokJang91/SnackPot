<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>  
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<title>생일 구독 조회</title>
</head>
<style>
    #birthContainer{
    	margin-top: 30px;
    }
    #birthInfoOuter{
    	margin: auto;
    	width: 100%;
    }
    #infoBirthService{
    	margin: auto;
    	width: 80%;
    }
    .per_amount input[name="per_amount"], .sending_time input[name="sending_time"]{
		display:none;
	}
	.per_amount input[name="per_amount"] + span, .sending_time input[name="sending_time"] + span{
		display:inline-block;
		background:none;
		border:1px solid #dfdfdf;  
		padding:0px 10px;
		text-align:center;
		height:35px;
		line-height:33px;
		font-weight:500;
		cursor:pointer;
	}
	.per_amount input[name="per_amount"]:checked + span, .sending_time input[name="sending_time"]:checked + span{
		border:1px solid #23a3a7;
		background:#23a3a7;
		color:#fff;
	}
	.per_amount_div, .sending_time_div{
		width: 15%;
	}
	#deleteBirthBtn{
		float: right;
	}
	#updateBirthSubs{
		float: right;
		background: rgb(10, 23, 78);
		color: rgb(245, 208, 66);
		font-weight: bolder;
		margin-left: 20px;
	}
	#updateBirthSubs:hover{
		float: right;
		transition-duration: 0.7s;
		background: rgb(245, 208, 66);
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
	<%-- footer 설정 --%>
	$(function(){
		$("#footer").css("margin-top","150px");
	});
	<%-- 구독 정보 조회 시 불러온 객체의 정보를 바탕으로 radio태그 체크 설정 --%>
	$(function(){
		
		var chkResult = ${chkResult};
		
		if(chkResult > 0){
			var perAmount = ${b.per_amount};
			var sendingTime = "${b.sending_time}";		
			
			switch(perAmount){
			case 10000 :
				$("#per_amount1").prop("checked",true);
				break;
			case 30000 :
				$("#per_amount2").prop("checked",true);
				break;
			case 50000 :
				$("#per_amount3").prop("checked",true);
				break;
			case 100000 :
				$("#per_amount4").prop("checked",true);
				break;
			}
			
			switch(sendingTime){
			case "당일" :
				$("#sending_time1").prop("checked",true);
				break;
			case "3일전" :
				$("#sending_time2").prop("checked",true);
				break;
			case "5일전" :
				$("#sending_time3").prop("checked",true);
				break;		
			}
		}
	});
</script>
<body id="birthBody">

	<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
	
	<section id="birthSection">
		<div class="container-fluid" id="birthContainer">
			<div class="birthInfoOuter">
				<form class="" id="infoBirthService" action="updateSubscribe.birth" method="post">
			    	<h4 style="text-align:center;">생일 구독 정보</h4>
			    	<hr>
			    	
			    	<input type="hidden" name="com_code" value="${loginUser.comCode }"/>
			    
			    	<div class="form-group row">
			    		<label class="col-md-3">1인당 최대 금액</label><%--데이터와 일치하는 값 속성 checked--%>
			    		<div class="col-md-9 row">
			        		<div class="form-check form-check-inline per_amount_div">
				                <label class="form-check-label per_amount" for="per_amount1">
				                <input class="form-check-input" type="radio" name="per_amount" id="per_amount1" value="10000">
				                <span>10,000원</span>
				                </label>
				            </div>&emsp;
				            <div class="form-check form-check-inline per_amount_div">
				                <label class="form-check-label per_amount" for="per_amount2">
				                <input class="form-check-input" type="radio" name="per_amount" id="per_amount2" value="30000">
				                <span>30,000원</span>
				                </label>
				            </div>&emsp;
				            <div class="form-check form-check-inline per_amount_div">
				                <label class="form-check-label per_amount" for="per_amount3">
				                <input class="form-check-input" type="radio" name="per_amount" id="per_amount3" value="50000">
				                <span>50,000원</span>
				                </label>
				            </div>&emsp;
				            <div class="form-check form-check-inline per_amount_div">
				                <label class="form-check-label per_amount" for="per_amount4">
				                <input class="form-check-input" type="radio" name="per_amount" id="per_amount4" value="100000">
				                <span>100,000원</span>
				                </label>
				            </div>
			        	</div>
			    	</div>

			        <br><hr>
			        <div class="form-group row">
			        	<label class="col-md-3">발송 시점</label>
			        	<div class="col-md-9 row">
			        		<div class="form-check form-check-inline sending_time_div">
				                <label class="form-check-label sending_time" for="sending_time1">
				                <input class="form-check-input" type="radio" name="sending_time" id="sending_time1" value="당일">
								<span>당일</span>
				                </label>
				            </div>&emsp;
				            <div class="form-check form-check-inline sending_time_div">
				                <label class="form-check-label sending_time" for="sending_time2">
				                <input class="form-check-input" type="radio" name="sending_time" id="sending_time2" value="3일전">
				                <span>3일 전</span>
				                </label>
				            </div>&emsp;
				            <div class="form-check form-check-inline sending_time_div">
				                <label class="form-check-label sending_time" for="sending_time3">
				                <input class="form-check-input" type="radio" name="sending_time" id="sending_time3" value="5일전">
				                <span>5일 전</span>
				                </label>
				            </div>
			        	</div>
			        </div>
			        <br><hr>

			        <div class="form-group row">
			        	<label class="col-md-3">선물 선택 알림 메시지</label>
			        	<div class="col-md-9 row">
			        		<select class="custom-select custom-select-md" id="sendMsg">
				                <option value="0" selected>선택</option>
				                <option value="1">당신을 위한 생일 선물이 도착했어요. 아래 링크를 통해 원하는 선물을 직접 골라보세요!</option>
				                <option value="2">귀하의 생일을 진심으로 축하드립니다~! 저희가 준비한 작은 선물을 링크를 통해 직접 골라보세요!</option>
				                <option value="3">직접 입력</option>
				            </select>
				            <textarea class="form-control" id="sendMsgArea" name="notification_msg" cols="50" rows="5" style="resize: none;" placeholder="선택하세요."></textarea>
			        	</div>
			        </div>
			        <br><hr>

			        <div class="form-group row">
			        	<label class="col-md-3">결제 예정일</label>
			        	<div class="col-md-9 row">
			        		<h5><b>${b.settlement_date }</b></h5>
			        	</div>
			        </div>
			        <br><hr>
			        
			        <button type="button" class="btn btn-dark" onclick="history.back(-1)">이전으로</button>
			        
			        <button type="submit" class="btn" id="updateBirthSubs">구독 수정하기</button>
			        <button type="button" class="btn btn-dark" id="deleteBirthBtn" onclick="deleteBirthSubs();">구독 취소하기</button>
			    </form>
			    <form id="deleteSubs" action="deleteSubscribe.birth" method="post">
			    	<input type="hidden" name="bservice_no" value="${b.bservice_no }"/>
			    </form>
			</div>
		</div>
	</section>
    
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    
	<script>
		<%-- 선물 선택 알림 메시지 옵션에 따른 태그 속성 설정 --%>
		$(function(){
			
			<%-- 수정 페이지에 들어오면 기존 값을 textarea에 출력, [선택] 옵션을 선택하면 기존의 값을 출력--%>
			var notification_msg = "${b.notification_msg}";
			
			$("#sendMsgArea").attr("disabled", false);
            $("#sendMsgArea").attr("readonly", true);
            
            notification_msg = notification_msg.split('<br/>').join("\r\n");
            $("#sendMsgArea").val(notification_msg);

		    $("#sendMsg").on('change', function(){

		        var sendMsgNum = $("#sendMsg").val();
		        var sendMsg = $("#sendMsg option:checked").text();
		        
		        switch(sendMsgNum){
		        case "0" :
		            $("#sendMsgArea").attr("disabled", false);
		            $("#sendMsgArea").attr("readonly", true);
		            $("#sendMsgArea").val(notification_msg);                        
		            break;
		        case "1" :
		            $("#sendMsgArea").attr("disabled",false);
		            $("#sendMsgArea").attr("readonly",true);
		            $("#sendMsgArea").val(sendMsg);
		            break;
		        case "2" :
		            $("#sendMsgArea").attr("disabled",false);
		            $("#sendMsgArea").attr("readonly",true);
		            $("#sendMsgArea").val(sendMsg);                       
		            break;
		        case "3" :
		            $("#sendMsgArea").attr("disabled", false);
		            $("#sendMsgArea").attr("readonly", false);
		            $("#sendMsgArea").attr("placeholder", "이곳에 메시지를 입력하세요.");
		            $("#sendMsgArea").val("");                        
		            break;
		        }
		    });
		});
		
		<%-- 구독 수정하기 버튼 클릭 시 모두 입력되어야 수정되도록 설정 --%>
		$(function(){
		    $("#updateBirthSubs").click(function(){
		    	var perAmount = $("input[name='per_amount']:checked").val();
		        var sendingTime = $("input[name='sending_time']:checked").val();
		        var notificationMsg = $("textarea[name='notification_msg']").val();
		        
		        if(perAmount == null){
		            alert("1인당 최대 금액을 설정해주세요.")
		            return false;            
		        }else{
		            if(sendingTime == null){
		                alert("발송 시점을 선택해주세요.")
		                return false;
		            }else{
		                if(notificationMsg == "" || notificationMsg == null){
		                    alert("선물 선택 알림 메시지를 설정해주세요.")
		                    return false;
		                }else{
		                	var sendText = $("#sendMsgArea").val();
		    				sendText = sendText.replace(/(?:\r\n|\r|\n)/g, '<br/>');
		    				$("#sendMsgArea").val(sendText);
		                }
		            }
		        }
		    });
		    
		});
		
		<%-- 구독 취소 --%>
		function deleteBirthSubs(){
			
			var deleteYN = confirm("구독을 취소하시겠습니까?");
			
			if(deleteYN == true){
				$("#deleteSubs").submit();
			}
			
		}
	</script>
</body>
</html>