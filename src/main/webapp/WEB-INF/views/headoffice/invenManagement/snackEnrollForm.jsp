<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>품목 등록</title>

  <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    
    <style>
      .content{
            height: 100vh;
            padding: 50px 0px;
            margin-left: auto;
            margin-right: auto;
            overflow-y: auto;
        }
        
        #submitBtn{
        
        float: right;
        color: #F5D042;
        background-color: #0A174E;
        
        }
    
    </style>
</head>
<body>

<div class="container-fluid">
    	<div class="row flex-nowrap">

		<jsp:include page="../../common/sidebar.jsp"/>
		
	    <div id="formWrap" class="content col-8">

        <h2>간식품목등록</h2>

        <form id="snackEnroll" action="insert.pm" method="post" enctype="multipart/form-data">



            <table>
               <tr>
                   <td rowspan="10">
                       <br>
                       <input type="file" name="uploadFile" required="required">
                </td>
               </tr>
               <tr>
                   <td><b>상품명</b>
                    <br>
                    <input type="text" name="snackName" class="inputForm">
                    </td>
               </tr>
                 <tr>
                   <td><b>상품코드</b>
                    <br>
                    <input type="number" name="snackNo" class="inputForm" id="snackNo">
                   </td>
               </tr>
               <tr>
                   <td><b>상품단위</b>
                    <br>
                    <input type="text" name="unit" class="inputForm">
                   </td>
               </tr>
               <tr>
                    <td><b>구입가</b>
                    <br>
                    <input type="text" name="purchasePrice" class="inputForm">
                    </td>     
               </tr>
               <tr>
                     <td><b>공급가</b>
                        <br>
                        <input type="text" name="releasePrice" class="inputForm">
                     </td>
               </tr>
               <tr>
                    <td><b>카테고리</b><br>
                        <select name="categoryNo">
                            <option value="1">스낵류</option>
                            <option value="2">음료류</option>
                            <option value="3">간편식류</option>
                        </select>
                    </td>
                    
               </tr>
               <tr>
                    <td><b>세부 카테고리</b>
                        <br>
                        스낵류
                        <br>
                        <input type="radio" id ="1"name="detailNo" value="1">
                        <label for="1">스낵</label>
                        <input type="radio" id ="2"name="detailNo" value="2">
                        <label for="2">파이/비스킷</label>
                        <input type="radio" id ="3"name="detailNo" value="3">
                        <label for="3">초콜릿</label>
                        <input type="radio" id ="4"name="detailNo" value="4">
                        <label for="4">캔디</label>
                        <input type="radio" id ="5"name="detailNo" value="5">
                        <label for="5">젤리</label>
                        <br>
                        <input type="radio" id ="6"name="detailNo" value="6">
                        <label for="6">껌</label>
                        <input type="radio" id ="7"name="detailNo" value="7">
                        <label for="7">시리얼바</label>
                        </fieldset>
                        <br>
                        음료류
                        <br>
                        <input type="radio" id ="8"name="detailNo" value="8">
                        <label for="8">탄산음료</label>
                        <input type="radio" id ="9"name="detailNo" value="9">
                        <label for="9">이온음료</label>
                
                        <input type="radio" id ="10"name="detailNo" value="10">
                        <label for="10">과일음료</label>
                        <input type="radio" id ="11"name="detailNo" value="11">
                        <label for="11">에너지음료</label>
                        <input type="radio" id ="12"name="detailNo" value="12">
                        <label for="12">유산균음료</label>
                        <input type="radio" id ="13"name="detailNo" value="13">
                        <label for="13">커피</label>
  						<br>
                        간편식류
                        <br>
                        <input type="radio" id ="14"name="detailNo" value="14">
                        <label for="14">컵라면</label>
                        <input type="radio" id ="15"name="detailNo" value="15">
                        <label for="15">핫도그/소시지</label>
                        <input type="radio" id ="16"name="detailNo" value="16">
                        <label for="16">계란</label>
                        <input type="radio" id ="17"name="detailNo" value="17">
                        <label for="17">시리얼</label>
                        <input type="radio" id ="18"name="detailNo" value="18">
                        <label for="17">컵밥</label>

                    </td>
                    
               </tr>
               <tr>
                    <td><b>맛</b>
                        <br>
                        <input type="radio" id ="1"name="tasteNo" value="1">
                        <label for="1">달콤</label>
                        <input type="radio" id ="2"name="tasteNo" value="2">
                        <label for="2">짭잘</label>
                        <input type="radio" id ="3"name="tasteNo" value="3">
                        <label for="3">담백</label>
                        <input type="radio" id ="4"name="tasteNo" value="4">
                        <label for="4">고소</label>
                        <input type="radio" id ="5"name="tasteNo" value="5">
                        <label for="5">새콤</label>
                        <input type="radio" id ="6"name="tasteNo" value="6">
                        <label for="6">매콤</label>

                    </td>
               </tr>
               <tr>
                <td><b>향</b>
                    <br>
                        <input type="radio" id ="1"name="aromaNo" value="1">
                        <label for="1">꿀</label>
                        <input type="radio" id ="2"name="aromaNo" value="2">
                        <label for="2">녹차</label>
                        <input type="radio" id ="3"name="aromaNo" value="3">
                        <label for="3">커피</label>
                        <input type="radio" id ="4"name="aromaNo" value="4">
                        <label for="4">초코</label>
                        <input type="radio" id ="5"name="aromaNo" value="5">
                        <label for="5">바닐라</label>
                        <br>
                        <input type="radio" id ="6"name="aromaNo" value="6">
                        <label for="6">요거트</label>
                        <input type="radio" id ="7"name="aromaNo" value="7">
                        <label for="7">치즈</label>
                        <input type="radio" id ="8"name="aromaNo" value="8">
                        <label for="8">감자</label>
                        <input type="radio" id ="9"name="aromaNo" value="9">
                        <label for="9">고구마</label>
                        <input type="radio" id ="10"name="aromaNo" value="10">
                        <label for="10">곡물</label>
                        <br>
                        <input type="radio" id ="11"name="aromaNo" value="11">
                        <label for="11">와사비</label>
                        <input type="radio" id ="12"name="aromaNo" value="12">
                        <label for="12">양파</label>
                        <input type="radio" id ="13"name="aromaNo" value="13">
                        <label for="13">해물</label>

                </td>
                </tr>
            </table>

			<div>

           <input type="submit" value="등록하기" disabled="disabled" id="submitBtn" class="btn btn-primary">


			</div>
        </form>
        
        


    </div>
    
    	</div>
	</div>
	
	
	<script>
	
	$('#snackNo').blur(function() {
		var snackNo = $('#snackNo').val();
		console.log(snackNo);
		$.ajax({
			url : 'enrollSnackNo.im',
			type : 'post',
			data: {'snackNo' : $('#snackNo').val()	},
			success : function (data) {
				if (data === 1) {
					console.log("check1");
					alert("이미 존재하는 상품코드 입니다");
					$("#submitBtn").attr("disabled", true);
				} else if(snackNo == ""){
					console.log("check2");
					alert("상품 코드를 입력해주세요");
					$("#submitBtn").attr("disabled", true);				
					
				} else{
					$("#submitBtn").removeAttr( 'disabled' );
					
				}
				
			},
			error : function() {
				console.log("통신실패");
			}
			
			
		})
	})
	
	
	
	
	</script>

</body>
</html>