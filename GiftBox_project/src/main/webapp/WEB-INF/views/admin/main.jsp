<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/admin.css">
</head>
<body>
 
    <div class="wrapper">
        <div class="wrap">
            <!-- gnv_area -->    
            <div class="top_gnb_area">
                <ul class="list">    
                    <li><a href="/main">메인 페이지</a></li>
                    <li><a href="/member/logout.do">로그아웃</a></li>
                    <li>고객센터</li>            
                </ul>
            </div>
            <!-- top_subject_area -->
            <div class="admin_top_wrap">
                <span>관리자 페이지</span>
                
            </div>
            <!-- contents-area -->
            <div class="admin_wrap">
                <!-- 네비영역 -->
                <div class="admin_navi_wrap">
              <ul>
                  <li >
                      <a class="admin_list_01" href="/admin/goodsEnroll">상품 등록</a>
                  </li>
                  <li>
                      <a class="admin_list_02" href="/admin/goodsManage">상품 관리</a>
                  </li>
                  <li>
                      <a class="admin_list_03" href="/admin/shopEnroll">가게 등록</a>                            
                  </li>
                  <li>
                      <a class="admin_list_04" href="/admin/shopManage">가게 관리</a>                            
                  </li>
                  <li>
                      <a class="admin_list_05">회원 관리</a>                            
                  </li>
                                  <li>
                     <a class="admin_list_06" href="/admin/orderList">주문 현황</a>                            
                 </li>                                                                                                
              </ul>
                </div>
                <div class="admin_content_wrap">
                    <div>관리자 페이지 입니다.</div>
                </div>
                <div class="clearfix"></div>
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
 
</body>
</html>
