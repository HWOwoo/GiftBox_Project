<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="/css/admin/shoppop.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
<body>

                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>가게 등록</span></div>
               	 
				<div class="author_table_wrap">
                    	<table class="author_table">
							<c:if test="${listCheck != 'empty' }">			
                    		<thead>
                    			<tr>
                    				<td class="th_column_1">가게 번호</td>
                    				<td class="th_column_2">가게 이름</td>
                    				<td class="th_column_3">가게 소속</td>
                    			</tr>
                    		</thead>
	                    		<c:forEach items="${list}" var="list">
		                    		<tr>
		                    			<td><c:out value="${list.shopId}"></c:out> </td>
		                    			<td>
											<a class="move" href='<c:out value="${list.shopId}"/>' data-name='<c:out value="${list.shopName}"/>'>
		                    				<c:out value="${list.shopName}"></c:out></td>
		                    			</a>
		                    			<td><c:out value="${list.nationName}"></c:out> </td>
		                    		</tr>
	                    		</c:forEach>
                    		</table>
                    	</c:if>

							
                		<c:if test="${listCheck == 'empty'}">
                			<div class="table_empty">
                				등록된 가게가 없습니다.
                			</div>
                		</c:if> 							
							                  	
					</div>
						 
                    <!-- 검색 영역 -->
                    <div class="search_wrap">
                    	<form id="searchForm" action="/admin/shopPop" method="get">
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
                    						 
					<form id="moveForm" action="/admin/shopPop" method="get">
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
						<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
					</form>					                 			
                    </div>                    
                </div>
                
                
<script>

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

		/* 작가 선택 및 팝업창 닫기 */
		$(".move").on("click", function(e){
			
			e.preventDefault();
			
			let shopId = $(this).attr("href");
			let shopName= $(this).data("name");
			$(opener.document).find("#shopId_input").val(shopId);
			$(opener.document).find("#shopName_input").val(shopName);
			
			window.close();

		});
		
</script>
                
</body>
</html>