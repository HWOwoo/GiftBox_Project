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
                    <a href="/main"><img src="img/logo_home.png" class="logo_img"></a>
                    
                    <div class="search_box">
                		<form id="searchForm" action="/search" method="get">
                			<div class="search_input">
                			   	<select name="type">
                					<option value="T">이름</option>
                					<option value="A">가게</option>
                				</select>
                				<input type="text" name="keyword" value="<c:out value="${pageMaker.cri.keyword}"/>">
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
                
                <li> <a href="/cart/${member.memberId}"> <img src="img/image__header-cart.svg"> </a> </li>
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
	            <a class="dropdown-menu1">패션</a>
	            <a href="/search?type=C&cateCode=102000">스포츠</a>
				<a href="/search?type=C&cateCode=103000">생활용품</a>
	            <a href="/search?type=C&cateCode=104000">도서</a>
	            <a href="/search?type=C&cateCode=105000">식품</a>
	            <a href="/search?type=C&cateCode=106000">게임</a>	            
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