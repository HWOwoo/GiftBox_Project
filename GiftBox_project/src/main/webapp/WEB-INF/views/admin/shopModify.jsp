<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="/css/admin/shopmodify.css">
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
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
              </div>
              
              
 <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>작가 상세</span></div>
                    <div class="admin_content_main">
                    	<form id="modifyForm" action="/admin/shopModify" method="post">
	                   		<div class="form_section">
	                   			<div class="form_section_title">
	                   				<label>작가 번호</label>
	                   			</div>
	                   			<div class="form_section_content">
	                   				<input class="input_block" name="shopId" readonly="readonly" value="<c:out value='${shopInfo.shopId }'></c:out>">
	                   			</div>
	                   		</div>                    
	                   		<div class="form_section">
	                   			<div class="form_section_title">
	                   				<label>작가 이름</label>
	                   			</div>
	                   			<div class="form_section_content">
	                   				<input name="shopName" value="<c:out value='${shopInfo.shopName }'></c:out>" >
	                   				<span id="warn_authorName">가게 이름을 입력 해주세요.</span>
	                   			</div>
	                   		</div>
	                   		<div class="form_section">
	                   			<div class="form_section_title">
	                   				<label>소속 국가</label>
	                   			</div>
	                   			<div class="form_section_content">
	                   				<select name="nationId" >
	                   					<option value="none" disabled="disabled">=== 선택 ===</option>
	                   					<option value="01" <c:out value=" ${shopInfo.nationId eq '01' ?'selected':''}"/>>본사</option>
	                   					<option value="02" <c:out value=" ${shopInfo.nationId eq '02' ?'selected':''}"/>>외주</option>
	                   				</select>
	                   			</div>
	                   		</div>
	                   		<div class="form_section">
	                   			<div class="form_section_title">
	                   				<label>작가소개</label>
	                   			</div>
	                   			<div class="form_section_content">
	                   				<textarea name="shopIntro" ><c:out value='${shopInfo.shopIntro }'/></textarea>
	                   				<span id="warn_authorIntro">가게 소개를 입력 해주세요.</span>
	                   			</div>
	                   		</div>
	                   		<div class="form_section">
	                   			<div class="form_section_title">
	                   				<label>등록 날짜</label>
	                   			</div>
	                   			<div class="form_section_content">
	                   				<input class="input_block" type="text" readonly="readonly" value="<fmt:formatDate value="${shopInfo.regDate}" pattern="yyyy-MM-dd"/>">
	                   			</div>
	                   		</div>
	                   		<div class="form_section">
	                   			<div class="form_section_title">
	                   				<label>수정 날짜</label>
	                   			</div>
	                   			<div class="form_section_content">
	                   				<input class="input_block" type="text" readonly="readonly" value="<fmt:formatDate value="${shopInfo.updateDate}" pattern="yyyy-MM-dd"/>">
	                   			</div>
	                   		</div>
	                 		<div class="btn_section">
	                   			<button id="cancelBtn" class="btn">취소</button>
		                    	<button id="modifyBtn" class="btn modify_btn">수 정</button>
		                    </div> 
	                    </form>
                    </div>                    
                </div>
                
                <form id="moveForm" method="get">
                	<input type="hidden" name="shopId" value='<c:out value="${shopInfo.shopId}"/>'>
                	<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
                	<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>' >
                	<input type="hidden" name="keyword" value='<c:out value="${cri.keyword}"/>'>
                </form>
                
<script>

		let moveForm = $("#moveForm");
		let modifyForm = $("#modifyForm");
		
		
		
		
		/* 작가 상세 페이지 이동 버튼 */
		$("#cancelBtn").on("click", function(e){
			
			e.preventDefault();
					
			moveForm.attr("action", "/admin/shopDetail")
			moveForm.submit();
			
		});
		
		/* 작가 수정 버튼 작동 및 유효성 검사 */
		$("#modifyBtn").on("click", function(e){
		
			let shopName = $(".form_section_content input[name='shopName']").val();
			let shopIntro = $(".form_section_content textarea").val();		
		
			let	nameCk = false;
			let introCk = false;		
			
			e.preventDefault();
			
			if(!shopName){
				$("#warn_authorName").css("display", "block");
			} else {
				$("#warn_authorName").css("display", "none");
				nameCk = true;
			}
			if(!shopIntro){
				$("#warn_authorIntro").css("display", "block");
			} else {
				$("#warn_authorIntro").css("display", "none");
				introCk = true;
			}
		
			
			if(nameCk && introCk ){
				modifyForm.submit();	
			} else {
				return false;
			}
			
			
		});


</script>


</body>
</html>