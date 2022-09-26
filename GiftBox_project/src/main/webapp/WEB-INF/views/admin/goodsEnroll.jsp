<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="/css/admin/goodsenroll.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
    <script src="https://cdn.ckeditor.com/ckeditor5/35.1.0/classic/ckeditor.js"></script> 
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
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
              </ul>
<!-- 
                    <div class="admin_list_01">
                        <a>상품 관리</a>
                    </div>
                     -->
                </div>
                
                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>상품 등록</span></div>
                 
			<div class="admin_content_main">
                    	<form action="/admin/goodsEnroll" method="post" id="enrollForm">
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 이름</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="giftName">
                    			</div>
                    		</div>
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>가게</label>
                    			</div>
                    			<div class="form_section_content">
									<input id="shopName_input" readonly="readonly">
									<input id="shopId_input" name="shopId" type="hidden">
									<button class="shopId_btn">가게 선택</button>
                    			</div>
                    		</div>            
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>판매시작일</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="publeYear" autocomplete="off" readonly="readonly">
                    			</div>
                    		</div>            
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>제작사</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="publisher">
                    			</div>
                    		</div>             
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>카테고리</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="cateCode">
                    			</div>
                    		</div>          
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 가격</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="giftPrice" value="0">
                    			</div>
                    		</div>               
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 재고</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="giftStock" value="0">
                    			</div>
                    		</div>          
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>상품 할인율</label>
                    			</div>
                    			<div class="form_section_content">
                    				<input name="giftDiscount" value="0">
                    			</div>
                    		</div>          		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>가게 소개</label>
                    			</div>
                    			<div class="form_section_content">
                    				<textarea name="giftIntro" id="giftIntro_textarea"></textarea>
                    			</div>
                    		</div>        		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>가게 설명</label>
                    			</div>
                    			<div class="form_section_content">
                    				<textarea name="giftContents" id="giftContents_textarea"></textarea>
                    			</div>
                    		</div>
                   		</form>
                   			<div class="btn_section">
                   				<button id="cancelBtn" class="btn">취 소</button>
	                    		<button id="enrollBtn" class="btn enroll_btn">등 록</button>
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

	let enrollForm = $("#enrollForm")
	
/* 취소 버튼 */
$("#cancelBtn").click(function(){
	
	location.href="/admin/goodsManage"
	
});

/* 상품 등록 버튼 */
$("#enrollBtn").on("click",function(e){
	
	e.preventDefault();
	
	enrollForm.submit();
	
});

/* 위지윅 적용 */

	/* 가게 소개 */
	ClassicEditor
		.create(document.querySelector('#giftIntro_textarea'))
		.catch(error=>{
			console.error(error);
		});
		
	/* 가게 목차 */	
	ClassicEditor
	.create(document.querySelector('#giftContents_textarea'))
	.catch(error=>{
		console.error(error);
	});
	
	
	/* 캘린더 */
	
	const config = {
		dateFormat: 'yy-mm-dd',
		showOn : "button",
		buttonText:"날짜 선택",
	    prevText: '이전 달',
	    nextText: '다음 달',
	    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	    dayNames: ['일','월','화','수','목','금','토'],
	    dayNamesShort: ['일','월','화','수','목','금','토'],
	    dayNamesMin: ['일','월','화','수','목','금','토'],
	    yearSuffix: '년',
        changeMonth: true,
        changeYear: true
	}
	
	$(function() {
		  $( "input[name='publeYear']" ).datepicker(config);
		});
	

	
	/* 가게 선택 버튼 */
	$('.shopId_btn').on("click",function(e){
		
		e.preventDefault();
		
		let popUrl = "/admin/shopPop";
		let popOption = "width = 750px, height=550px, top=300px, left=300px, scrollbars=yes";
		
		window.open(popUrl,"가게 찾기",popOption);
		
	});	
	
</script> 
 
</body>
</html>
