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
    <link rel="stylesheet" href="js/main.js">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
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
                    <img src="img/logo_home.png" class="logo_img" a href="#">

                    <div class="search_box">
                        <input type="text" placeholder="검색어 입력" class="search_inptu">
                        <button class="search_btn">검색</button>
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



    <div class="shop_blog">

        <div class="shop_text">
        <h4> THE SHOP <br> Our Newest Character</h4>

        </div> 

        <div class=" shop_post">

        <div class="shop_first_blog_post">
                <img src="img/ame.png"> <br>
            <div class="blog_first_category"> 
                Character 
            <span class="blog_first_category_new">
                new!
            </span>
            </div>
            <div class="blog_first_title">
                Amelia
            </div>
            <br>
            <a href="#" class="post_button"> 
                Replay 
            </a>
        </div>

        <div class="shop_sec_blog_post">
                <img src="img/same.webp"> <br>
            <div class="blog_sec_category"> 
                Character 
            <span class="blog_sec_category_new">
                new!
            </span>
            </div>
            <div class="blog_sec_title">
                Same
            </div>
            <br>
            <a href="#" class="post_button"> 
                Replay 
            </a>
        </div>

        <div class="shop_third_blog_post">
                <img src="img/muner.png"> <br>
            <div class="blog_third_category"> 
                Character 
            <span class="blog_third_category_new">
                new!
            </span>
            </div>
            <div class="blog_third_title">
                Muner
            </div>
            <br>
            <a href="shop.html" class="post_button"> 
                Replay 
            </a>
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