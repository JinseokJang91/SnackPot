<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
         <!--<link rel="stylesheet" href="resources/css/snackPotMainView.css">  -->  
</head>
<style>
/*간식 ,생일 구독 배너*/
.img1{
    height: 580px;
    text-align: center;
   
}
.carousel-caption>h1{
    font-weight: bold;
   
}

.carousel-caption {
    margin-bottom: 180px;
    margin-right: 500px;
    color: black;
}

/*스낵구독, 생일구독 버튼*/
.carousel-caption>.snackBtn , .hbdkBtn{
    margin-left: 33%;
   
}
a.animated-button.thar-three {
	color: rgb(245, 208, 66);
    background-color: rgb(10, 23, 78);
    font-size: 18px;
    width: 150px;
    height: 40px;
	cursor: pointer;
	display: block;
	position: relative;
	transition: all 0.5s cubic-bezier(0.42, 0, 0.58, 1);
    border-radius: 5px;
}
a.animated-button.thar-three:hover {
	color: rgb(10, 23, 78) !important;
	background-color: transparent;
	text-shadow: nthree;
}
a.animated-button.thar-three:hover:before {
	left: 0%;
	right: auto;
	width: 100%;
}
a.animated-button.thar-three:before {
	display: block;
	position: absolute;
	top: 0px;
	right: 0px;
	height: 100%;
	width: 0px;
	z-index: -1;
	content: '';
	color: #000 !important;
	background: rgb(245, 208, 66);
	transition: all 0.5s cubic-bezier(0.42, 0, 0.58, 1);
    border-radius: 5px;
}
/*홈페이지 내용*/
.snackPotName{
    color:rgb(245, 208, 66);
    font-weight: bolder;
}
/*스낵팟 이유*/
.question>h4{
    text-align: center;
    margin-bottom: 25px;
    font-weight: bolder;
}
body{
    margin-top:20px; 
}
.m-t-5{
    margin-top: 5px;   
}
.card {
    background: #fff;
    margin-bottom: 30px;
    transition: .5s;
    border: 1px solid lightgray;
    border-radius: 1.5em;
    display: inline-block;
    position: relative;
    width: 100%;
    box-shadow: none;
}
.card .body {
    font-size: 14px;
    color: black;
    padding: 20px;
    font-weight: 400;
}
.queTxt{
    text-align: left;
    font-size: medium;
}
.col-md-8{
    padding-top: 30px;
}
.profile-page .profile-header {
    position: relative
}
.profile-page .profile-header .profile-image img {
    border-radius: 50%;
    width: 120px;
    box-shadow: 0 3px 6px rgba(0, 0, 0, 0.16), 0 3px 6px rgba(0, 0, 0, 0.23);
}
.card-img-top1{
    width: 250px;
    margin-left: 50px;
}
/*생일*/
.bDiv1 ,.bDiv2{
border-radius: 5px;
background-color: rgba(245, 208, 66, 0.08);
}
.bimg1{
    width: 50%;
    border-radius: 5px;
   
}
.bimg2{
    width: 50%;
    height: 250px;
    margin-left: 126px;
    border-radius: 5px;
}
/*생일팟 이미지 옆 텍스트*/
.bl1{
    margin-left: 140px;
    font-size:18px;
}
.bl2{
    margin-left: 60px;
    font-size: 18px;
}
/*생일 4컷 이미지*/
.partnerImg{
    margin-left: 20%;
}
.partnerLb{
    margin-left: 30%;
}
.b4Img{
    text-align: center;
}
.card{
    margin-right: 15px;
    margin-top:20px;
}
.bnumber{
    font-weight: bold;
    font-size: 20px;
    color:rgb(245, 208, 66);
}
.percentImg > label{
    text-align: center;
    margin: 7px 100px 0 70px;
    padding-left: 100px;
    font-weight: bold;
}
/*스낵서비스 이미지 사진*/
.snackServiceImg{
    width: 500px;
    border-radius: 2px;
}
.snack4Img{
    margin-bottom: 20px;
    margin-top: 10px;
}
.serviceNumber{
    color:rgb(245, 208, 66);
    font-weight: bold;
    margin-right: 10px;
}
.card-title{
    font-weight: bolder;
}
.card.snackCard, .card.HBD{

	display: inline-block;
}
</style>
<body>  
<jsp:include page="common/menubar.jsp"/>
    <!--carousel-->
    <div id="demo" class="carousel slide" data-ride="carousel">

        <!-- Indicators -->
        <ul class="carousel-indicators">
          <li data-target="#demo" data-slide-to="0" class="active"></li>
          <li data-target="#demo" data-slide-to="1"></li>
        </ul>
      
        <!-- The slideshow -->
        <!--스낵 구독-->
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="${ pageContext.servletContext.contextPath }/resources/images/common/간식구독배너.jpg" class="img1">
            <div class="carousel-caption banner-img1">
                <h1 style="color: black;">간식의 공식, 스낵팟</h1>
                <p style="color: black;">NO.1 맞춤형 간식구독 서비스</p><br>
                <div class="col-md-3 col-sm-3 col-xs-6 snackBtn"> 
                    <a href="subsForm.sn" class="btn btn-sm animated-button thar-three">구독하기</a>
                </div>
              </div>
          </div>
          <!--생일 구독-->
          <div class="carousel-item">
            <img src="${ pageContext.servletContext.contextPath }/resources/images/common/생일구독배너.png" class="img1">
            <div class="carousel-caption banner-img1">
                <h1 style="color: black;">1년의 단하루,</h1>
                <p style="color: black;">직원의 행복한 생일을 만들어주는 구독서비스</p><br>
                <div class="col-md-3 col-sm-3 col-xs-6 hbdkBtn"> 
                    <a href="subscribeForm.birth" class="btn btn-sm animated-button thar-three ">구독하기</a>
                </div>
              </div>
          </div>
        </div>
      
        <!-- Left and right controls -->
        <a class="carousel-control-prev" href="#demo" data-slide="prev">
          <span class="carousel-control-prev-icon"></span>
        </a>
        <a class="carousel-control-next" href="#demo" data-slide="next">
          <span class="carousel-control-next-icon"></span>
        </a>
      </div>
      <br><br><br><br>
      <!--스낵팟 설명(부가설명)-->
      <div class="container-fluid" style="width: 90%;">
          <h1><label class="snackPotName">스낵팟</label>은 기업 복지 니즈에<br>맞춰 다양한 서비스를 제공합니다</h1>
          <br><br>
        <!--스낵팟이 필요한 이유-->
        <div class="question"><h4>이러한 고민들 스낵팟으로 해결하세요!</h4></div>
          <div class="container profile-page">
            <div class="row">
                <div class="col">
                    <div class="card profile-header">
                        <div class="body">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="profile-image float-md-right"><img src="${ pageContext.servletContext.contextPath }/resources/images/common/물음표1.png" style="padding: 30px;"> </div>
                                </div>
                                <div class=" col-md-8 ">
                                    <span class="queTxt">담당직원이 매일 탕비실을 채워넣기도 힘들고 지속적인 관리 해주는 곳은 없을까?</span>
                                </div>                
                            </div>
                        </div>                    
                    </div>
                </div>
            <div class="col">
                <div class="card profile-header">
                    <div class="body">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="profile-image float-md-right"> <img src="${ pageContext.servletContext.contextPath }/resources/images/common/물음표1.png" style="padding: 30px;"> </div>
                            </div>
                            <div class="col-md-8">
                                <span class="queTxt">직원들의 복지를 효율적으로 관리할수있는 서비스가 없을까?</span>
                            </div>                
                        </div>
                    </div>                    
                </div>
                </div>
            </div>
         </div>
        <br><br><br>
         <!--사무실 간식 서비스 비교 설명-->
         <div>
            <div><h3><strong>첫번째</strong>.&nbsp; 간식구독 서비스</h3><p></p>
                <h4><label style="color: rgb(245, 208, 66);"><strong>스낵팟</strong></label>은 사무실 간식 서비스를 제공합니다.</h4><br>
                <div>
                <div class="card snackCard" style="width: 40rem; height: 20rem;">
                    <div class="card-body">
                      <h4 class="card-title"><label class="serviceNumber">01.</label> 기업별 맞춤 간식 서비스</h4>
                        <img  src="${ pageContext.servletContext.contextPath }/resources/images/common/예산.svg" class="snack4Img">
                      <p class="card-text">
                          <strong> 예산 ,간식 선호도,배송일만 보내주세요!</strong><br>
                          <strong>스낵팟</strong>의 축적된 노하우와 데이터를 기반으로 고객사에 최적화된 맞춤 상품을<br> 추천해드립니다.
                      </p>
                    </div>
                  </div>
                  <div class="card snackCard" style="width: 40rem;height: 20rem;">
                    <div class="card-body">
                      <h4 class="card-title"><label class="serviceNumber">02.</label> 간편한 간식 담기서비스</h4>
                      <img  src="${ pageContext.servletContext.contextPath }/resources/images/common/시간.svg" class="snack4Img">
                      <p class="card-text">
                           스낵팟은 언제 어디서든 관리할수있는 <strong>온라인 시스템</strong>입니다.<br>
                           간식 관리 외의 본 업무로 바쁜 와중에 시간을 내지 않아도
                          출.퇴근길/주말/저녁등<br> 여유로운 시간대에 <strong>어디서든 간식을 담고 확인</strong>할수 있습니다.
                      </p>
                    </div>
                  </div>
                  <div class="card snackCard" style="width: 40rem; height: 20rem;">
                    <div class="card-body">
                      <h4 class="card-title"><label class="serviceNumber">03.</label> 다양한 간식종류</h4>
                      <img  src="${ pageContext.servletContext.contextPath }/resources/images/common/스낵.svg" class="snack4Img">
                      <p class="card-text">
                          스낵팟의 비전은<br> <strong>'국내 유통되는 모든 간식중, 고객정보에 맞는 간식을 다양하게 제공하자'</strong>입니다.<br>
                          간식종류의 세분화와 1000개 종 이상의 상품을 제공하며 '질린다'라는 피드백을 가장 두려워하는 만큼, <strong>간식 얼리어답터</strong>로 만들어드리겠습니다.
                      </p>
                    </div>
                  </div>
                  <div class="card snackCard" style="width: 40rem; height: 20rem;">
                    <div class="card-body">
                      <h4 class="card-title"><label class="serviceNumber">04.</label> 서비스 만족도</h4>
                      <div>
                        <img  src="${ pageContext.servletContext.contextPath }/resources/images/common/간식피드백.svg" class="snack4Img">
                      <p class="card-text">
                           <strong>상품,피드백 등 서비스 운영 관리가 잘될까 고민하시나요?</strong><br>
                           스낵팟은 고객사마다 <strong>일대일</strong>로 배정되는 전담 매니저를 통해<br>
                           간식 선호도, 운영에 대한 불편함 피드백 수집과 반영 등 서비스의 전 과정을<br><strong>직접 운영 및 관리</strong>합니다.
                      </p>
                    </div>
                    </div>
                  </div>
			</div>
                  <br> <br> <br>
                  <h2 style="text-align: center;"><strong>스낵팟</strong>은 편의점 대비 &nbsp;<label style="color:rgb(245, 208, 66);">20% ~ 30%</label><br>더 저렴하게 제공합니다 </h2><br>
                  <div style="text-align: center;">
                    <img class="card-img-top1"  src="${ pageContext.servletContext.contextPath }/resources/images/common/메인스낵류.jpg"> 
                    <img class="card-img-top1"  src="${ pageContext.servletContext.contextPath }/resources/images/common/메인음료.jpg" >
                    <img class="card-img-top1"  src="${ pageContext.servletContext.contextPath }/resources/images/common/메인간편식.jpg" >
                    <div class="percentImg"><label>스낵</label><label>음료</label><label>간편식</label></div>
                </div>
            </div>
            <br><br><br><br><br>
            <!--생일 서비스 비교 설명-->
            <div><h3><strong>두번째</strong>.&nbsp; 생일구독 서비스</h3></div>

            <div><h4>직원의 <label style="color: rgb(245, 208, 66);"><strong>생일날</strong></label>, 우리 회사는 어떤가요?</h4></div><br>
            <div class="bDiv1">
              <img  src="${ pageContext.servletContext.contextPath }/resources/images/common/생일사진2.png" class="bimg1">
              <label class="bl1">챙기긴 하는데 매번 기억하기 힘들어 잊기도 하나요?</label>
            </div>

            <div class="bDiv2">
              <label class="bl2">잘하고 있는데, 시간과 비용을 아끼고 싶다고 생각하시나요?</label>
              <img  src="${ pageContext.servletContext.contextPath }/resources/images/common/생일사진3.png" class="bimg2">
            </div>
            <br><br><br><br><br>

            <!--생일 구독4컷-->
            <div><h4><strong><label style="color: rgb(245, 208, 66);">스낵팟</label>이 직원의 생일을 챙겨드릴게요.</strong></h4></div><br>
          <div class="b4Img">
            <div class="card HBD" style="width: 18rem;">
              <img class="card-img-top HBD"  src="${ pageContext.servletContext.contextPath }/resources/images/common/생일01.jpg" alt="생일01">
              <div class="card-body">
                <p class="card-text"><strong>직원들의 생일만 알려주세요</strong></p>
                <hr>
                <div class="bnumber">01</div><br>
                <p>직원들의 생일과 받을 날짜만 <br>등록하면 그다음은 스낵팟이<br> 다 알아서 챙길게요.</p>
              </div>
            </div>
            <div class="card HBD" style="width: 18rem; height: auto;" >
              <img class="card-img-top HBD"  src="${ pageContext.servletContext.contextPath }/resources/images/common/생일02.png" alt="생일02">
              <div class="card-body">
                <p class="card-text"><strong>선물을 알아서 보내드릴게요</strong></p>
                <hr>
                <div class="bnumber">02</div><br>
                <p>케이크, 기프티콘, 상품권등 <br>원하는 선물을 선택하세요.<br> 1만원부터 시작할수있어요</p>
              </div>
            </div>
            <div class="card HBD" style="width: 18rem; height: auto;">
              <img class="card-img-top HBD"  src="${ pageContext.servletContext.contextPath }/resources/images/common/생일03.jpg" alt="생일03">
              <div class="card-body">
                <p class="card-text"><strong>직원에게 행복을 드릴게요</strong></p>
                <hr>
                <div class="bnumber">03</div><br>
                <p>선물과 함께 따뜻한 메세지와<br> 작은선물을 추천드릴게요.<br>이회사를 다니는것이 기쁠거예요.</p>
              </div>
            </div>
            <div class="card HBD" style="width: 18rem; height: auto;">
              <img class="card-img-top HBD"  src="${ pageContext.servletContext.contextPath }/resources/images/common/생일04.jpg" alt="생일04">
              <div class="card-body">
                <p class="card-text"><strong>비용과 시간을 아끼세요</strong></p>
                <hr>
                <div class="bnumber">04</div><br>
                <p>직접 생일을 기억하지않아도,매번 선물을 사러 다니지 않아도 돼요.<br>스냇팟이 무료로 대신해드릴게요.</p>
              </div>
            </div>
          </div>
            <br> <br><br><br><br>
            <div class="partnerLb"><h4><strong><label style="color: rgb(245, 208, 66);">스낵팟</label>은 업계의 리더기업들과 함께 만들어 갑니다!</strong></h4></div>
            <br>
            <img class="partnerImg"  src="${ pageContext.servletContext.contextPath }/resources/images/common/제휴기업.png" alt="제휴기업">
            <br> <br> <br> <br>
          	
      </div>
      <jsp:include page="common/footer.jsp"/>
</body>
</html>