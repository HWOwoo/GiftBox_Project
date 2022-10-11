<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Main</title>
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/js/main.js">
    <link rel="stylesheet" href="/css/join.css">
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
                        <input type="text" placeholder="검색어 입력" class="search_inptu">
                        <button class="search_btn">검색</button>
                    </div>
                </li>
                  
                <li></li>
            </ul>
            <ul>
                <li> <a href="/member/login"><img src="/img/image__header-mypage.svg" title="마이페이지" ></a> </li>
                <li> <a href="#"> <img src="/img/image__header-cart.svg"> </a> </li>
                <li> <a href="#"> <img src="/img/image__header-recent.svg"> </a> </li>
            </ul>
          </nav>
    </header>

<div class="content_tab">
    <div class="main-all-category">
        <li class="dropdown">
            <a href="javascript:void(0)" class="dropbtn" onclick="myFunction()">
            전체 카테고리</a>
            <div class="dropdown-content" id="myDropdown">
              <a href="#">메인메뉴 1</a>
              <a href="#">메인메뉴 2</a>
              <a href="#">메인메뉴 3</a>
              <a href="#">메인메뉴 4</a>
              <a href="#">메인메뉴 5</a>
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
<div class="wrapper">
	<form id="join_form" method="post">
	<div class="wrap">
			<div class="subjecet">
				<span>회원가입</span>
			</div>
			<div class="id_wrap">
				<div class="id_name">아이디</div>
				<div class="id_input_box">
					<input class="id_input" name="memberId">
				</div>
				<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
				<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
				<span class="final_id_ck">아이디를 입력해주세요.</span>
			</div>
			<div class="pw_wrap">
				<div class="pw_name">비밀번호</div>
				<div class="pw_input_box">
					<input class="pw_input" name="memberPw">
				</div>
				<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
			</div>
			<div class="pwck_wrap">
				<div class="pwck_name">비밀번호 확인</div>
				<div class="pwck_input_box">
					<input class="pwck_input">
				</div>
				<span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span>
				<span class="pwck-input-re-1">비밀번호가 일치합니다.</span>
                <span class="pwck-input-re-2">비밀번호가 일치하지 않습니다.</span>
			</div>
			<div class="user_wrap">
				<div class="user_name">이름</div>
				<div class="user_input_box">
					<input class="user_input" name="memberName">
				</div>
				<span class="final_name_ck">이름을 입력해주세요.</span>
			</div>
			<div class="mail_wrap">
				<div class="mail_name">이메일</div> 
				<div class="mail_input_box">
					<input class="mail_input" name="memberMail">
				</div>
				<span class="final_mail_ck">이메일을 입력해주세요.</span>
				<div class="mail_check_wrap">
					<div class="mail_check_input_box" id="mail_check_input_box_false">
						<input class="mail_check_input" disabled="disabled">
					</div>
					<div class="mail_check_button">
						<span>인증번호 전송</span>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
			<div class="address_wrap">
				<div class="address_name">주소</div>
				<div class="address_input_1_wrap">
					<div class="address_input_1_box">
						<input class="address_input_1" name="memberAddr1" readonly="readonly">
					</div>
					<div class="address_button" onclick="daum_address()">
						<span>주소 검색</span>
					</div>
					<div class="clearfix"></div>
				</div>
				<div class ="address_input_2_wrap">
					<div class="address_input_2_box">
						<input class="address_input_2" name="memberAddr2" readonly="readonly">
					</div>
				</div>
				<div class ="address_input_3_wrap">
					<div class="address_input_3_box">
						<input class="address_input_3" name="memberAddr3" readonly="readonly">
					</div>
				</div>
				<span class="final_addr_ck">주소를 입력해주세요.</span>
			</div>
			<div class="join_button_wrap">
				<input type="button" class="join_button" value="가입하기">
			</div>
		</div>
	</form>
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

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

	/* 유효성 검사 통과유무 변수 */
	var idCheck = false;            // 아이디
	var idckCheck = false;            // 아이디 중복 검사
	var pwCheck = false;            // 비번
	var pwckCheck = false;            // 비번 확인
	var pwckcorCheck = false;        // 비번 확인 일치 확인
	var nameCheck = false;            // 이름
	var mailCheck = false;            // 이메일
	var addressCheck = false         // 주소

    $(document).ready(function(){
        //회원가입 버튼(회원가입 기능 작동)
        $(".join_button").click(function(){
        	
            /* 입력값 변수 */
            var id = $('.id_input').val();                 // id 입력란
            var pw = $('.pw_input').val();                // 비밀번호 입력란
            var pwck = $('.pwck_input').val();            // 비밀번호 확인 입력란
            var name = $('.user_input').val();            // 이름 입력란
            var mail = $('.mail_input').val();            // 이메일 입력란
            var addr = $('.address_input_3').val();        // 주소 입력란
            
            /* 아이디 유효성검사 */
            if(id == ""){
                $('.final_id_ck').css('display','block');
                idCheck = false;
            }else{
                $('.final_id_ck').css('display', 'none');
                idCheck = true;
            }
            
            /* 비밀번호 유효성 검사 */
            if(pw == ""){
                $('.final_pw_ck').css('display','block');
                pwCheck = false;
            }else{
                $('.final_pw_ck').css('display', 'none');
                pwCheck = true;
            }
            
            /* 비밀번호 확인 유효성 검사 */
            if(pwck == ""){
                $('.final_pwck_ck').css('display','block');
                pwckCheck = false;
            }else{
                $('.final_pwck_ck').css('display', 'none');
                pwckCheck = true;
            }
            
            /* 이름 유효성 검사 */
            if(name == ""){
                $('.final_name_ck').css('display','block');
                nameCheck = false;
            }else{
                $('.final_name_ck').css('display', 'none');
                nameCheck = true;
            }
            
            /* 이메일 유효성 검사 */
            if(mail == ""){
                $('.final_mail_ck').css('display','block');
                mailCheck = false;
            }else{
                $('.final_mail_ck').css('display', 'none');
                mailCheck = true;
            }
            
            /* 주소 유효성 검사 */
            if(addr == ""){
                $('.final_addr_ck').css('display','block');
                addressCheck = false;
            }else{
                $('.final_addr_ck').css('display', 'none');
                addressCheck = true;
            }
            
            /* 최종 유효성 검사 */
            if(idCheck&&idckCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&nameCheck&&mailCheck&&addressCheck ){
    			$("#join_form").attr("action", "/member/join");
    			$("#join_form").submit();
            }   
            

        });
    });

    /** 주소록 api */
    function daum_address(){
		    new daum.Postcode({
		     oncomplete: function(data) {
		         // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		    	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	 
	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	 
	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    addr += extraAddr;
	                
	                } else {
	                	addr += ' ';
	                }
	 
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		            $(".address_input_1").val(data.zonecode);
		            //$("[name=memberAddr1]").val(data.zonecode);    // 대체가능
		            $(".address_input_2").val(addr);
		            //$("[name=memberAddr2]").val(addr); 
	                // 커서를 상세주소 필드로 이동한다.
		            $(".address_input_3").attr("readonly",false);
		            $(".address_input_3").focus();
		
		     }
		 }).open(); 
	 }
    
    /* 비밀번호 확인 일치 유효성 검사 */
    $('.pwck_input').on("propertychange change keyup paste input", function(){
    	
        var pw = $('.pw_input').val();
        var pwck = $('.pwck_input').val();
        $('.final_pwck_ck').css('display', 'none');
        
        if(pw == pwck){
            $('.pwck-input-re-1').css('display','block');
            $('.pwck-input-re-2').css('display','none');
            pwckcorCheck = true;
        }else{
            $('.pwck-input-re-1').css('display','none');
            $('.pwck-input-re-2').css('display','block');
            pwckcorCheck = false;
        }  
        
    }); 
    
  	//아이디 중복검사
	$('.id_input').on("propertychange change keyup paste input", function(){
	
		/* console.log("keyup 테스트"); */
	
		var memberId = $('.id_input').val();			// .id_input에 입력되는 값
		var data = {memberId : memberId}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
		
		$.ajax({
			type : "post",
			url : "/member/memberIdChk",
			data : data,
			success : function(result){
				// console.log("성공 여부" + result);
				if(result != 'fail'){
					$('.id_input_re_1').css("display","inline-block");
					$('.id_input_re_2').css("display", "none");	
					idckCheck = true;
				} else {
					$('.id_input_re_2').css("display","inline-block");
					$('.id_input_re_1').css("display", "none");	
					idckCheck = false;
				}
				
			}// success 종료
		}); // ajax 종료	
	
	
	});// function 종료
	
    </script>
</body>