<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>커뮤니티 게시글 등록</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- smarteditor-->
  <script type="text/javascript" src="${ pageContext.servletContext.contextPath}/resources/static/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
  <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script> 
</head>
<style>
  .contain{
        background-color: rgba(245, 208, 66, 0.08);
        padding: 30px 0 30px 0 ;
    }
   .title{
        width:1250px;
        height : 30px;
        margin : 20px 0px 10px 0px;
    }
    ::placeholder{
        padding-left: 20px;
        padding-top: 40px;
    }
    h4{
        text-align: left;
        margin-left: 150px;
    }
    hr{
        width: 1250px;
        margin-bottom: -10px;
        height: 0.1px;
        background-color: black;
    }
    .chkBtn{
    	display: inline-block;
    	margin-left: 650px;
    }
	.saveBtn{
        background-color: rgb(10, 23, 78);
        color: white;
        border-style: none;
        height: 30px;
        width: 90px;
        border-radius: 10px;
        margin-right: 20px;
    }
    .backBtn{
  		background-color: rgb(245, 208, 66);
        color: white;
        border-style: none;
        height: 30px;
        width: 90px;
        border-radius: 10px;
    }
   .upfile{
       text-align: left;
       margin-right: 800px;
       margin-top: 10px;
    }
    .fileBtn{
    	border: 1px solid lightgray;
    	background-color: white;
    	width: 50px;
    	margin: 0 3px 0 0;
    	border-radius: 3px;
    }
</style>
<body>
<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
<br>
<div class="contain" >
  <form action="update.cm" method="post" id="frm" style="text-align:center;" enctype="multipart/form-data">
  <input type="hidden" name="cno" value="${ulist.communityNo }"> 
  	<h3>게시글 수정</h3>
  	<input type="text" class="title" name="title" value="${ulist.title}">
  	<div class="tarea">
    <textarea name="seContent" id="smarteditor" rows="100" cols="100" style="width:1250px; height:450px;">${ulist.content}</textarea>
    </div>
    <div>
    	<button onclick="deletefile()" class="fileBtn">파일</button>
    	${ ulist.originName }
		   <input type="file" name="reuploadFile" class="upfile">
		  <c:if test="${ !empty ulist.originName }">
	      <input type="hidden" name="changeName" value="${ ulist.changeName }" >
	      <input type="hidden" name="originName" value="${ ulist.originName }">
          </c:if>
	</div>
	</form>
	</div>
	<br>
	<div class="chkBtn">
		<input type="button" onclick="update()" value="확인" class="saveBtn">
		<input type="button" onclick="back()" value="취소" class="backBtn">
	</div>	
</body>
<!--  -->	
 <script type="text/javascript">
 		//전역변수선언 , 
	    var oEditors = [];
	     
 		//스마트 에디터 프레임 생성
	    nhn.husky.EZCreator.createInIFrame({
	        oAppRef: oEditors,
	        elPlaceHolder: "smarteditor",
	        sSkinURI: "${ pageContext.servletContext.contextPath }/resources/static/smarteditor/SmartEditor2Skin.html",
	        htParams : {
	            bUseToolbar : true,             // 툴바 사용 여부 (true:사용/ false:사용하지 않음)        
	            bUseVerticalResizer : true,    // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseModeChanger : false         // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	        }
	    });
 		
	    function update(){
	    
	    	oEditors.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD" ,[]);	
	    	
	    //	var content = $('#smarteditor').val().replace(/<p><br><\/p>/gi , "<br>"); // <p><\p> -> <br>
	    	
	    	frm.submit(); 
	    	return;
	    }
	    
	    function deletefile(){
	        if(confirm('파일을 삭제하시겠습니까?')){
	        	alert('네')
	        }else{
	        	alert('아니오')
	        }
	    	
	    }
 </script>  
 
</html>

    	