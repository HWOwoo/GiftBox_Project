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
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/js/main.js">
    <link rel="stylesheet" href="/css/login.css">
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
                <li> <a href="/member/login"><img src="/img/image__header-mypage.svg" title="마이페이지" ></a> </li>
                <li> <a href="#"> <img src="/img/image__header-cart.svg"> </a> </li>
                <li> <a href="#"> <img src="/img/image__header-recent.svg"> </a> </li>
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

	<div class="main-container">
		<div class="main-wrap">
		<form id="login_form" method="post" class="login-input-section-wrap">
			<div class="login-input-wrap">	
				<input placeholder="아이디" type="text" name="memberId" class="id_input">
			</div>
			<div class="login-input-wrap password-wrap">	
				<input placeholder="비밀번호" type="password" name="memberPw" class="Pw_input">
			</div>
			
            <c:if test = "${result == 0 }">
                <div class = "login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
            </c:if>
			
			<div class="login-button-wrap">
				<input type="button" class="login_button" value="로그인">
			</div>
		</form>
		</div>
		
			
	    <div class="regist-button">
	    
	        <button> <a href="/member/join"> 회원가입 </a> </button>
	        <button a="#"> 아이디 / 비밀번호 찾기</button>
	    </div>

	</div>

<script>
 
    /* 로그인 버튼 클릭 메서드 */
    $(".login_button").click(function(){
        
        /* 로그인 메서드 서버 요청 */
        $("#login_form").attr("action", "/member/login.do");
        $("#login_form").submit();
        
    });
 
</script>

</body>
</html>