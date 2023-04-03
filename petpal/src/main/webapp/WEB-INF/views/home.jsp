<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

   
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
    

<title>Insert title here</title>
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>

    <style>
    	.swiper{
    		width:100%;
    		heigth:250px;
    	}
        .swiper-slide>img{
            width: 100%;
            height: 250px;
        }
        hr{
            background-color: #D2DAFF ;
            height: 1px;
            border: 0;
        }
        label{
            font-family: 카페24 써라운드 에어 가늘게;
            font-size: 25px;
            font-weight: bolder;
        }
        .itme>a>img{
            width: 290px;
            height: 200px;
        }
        .itmeL>a>img{
            width: 590px;
            height: 200px;
        }
        label>span{
            color: #9091E6;
            font-size: 28px;
        }
        #box{
            border: 1px solid #D2DAFF;
            border-radius: 10px;
            width: 220px;
            height: 200px;
            padding:10px;
            margin-bottom:10px;
            /* background-color: #d2daff42; */
        }
        .flex-box.item{
            flex-direction: column;
            font-size: 15px;
            margin-bottom: 50px;
            width: 200px;
            height: 300px;
            flex-grow:1;
        }
        strong{
            color: #EC6565;
            font-size: 16px;
        }
        .form-btn{
            border: 2px solid #D2DAFF;
            border-radius: 25px;
            background-color: white;
            color: #9091E6;
            padding-left: 50px;
            padding-right: 50px;
        }
        del{
        	color:darkgray;
        }
    </style>

    <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
    
    <script type="text/javascript">
        //독립형 자바스크립트 템플릿
        window.addEventListener("load", function(){
            var swiper = new Swiper('.swiper', {
                // Optional parameters
                // direction: 'vertical',
                slidesPerView :'auto' ,
                loop: true,
                autoHeight : true,

                pagination: {
                    el: '.swiper-pagination',
                    type:'bullets',
                },
                navigation: {
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
                },
                autoplay:{
                    delay:2000,
                },                
            });
        });
        </script>
        
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    <script type="text/javascript">
        $(function(){
			$("#all").click(function(){
				location.href = "/WEB-INF/views/product/list.jsp"
			});
        });
        
    </script>
</head>
<body>
	<div>
		<a href="/shop/goods/goods_list?categoryCode=1010"></a>
		<a href="/shop/goods/goods_list?categoryCode=3010"></a>
	</div>
      <div class="container-1500">
            <div class="row"> 
                <!-- Slider main container -->
                <div class="swiper">
                    <!-- Additional required wrapper -->
                    <div class="swiper-wrapper">
                        <!-- Slides -->
                        <div class="swiper-slide"><img src="https://cdnimg.dogpang.com/catpang/data/event/banner/sno_maintopnew_202206131734445.jpg" alt="네추라너리쉬"></div>
                        <div class="swiper-slide"><img src="https://cdnimg.dogpang.com/catpang/data/event/banner/sno_maintopnew_202303241300251.jpg" alt="도그팡 봄맞이 이벤트"></div>
                        <div class="swiper-slide"><img src="https://cdnimg.dogpang.com/catpang/data/event/banner/sno_maintopnew_202205101756341.jpg" alt="엘리야코리아"></div>
                        <div class="swiper-slide"><img src="https://cdnimg.dogpang.com/catpang/data/event/banner/sno_maintopnew_202301021739372.jpg" alt="네츄럴코어대용량사료"></div>
                    </div>
                    <!-- If we need pagination -->
                    <div class="swiper-pagination"></div>
                    
                    <!-- If we need navigation buttons -->
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>
                </div>
            </div>
            <div class="row flex-box" style="margin-left: 3px;">
                <div class="itmeL me-10">
                    <a href="#">
                        <img src="https://cdnimg.dogpang.com/catpang/data/event/banner/sno_center01_202301121829421.jpg" alt="청담닥터스랩 데일리솔루션">
                    </a>
                </div>
                <div class="itmeL me-10">
                    <a href="#">
                        <img src="https://cdnimg.dogpang.com/catpang/data/event/banner/sno_center01_202302161824492.jpg" alt="anf">
                    </a>
                    </div>
                <div class="itme">
                    <a href="#">
                        <img src="https://cdnimg.dogpang.com/catpang/data/event/banner/goodsno_center01_202212271757523.jpg" alt="치약">
                    </a>
                </div>
            </div>
            <div class="row flex-box" style="margin-left: 3px;">
                <div class="itme me-10">
                    <a href="#">
                        <img src="https://cdnimg.dogpang.com/catpang/data/event/banner/sno_center01_202206151136534.jpg" alt="커피트릿">
                    </a>
                </div>
                <div class="itme me-10">
                    <a href="#">
                        <img src="https://cdnimg.dogpang.com/catpang/data/event/banner/sno_center01_202301181605535.jpg" alt="덴티페어리">
                    </a>
                </div>
                <div class="itme me-10">
                    <a href="#">
                        <img src="https://cdnimg.dogpang.com/catpang/data/event/banner/sno_center01_202301181603386.jpg" alt="홀썸볼">
                    </a>
                </div>
                <div class="itme me-10">
                    <a href="#">
                        <img src="https://cdnimg.dogpang.com/catpang/data/event/banner/sno_center01_202207011329407.jpg" alt="카누들">
                    </a>
                </div>
                <div class="itme me-10">
                    <a href="#">
                        <img src="https://cdnimg.dogpang.com/catpang/data/event/banner/sno_center01_202301311410078.jpg" alt="라이프앱">
                    </a>
                </div>
            </div>
            <div class="row flex-box" style="margin-left: 3px;">
                <div class="itme me-10">
                    <a href="#">
                        <img src="https://cdnimg.dogpang.com/catpang/data/event/banner/sno_center01_202208161535599.jpg" alt="테스트">
                    </a>
                </div>
                <div class="itme me-10">
                    <a href="#">
                        <img src="https://cdnimg.dogpang.com/catpang/data/event/banner/goodsno_center01_2023010917203410.jpg" alt="비프캔">
                    </a>
                </div>
                <div class="itme me-10">
                    <a href="#">
                        <img src="https://cdnimg.dogpang.com/catpang/data/event/banner/sno_center01_2023011816475711.jpg" alt="anf">
                    </a>
                </div>
                <div class="itme me-10">
                    <a href="#">
                        <img src="https://cdnimg.dogpang.com/catpang/data/event/banner/sno_center01_2022120711305112.jpg" alt="테스트">
                    </a>
                </div>
                <div class="itme">
                    <a href="#">
                        <img src="https://cdnimg.dogpang.com/catpang/data/event/banner/sno_center01_2023010917381613.jpg" alt="테스트">
                    </a>
                </div>
            </div>
            <br>
            <br>
            <br>
            <br>
            <div class="row left">
                <label>★할인중★</label>
            </div>
            <br>

            <div class="row flex-box">

                <div class="me-20 flex-box item ">
                <a href="#">
                    <img src="${product.imageURL}" id="box">
                    <span>${ProductDto.productName}</span>
                </a>
                <span>${ProductDto.productDiscount}</span>%
                    <del>${ProductDto.productPrice}</del>
                    <strong class="price">
                    <span>${disPrice}</span>원
                    </strong>
                </div>



                 <div class="me-20 flex-box item ">
                <a href="">
                    <img src="img/discount/2.jpg" id="box">
                    <span>에티펫 손발 엉덩이 깨끗 도톰한 티슈 40매</span>
                </a>
                    <strong class="price">
                    <span>2,000</span>원
                    </strong>
                </div>

                <div class="me-20 flex-box item">
                <a href="">
                    <img src="img/discount/3.jpg" id="box">
                    <span>내츄럴코어 바이트 치킨 덕 2종 콤보</span>
                </a>
                    <strong class="price">
                    <span>10,000</span>원
                    </strong>
                </div>

                <div class="me-20 flex-box item">
                <a href="">
                    <img src="img/discount/4.jpg" id="box">
                    <span>내츄럴코어 센시티브케어 베지토퍼</span>
                </a>
                    <strong class="price">
                    <span>2,500</span>원
                    </strong>
                </div>

                <div class="me-20 flex-box item">
                <a href="">
                    <img src="img/discount/5.jpg" id="box">
                    <span>엘리야 치킨 오리 롤 베이글 대형견 4종 콤보</span>
                </a>
                    <strong class="price">
                    <span>21,000</span>원
                    </strong>
                </div>

                <div class="flex-box item">
                <a href="">
                    <img src="img/discount/6.jpg" id="box">
                    <span>[3+1] 네추라너리쉬 트릿트릭 리필 3종콤보</span>
                </a>
                    <strong class="price">
                    <span>29,700</span>원
                    </strong>
                </div>
            </div>

            <div class="row flex-box mt-40">
                <div class="me-20 flex-box item">
                <a href="">
                    <img src="img/discount/7.jpg" id="box">
                    <span>[카누들S 2p x 5개 추가증정]포켄스 덴티페어리 디스펜서 강아지 덴탈껌 SS 124개입</span>
                </a>
                    <strong class="price">
                    <span>32,000</span>원
                    </strong>
                </div>

                <div class="me-20 flex-box item">
                <a href="">
                    <img src="img/discount/8.jpg" id="box">
                    <span>내츄럴코어 센시티브케어 콩고기 48g</span>
                </a>
                    <strong class="price">
                    <span>5,000</span>원
                    </strong>
                </div>

                <div class="me-20 flex-box item">
                <a href="">
                    <img src="img/discount/9.jpg" id="box">
                    <span>펫시모 강아지 파우치 70g 6종 콤보 12개</span>
                </a>
                    <strong class="price">
                    <span>18,000</span>원
                    </strong>
                </div>

                <div class="me-20 flex-box item">
                <a href="">
                    <img src="img/discount/10.jpg" id="box">
                    <span>내추렬코어 덕스틱 오리&참치 20p</span>
                </a>
                    <strong class="price">
                    <span>15,000</span>원
                    </strong>
                </div>

                <div class="me-20 flex-box item">
                <a href="">
                    <img src="img/discount/11.jpg"id="box">
                    <span>칸타나 동결건조 치킨 연어칩 72g</span>
                </a>
                    <strong class="price">
                    <span>5,00</span>원
                    </strong>
                </div>

                <div class="flex-box item">
                <a href = "">
                    <img src="${productDto.imageURL }" id="box">
                    <span>${ProductDto.productName}</span>
                </a>
                	<span>${ProductDto.productDiscount}</span>%
                    <del>${ProductDto.productPrice}</del>
                    <strong class="price">
                    <span>${disPrice}</span>원
                    </strong>
                </div>
            </div>

            <br>
            <br>
            <div class="row center">
                <button type="submit" id="all" class="form-btn ps-50 pe-50" style="border-radius: 25px;">
                상품 전체보기
                </button>
            </div>
            <br>
            <!-- 
            <div class="row left mt-30">
                <img src="img/logo2.png" width="100" style="margin-bottom: -10px;">
                <label><span class="ms-10">펫팔</span>의 기분좋은 혜택</label>
                <hr class="mb-30">
            </div>
            <div class="row flex-box" style="width: 200px; height: 200px;">
                <img class="me-40" src="img/01.PNG">
                <img class="me-40"src="img/02.PNG">
                <img class="me-40"src="img/03.PNG">
                <img class="me-40"src="img/04.PNG">
            </div>
             -->
        </div >



<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>

