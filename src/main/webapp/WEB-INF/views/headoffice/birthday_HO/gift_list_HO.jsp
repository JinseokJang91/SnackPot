<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
<title>선물 리스트(본사)</title>
</head>
<style>
#giftContainer{
	height: 100vh;
}
#giftContainer>div{
	border-bottom: 1px solid lightgray;
}
.giftOuter{
	margin: auto;
	width: 90%;
}
#giftArea{
	height: 100vh;
	overflow: scroll;
}
#giftCount{
	color: red;
}
.giftListTop {
	display: inline-block;
}
#searchGiftArea{
	float: right;
	margin-right: 10px;
}
.giftImage{
	border-bottom: 1px solid rgb(236, 236, 236);
}
#giftBtnArea button{
	float: left;
	margin-left: 5px;
    margin-right: 5px;
}
#giftBtnArea h3{
	float:left;
}
.giftCardHeader{
	clear: both;
	padding: 0;
	text-decoration: none;
	border:0;
	background-color: white;
}
.checkArea{
	float:left;
	display: inline-block;
}
.updateGiftBtnDiv{
	float:right;
	display: inline-block;
	width:40%;
}
.updateGiftBtn{
	clear: both;
	font-size: smaller;
	width:100%;
}
#chosenGiftArea>div>div{
	border : 1px solid gray;
	margin : 1px;
}
#insertGift .input-group-prepend, #updateGift .input-group-prepend{
	width: 20%;
}
#insertGift .input-group-prepend>span, #updateGift .input-group-prepend>span{
	width: 100%;	
}
#insertGiftImgDiv, #updateGiftImgDiv{
	cursor: pointer;
}
#giftCategory a:link, #giftCategory a:visited{
	text-decoration: none;
	color: black;
}
#giftCategory a{
	cursor: pointer;
}
#seeMoreItems{
	width:250px;
	margin: auto;
	padding: 12px;
	border-radius: 2rem;
	box-shadow: none;
	border: 1px solid lightgray;
	background-color: rgb(19, 36, 114);
	color: rgb(245, 208, 66);
}
#seeMoreItems:hover{
	background-color: rgb(10, 23, 78);
	color: yellow;
}
#goTop{
	text-decoration: none;
	color: rgb(10, 23, 78);
	display:scroll;
	position:fixed;
	bottom:22px;
	right:22px;
}
</style>
<body id="giftListBody">
	<section class="giftSection">
		<div class="container-fluid" id="giftContainer">
			<div class="row flex-nowrap">
				<jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
				
				<div class="col-10" id="giftArea">
					<div class="giftOuter">
						<br id="top"><br>
						<div id="giftBtnArea">
							<h3>선물 리스트&emsp;</h3>
							<button type="button" class="btn btn-dark" id="delGiftBtn" onclick="deleteGift();">선택 삭제</button>
						    <button type="button" class="btn btn-dark" data-toggle="modal" data-target="#insertGift">추가하기</button>
						</div>
					
						<br>
						<br>
						<div>
							<div class="form-check giftListTop">
								<input type="checkbox" class="form-check-input" id="giftChk">
								<label class="form-check-label"	for="giftChk">전체 선택</label>
							</div>
							&nbsp;|&nbsp;
							<div class="giftListTop" id="giftCategory">
								<span>검색결과 <b id="giftCount"></b>개	</span>&nbsp;|&nbsp;
								<span><a id="giftCtgry1">추천상품순</a></span>&nbsp;|&nbsp;
								<span><a id="giftCtgry2">높은가격순</a></span>&nbsp;|&nbsp;
								<span><a id="giftCtgry3">낮은가격순</a></span>
							</div>
							 &emsp;&emsp;
						    <div class="giftListTop" id="searchGiftArea">
						        <span><i class="fas fa-search"></i></span>
						        <input type="text" id="search">        
						    </div>
						</div>
						<hr>
						<%-- 선택 삭제 modal --%>
						<div class="modal fade" id="deleteGift" tabindex="-1" aria-hidden="true">
					        <div class="modal-dialog modal-dialog-scrollable">
					            <div class="modal-content">
					                <div class="modal-header">
					                    <div class="modal-title" id="deleteGiftHead">선택 삭제</div>
					                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					                        <span aria-hidden="true">&times;</span>
					                    </button>
					                </div>
					                <div class="modal-body" id="chosenGiftArea">
					                	<div class="card h-100">
					                	<%-- 이곳에 ajax로 가져온 리스트 출력(선택 삭제하기 위해 체크한 품목들 정보) --%>
					                	</div>
					                </div>
					                <div class="modal-footer">
					                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취 소</button>
					                    <button type="submit" class="btn btn-primary" onclick="realDelGift();">삭 제</button>
					                </div>
					            </div>
					        </div>
					    </div>
						<%-- 수정하기 modal --%>
					    <div class="modal fade" id="updateGift" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-hidden="true">
					        <div class="modal-dialog">
					            <div class="modal-content">
					                <div class="modal-header">
					                    <div class="modal-title" id="updateGiftHead">선택 수정</div>
					                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					                        <span aria-hidden="true">&times;</span>
					                    </button>
					                </div>
					                <form id="updateGiftForm" method="post" action="updateGift.ho" enctype="multipart/form-data">
					                	<input type="hidden" name="giftNo" id="updateGiftNo"/>
					                	<div class="modal-body">
						                	<div class="card h-100">
						                        <div id="updateGiftImgDiv">
						                            <img class="card-img-top" id="updateGiftImg" alt="이미지를 등록하세요">
						                        </div>
						                        <div id="updateFileArea">
						                            <input type="file" name="updateImgFile" id="updateImgFile" accept="image/*" onchange="loadImg(this);">
						                        </div>
						                    </div>
						                    <hr>
						                    <div class="mb-3">
											  <div class="input-group is-invalid">
											    <div class="input-group-prepend">
											      <span class="input-group-text">브랜드명</span>
											    </div>
											    <input type="text" class="form-control" id="giftBrand" name="giftBrand" required>
											  </div>
											</div>
											<div class="mb-3">
											  <div class="input-group is-invalid">
											    <div class="input-group-prepend">
											      <span class="input-group-text">상품명</span>
											    </div>
											    <input type="text" class="form-control" id="giftName" name="giftName" required>
											  </div>
											</div>
											<div class="mb-3">
											  <div class="input-group is-invalid">
											    <div class="input-group-prepend">
											      <span class="input-group-text">가격</span>
											    </div>
											    <input type="text" class="form-control" id="giftPrice" name="giftPrice" required onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
											  </div>
											</div>
						                </div>
						                <div class="modal-footer">
						                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취 소</button>
						                    <button type="submit" class="btn btn-primary">수 정</button>
						                </div>
					                </form>
					            </div>
					        </div>
					    </div>
					    
						<%-- 추가하기 modal --%>
					    <div class="modal fade" id="insertGift" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-hidden="true">
					        <div class="modal-dialog">
					            <div class="modal-content">
					                <div class="modal-header">
					                    <div class="modal-title" id="updateGiftHead">추가하기</div>
					                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					                        <span aria-hidden="true">&times;</span>
					                    </button>
					                </div>
					                <form id="insertGiftForm" method="post" action="insertGift.ho" enctype="multipart/form-data">
						                <div class="modal-body">
						                    <div class="card h-100">
						                        <div id="insertGiftImgDiv">
						                            <img class="card-img-top" id="insertGiftImg" alt="이미지를 등록하세요">
						                        </div>
						                        <div id="insertFileArea">
						                            <input type="file" name="insertImgFile" id="insertImgFile" accept="image/*" onchange="loadImg(this);">
						                        </div>
						                    </div>
						                    <hr>
						                    <div class="mb-3">
											  <div class="input-group is-invalid">
											    <div class="input-group-prepend">
											      <span class="input-group-text">브랜드명</span>
											    </div>
											    <input type="text" class="form-control" id="giftBrand" name="giftBrand" required>
											  </div>
											</div>
											<div class="mb-3">
											  <div class="input-group is-invalid">
											    <div class="input-group-prepend">
											      <span class="input-group-text">상품명</span>
											    </div>
											    <input type="text" class="form-control" id="giftName" name="giftName" required>
											  </div>
											</div>
											<div class="mb-3">
											  <div class="input-group is-invalid">
											    <div class="input-group-prepend">
											      <span class="input-group-text">가격</span>
											    </div>
											    <input type="text" class="form-control" id="giftPrice" name="giftPrice" required onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
											  </div>
											</div>
						                </div>
						                <div class="modal-footer">
						                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취 소</button>
						                    <button type="submit" class="btn btn-primary" id="insertGiftBtn">추 가</button>
						                </div>
					                </form>
					            </div>
					        </div>
					    </div>
						
						<script>
							$(function(){
								<%-- 각 제품 영역에 마우스를 올리면 각 제품마다의 수정 버튼이 나타나도록 설정 --%>
								$(".updateGiftBtn").css("opacity", "0");
								
								$(".cardWholeArea").each(function(index){
									$(this).hover(function(){
										$(this).children(index).children(index).eq(1).children().css("opacity", "1.0");
										$(this).children(index).children(index).eq(1).children().attr("disabled", false);
									}, function(){
										$(this).children(index).children(index).eq(1).children().css("opacity", "0");
										$(this).children(index).children(index).eq(1).children().attr("disabled", true);
									});
								});
							});
						</script>
						
						<div class="row row-cols-1 row-cols-md-5" id="giftListArea">
							<c:forEach items="${list }" var="giftList">
								<div class="col mb-4 gift">
									<div class="card h-100 cardWholeArea">
										<div class="card-header giftCardHeader">
										<div class="form-check checkArea">
											<input type="checkbox" class="form-check-input" name="giftChk" value="${giftList.giftNo }">
										</div>
										<div class="updateGiftBtnDiv">
											<button type="button" class="btn btn-dark updateGiftBtn" name="updateGiftBtn" value="${giftList.giftNo }" data-toggle="modal" data-target="#updateGift">수정하기</button>
										</div>
										</div>
										<div class="giftImage">
											<img src="${ pageContext.servletContext.contextPath }/resources/images/${giftList.changeName}" class="card-img-top" alt="...">
										</div>
										
										<div class="card-body">
											<p class="card-title" style="font-size: large">${giftList.giftBrand }</p>
											<p class="card-text" style="height: 35%">${giftList.giftName }</p><hr>
											<p class="card-text"><b><fmt:formatNumber value="${giftList.giftPrice }" pattern="#,###" />원</b></p><br>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
					<br>
					<div style="width:250px; margin: auto;">
						<button type="button" class="btn btn-outline-secondary btn-lg" id="seeMoreItems">더보기 <span id="itemsCount"></span> / <span id="wholeItemsCount"></span></button>
					</div>
            		<a id="goTop" href="#top" data-toggle="tooltip" data-placement="top" title="맨 위로 이동"><i class="fas fa-arrow-alt-circle-up fa-3x"></i></a>
            		<br><br>
				</div>
			</div>
		</div>
		
		<%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"/>--%>
	</section>

	<script type="text/javascript">
		<%-- 화면 로딩 시 정해진 개수의 상품만 출력(20개) --%>
		function firstHideItems(){
			var firstItems = 20;
			const itemsLength = $(".gift").length;

			$("#itemsCount").html(firstItems);
			$("#wholeItemsCount").html(itemsLength);
			
			for(var i=0; i<itemsLength; i++){
				if(i < firstItems){
					$(".gift").eq(i).show();
				}else{
					$(".gift").eq(i).hide();
				}
			}
		}
		
		$(function(){
			firstHideItems();
			var visibleItems = 20;
			const itemsLnth = $(".gift").length;
			<%-- 더보기 버튼 클릭 시 실행 함수 --%>
			$(document).on('click', '#seeMoreItems',  function(){
				if(visibleItems + 20 > itemsLnth){
					visibleItems += (itemsLnth - visibleItems);
				}else{
					visibleItems += 20;
				}
				
				$("#itemsCount").html(visibleItems);
				for(var i=0; i<itemsLnth; i++){
					if(i < visibleItems){
						$(".gift").eq(i).show();
					}else{
						$(".gift").eq(i).hide();
					}
				}
			});
		});
		
		$(function(){
			<%-- 각 상품에 존재하는 수정 버튼 클릭 시 나타나는 modal에 출력할 정보 가져오기 --%>
			$(document).on('click','.updateGiftBtn', function(e){
				
				var clickVal = e.target.value;
				$("#updateGiftNo").val(clickVal);
				
				$.ajax({
					url : "selectGiftOne.ho",
					type : "POST",
					data : {
						giftNo : clickVal
					},
					success : function(result){
						var fileRoute = "${ pageContext.servletContext.contextPath }" + "/resources/images/" + result.changeName;
						
						<%--$("#updateImgFile").val(result.changeName); //DOM 오류 발생--%>
						$("#updateGiftImg").attr("src", fileRoute)
						$("#giftBrand").val(result.giftBrand);
						$("#giftName").val(result.giftName);
						$("#giftPrice").val(result.giftPrice);
					},
					error : function(error){
						alert("에러발생 : " + error);
					}
				});
			});
		});
		
		<%-- 전체 체크 설정 --%>
		$(function(){
	    	var chkRow = $("input[name='giftChk']");
	    	var rowCount = chkRow.length;
	    	
	    	<%-- 선물 사진 클릭해도 체크박스 체크되게 설정 --%>
	    	$(document).on('click','.giftImage', function(){
	    		var imgClickforChk = $(this).siblings(".giftCardHeader").children().eq(0).children();
	    		
	    		if(imgClickforChk.is(":checked")){
	    			imgClickforChk.prop("checked", false);
	    		}else{
	    			imgClickforChk.prop("checked", true);
	    		}
	    		
	    		if($("input[name='giftChk']:checked").length == rowCount){ <%--각각 체크해서 전체를 다 체크했을 때--%>
	                $("#giftChk")[0].checked = true;
	            }else{
	                $("#giftChk")[0].checked = false;
	            }
	    	});
	    	
	    	<%-- 전체 선택하면 모든 체크박스가 checked --%>
	        $("#giftChk").click(function(){
	            var chkList = $("input[name='giftChk']");
	            for(var i=0; i<chkList.length; i++){
	                chkList[i].checked = this.checked;
	            }
	        });

	        <%-- 상품 하나씩 체크했을 경우 - 하나씩 전체 다 체크했을 때 --%>
	        $(document).on('click', 'input[name="giftChk"]', function(){
	             if($("input[name='giftChk']:checked").length == rowCount){ <%--각각 체크해서 전체를 다 체크했을 때--%>
	                 $("#giftChk")[0].checked = true;
	             }else{
	                 $("#giftChk")[0].checked = false;
	             }
	        });
	    });

		<%-- 선택 삭제한 항목 데이터list modal에 불러오기 --%>
		function deleteGift(){

			var chkArr = new Array();
			var chkCount = $("input[name='giftChk']");

			for(var i=0; i<chkCount.length; i++){
				if(chkCount[i].checked){
					chkArr.push(chkCount[i].value);
				}
			}
			
			if(chkArr.length == 0){
				$("#delGiftBtn").removeAttr("data-toggle").removeAttr("data-target");
				alert("선택된 항목이 없습니다.");
			}else{
				$("#delGiftBtn").attr("data-toggle","modal").attr("data-target","#deleteGift");

				$.ajax({
					url : "checkedGiftList.ho",
					type: "POST",
					traditional : true,
					data: {
						chkArr : chkArr
					},
					success : function(data){
						var result = '';
						
						result += '<h5>총 <span id="checkedGiftNum">' + data.length + '</span>개 상품을 선택하셨습니다. 해당 상품들을 삭제하시겠습니까?</h5>';
						
						$.each(data, function(index, item){
							result += '<input type="hidden" name="delGiftNo" value="' + item.giftNo + '"/>';
							result += '<div>';
							result += '<div class="card-body">';
							result += '<h5 class="card-title"><b>' + (index+1) + '. </b>' + item.giftBrand + '</h5>';
							result += '<p class="card-text">' + item.giftName + '</p> ';
							result += '</div>';
							result += '</div>';
						});
						$("#chosenGiftArea").html(result);
					},
					error : function(error){
						alert(error);
					}
				});
			}
		}
		
		<%-- modal 데이터를 바탕으로 선택한 선물 항목 삭제하기 --%>
		function realDelGift(){
			<%-- input 히든으로 준 거 가져와볼 것!!! --%>
			var delArr = new Array();
			
			$("input[name='giftChk']:checked").each(function(){
				delArr.push($(this).val());
			});
 
			$.ajax({
				url : "deleteGift.ho",
				type : "POST",
				traditional : true,
				data : {
					delArr : delArr
				},
				success : function(result){
					if(result>0){
						location.replace("giftList.ho");
					}else{
						alert("선물 삭제에 실패했습니다.")
					}
				},
				error : function(error){
					alert(error);
				}
			});
		}
		
		<%-- 선물 사진 관련 --%>
	    $(function(){
	        $("#updateFileArea").hide();
	        $("#insertFileArea").hide();
	    });
	    <%-- 선물 이미지 클릭하면 파일 등록할 수 있도록 설정--%>
	    $("#updateGiftImgDiv").click(function(){
	        $("#updateImgFile").click();
	    });
	
	    $("#insertGiftImgDiv").click(function(){
	        $("#insertImgFile").click();
	    });
		
	    <%-- 이미지 영역을 눌러서 파일 등록하면 해당 이미지를 출력하는 함수설정 --%>
	    function loadImg(imgFile) {
			if (imgFile.files.length == 1) {
				var reader = new FileReader();
				
				reader.readAsDataURL(imgFile.files[0]);
				
				reader.onload = function(e) {
					$("#insertGiftImg").attr("src", e.target.result);
					$("#updateGiftImg").attr("src", e.target.result);
				}
			}
	    }
	    
	    <%-- 선물 검색 관련 --%>
	    $(function(){       
	
	    	<%-- 상품 총 개수 출력용 --%>
			var rowCount = $("#giftListArea").children().length;
			$("#giftCount").html(rowCount);
	    	
	        $("#search").keyup(function(){
	
	            $(".gift").hide();
	
	            var searchText = $(this).val();
	            searchText = searchText.toUpperCase();
	            
	            //var giftBrand = $(".card-body>h5:contains('"+searchText+"')");
	            var giftName = $(".card-body>p:contains('"+searchText+"')");
	            //var giftPrice = $(".card-body>h6:contains('"+searchText+"')");

	            //$(giftBrand).parent().parent().parent().show();
	            $(giftName).parent().parent().parent().show();
	            //$(giftPrice).parent().parent().parent().show();
	
				var newCount = 0;
	            
	            for(var i=0; i<rowCount; i++){
					visibleYN = $("#giftListArea").children().eq(i).is(":visible");
					
					if(visibleYN == true){
						newCount += 1;
					}
				}
		    	
		    	$("#giftCount").html(newCount);
		    	$("#seeMoreItems").hide();
		    	
		    	<%-- 검색어를 다 지웠을 때 초기 화면으로 리턴하기 위한 조건 --%>
		    	if(searchText == ""){
		    		firstHideItems();
		    		$("#seeMoreItems").show();
		    	}

	        });
	    });
	    
	    <%-- 상품 정렬(구독회사 giftList에는 세 개에서 각각 실행하는 ajax를 하나로 합쳐놓음 - 비교용) --%>
		$(function(){
			
			<%-- footer 설정 --%>
			<%-- 
			$("#footer").css("width","100%");
			$("#footer-1").css("width","100%").css("text-align","center").css("margin","auto");
			$("#footer-2").css("width","40%").css("text-align","left").css("margin","auto");
			$("#footer-2>p").css("padding-left","60px");--%>
			
			$("#giftCtgry1").css("font-weight", "bolder");
			$("#giftCtgry1").html('<i class="fas fa-check"></i>&nbsp;추천상품순');
			$("#giftCtgry2").css("font-weight", "normal");
			$("#giftCtgry2").html('높은가격순');
			$("#giftCtgry3").css("font-weight", "normal");
			$("#giftCtgry3").html('낮은가격순');
			
			$("#seeMoreItems").show();
			
			var ctgryNum;
			<%-- 추천상품순 정렬 --%>
			$("#giftCtgry1").on('click', function(){
				
				$("#giftCtgry1").css("font-weight", "bolder");
				$("#giftCtgry2").css("font-weight", "normal");
				$("#giftCtgry3").css("font-weight", "normal");
				
				$("#giftCtgry1").html('<i class="fas fa-check"></i>&nbsp;추천상품순');
				$("#giftCtgry2").html('높은가격순');
				$("#giftCtgry3").html('낮은가격순');
				
				$("#giftListArea").children().hide();
				
				$("#seeMoreItems").hide();
				ctgryNum = 1;
				
				$.ajax({
					url: "selectCtgry.ho",
					type: "POST",
					data: {
						ctgryNum : ctgryNum
					},
					success: function(data){

						var result = '';

						$.each(data, function(index, item){
							result += '<div class="col mb-4 gift">';
							result += '<div class="card h-100 cardWholeArea">';
							
							result += '<div class="card-header giftCardHeader">';
							result += '<div class="form-check checkArea">';
							result += '<input type="checkbox" class="form-check-input" name="giftChk" value="' + item.giftNo + '">';
							result += '</div>';
							result += '<div class="updateGiftBtnDiv">';
							result += '<button type="button" class="btn btn-dark updateGiftBtn" name="updateGiftBtn" value="' + item.giftNo + '" data-toggle="modal" data-target="#updateGift">수정하기</button>';
							result += '</div>';
							result += '</div>';
							result += '<div class="giftImage">'
							result += '<img src="${ pageContext.servletContext.contextPath }/resources/images/' + item.changeName + '" class="card-img-top" alt="...">';
							result += '</div>';
							result += '<div class="card-body">';
							result += '<p class="card-title" style="font-size: large">' + item.giftBrand + '</p>';
							result += '<p class="card-text" style="height: 35%">' + item.giftName + '</p><hr>';
							result += '<p class="card-text"><b>' + (item.giftPrice).toLocaleString() + '원</b></p><br>';
							result += '</div>';
							result += '</div>';
							result += '</div>';
						});
						$("#giftListArea").html(result);
						
						$("#seeMoreItems").show();
						
						$(".updateGiftBtn").css("opacity", "0");
						
						$(".cardWholeArea").each(function(index){
							$(this).hover(function(){
								$(this).children(index).children(index).eq(1).children().css("opacity", "1.0");
								$(this).children(index).children(index).eq(1).children().attr("disabled", false);
							}, function(){
								$(this).children(index).children(index).eq(1).children().css("opacity", "0");
								$(this).children(index).children(index).eq(1).children().attr("disabled", true);
							});
						});
						
						firstHideItems();
						
						$("#giftChk")[0].checked = false;<%-- 카테고리 누르면 전체체크 해제되도록 설정(전체체크만 초기화 안되므로) --%>
					},
					error: function(error){
						alert(error);
					}
				});
			});
			<%-- 높은가격순 정렬 --%>
			$("#giftCtgry2").on('click', function(){
				
				$("#giftCtgry1").css("font-weight", "normal");
				$("#giftCtgry2").css("font-weight", "bolder");
				$("#giftCtgry3").css("font-weight", "normal");
				
				$("#giftCtgry1").html('추천상품순');
				$("#giftCtgry2").html('<i class="fas fa-check"></i>&nbsp;높은가격순');
				$("#giftCtgry3").html('낮은가격순');
				
				$("#giftListArea").children().hide();
				
				$("#seeMoreItems").hide();
				ctgryNum = 2;
				
				$.ajax({
					url: "selectCtgry.ho",
					type: "POST",
					data: {
						ctgryNum : ctgryNum
					},
					success: function(data){
						var result = '';
						
						$.each(data, function(index, item){
							result += '<div class="col mb-4 gift">';
							result += '<div class="card h-100 cardWholeArea">';
							
							result += '<div class="card-header giftCardHeader">';
							result += '<div class="form-check checkArea">';
							result += '<input type="checkbox" class="form-check-input" name="giftChk" value="' + item.giftNo + '">';
							result += '</div>';
							result += '<div class="updateGiftBtnDiv">';
							result += '<button type="button" class="btn btn-dark updateGiftBtn" name="updateGiftBtn" value="' + item.giftNo + '" data-toggle="modal" data-target="#updateGift">수정하기</button>';
							result += '</div>';
							result += '</div>';
							result += '<div class="giftImage">'
							result += '<img src="${ pageContext.servletContext.contextPath }/resources/images/' + item.changeName + '" class="card-img-top" alt="...">';
							result += '</div>';
							result += '<div class="card-body">';
							result += '<p class="card-title" style="font-size: large">' + item.giftBrand + '</p>';
							result += '<p class="card-text" style="height: 35%">' + item.giftName + '</p><hr>';
							result += '<p class="card-text"><b>' + (item.giftPrice).toLocaleString() + '원</b></p><br>';
							result += '</div>';
							result += '</div>';
							result += '</div>';
						});
						$("#giftListArea").html(result);
						
						$("#seeMoreItems").show();
						
						$(".updateGiftBtn").css("opacity", "0");
						
						$(".cardWholeArea").each(function(index){
							$(this).hover(function(){
								$(this).children(index).children(index).eq(1).children().css("opacity", "1.0");
								$(this).children(index).children(index).eq(1).children().attr("disabled", false);
								
							}, function(){
								$(this).children(index).children(index).eq(1).children().css("opacity", "0");
								$(this).children(index).children(index).eq(1).children().attr("disabled", true);
							});
						});	
						
						firstHideItems();
						
						$("#giftChk")[0].checked = false;
					},
					error: function(error){
						alert(error);
					}
				});
			});
			<%-- 낮은가격순 정렬 --%>
			$("#giftCtgry3").on('click', function(){
				
				$("#giftCtgry1").css("font-weight", "normal");
				$("#giftCtgry2").css("font-weight", "normal");
				$("#giftCtgry3").css("font-weight", "bolder");
				
				$("#giftCtgry1").html('추천상품순');
				$("#giftCtgry2").html('높은가격순');
				$("#giftCtgry3").html('<i class="fas fa-check"></i>&nbsp;낮은가격순');
				
				$("#giftListArea").children().hide();
				
				$("#seeMoreItems").hide();
				ctgryNum = 3;

				$.ajax({
					url: "selectCtgry.ho",
					type: "POST",
					data: {
						ctgryNum : ctgryNum
					},
					success: function(data){
						var result = '';
						
						$.each(data, function(index, item){
							result += '<div class="col mb-4 gift">';
							result += '<div class="card h-100 cardWholeArea">';
							
							result += '<div class="card-header giftCardHeader">';
							result += '<div class="form-check checkArea">';
							result += '<input type="checkbox" class="form-check-input" name="giftChk" value="' + item.giftNo + '">';
							result += '</div>';
							result += '<div class="updateGiftBtnDiv">';
							result += '<button type="button" class="btn btn-dark updateGiftBtn" name="updateGiftBtn" value="' + item.giftNo + '" data-toggle="modal" data-target="#updateGift">수정하기</button>';
							result += '</div>';
							result += '</div>';
							result += '<div class="giftImage">'
							result += '<img src="${ pageContext.servletContext.contextPath }/resources/images/' + item.changeName + '" class="card-img-top" alt="...">';
							result += '</div>';
							result += '<div class="card-body">';
							result += '<p class="card-title" style="font-size: large">' + item.giftBrand + '</p>';
							result += '<p class="card-text" style="height: 35%">' + item.giftName + '</p><hr>';
							result += '<p class="card-text"><b>' + (item.giftPrice).toLocaleString() + '원</b></p><br>';
							result += '</div>';
							result += '</div>';
							result += '</div>';
						});
						$("#giftListArea").html(result);
						
						$("#seeMoreItems").show();
						
						$(".updateGiftBtn").css("opacity", "0");
						
						$(".cardWholeArea").each(function(index){
							$(this).hover(function(){
								$(this).children(index).children(index).eq(1).children().css("opacity", "1.0");
								$(this).children(index).children(index).eq(1).children().attr("disabled", false);
								
							}, function(){
								$(this).children(index).children(index).eq(1).children().css("opacity", "0");
								$(this).children(index).children(index).eq(1).children().attr("disabled", true);
							});
						});
						
						firstHideItems();
						
						$("#giftChk")[0].checked = false;
					},
					error: function(error){
						alert(error);
					}
				});
			});
		});
	</script>
</body>
</html>