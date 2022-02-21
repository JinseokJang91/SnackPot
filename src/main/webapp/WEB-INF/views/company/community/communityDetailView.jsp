<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>communityDetail</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
</head>
<style>

    #smarteditor{
         border : 1px solid;
         height:450px;
         width: 1250px; 
         margin: 0 auto;
    }

    ::placeholder{
        padding-left: 20px;
        padding-top: 40px;
    }
    .btn{
        margin-left: 80px;
        text-align: center;
    }
 
    hr{
        width: 1250px;
        height: 0.1px;
        margin-top: 10px;
        background-color: black;
    }
      
        
    .dbtn{
        float: left;
        margin-left: 80px;
        margin-top: 7px;
    }
    .topLine{
        margin-bottom: -12px;
        text-align: right;
        margin-right: 80px;
    }
    /*커뮤니티 제목라벨*/
	.titleLb{
		float: left;
		margin-left: 100px;
	}
    /*조회수*/
	.viewsDiv{
		display: inline-block;
		margin-left: 55%;
		margin-bottom: -10px;
		padding-top: 6px;
	} 
     /*추천,비추천 버튼*/
    .recommendBtn{
        text-align: center;
        margin-top: 60px;
    }
    .reBtn{
        margin-right: 30px;
        border-radius: 50%;
        border-style: none;
        font-size: 20px;
        color: red;
    }
    .nreBtn{
        border-radius: 50%;
        border-style: none;
        font-size: 20px;
    }
     /*첨부파일*/
    .attachmentfile{
       margin-left: 75%;
       width: 200px;

    }
 
    /*수정 삭제btn*/
    .update ,#addReply{
        background-color: rgb(10, 23, 78);
        color: white;
        border-style: none;
      	height: 30px;
   		width: 90px;
        border-radius: 10px;
    }
    .deleteCmnt{
        background-color: rgb(245, 208, 66);
        color: white;
        border-style: none;
       	height: 30px;
   		width: 90px;
        border-radius: 10px;
        margin-top: 8px;
    }
    .back{
        background-color: rgb(245, 208, 66);
        margin-top: 15px;
        color: white;
        border-style: none;
        height: 30px;
    	width: 90px;
        border-radius: 10px;
    }
    #addReply{
        margin-left: 165px;
    }
    /*댓글창*/
    .form-control{
        margin-left: 100px;
    }
    .fa-comment-dots{
        font-size: 20px;
        background-color: rgba(10, 23, 78, 0.18);
        color: black;
        border-style: none;
        height: 30px;
        width: 120px;
        border-radius: 4px;
        text-align: center;
        padding: 0 10px 0 10px;
    }
    
    /*append css*/
    /*수정버튼*/
    .updateReply, .deleteReply  , .reReplyAdd ,.deleteReReplyBtn{
    	border: 1px solid lightgray;
    	background-color: white;
    	width: 50px;
    	margin: 0 3px 0 0;
    	border-radius: 3px;
    }
    /* 수정완료 버튼*/
    #updateComment{
    	background-color: white;
    	color: rgb(10, 23, 78);
  		height: 30px;
    	width:80px;
    	border-radius: 3px;
    }
   /*부모댓글*/
  /*댓글안 날짜*/
  .replyDate{
  	float: right;
	font-size: 12px;
	color: gray;
	margin-top: 4px;

  }
  /*부모댓글 */
  .replyContent1{
  	display: inline-block;
  	margin-left: 40px;
  }
  /*댓글수정 창*/
  #reContent2{
  	margin-left: 200px;
  	margin-right : 10px;
  	width: 580px;
  	height: 35px;
  	border-radius: 2px;
  }
  /*답글 */
  .rereplyTd{
  	width: 16%;

  }
  .rereplyName{
  	margin-left: 35px;
  	
  }
  /*답글의 화살표*/
  .imgArrow{
  	width: 10px;
  	height: 10px;
  	margin-right: 5px;
  	margin-bottom: 9px;
  }
  /*답글*/ 
  #reReContent2{
  	width: 450px;
  	height: 35px;
  }
 #reReplyBtn{
     background-color: rgb(10, 23, 78);
     color: white;
     border-style: none;
     height: 30px;
     width: 90px;
     border-radius: 10px;
 	
 }		
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	<br>
<div class="content" style="padding-left: 5%; padding-right: 5%;">
	<form action="insert.cm" method="post" id="frm" style="text-align: center;" enctype="multipart/form-data">
	<br><br>
			<div class="titleDiv"><label class="titleLb"><h5>${dlist.title}</h5></label></div>
			<div class="viewsDiv"><label class="viewsLb1">조회</label>&nbsp;&nbsp;<label class="viewsLb2">${dlist.views}</label>&nbsp;&nbsp;<label>||&nbsp;&nbsp;${dlist.writerDate}</label></div>
	
		<hr>
		<div>
			 	<c:if test="${ !empty dlist.originName }">
                    <label class="attachmentfile">
                     [파일]
                     <a href="${ pageContext.servletContext.contextPath }/resources/upload_files/cmntAttachment/${dlist.changeName}" download="${ dlist.originName }">${ dlist.originName }</a>
                  </label> 
                 </c:if>
		</div>
		<div class="tarea">
			<div name="seContent" id="smarteditor">${dlist.content}</div>
		</div>
		</form>
		<div>
			<c:if test="${ loginUser.memId eq dlist.writer }">
				<div class="dbtn"><!-- form에다 넣으면 안된다 inser.cm탐 -->
					<button class="update" value="${dlist.communityNo }" onclick="update(this.value)">수정</button>
					<button class="deleteCmnt" value="${dlist.communityNo }" onclick="deleteCmnt(this.value)">삭제</button>
				</div>
			</c:if>
				<div class="topLine">
					<button class="back" onclick="javascript:history.go(-1);">취소</button>
				</div>
		</div>
	<br>
	<!--추천 비추천 버튼-->
	<div class="recommendBtn">
		<label>${dlist.recommend}</label>
		<button class="reBtn" onclick="recommend(this.value)" value="${dlist.communityNo}">
			<i class="far fa-thumbs-up"></i>
		</button>
		<button class="nreBtn" onclick="n_recommend(this.value)" value="${dlist.communityNo}">
			<i class="far fa-thumbs-down"></i>
		</button>
		<label>${dlist.n_recommend}</label>
	</div>
	<br>
	<br>
	<!-- 댓글!! -->
	<div class="replyContain" style="padding: 0 4% 0 4%">
	<button class="far fa-comment-dots" onclick="selectReplyList()">댓글</button>
 		<table id="replyArea" class="table">
                <thead>
                    <tr style="background-color: rgba(10, 23, 78, 0.18);">
	                        <th colspan="4" style="width:75%" >
	                            <input type="text" class="form-control" id="replyContent"  style="resize:none; width:100%" placeholder="댓글을 입력해주세요.">
	                        </th>
	                        <th style="vertical-align: middle"><button id="addReply" onclick="addReply()">등록하기</button></th>
                    </tr>
                </thead>
                <tbody>  
                    
                </tbody>
         </table>
      </div>
     <div class="reReplyModal">
     
     </div>
	</div>
	</div>
</div>
	<br><br><br><br>
</div>
</body>
<script>
	/*수정폼으로*/
	function update(val) {
		const cno = val;
		//alert(cno)
		location.href = "updateForm.cm?cno=" + cno;
	}
	/*게시글 삭제하기*/
	function deleteCmnt(val) {
		const cno = val;
		
		
		if(confirm("정말 삭제하시겠습니가?")){
			location.href = "delete.cm?cno=" + cno;
			$.ajax({
				url : "delete.cm",
				type : "post",
				data : {cno : cno},
				success:function(){
					alert("삭제되었습니다.")
				}
			})
		}else{
			return;
		}
	}

	/*게시글 조회수 , 추천수*/
	function recommend(val) {
		const cno = val;
		console.log(cno)

		$.ajax({
			url : "plusCount.recommend",
			data : {
				cno : cno
			},
			type : "post",
			success : location.reload()
		})
	}

	function n_recommend(val){
		const cno = val;

		$.ajax({
			url : "plusCount.n_recommend",
			data : {
				cno : cno
			},
			type : "post",
			success : location.reload()
		})
	}
	
	//댓글
	function selectReplyList(){ 
		var cno = ${dlist.communityNo};
		$.ajax({
			url:"reList.cm",
			data:{cno:cno},
			type:"get",
			success:function(list){
				console.log(list)
				$("#rcount").text(list.length);
				
				var value="";
				$.each(list, function(index, obj){
					
					if("${loginUser.memId}" == obj.reWriter && obj.reGroups == 0 && obj.reContent != '-1'){ //글작성자가 본인 && 부모댓글
						value += "<tr class='replyParent'>";
					    value += "<td  style='width: 13%'>" + '익명' + "<label class='replyDate'>" + obj.reDate + "</label>" + "</td>" +
								 "<td style='width: 50%' class='replyContent'>" +"<label class='replyContent1'>" + obj.reContent + "</label>" +"</td>" + 
								 "<td></td>"+
						 	  	 "<td></td>"+
								 "<td style='width: 40%' ><input type='button' value='수정' class='updateReply' data_num='"+obj.reNo+"'data_text='"+obj.reContent+"'data_index='"+index+"'>"+
								 "<input type='button' value='삭제' class='deleteReply' data_num="+obj.reNo+" data_reGroup="+obj.reGroup+">"+
								 "<input type='button' value='답글' class='reReplyAdd' data_num="+obj.reNo+" data_index="+index+" data_text="+obj.reContent+" data_reGroup="+obj.reGroup+" data_reGroupDept="+obj.reGroupDept+" data-toggle='modal' data-target='#myModal"+index+"'></td>"+
								 "</tr>";
					 	
						value += "<tr><td colspan='5'><div id='updateCommentFormDiv"+index+"'></div></td></tr>";
								 console.log(obj.reContent)
					}else if(obj.reGroups == 1 && "${loginUser.memId}" != obj.reWriter){ //자식댓글
						value += "<tr>";
						value += "<td class='rereplyTd'>" +  "<label class='rereplyName'>" + "<img class='imgArrow' src='${ pageContext.servletContext.contextPath }/resources/images/common/화살표.png'>"+'익명'+"</label>" + "<label class='replyDate'>" + obj.reDate + "</label>" + "</td>" +
								 "<td style='width: 50%' class='replyContent'>" +"<label class='replyContent1'>" + obj.reContent + "</label>" +"</td>" + 
					   			 "<td></td>"+
						 	  	 "<td></td>"+
						 	  	 "</tr>";	 
						}else if("${loginUser.memId}" != obj.reWriter && obj.reGroups == 0 && obj.reContent != '-1'){ //부모댓글 && 작성자가 다름
							value += "<tr class='replyParent'>";
							value += "<td  style='width: 13%'>" + '익명' + "<label class='replyDate'>" + obj.reDate + "</label>" + "</td>" +
							 "<td style='width: 50%' class='replyContent'>" +"<label class='replyContent1'>" + obj.reContent + "</label>" +"</td>" + 
							 	 "<td></td>"+
					 	  	 	 "<td></td>"+
								  "<td>"+
								  "<input type='button' value='답글' class='reReplyAdd' data_num="+obj.reNo+" data_index="+index+" data_text="+obj.reContent+" data_reGroup="+obj.reGroup+" data_reGroupDept="+obj.reGroupDept+" data-toggle='modal' data-target='#myModal"+index+"'></td>"+
							 	  "</tr>";
									 value += "<tr>";
									 value += "<td><div id='updateCommentFormDiv"+index+"'></div></td>";
									 console.log(obj.reContent)
							}else if("${loginUser.memId}" == obj.reWriter && obj.reGroups == 1){ //자식댓글 이고 작성자가 본인일때
								value += "<tr>";
								value += "<td class='rereplyTd'>" +  "<label class='rereplyName'>" + "<img class='imgArrow' src='${ pageContext.servletContext.contextPath }/resources/images/common/화살표.png'>"+'익명'+"</label>" + "<label class='replyDate'>" + obj.reDate + "</label>" + "</td>" +
										 "<td style='width: 50%' class='replyContent'>" +"<label class='replyContent1'>" + obj.reContent + "</label>" +"</td>" + 
										 "<td></td>"+
										 "<td><input type='button' value='삭제' class='deleteReReplyBtn' data_num="+obj.reNo+"></td>" + 
								 	  	 "</tr>";	
							}else if(obj.reGroups == 0 && obj.reContent == '-1'){
								value += "<tr class='replyParent'>";
								value += "<td  style='width: 13%'>" + '익명' + "<label class='replyDate'>" + obj.reDate + "</label>" + "</td>" +
										 "<td style='width: 50%' class='replyContent'>" +"<label class='replyContent1'>" + '(   삭제된 댓글입니다.  )' + "</label>" +"</td>" + 
										 "<td></td>"+
								 	  	 "<td></td>"+
										 "</tr>";
							}
					});
				$("#replyArea tbody").html(value).trigger("create");
				
				//댓글 삭제
				 $('.deleteReply').on('click', function(){
					 var reNo = $(this).attr('data_num'); 
					 var reGroup = $(this).attr('data_reGroup');
					 var cno = ${dlist.communityNo};
					 console.log("삭제할 부모댓글 " + reGroup)
					 console.log("삭제할 댓글번호 : " + reNo)
					 console.log("삭제할 cno : " + cno)
					   $.ajax({
		                    
		                    url : "deleteReply.cm",
		                    type : "post",
		                        
		                    data :{
		                    	
		                    	reNo : reNo,
		                    	reGroup : reGroup,
		                    	cno : cno
		                    },
		                    success : function(){
		                        alert("삭제되었습니다.");
		                        selectReplyList();
		                    },
		                    error : function(error){
		                        console.log(error);
		                    }
		                    
		                });
		            
		            });//댓글삭제 function끝

				},error:function(){
				console.log("댓글 리스트 가져오기 실패");
			}
		});
	}
	
	//댓글달기
	function addReply(){
		var  cno = ${dlist.communityNo};

			if($("#replyContent").val().trim().length != 0){
				
				$.ajax({
					url:"reinsert.cm",
					type:"post",
					data:{
						  reContent:$("#replyContent").val(),
						  cno: cno,
						  reWriter:"${loginUser.memId}"
						  },
					success:function(result){
						if(result > 0){
							$("#replyContent").val('');
							selectReplyList();
							
						}else{
							alert("댓글등록실패");
						}
					},error:function(){
						console.log("댓글 작성 ajax 통신 실패");
					}
				});
				
			}else{
				alert("댓글을 입력해주세요");
			}
			
		}
	
	// 댓글 수정
	$(function(){
		$(document).on('click', '.updateReply', function(){
			 var reNo = $(this).attr('data_num');
			 var reContent = $(this).attr('data_text');
			 var index = $(this).attr('data_index');
			 console.log("수정할 번호 : " + reNo); 
			 console.log("수정할 내용 : " + reContent);
			 console.log("수정할 댓글 인덱스 : " + index);

				value =  '<input type="hidden" id ="reNo"  value="'+reNo+'">';
			    value += '<input type="text" id ="reContent2"  value="'+reContent+'">';
			    value += '<input type="button" value="수정완료" id="updateComment" > ';

	     		   
		 $('#updateCommentFormDiv'+index).html(value).trigger("create");
	 	console.log("value값 : " + '#updateCommentFormDiv'+index)
	 		
		$('#updateComment').on('click', function(){
			var reNo = $('#reNo').val();
			var reContent = $('#reContent2').val();
			
		console.log("reNo ==>" + reNo);
		console.log("reContent ==>" + reContent);
		
		$.ajax({
			
			url : "reupdate.cm",
			data :{ 
				reNo : reNo,
				reContent : reContent
			},
			type : "get",
			success : function(){
				alert("수정이 완료되었습니다.")
				selectReplyList();

			}
			
		})

	})

	})
	})//댓글수정 function끝
	
	//답글 달기
	$(function(){
	$(document).on('click', '.reReplyAdd', function(){
		
		 var index = $(this).attr('data_index');
		 var reNo = $(this).attr('data_num');
		 var reContent = $(this).attr('data_text');
		 var reGroup = $(this).attr('data_reGroup');
		 console.log("답글달 댓글 번호 : " + reNo);
		 console.log("답글달 댓글 인덱스 : " + index);
		 console.log("답글달 댓글 reGroup : " + reGroup);
		
		 
		   
			value  =  "<div class='modal fade' id='myModal"+index+"'>"
			value +=  "<div class='modal-dialog'>" +
		         	 "<div class='modal-content'>";
		          
		   
		    value += "<div class='modal-header'>"+
		    		 '<input type="hidden" id ="reNo"  value="'+reNo+'">'+
		    		 '<input type="hidden" id ="reGroup"  value="'+reGroup+'">'+
		             '<label><h5>답글</h5></label>'+
		              "<button type='button' class='close' data-dismiss='modal'>×</button>"+
		             "</div>";
		            
		            
		   value += "<div class='modal-body'>"+
		              "<input type='text' id='reReContent2'>"+
		            "</div>";
		            
		           
		  value += "<div class='modal-footer'>"+
		              "<button type='button' data-dismiss='modal' id='reReplyBtn'>작성</button>"+
		            "</div>"+
		         "</div></div></div>";
	      
	          	$('.reReplyModal').html(value);
	        	$("#myModal"+index).modal();
	        	//console.log(value);
	
	       	$('#reReplyBtn').on('click', function(){
  			var reRecontent = document.getElementById('reReContent2').value;
  			var reGroup = $('#reGroup').val();
  			var  cmntNo = ${dlist.communityNo};
  			console.log('답글 내용 : '  +  reRecontent);
  			console.log('답글달 reGroup : '  +  reGroup);
  			console.log('답글달 cmntNo : '  +  cmntNo);
  			
  			$.ajax({
  				
  				url:"insertReReply.cm",
  				data:{
  					reRecontent : reRecontent,
  					reGroup : reGroup,
  					cmntNo : cmntNo
  					
  				},
  				type : "get",
  				success : function(){
  					alert("답글작성 성공")
  					$("#reReContent2").val('');
        			selectReplyList();
  				}
  				
  			});
  			
  		})//답글 작성하기 끝
	        	
	})
})//답글달기function 끝
	

	//답글 삭제
	$(function(){
	$(document).on('click', '.deleteReReplyBtn', function(){
		 var reNo = $(this).attr('data_num');
	
			console.log("삭제할 답글번호 : "  + reNo);
		if(confirm("삭제하시겠습니까?")){
			
			$.ajax({
				url : "deleteReReply.cm",
				data :{
					reNo : reNo
				},
				type: "post",
				success:function(){
					alert("삭제되었습니다.")
					selectReplyList();
				}
			})
			
			
		}else{
			alert("삭제를 취소하였습니다.")
		}
			
		})
	})//답글 삭제function끝
</script>

</html>

        	