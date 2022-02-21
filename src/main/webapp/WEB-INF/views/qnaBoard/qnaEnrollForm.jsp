<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 작성</title>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
 	#enrollForm>table{width:100%;}
    #enrollForm>table *{ margin:5px;}
      
 .content{
            height: 100vh;
            padding: 50px 0px;
            margin-left: auto;
            margin-right: auto;
            overflow-y: auto;
        }
        
                
        #btn1{

        color: #F5D042;
        background-color: #0A174E;
 }
 
   #btn2{

        color: #F5D042;
        background-color: #0A174E;
 }
        
        }
</style>
</head>

<body>
    <jsp:include page="../common/menubar.jsp"/>

    <div class="content col-8">
        <br><br>
        <div class="innerOuter">
            <h2>문의 작성하기</h2>
            <br>
			
            <form id="enrollForm" method="post" action="insert.qna" enctype="multipart/form-data">
                <table align="center">
                    <tr>
                        <th><label for="title">제목</label></th>
                        <td><input type="text" id="title" class="form-control" name="qTitle" required value="문의합니다" maxlength="20"></td>
                    </tr>
               
                    <tr>
                        <th><label for="upfile">첨부파일</label></th>
                        <td><input type="file" id="upfile" class="form-control-file border" name="uploadFile"></td>
                    </tr>
                    <tr>
                        <th colspan="2"><label for="content">내용</label></th>
                    </tr>
                    <tr>
                        <th colspan="2"><textarea class="form-control" required name="qContent" id="content" rows="10" style="resize:none;"></textarea></th>
                    </tr>
                </table>
                <br>
				<div align="right" id="content_cnt">(0 / 500)</div>
                <div align="center">
                    <button type="submit" class="btn" id="btn1">등록하기</button>
                    <button type="reset" class="btn" onclick="javascript:history.go(-1);" id="btn2">취소하기</button>
                </div>
            </form>
        </div>
        <br><br>
    </div>
    
    <script type="text/javascript">
  
    $(document).ready(function() {
        $('#content').on('keyup', function() {
            $('#content_cnt').html("("+$(this).val().length+" / 500)");
     
            if($(this).val().length > 500) {
                $(this).val($(this).val().substring(0, 500));
                $('#test_cnt').html("(500 / 500)");
            }
        });
    });
    
    </script>

    <jsp:include page="../common/footer.jsp"/>
</body>
</html>