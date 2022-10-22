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
				<img style="width:90%">
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
				<div class="point-div">
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
		
		<div class="product-detail">
			<a href="#" style="text-decoration:none; color:black;">상품상세</a>
			<a href="#" style="text-decoration:none; color:black;">고객리뷰</a>
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
				<h2>고객리뷰</h2>
			
			<c:if test="${member != null}">
				<div class="reply_button_wrap">
					<button>리뷰 쓰기</button>
				</div>
			</c:if>
			
			</div>
			<div class="bottom-line">
			</div>
			

			
			<div class="reply_not_div">
						
			</div>
			
			<ul class="reply_content_ul">
			<!-- 
				<li>
					<div class="comment_wrap">
						<div class="reply_top">
							<span class="id_span">sjinjin7</span>
							<span class="date_span">2021-10-11</span>
							<span class="rating_span">평점 : <span class="rating_value_span">4</span>점</span>
							<a class="update_reply_btn">수정</a><a class="delete_reply_btn">삭제</a>
						</div>
						<div class="reply_bottom">
							<div class="reply_bottom_txt">
								사실 기대를 많이하고 읽기시작했는데 읽으면서 가가 쓴것이 맞는지 의심들게합니다 문체도그렇고 간결하지 않네요 제가 기대가 크던 작았던간에 책장이 사실 안넘겨집니다.
							</div>
						</div>
					</div>
				</li>	
			-->
			</ul>
			
			<div class="repy_pageInfo_div">
			<!--
				<ul class="pageMaker">
					<li class="pageMaker_btn prev">
						<a>이전</a>
					</li>
					<li class="pageMaker_btn">
						<a>1</a>
					</li>
					<li class="pageMaker_btn">
						<a>2</a>
					</li>
					<li class="pageMaker_btn active">
						<a>3</a>
					</li>													
					<li class="pageMaker_btn next">
						<a>다음</a>
					</li>
				</ul>
			-->
			</div>			
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
		
		/* 리뷰 */
		const giftId = '${goodsInfo.giftId}';	

		$.getJSON("/reply/list", {giftId : giftId}, function(obj){
			
			makeReplyContent(obj)
			
		});
		
	});	// document
	
	/* 댓글(리뷰) 동적 생성 메서드 */
	function makeReplyContent(obj){
		
		if(obj.list.length === 0){
			$(".reply_not_div").html('<span>리뷰가 없습니다.</span>');
			$(".reply_content_ul").html('');
			$(".pageMaker").html('');
		} else{
			
			$(".reply_not_div").html('');
			
			const list = obj.list;
			const pf = obj.pageInfo;
			const userId = '${member.memberId}';		
			
			/* list */
			
			let reply_list = '';			
			
			$(list).each(function(i,obj){
				reply_list += '<li>';
				reply_list += '<div class="comment_wrap">';
				reply_list += '<div class="reply_top">';
				/* 아이디 */
				reply_list += '<span class="id_span">'+ obj.memberId+'</span>';
				/* 날짜 */
				reply_list += '<span class="date_span">'+ obj.regDate +'</span>';
				/* 평점 */
				reply_list += '<span class="rating_span">평점 : <span class="rating_value_span">'+ obj.rating +'</span>점</span>';
				if(obj.memberId === userId){
					reply_list += '<a class="update_reply_btn" href="'+ obj.replyId +'">수정</a><a class="delete_reply_btn" href="'+ obj.replyId +'">삭제</a>';
				}
				reply_list += '</div>'; //<div class="reply_top">
				reply_list += '<div class="reply_bottom">';
				reply_list += '<div class="reply_bottom_txt">'+ obj.content +'</div>';
				reply_list += '</div>';//<div class="reply_bottom">
				reply_list += '</div>';//<div class="comment_wrap">
				reply_list += '</li>';
			});		
			
			$(".reply_content_ul").html(reply_list);			
			
			/* 페이지 버튼 */
			
			let reply_pageMaker = '';	
			
				/* prev */
				if(pf.prev){
					let prev_num = pf.pageStart -1;
					reply_pageMaker += '<li class="pageMaker_btn prev">';
					reply_pageMaker += '<a href="'+ prev_num +'">이전</a>';
					reply_pageMaker += '</li>';	
				}
				/* numbre btn */
				for(let i = pf.pageStart; i < pf.pageEnd+1; i++){
					reply_pageMaker += '<li class="pageMaker_btn ';
					if(pf.cri.pageNum === i){
						reply_pageMaker += 'active';
					}
					reply_pageMaker += '">';
					reply_pageMaker += '<a href="'+i+'">'+i+'</a>';
					reply_pageMaker += '</li>';
				}
				/* next */
				if(pf.next){
					let next_num = pf.pageEnd +1;
					reply_pageMaker += '<li class="pageMaker_btn next">';
					reply_pageMaker += '<a href="'+ next_num +'">다음</a>';
					reply_pageMaker += '</li>';	
				}	
				
			$(".pageMaker").html(reply_pageMaker);				
			
		}		
	}
	
	/* 댓글 페이지 정보 */
	 const cri = {
		giftId : '${goodsInfo.giftId}',
		pageNum : 1,
		amount : 10
	}
	
	/* 댓글 페이지 이동 버튼 동작 */
	$(document).on('click', '.pageMaker_btn a', function(e){
		e.preventDefault();
		
		let page = $(this).attr("href");	
		cri.pageNum = page;		
		
		replyListInit();			
			
	 });
	
		/* 리뷰 삭제 버튼 */
	 $(document).on('click', '.delete_reply_btn', function(e){
		 
			e.preventDefault();
			let replyId = $(this).attr("href");	
			
			$.ajax({
				data : {
					replyId : replyId,
					giftId : '${goodsInfo.giftId}'
				},
				url : '/reply/delete',
				type : 'POST',
				success : function(result){
					replyListInit();
					alert('삭제가 완료되엇습니다.');
				}
			});	
			
	 });
	
	
	/* 댓글 데이터 서버 요청 및 댓글 동적 생성 메서드 */
	let replyListInit = function(){
		$.getJSON("/reply/list", cri , function(obj){
			
			makeReplyContent(obj);
			
		});		
	}
	
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