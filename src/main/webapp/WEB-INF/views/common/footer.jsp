<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    /* div{border:1px solid red;} */
    #footer{
        width:90%;
        height:200px;
        margin:auto;
        margin-top:10px;
    }

    #footer-2{
        width:100%;
        height:80%;
    }
    #footer-1, #footer-2{
        padding-left:50px
    }

    #footer-1 > a{
        text-decoration:none;
        font-weight: 600;
        margin:10px;
        line-height: 40px;
        color: black;
    }
    #footer-2>p{
        margin: 0;
        padding:10px;
        font-size: 13px;
    }
    #p2{
        text-align:center;
    }
</style>
</head>
<body>
	<hr>
	<div id="footer">
        <div id="footer-1">
            <a href="#">이용약관</a> | 
            <a href="#">개인정보취급방침</a> | 
            <a href="#">구독하기</a> | 
            <a href="#">문의하기</a> 
        </div>

        <div id="footer-2">
            <p id="p1">
                	주식회사 스낵팟 대표이사 탕비실수호대 사업자등록번호 2021-12-00025 <br>
          			본사 : 서울특별시 용산구 한강대로 100 스낵팟<br>
          			물류 : 서울 금천구 가산디지털1로 119 , sk트윈B동 B119호 물류센터<br>
       				서비스신청문의 : snackpotservice@snackPot.com
       				마케팅 제휴 : snackpotmarketing@snackPot.com
            </p>
            <p id="p2"> ⓒ 1945 office pantry guard zzang All Right Reserved</p>     
        </div>
    </div>
</body>
</html>