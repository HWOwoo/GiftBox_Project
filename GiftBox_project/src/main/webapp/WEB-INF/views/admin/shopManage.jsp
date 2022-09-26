<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="/css/admin/shopmanage.css">
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
<!-- 
                    <div class="admin_list_01">
                        <a>상품 관리</a>
                    </div>
                     -->
                </div>
                
                <div class="admin_content_wrap">
               	 <span>작가관리</span>

                
				<div class="author_table_wrap">
                    	<table class="author_table">
							<c:if test="${listCheck != 'empty' }">			
                    		<thead>
                    			<tr>
                    				<td class="th_column_1">가게 번호</td>
                    				<td class="th_column_2">가게 이름</td>
                    				<td class="th_column_3">가게 소속</td>
                    				<td class="th_column_4">등록 날짜</td>
                    				<td class="th_column_5">수정 날짜</td>
                    			</tr>
                    		</thead>
	                    		<c:forEach items="${list}" var="list">
		                    		<tr>
		                    			<td><c:out value="${list.shopId}"></c:out> </td>
		                    			<td>
		                    			<a class="move" href='<c:out value="${list.shopId}"/>'>
		                    				<c:out value="${list.shopName}"></c:out></td>
		                    			</a>
		                    			<td><c:out value="${list.nationName}"></c:out> </td>
		                    			<td><fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd"/></td>
		                    			<td><fmt:formatDate value="${list.updateDate}" pattern="yyyy-MM-dd"/></td>
		                    		</tr>
	                    		</c:forEach>
                    		</table>
                    	</c:if>

							
                		<c:if test="${listCheck == 'empty'}">
                			<div class="table_empty">
                				등록된 작가가 없습니다.
                			</div>
                		</c:if> 							
							                  	
					</div>
						 
                    <!-- 검색 영역 -->
                    <div class="search_wrap">
                    	<form id="searchForm" action="/admin/shopManage" method="get">
                    		<div class="search_input">
                    			<input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
                    			<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
                    			<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
                    			<button class='btn search_btn'>검 색</button>
                    		</div>
                    	</form>
                    </div>  						 
						 
                    <!-- 페이지 이동 인터페이스 영역 -->
                    <div class="pageMaker_wrap" >
                    
	                    <ul class="pageMaker">
	                    
	                    	<!-- 이전 버튼 -->
	                    	<c:if test="${pageMaker.prev}">
	                    		<li class="pageMaker_btn prev">
	                    			<a href="${pageMaker.pageStart - 1}">이전</a>
	                    		</li>
	                    	</c:if>
	                    	
	                    	<!-- 페이지 번호 -->
	                    	<c:forEach begin="${pageMaker.pageStart}" end="${pageMaker.pageEnd}" var="num">
	                    		<li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? "active":""}">
	                    			<a href="${num}">${num}</a>
	                    		</li>
	                    	</c:forEach>
	                    	
	                    	<!-- 다음 버튼 -->
	                    	<c:if test="${pageMaker.next}">
	                    		<li class="pageMaker_btn next">
	                    			<a href="${pageMaker.pageEnd + 1 }">다음</a>
	                    		</li>
	                    	</c:if>
	                    	
	                    </ul>                   
                    </div>
                    						 
					<form id="moveForm" action="/admin/shopManage" method="get">
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
						<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
					</form>					                 			
                    </div>                    
                </div>
                
                
                <div class="clearfix"></div>
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
		    
		    let result = "${enroll_result}";
			let mresult = '<c:out value="${modify_result}"/>';
		    
		    checkResult(result);
			checkmResult(mresult);
			
		    function checkResult(result){
		        
		        if(result === ''){
		            return;
		        }
		        
		        alert("가게'${enroll_result}' 을 등록하였습니다.");
		        
		    }
		    
			function checkmResult(mresult){
				
				if(mresult === '1'){
					alert("가게 정보 수정을 완료하였습니다.");
				} else if(mresult === '0') {
					alert("가게 정보 수정을 하지 못하였습니다.")	
				}
				
			}
		 
		});
		
		let moveForm = $('#moveForm');
		let searchForm = $('#searchForm');
		 
		/** 페이지 이동 버튼 */
		$(".pageMaker_btn a").on("click", function(e){
		    
		    e.preventDefault();
		    
		    moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		    
		    moveForm.submit();
		
		});
	
		/* 가게 검색 버튼 동작 */
		$("#searchForm button").on("click", function(e){
			
			e.preventDefault();
			
			/* 검색 키워드 유효성 검사 */
			if(!searchForm.find("input[name='keyword']").val()){
				alert("키워드를 입력하십시오");
				return false;
			}
			
			searchForm.find("input[name='pageNum']").val("1");
			
			searchForm.submit();
			
		});		
		
		/* 가게 상세 페이지 이동 */
		$(".move").on("click", function(e){
			
			e.preventDefault();
			
			moveForm.append("<input type='hidden' name='shopId' value='"+ $(this).attr("href") + "'>");
			moveForm.attr("action", "/admin/shopDetail");
			moveForm.submit();
			
		});		
		
		
</script>
</body>
</html>