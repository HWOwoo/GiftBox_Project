<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Main</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script>
        /* When the user clicks on the button, 
        toggle between hiding and showing the dropdown content */
        function myFunction() {
            document.getElementById("myDropdown").classList.toggle("show");
        }
        
        // Close the dropdown if the user clicks outside of it
        window.onclick = function(e) {
          if (!e.target.matches('.dropbtn')) {
        
            var dropdowns = document.getElementsByClassName("dropdown-content");
            for (var d = 0; d < dropdowns.length; d++) {
              var openDropdown = dropdowns[d];
              if (openDropdown.classList.contains('show')) {
                openDropdown.classList.remove('show');
              }
            }
          }
        }
        </script>
</head>
<body>
    <header>
        <nav>
            <ul>
                <li>
                     <a href="/main"><img src="img/logo_home.png" class="logo_img"></a>
                    
                    <div class="search_box">
                		<form id="searchForm" action="/search" method="get">
                			<div class="search_input">
                			   	<select name="type">
                					<option value="T">이름</option>
                					<option value="A">가게</option>
                				</select>
                				<input type="text" name="keyword">
                    			<button class='search_btn'>검 색</button>                				
                			</div>
                		</form>
                	</div>
                </li>
                

                  
                <li></li>
            </ul>
            <ul>
            	<!-- 비로그인, 마이페이지 클릭시 로그인 화면 -->
                <c:if test = "${member == null }">
                <li> <a href="/member/login"><img src="img/image__header-mypage.svg" title="마이페이지" ></a> </li>
                </c:if>   
                
                <!-- 로그인, 마이페이지 클릭시 마이페이지 -->
                <!-- 
                <c:if test="${ member != null }">
                <li> <a href="#"><img src="img/image__header-mypage.svg" title="마이페이지" ></a> </li>  
                <li> <a href="/member/logout.do"><img src="img/58761.png" title="로그아웃" ></a> </li>        
                </c:if>
                 -->
                 
                <!-- 로그인, 마이페이지 클릭시 마이페이지 -->
                <c:if test="${ member != null }">
                <li> <a href="#"><img src="img/image__header-mypage.svg" title="마이페이지" ></a> </li>  
                <li> <a id="gnb_logout_button"><img src="img/58761.png" title="로그아웃" ></a> </li>        
                </c:if>
                
                <!-- 관리자 로그인시, 관리페이지 -->
				<c:if test="${member.adminCk == 1 }">
				<li> <a href="/admin/main"><img src="img/gear.png" title="관리자" ></a> </li>
				</c:if>
                
                <li> <a href="#"> <img src="img/image__header-cart.svg"> </a> </li>
                <li> <a href="#"> <img src="img/image__header-recent.svg"> </a> </li>
            </ul>
          </nav>
    </header>

<div class="content_tab">
    <div class="main-all-category">
        <li class="dropdown">
            <a href="javascript:void(0)" class="dropbtn" onclick="myFunction()">
            전체 카테고리</a>
            <div class="dropdown-content" id="myDropdown">
              <a href="#">메인메뉴 1</a>
              <a href="#">메인메뉴 2</a>
              <a href="#">메인메뉴 3</a>
              <a href="#">메인메뉴 4</a>
              <a href="#">메인메뉴 5</a>
            </div>
          </li>
    </div>


    <div class="main-menu">
        <ul class="sub-menu" style="padding-left: 20px;">
            <li><a href="#"> 예약 상품 </a></li>
            <li><a href="#"> 새로운 상품 </a></li>
            <li><a href="#"> 추천 상품 </a></li>
            <li><a href="#"> 다운로드 전용 </a></li>
            <li><a href="#"> SALE </a></li>
            <li><a href="#"> EVENT </a></li>
        </ul>
    </div>
</div>    


    <div class="powercouple">
        <h5> SS'22 POWER COUPLE </h5>
        <h2> 
        Now introducing our
        brand-new summer duo:
        Like Babe + Like Coral 
        </h2>

        <a href="#" class="button"> SHOP NOW </a>
    </div>

    <div class="ecoback">
        <div class="ecoback_img"></div>
        <div class="ecoback_flex">
        <h4> SS'22 PAINT BOX </h4>
        <h3>
        Meet your new go-to Tote Bag for summer. Neutral with holographic foil lettering,
         it's the perfect modern accessory that goes with everything.
        </h3>
        <a href="#" class="button"> SHOP NOW </a>
        </div>
    </div>

    <div class="manicure">
        <h4> OUR STUDIO </h4>
        <h3> 
            Book new nails at our Upper East Side studio. 
        </h3>
        <a href="#" class="button">  </a>
    </div>
    
    	<div class="slide_div_wrap">
		<div class="slide_div">
			<div>
				<a>
					<img src="img/main-slider-imag01.jpg" style="width: 100%; height: 550px;">
				</a>
			</div>
			<div>
				<a>
					<img src="img/main-slider-imag02.jpg" style="width: 100%; height: 550px;">
				</a>
			</div>
			<div>
				<a>
					<img src="img/main-slider-imag03.jpg" style="width: 100%; height: 550px;">
				</a>
			</div>				
		</div>	
	</div>
    



    <div class="shop_blog">

        <div class="shop_text">
        <h4> THE SHOP <br> Our Newest Character</h4>

        </div> 

	<div class="ls_wrap">
		<div class="ls_div_subject">
			평점순 상품
		</div>
			<div class="ls_div">
				<c:forEach items="${ls}" var="ls">
					<a href="/goodsDetail/${ls.giftId}">
						<div class="ls_div_content_wrap">
							<div class="ls_div_content" style="background-color: hsl(34, 57%, 70%);">
								<div class="image_wrap" data-giftid="${ls.imageList[0].giftId}" data-path="${ls.imageList[0].uploadPath}" data-uuid="${ls.imageList[0].uuid}" data-filename="${ls.imageList[0].fileName}">
									<img style="width:100%; height:160px">
								</div>	
											
							<div class="ls_category">
								${ls.cateName}
							</div>
							<div class="ls_rating">
								${ls.ratingAvg}
							</div>
							<div class="ls_giftName">
								${ls.giftName}
							</div>		
															</div>			

					</div>
					</a>					
				</c:forEach>					
			</div>
		</div>
    </div>

    <footer>
        <div class="footer_ul">
            <div class="first_fo">
                <ul> SUPPORT </ul>         
            <ul>
                <li>F.A.Q</li>
                <li>Privacy Policy</li>
                <li>CONDITIONS</li>
                <li>ACCESSIBLILITY</li>
            </ul>
            </div>

            <div class="second_fo">
                <ul> FOLLOW US </ul>
            <ul>
                <li>INSTAGRAM</li>
                <li>PINTEREST</li>
                <li>FACEBOOK</li>
                <li>NEWSLETTER</li>
            </ul>
            </div>

            <div class="third_fo">
                <ul> PAINTBOX </ul>
            <ul>
                <li>OUR STUDIO</li>
                <li>CAREERS</li>
                <li>PRESS</li>
                <li>CONTACT US</li>
            </ul>
            </div>
        </div>
    </footer>
    
<script>

	$(document).ready(function(){
		
		$(".slide_div").slick(
			{
				dots: true,
				autoplay : true,
				autoplaySpeed: 5000
			}
		);
		
		$(".ls_div").slick({
		      arrows : true,         // 옆으로 이동하는 화살표 표시 여부
		      dots : true,         // 스크롤바 아래 점으로 페이지네이션 여부
			slidesToShow: 5,
			slidesToScroll: 1
		});
		
		/* 이미지 삽입 */
		$(".image_wrap").each(function(i, obj){
			
			const bobj = $(obj);
			
			if(bobj.data("giftid")){
				const uploadPath = bobj.data("path");
				const uuid = bobj.data("uuid");
				const fileName = bobj.data("filename");
				
				const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
				
				$(this).find("img").attr('src', '/display?fileName=' + fileCallPath);
			} else {
				$(this).find("img").attr('src', '/img/exbox.png');
			}
			
		});
	});

	/* gnb_area 로그아웃 버튼 작동 */
	$("#gnb_logout_button").click(function(){
	    //alert("버튼 작동");
	    $.ajax({
	        type:"POST",
	        url:"/member/logout.do",
	        success:function(data){
	            alert("로그아웃 성공");
	            document.location.reload();     
	        } 
	    }); // ajax 
	});

</script>

</body>
</html>