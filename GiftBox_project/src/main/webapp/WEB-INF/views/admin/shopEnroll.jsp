<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="/css/admin/shopenroll.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
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
                      <lI>
                          <a class="admin_list_03" href="/admin/shopEnroll">가게 등록</a>                            
                      </lI>
                      <lI>
                          <a class="admin_list_04" href="/admin/shopManage">가게 관리</a>                            
                      </lI>
                      <lI>
                          <a class="admin_list_05">회원 관리</a>                            
                      </lI>                                                                                             
                  </ul>
                </div>
                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>가게 등록</span></div>
						<div class="admin_content_main">
                    	<form action="/admin/shopEnroll.do" method="post" id="enrollForm">
                    		<div class="form_section">
                    		
                    		<div class="form_section_title">
                    				<label>가게 이름</label>
                    		</div>
                    		
                    		<div class="form_section_content">
                    				<input name="shopName">
                    				<span id="warn_shopName">가게 이름을 입력 해주세요.</span>
                    			</div>
                    		</div>
                    		
                    		<div class="form_section">
                    			<div class="form_section_title">
                    				<label>소속 선택</label>
                    		</div>
                    		
                    		<div class="form_section_content">
                    				<select name="nationId">
                    					<option value="none" selected>선택</option>
                    					<option value="01">본사</option>
                    					<option value="02">외주</option>
                    				</select>
                    				<span id="warn_nationId">소속을 선택해주세요.</span>
                    			</div>
                    		</div>
                    		
                    		<div class="form_section">
                    			
                    			<div class="form_section_title">
                    				<label>가게 소개</label>
                    			</div>
                    			
                    			<div class="form_section_content">
                    				<input name="shopIntro" type="text">
                    				<span id="warn_shopIntro">가게 소개를 입력 해주세요.</span>
                    			</div>
                    			
                    		</div>
                   		</form>
                   		
                   			<div class="btn_section">
                   				<button id="cancelBtn" class="btn">취 소</button>
	                    		<button id="enrollBtn" class="btn enroll_btn">등 록</button>
	                    	</div> 
                    </div>
                </div>
                <div class="clearfix"></div>
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
 
		 /* 등록 버튼 */
	$("#enrollBtn").click(function(){  
		
		 /* 검사 통과 유무 변수 */
		let nameCheck = false;            // 가게 이름
		let nationCheck = false;        // 소속
		let introCheck = false;            // 가게 소개   
		
	    /* 입력값 변수 */
	    let shopName = $('input[name=shopName]').val();        // 작가 이름
	    let nationId = $('select[name=nationId]').val();        // 소속 국가
	    let shopIntro = $('input[name=shopIntro]').val();    // 작가 소개
	    
	    /* 공란 경고 span태그 */
	    let wShopName = $('#warn_shopName');
	    let wNationId = $('#warn_nationId');
	    let wShopIntro = $('#warn_shopIntro');
	    
	    /* 가게 이름 공란 체크 */
	    if(shopName ===''){
	        wShopName.css('display', 'block');
	        nameCheck = false;
	    } else{
	        wShopName.css('display', 'none');
	        nameCheck = true;
	    }
	    
	    /* 소속 국가 공란 체크 */
	    if(nationId ==='none'){
	        wNationId.css('display', 'block');
	        nationCheck = false;
	    } else{
	        wNationId.css('display', 'none');
	        nationCheck = true;
	    }    
	    
	    /* 가게 소개 공란 체크 */
	    if(shopIntro ===''){
	        wShopIntro.css('display', 'block');
	        introCheck = false;
	    } else{
	        wShopIntro.css('display', 'none');
	        introCheck = true;
	    }   
	    
	    /* 최종 검사 */
	    if(nameCheck && nationCheck && introCheck){
	        $("#enrollForm").submit();    
	    } else	{
	    	
	        return;
	    }
	    
	});
  
		 
		/* 취소 버튼 */
	$("#cancelBtn").click(function(){
		location.href="/admin/shopManage"
	});
 
</script>
 
</body>
</html>
