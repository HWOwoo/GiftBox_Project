<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="/css/style.css">
	<link rel="stylesheet" href="/css/goodsDetail.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
	<%@include file="include/header2.jsp" %>

	<div class="content_area">
		
		<div class="line">	
		</div>			

		<div class="content_top">
			<div class="ct_left_area">
				<div class="image_wrap" data-giftid="${goodsInfo.imageList[0].giftId}" data-path="${goodsInfo.imageList[0].uploadPath}" data-uuid="${goodsInfo.imageList[0].uuid}" data-filename="${goodsInfo.imageList[0].fileName}">
				<img>
			</div>				
		</div>
		
		<div class="ct_right_area">
			<div class="title">
				<h1>
					${goodsInfo.giftName}
				</h1>
			</div>
		<div class="line">
		</div>
			<div class="shop">
			 <span>
			 	${goodsInfo.shopName}
			 </span>
			 <span>|</span>
			 <span>
			 	${goodsInfo.publisher}
			 </span>
			 <span>|</span>
			 <span class="publeyear">
			 	${goodsInfo.publeYear}
			 </span>
			</div>
		<div class="line">
		</div>	
			<div class="price">
				<div class="sale_price">정가 : <fmt:formatNumber value="${goodsInfo.giftPrice}" pattern="#,### 원" /></div>
				<div class="discount_price">
					판매가 : <span class="discount_price_number"><fmt:formatNumber value="${goodsInfo.giftPrice - (goodsInfo.giftPrice*goodsInfo.giftDiscount)}" pattern="#,### 원" /></span> 
					[<fmt:formatNumber value="${goodsInfo.giftDiscount*100}" pattern="###" />% 
					<fmt:formatNumber value="${goodsInfo.giftPrice*goodsInfo.giftDiscount}" pattern="#,### 원" /> 할인]</div>							
				</div>
				<div>
					적립 포인트 : <span class="point_span"></span>원
				</div>			
				<div class="line">
				</div>	
				<div class="button">						
					<div class="button_quantity">
						주문수량
						<input type="text" class="quantity_input" value="1">
						<span>
							<button class="plus_btn">+</button>
							<button class="minus_btn">-</button>
						</span>
					</div>
					<div class="button_set">
						<a class="btn_cart">장바구니 담기</a>
						<a class="btn_buy">바로구매</a>
					</div>
				</div>
			</div>
		</div>			
		
		<div>				　	
		</div>
		
		<div class="line">
		</div>
		
		<div class="product-detail">
			<a href="#">상품상세</a>
			<a href="#">고객리뷰</a>
		</div>
		
		<div class="content_middle">
			<div class="gift_intro">
				${goodsInfo.giftIntro}
			</div>
			<div class="gift_content">
				${goodsInfo.giftContents }
			</div>
		</div>
		<div class="line">
		</div>				
		<div class="content_bottom">
			<div class="reply_subject">
				<h2>리뷰</h2>
			</div>
			
			<c:if test="${member != null}">
				<div class="reply_button_wrap">
					<button>리뷰 쓰기</button>
				</div>
			</c:if>
		</div>
		
		<!-- 주문 form -->
		<form action="/order/${member.memberId}" method="get" class="order_form">
			<input type="hidden" name="orders[0].giftId" value="${goodsInfo.giftId}">
			<input type="hidden" name="orders[0].giftCount" value="">
		</form>
		
	</div>

<script>
	$(document).ready(function(){
		
		/* 이미지 삽입 */
		const bobj = $(".image_wrap");
		
		if(bobj.data("giftid")){
			const uploadPath = bobj.data("path");
			const uuid = bobj.data("uuid");
			const fileName = bobj.data("filename");
			
			const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
			
			bobj.find("img").attr('src', '/display?fileName=' + fileCallPath);
		} else {
			bobj.find("img").attr('src', '/img/exbox.png');
		}
		
		/* publeyear */
		const year = "${goodsInfo.publeYear}";
		
		let tempYear = year.substr(0,10);
		
		let yearArray = tempYear.split("-")
		let publeYear = yearArray[0] + "년 " + yearArray[1] + "월 " + yearArray[2] + "일";
		
		$(".publeyear").html(publeYear);
		
		/* 포인트 삽입 */
		let salePrice = "${goodsInfo.giftPrice - (goodsInfo.giftPrice*goodsInfo.giftDiscount)}"
		let point = salePrice*0.005;
		point = Math.floor(point);
		$(".point_span").text(point);
		
		
	});	
	
	// 수량 버튼 조작
	let quantity = $(".quantity_input").val();
	
	$(".plus_btn").on("click", function(){
		$(".quantity_input").val(++quantity);
	});
	
	$(".minus_btn").on("click", function(){
		if(quantity > 1){
			$(".quantity_input").val(--quantity);	
		}
	});
	
	// 서버로 전송할 데이터
	const form = {
			memberId : '${member.memberId}',
			giftId : '${goodsInfo.giftId}',
			giftCount : ''
	};
	
	// 장바구니 추가 버튼
	$(".btn_cart").on("click", function(e){
		$(".btn_cart").on("click", function(e){
			form.giftCount = $(".quantity_input").val();
			$.ajax({
				url: '/cart/add',
				type: 'POST',
				data: form,
				success: function(result){
					cartAlert(result);
				}
			})
		});
		
		function cartAlert(result){
			if(result == '0'){
				alert("장바구니에 추가를 하지 못하였습니다.");
			} else if(result == '1'){
				alert("장바구니에 추가되었습니다.");
			} else if(result == '2'){
				alert("장바구니에 이미 추가되어져 있습니다.");
			} else if(result == '5'){
				alert("로그인이 필요합니다.");	
			}
		}
	});
	
	/* 바로구매 버튼 */
	$(".btn_buy").on("click", function(){
		let giftCount = $(".quantity_input").val();
		$(".order_form").find("input[name='orders[0].giftCount']").val(giftCount);
		$(".order_form").submit();
	});
	
	/* 리뷰쓰기 */
	$(".reply_button_wrap").on("click", function(e){
		
		e.preventDefault();	
		
		const memberId = '${member.memberId}';
		const giftId = '${goodsInfo.giftId}';
		

		$.ajax({
			data : {
				giftId : giftId,
				memberId : memberId
			},
			url : '/reply/check',
			type : 'POST',
			success : function(result){
				if(result === '1'){
					alert("이미 등록된 리뷰가 존재 합니다.")
				} else if(result === '0'){
					let popUrl = "/replyEnroll/" + memberId + "?giftId=" + giftId;
					console.log(popUrl);
					let popOption = "width = 490px, height=490px, top=300px, left=300px, scrollbars=yes";
					
					window.open(popUrl,"리뷰 쓰기",popOption);							
				}

			}
		});
	
		/*
		let popUrl = "/replyEnroll/" + memberId + "?giftId=" + giftId;
		console.log(popUrl);
		let popOption = "width = 490px, height=490px, top=300px, left=300px, scrollbars=yes";
		
		window.open(popUrl,"리뷰 쓰기",popOption);
		*/
		
	});
</script>
	


</body>
</html>