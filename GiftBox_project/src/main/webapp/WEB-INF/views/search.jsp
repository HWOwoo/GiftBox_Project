<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="css/search.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<%@include file="include/header.jsp" %>
	
	<div class="content_area">
	
	<!-- 게시물 o -->
	<c:if test="${listcheck != 'empty'}">
			
	</c:if>
	<!-- 게시물 x -->
	<c:if test="${listcheck == 'empty'}">
		<div class="table_empty">
			검색결과가 없습니다.
		</div>
	</c:if>
		
	</div>
	
	<div class="list_search_result">
		<table class="type_list">
			<colgroup>
				<col width="110">
				<col width="*">
				<col width="120">
				<col width="120">
				<col width="120">
			</colgroup>
		
		<tbody id="searchList>">
		<c:forEach items="${list}" var="list">
			<tr>
			<td class="image">
				<div class="image_wrap" data-giftid="${list.imageList[0].giftId}" data-path="${list.imageList[0].uploadPath}" data-uuid="${list.imageList[0].uuid}" data-filename="${list.imageList[0].fileName}">
					<img>
				</div>			
			</td>
				
				<td class="detail">
					<div class="category">
					[${list.cateName}]
					</div>
					<div class="title">
					${list.giftName}
					</div>
					<div class="shop">
					${list.shopName} 가게 | ${list.publisher} | ${list.publeYear}
					</div>
				</td>
				
				<td class="info">
					<div class="rating">
					평점(추후 추가)
					</div>
				</td>
			
				<td class="price">
				
				<div class="org_price">				
					<del>
						<fmt:formatNumber value="${list.giftPrice}" pattern="#,### 원"/>
					</del>			
				</div>
				
				<div class="sell_price">
					<strong>
						<fmt:formatNumber value="${list.giftPrice * (1-list.giftDiscount)}" pattern="#,### 원"/>
					</strong>
				</div>
			</td>			
			<td class="option">
			</td>			
			</tr>
			
		</c:forEach>
		</tbody>			
		</table>
	</div>
	
		<!-- 페이지 이동 인터페이스 -->
	<div class="pageMaker_wrap">
		<ul class="pageMaker">
               			
			<!-- 이전 버튼 -->
			<c:if test="${pageMaker.prev }">
       			<li class="pageMaker_btn prev">
       				<a href="${pageMaker.pageStart -1}">이전</a>
       			</li>
			</c:if>
	               			
       		<!-- 페이지 번호 -->
       		<c:forEach begin="${pageMaker.pageStart }" end="${pageMaker.pageEnd }" var="num">
       			<li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? 'active':''}">
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
	
	<form id="moveForm" action="/search" method="get" >
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
		<input type="hidden" name="type" value="${pageMaker.cri.type}">
	</form>
	
	
<script>
	/* 페이지 이동 버튼 */
	const moveForm = $('#moveForm');
	
	$(".pageMaker_btn a").on("click", function(e){
		
		e.preventDefault();
		
		moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		
		moveForm.submit();
		
	});
	
	$(document).ready(function(){
		// 검색 타입 selected
		const selectedType = '<c:out value="${pageMaker.cri.type}"/>';
		if(selectedType != ""){
			$("select[name='type']").val(selectedType).attr("selected", "selected");	
		}
		
	});
	
	/* 이미지 삽입 */
	$(".image_wrap").each(function(i, obj){
		
		const bobj = $(obj);
		
		if(bobj.data("giftid")) {
			const uploadPath = bobj.data("path");
			const uuid = bobj.data("uuid");
			const fileName = bobj.data("filename");
			
			const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
			
			$(this).find("img").attr('src', '/display?fileName=' + fileCallPath);
		} else {
			$(this).find("img").attr('src', '/img/exbox.png');
		}
		
	});
</script>	
</body>
</html>