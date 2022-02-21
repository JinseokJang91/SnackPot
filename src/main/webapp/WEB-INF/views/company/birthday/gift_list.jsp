<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%--
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
--%>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
<link rel="stylesheet" type="text/css" href="resources/css/giftList.css">
<link rel="shortcut icon" href="#">
<title>선물 리스트</title>
</head>
<style>
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
<body id="giftListBody">

	<jsp:include page="/WEB-INF/views/common/menubar.jsp"/>

	<section>
		<div class="container-fluid" id="giftContainer">
			<br><br>
			<a id="tip" tabindex="0" class="btn" role="button" data-toggle="popover" data-placement="left" data-trigger="focus" 
			title="선물리스트 추가 기능" data-content="상품에 마우스를 올리면 나타나는 아이콘을 클릭해 원하는 선물리스트에 추가할 수 있어요!">TIP</a>
			<br><br>
			
			<div id="giftFuncArea">
				<div class="giftListTop" id="giftSearchArea">
					<span style="font-size: large;">검색결과 <b id="giftCount"></b>개</span>&nbsp;&nbsp;&nbsp;
					<div class="searchDiv" id="searchDiv">
						<input type="text" id="searchInput" placeholder=" 결과 내 재검색">
				        <span><i class="fas fa-search"></i></span>&nbsp;&nbsp;
					</div>
				</div>
				<div class="giftListTop" id="giftCategory">
				 	<%-- 스크립트에서 a태그 안에 값을 넣기 때문에 a태그에 텍스트를 빼도 되긴함 --%>
					<span><a id="giftCtgry1">추천상품순</a></span>&nbsp;|&nbsp;
					<span><a id="giftCtgry2">높은가격순</a></span>&nbsp;|&nbsp;
					<span><a id="giftCtgry3">낮은가격순</a></span>
				</div>
				 &emsp;&emsp;
			</div>
			<hr>
	
			<div class="row row-cols-1 row-cols-md-5" id="giftListArea">
				<c:forEach items="${list }" var="giftList">
					<div class="col mb-4 gift">
						<div class="card h-100 cardWholeArea">
							<div>
							<h5 class="cardHead" id="cardHeader" style="text-align: center;">&emsp;</h5>
							<input class="getChangeName" type="hidden" value="${giftList.changeName}"/>
							<img src="${ pageContext.servletContext.contextPath }/resources/images/${giftList.changeName}" class="card-img-top" alt="...">
							</div>
							
							<div class="card-body">
								<p class="card-title" style="font-size: large">${giftList.giftBrand }</p>
								<p class="card-text" style="height: 35%">${giftList.giftName }</p><hr>
								<p class="card-text"><b><fmt:formatNumber value="${giftList.giftPrice }" pattern="#,###" />원</b></p><br>
							</div>
							<div class="cardOuter" id="cardOuter">
								<div class="cardInner">
									<div>
										<button type="button" class="addGift" value="${giftList.giftNo }" data-toggle="modal" data-target="#addGiftModal">
											<i class="fas fa-folder-plus fa-3x" data-toggle="tooltip" data-placement="top" title="폴더에 저장"></i>
										</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>

		<div class="modal fade" id="addGiftModal" tabindex="-1" aria-hidden="true">
		    <div class="modal-dialog modal-dialog-scrollable modal-lg">
		        <div class="modal-content">
		            <div class="modal-header">
		                <div class="modal-title">선물 담기</div><!--텍스트 가운데로-->
		                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                    <span aria-hidden="true">&times;</span>
		                </button>
		            </div>
		            <div class="modal-body">
		                <div class="input-group" id="addGiftFolder">
			                <input type="text" class="form-control" name="folderName" size="12" maxlength="10" placeholder="새 폴더" required/>
		                    
		                    <div class="input-group-append"><!-- 왼쪽 div pointer로 바꾸고 클릭 이벤트 설정-->
		                        <span class="input-group-text" id="addFolder" style="cursor: pointer;">&emsp;생 성&emsp;</span>
		                    </div>
		                </div><hr>
		
		                <div class="accordion" id="giftAccordion">
		                    <ul class="list-group" id="folderUlTag" style="list-style: none;">
		                    	<%-- 선물 폴더 리스트 ajax로 출력되는 부분 --%>
		                    </ul>
		                </div><hr>   
		            </div>
		        </div>
		    </div>
		</div>
		<br>
		<div style="width:250px; margin: auto;">
			<button type="button" class="btn btn-outline-secondary btn-lg" id="seeMoreItems">더보기 <span id="itemsCount"></span> / <span id="wholeItemsCount"></span></button>
		</div>
		<a id="goTop" href="#top" data-toggle="tooltip" data-placement="top" title="맨 위로 이동"><i class="fas fa-arrow-alt-circle-up fa-3x"></i></a>
		<br><br><br>
	</section>
	
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	<script>
		<%-- footer 설정 --%>
		$(function(){
			$("#footer").css("margin-top","150px");
		});
	</script>
	
	<script type="text/javascript">
		
		<%-- BEST 상품의 changeName을 담은 array --%>
		var bestItemsArray;
		<%-- 익명함수 사용해서 best 상품 골라내기 --%>
		(function getBestItems(){		
			bestItemsArray = new Array();
			
			for(var i=0; i<5; i++){
				$(".cardHead").eq(i).html("<span>B</span><span>E</span><span>S</span><span>T</span><span>!</span>");
				bestItemsArray.push($(".cardHead").eq(i).siblings("input[class='getChangeName']").val());
			}
			
			return bestItemsArray;
		}());
		
		$(function () {
			<%-- 팝오버 TIP 실행 함수 --%>
			$('[data-toggle="popover"]').popover();
		});
		
		<%-- 카테고리별 상품 리스트 출력 함수 --%>
		function selectCategory(categoryNum){
			
			var result = '';
			
			$.ajax({
				url: "selectCtgry.birth",
				type: "POST",
				data: {
					ctgryNum : categoryNum
				},
				success: function(data){
					
					$.each(data, function(index, item){
						result += '<div class="col mb-4 gift">';
						result += '<div class="card h-100 cardWholeArea">';
						result += '<div>';
						result += '<h5 class="cardHead" id="cardHeader" style="text-align: center;">&emsp;</h5>';
						result += '<input class="getChangeName" type="hidden" value="' + item.changeName + '"/>';
						result += '<img src="${ pageContext.servletContext.contextPath }/resources/images/' + item.changeName + '" class="card-img-top" alt="...">';
						result += '</div>';
						result += '<div class="card-body">';
						result += '<p class="card-title" style="font-size: large">' + item.giftBrand + '</p>';
						result += '<p class="card-text" style="height: 35%">' + item.giftName + '</p><hr>';
						result += '<p class="card-text"><b>' + (item.giftPrice).toLocaleString() + '원</b></p><br>';
						result += '</div>';
						
						result += '<div class="cardOuter" id="cardOuter">';
						result += '<div class="cardInner">';
						result += '<div><button type="button" class="addGift" value="' + item.giftNo + '" data-toggle="modal" data-target="#addGiftModal">';
						result += '<i class="fas fa-folder-plus fa-3x" data-toggle="tooltip" data-placement="top" title="폴더에 저장"></i>';
						result += '</button></div>';
						result += '</div></div>';
						
						result += '</div>';
						result += '</div>';
					});
					$("#giftListArea").html(result);
					
					<%-- for문을 통해 배열 내의 changeName과 item의 changeName을 각각 비교해 해당 상품에 BEST 문구가 들어가게 설정 --%>
					$.each(data, function(index, item){
						for(var i=0; i<bestItemsArray.length; i++){
							if(item.changeName == bestItemsArray[i]){
								$("input[value='"+bestItemsArray[i]+"']").siblings("h5").html("<span>B</span><span>E</span><span>S</span><span>T</span><span>!</span>");
							}
						}
					});
					
					$("#seeMoreItems").show();
					
					<%-- 각 카드 감싸는 outer(폴더 아이콘 들어가는 부분) --%>
					$(".cardOuter").css("opacity","0");
					
					<%-- 각 상품에 마우스 올리면 선물리스트 추가하는 아이콘 보이게 설정 --%>
					$(".gift").each(function(index){
						$(this).hover(function(){
							$(this).children(index).children(index).eq(2).css("opacity","1.0");
						}, function(){
							$(this).children(index).children(index).eq(2).css("opacity","0");
						});
					});
					
					firstHideItems();
				},
				error: function(error){
					alert(error);
				}
			});
		}

		<%-- 상품 정렬 --%>
		$(function(){
			
			$("#giftCtgry1").css("font-weight", "bolder");
			$("#giftCtgry1").html('<i class="fas fa-check"></i>&nbsp;추천상품순');
			$("#giftCtgry2").css("font-weight", "normal");
			$("#giftCtgry2").html('높은가격순');
			$("#giftCtgry3").css("font-weight", "normal");
			$("#giftCtgry3").html('낮은가격순');
			
			$("#seeMoreItems").show();

			var ctgryNum;
			<%-- (1) 추천상품순 --%>
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

				selectCategory(ctgryNum);
			});
			<%-- (2) 높은가격순 --%>
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

				selectCategory(ctgryNum);
			});
			<%-- (3) 낮은가격순 --%>
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

				selectCategory(ctgryNum);
			});
		});
		
	    <%-- 선물 검색 관련 --%>
	    $(function(){     
	    	<%-- 상품 총 개수 출력용 --%>
			var rowCount = $("#giftListArea").children().length;
			$("#giftCount").html(rowCount);
	    	
	        $("#searchInput").keyup(function(){
	            $(".gift").hide();
	
	            var searchText = $(this).val();
	            searchText = searchText.toUpperCase(); <%-- 등록되는 상품 정보에 포함된 알파벳은 전부 대문자이므로 대문자로 검색 --%>
	            
	            <%-- h5,h6를 p로 다 바꿔서 하나만 있어도 됨 --%>
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
	    
	    <%-- 각 제품 영역에 마우스를 올리면 아이콘이 각각 뜨도록 설정--%>
	    $(function(){
			$(".cardOuter").css("opacity","0");
			
			$(".gift").each(function(index){
				$(this).hover(function(){
					$(this).children(index).children(index).eq(2).css("opacity","1.0");
				}, function(){
					$(this).children(index).children(index).eq(2).css("opacity","0");
				});
			});
		});
	    
	</script>

	<script>
		$(function(){
			$("#searchInput").focus(function(){
				$("#searchDiv").css("border","2px solid gray");
			});
			
			$("#searchInput").blur(function(){
				$("#searchDiv").css("border","1px solid lightgray");
			});
		});
		<%-- # modal에 폴더 리스트를 출력하기 위한 함수 --%>
		function selectFolderList(){
			
			$.ajax({
				url: "selectFolderList.birth",
				type: "POST",
				data :"",
				success: function(list){
					
					var result = '';
					
					$.each(list, function(index, item){
						result += '<li class="list-group-item d-flex justify-content-between align-items-center" style="padding-top: 0; padding-bottom: 0; height: 3rem; cursor: default;">';
						result += '<div class="giftListFolder" style="width: 25%; height: 100%; display: flex; align-items: center;">';
						result += '<button class="giftIcon" type="button" value="' + (index+1) + '" data-toggle="collapse" data-target="#giftCollapse' + (index+1) + '" aria-expanded="false" style="outline: none; border: none; background: white;">';
						result += '<input class="glistNo" type="hidden" value="' + item.glistNo + '"/>';
						result += '<i class="fas fa-folder" id="GIFT' + (index+1) + '" style="color: gold; cursor: pointer;" data-toggle="tooltip" data-placement="top" title="담은 목록 보기"></i></button>';
						result += '<span>&ensp;' + item.glistName + '</span></div>';
						
						result += '<div class="folderRight">';
						result += '<input class="folderNo" type="hidden" value="' + item.glistNo + '"/>';
						result += '<input class="folderRowNum" type="hidden" value="' + (index+1) + '"/>';
						result += '<span class="badge badge-primary badge-pill folderBadge" style="cursor: pointer; width: 28px; margin-right: 7px;" data-toggle="tooltip" data-placement="top" title="폴더에 담기">' + item.folderGiftCount + '</span>';
						result += '<i class="fas fa-times folderTimes" style="cursor: pointer;"></i></div></li>';
						result += '<li id="giftCollapse' + (index+1) + '" class="collapse" data-parent="#giftAccordion">';
						result += '<div style="padding: 1.5rem;">';
						result += '<table class="table folderTable">';
						result += '<thead class="thead-dark">';
						result += '<tr>';
						result += '<th scope="col" style="width: 10%;">번호</th>';
						result += '<th scope="col" style="width: 20%;">이미지</th>';
						result += '<th scope="col" style="width: 18%;">브랜드명</th>';
						result += '<th scope="col" style="width: 40%;">상품명</th>';
						result += '<th scope="col" style="width: 12%;">가격(원)</th>';
						result += '</tr>';
						result += '</thead>';
						result += '<tbody class="folderInfoBody" id="folderInfoBody' + (index+1) + '">';
						result += '</tbody>';
						result += '</table>';
						result += '</div>';
						result += '</li>';
					});
					$("#folderUlTag").html(result);
				},
				error: function(error){
					alert(error);
				}
			});
		}
		
		<%--2. 선택한 제품 원하는 폴더에 추가 기능 (뱃지 클릭해서 추가) --%>
		$(function(){
			<%-- 화면 로딩 시 선물 리스트 데이터 조회해둠(modal창에 바로 화면에 나올 수 있게) --%>
			selectFolderList();

	    	<%-- (1) 각 상품 클릭하면 해당 GIFT_NO 값을 giftNo에 삽입 --%>
	    	var giftNo;
	    	$(document).on('click', '.addGift', function(e){
	            giftNo = e.currentTarget.value;
	    	});
	    	
	    	<%-- (2) 뱃지 클릭 시 중복체크 후 뱃지 숫자 증가시킴 --%>
            $(document).on('click','.folderBadge', function(){
            	<%-- 
            	thisTag : 태그를 ajax로 가지고 들어가기 위해 변수로 선언(여기서는 span 태그를 의미)
            	folderGiftCnt : 뱃지(span태그)를 클릭하면 상품이 들어가 +1이 되어야 하므로 기존 값에 +1을 한 값을 이 변수에 대입
            	--%>
            	var thisTag = $(this);
            	var folderGiftCnt = parseInt($(this).html()) + 1;
            	
            	<%-- 선택한 폴더의 glistNo을 가져오기위해 siblings() 활용해 input[type='hidden']의 val값을 가져옴 --%>
            	var glistNo = $(this).siblings(".folderNo").val();
            	var folderRowNum = $(this).siblings(".folderRowNum").val();
            	var detailArr = new Array();
            	detailArr.push(glistNo);
            	detailArr.push(giftNo);
            	
            	<%-- (2-1) 중복 데이터가 들어가지 못하게 먼저 체크 --%>
            	$.ajax({
            		url: "checkDuplicate.birth",
            		type: "POST",
            		traditional: true,
            		data:{
            			detailArr : detailArr
            		},
            		success: function(result){
            			if(result > 0){
            				alert("이미 해당 기프티콘 정보가 존재합니다.");
            				return false;
            			}else{
            				<%-- (2-2) 폴더에 데이터 추가와 뱃지 숫자 증가 처리 --%>
        	            	$.ajax({
        	            		url: "addGiftDetail.birth",
        	            		type: "POST",
        	            		traditional: true,
        	            		data:{
        	            			detailArr : detailArr
        	            		},
        	            		success: function(result){
        	            			if(result > 0){
        	            				thisTag.html(''+folderGiftCnt);
            	            			selectFolderInfo(folderRowNum);
        	            			}
        	            		},
        	            		error: function(error){
        	            			alert(error);
        	            		}
        	            	});
            			}
            		},
            		error: function(error){
            			alert(error);
            		}
            	});	
	    	});
            <%-- 폴더 삭제 함수 --%>
            $(document).on('click','.folderTimes', function(){
            	var folderNo = $(this).siblings(".folderNo").val();
            	
            	if(folderNo == 'FOLDER0'){
            		alert("기본 폴더는 삭제할 수 없습니다.");
            	}else{
            		var confirmVal = confirm("정말 삭제하시겠습니까?");
                	if(confirmVal == true){
                		$.ajax({
                    		url: "delGiftFolder.birth",
                    		type: "POST",
                    		data: {
                    			glistNo : folderNo
                    		},
                    		success: function(result){
                    			selectFolderList();
                    		},
                    		error: function(error){
                    			alert(error);
                    		}
                    	});
                	}else{
                		alert("삭제가 취소되었습니다.")
                	}
            	}
            });
	    });
		
		<%-- # 각 폴더에 속한 상품 리스트 출력 --%>
		function selectFolderInfo(rowNumVal){

			$.ajax({
				url: "selectFolderInfo.birth",
				type: "POST",
				data:{
					rowNum : rowNumVal
				},
				success: function(list){

					var result='';
					
					if(list.length != 0){
						$.each(list, function(index, item){
							var price = (item.giftPrice).toLocaleString();

							result += '<tr>';
							result += '<th scope="row" style="text-align:center;">';
							result += '<input class="delGiftNo" type="hidden" value="' + item.giftNo + '"/>';
							result += '<i class="fas fa-times delFolderDetail" style="cursor: pointer; float:left;"></i>' + (index+1) + '</th>'
							result += '<td><img class="folderGiftImg" width="50%" height="50%" src="${ pageContext.servletContext.contextPath }/resources/images/' + item.changeName + '"></td>';
							result += '<td>' + item.giftBrand + '</td>';
							result += '<td>' + item.giftName + '</td>';
							result += '<td>' + price + '</td>';
							result += '</tr>';
						});
					}else{
						result += '<tr><td colspan="5"><h5>추가된 상품이 존재하지 않습니다.</h5></td></tr>';
					}
					$("#folderInfoBody"+rowNumVal).html(result);
				},
				error: function(error){
					alert(error);
				}
			});
		}
		
		<%-- 4. 선택한 폴더 내 리스트 조회 기능 --%>
		$(function(){

			$(document).on('click', '.giftIcon', function(e){
				<%-- 
	        	e.currentTarget : button 태그 -> value값 추출 가능
	        	e.target : i 태그
	        	--%>
	        	
	        	<%-- 폴더 아이콘 변경 코드 --%>
				var iconClickYN = $(this).attr("aria-expanded");

            	if(iconClickYN == "false"){
		            $(this).children().removeClass().addClass('fas fa-folder');
		        }else{
		        	<%-- collapse를 연 요소만 폴더 아이콘이 변하게 설정 --%>
		        	$(".giftIcon").children().removeClass().addClass('fas fa-folder');
		            $(this).children().removeClass().addClass('fas fa-folder-open');
		        }
				
            	<%-- ================================================================================== --%>
				
            	<%-- 폴더 클릭 시 기프티콘 목록 출력 코드 --%>
            	
				<%-- button value값을 status.count로 구해서 쿼리문에서 WHERE절의 ROWNUM 값으로 활용(GIFT_LIST 테이블)--%> 
				
				<%-- 폴더 새로 추가 시 e.currentTarget.value 값이 undefined가 되므로 이거로 구하는건 안될 것 같고,
					length값으로 targetVal 설정 후 rowNumVal이 null일 때 targetVal에 + 1을 하면
					원하는 값을 얻을 수 있음
				--%>
				var targetVal = $(".giftIcon").length;
				
				var rowNumVal = e.currentTarget.value;
				
				<%-- selectFolderList 함수를 따로 만들었기 때문에 필요없어짐
				if(rowNumVal == null){
					rowNumVal = targetVal + 1;
				}
				console.log(rowNumVal);
				--%>
				
				<%-- 
				폴더 내 상품 삭제를 위해 glistNo을 먼저 구한 후 함수로 값을 넘겨줌 
				var glistNo = $(this).children().eq(0).val();
				--%>
				
				selectFolderInfo(rowNumVal);
			});
		});
	
		$(function(){
			<%-- 폴더 삭제하는 x 아이콘에 마우스 올릴 때 색 변경 --%>
			$(".delFolderDetail").hover(function(){
				$(".delFolderDetail").css("color","red");
			});
		});
		
		$(function(){
			<%-- 폴더 상세 테이블에서 기프티콘 삭제할 때 실행되는 함수 --%>
			$(document).on('click','.delFolderDetail', function(){
				var thisBadge = $(this).parents("li").prev().find("span:eq(1)");
				
				var delGlistNo = $(this).parents("li").prev().find("button[class='giftIcon']").children().eq(0).val();
				var delRowNumVal = $(this).parents("li").prev().find("input[class='folderRowNum']").val();
				var delGiftNo = $(this).siblings(".delGiftNo").val();
				
				var delGiftArr = new Array();
				delGiftArr.push(delGlistNo);
				delGiftArr.push(delGiftNo);
				
				$.ajax({
					url: "delFolderDetail.birth",
					type: "POST",
					traditional: true,
					data : {
						delGiftArr : delGiftArr
					},
					success: function(result){						
						var badgeCount = thisBadge.html();
						thisBadge.html(badgeCount-1);
						selectFolderInfo(delRowNumVal);
					},
					error: function(error){
						alert(error);
					}
				});
			});
		});

	    <%-- 1. 폴더 추가 기능 --%>
	    $(function(){
	    	
	    	$(document).on('click','#addFolder',function(e){

	    		var fName= $("input[name='folderName']").val();
	    		
	    		$.ajax({
	    			url: "addGiftFolder.birth",
	    			type: "POST",
	    			data: {
	    				folderName : fName
	    			},
	    			success: function(data){

	    				<%-- 폴더 생성 후에는 text를 비워줌 --%>
	    				$("input[name='folderName']").val("");
	    				
	    				<%-- 
	    				ul내부 li개수를 구해서 modal id뒤의 count를 지정 - 한 항목당 li태그가 두 개 들어있으므로 나누기 2를 해야함. 그 다음 인덱스를 대입하기 위해 +1
	    				--%>
	    				var liCount = $("#folderUlTag").children().length/2 + 1;
	    				
	    				var result = '';
	    				
	    				if(data != ""){
	    					selectFolderList();
		    				selectFolderInfo(liCount);
	    				}else{
	    					alert("폴더명을 입력하세요.");
	    				}
	    			},
	    			error: function(error){
	    				console.log(error);
	    			}
	    		});
	    	});
	    });
	    	
	    <%-- 화면 로딩 시 정해진 개수만 출력(20개) --%>
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
					visibleItems += (itemsLnth - visibleItems)
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
	</script>
</body>
</html>