<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <title>커뮤니티 게시글 등록</title>
    <!-- smarteditor -->
  <script type="text/javascript" src="${ pageContext.servletContext.contextPath}/resources/static/smarteditor/js/service/HuskyEZCreator.js" charset="utf-8"></script>
  <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
</head>
<style>
    /* 글작성 바탕 DIV*/
    .contain{
        background-color: rgba(245, 208, 66, 0.08);
        padding: 30px 0 30px 0 ;
    }
    .title{
        width:1250px;
        height : 40px;
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
    /*버튼*/
    .wbtn{
        padding: 50px 0 50px 42%;
        float: left;
    }
    .saveBtn{
        background-color: rgb(10, 23, 78);
        color: white;
        border-style: none;
        height: 30px;
        width: 90px;
        border-radius: 10px;
    }
    .backBtn{
        background-color: rgb(245, 208, 66);
        color: white;
        border-style: none;
        height: 30px;
        width: 90px;
        border-radius: 10px;
    }
    /*file*/
    .upfile{
       text-align: left;
       margin-right: 954px;
       margin-top: 10px;
    }

</style>
<body>
<jsp:include page="/WEB-INF/views/common/menubar.jsp" />

<div class="contain" >
 <form action="insert.cm" method="post" id="frm" style="text-align:center;" enctype="multipart/form-data" >
        <h4>글쓰기</h4>
        <hr>
        <input type="text" class="title" name="title"  placeholder="제목을 입력해주세요." >
     <div class="tarea">
      <textarea name="seContent" id="smarteditor" rows="100" cols="100" style="width:1250px; height:450px;" placeholder="내용을 입력해주세요."></textarea>
    </div>
      <div>
      <input type="file" name="uploadFile" class="upfile">
      </div>
       <div class="wbtn">
           <input type="button" onclick="save()" value="등록" class="saveBtn">&nbsp;&nbsp;
           <input type="button" onclick="back()" value="취소" class="backBtn">
      </div>
    </form>
</div>
 
</body>

 <script type="text/javascript">
 		//전역변수선언 , 
	    var oEditors = [];
	     
 		//스마트 에디터 프레임 생성
	    nhn.husky.EZCreator.createInIFrame({
	        oAppRef: oEditors,
	        elPlaceHolder: "smarteditor",
	      	sSkinURI: "${ pageContext.servletContext.contextPath }/resources/static/smarteditor/SmartEditor2Skin.html",
	      	 // sSkinURI: "${ pageContext.servletContext.contextPath }/resources/static/smarteditor2/SmartEditor2Skin.html", 
	        htParams : {
	            bUseToolbar : true,             // 툴바 사용 여부 (true:사용/ false:사용하지 않음)        
	            bUseVerticalResizer : false,    // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseModeChanger : false         // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	        }
	    });
 		
	    function save(){
	    
	    	oEditors.getById["smarteditor"].exec("UPDATE_CONTENTS_FIELD" ,[]);	
	    	
	    //	var content = $('#smarteditor').val().replace(/<p><br><\/p>/gi , "<br>"); // <p><\p> -> <br>
	    	
	    	frm.submit(); 
	    	return;
	    }
	    
	    function back(){
	    	location.href = "list.cm"
	    }
	    
 </script>  
 	
</html>

	