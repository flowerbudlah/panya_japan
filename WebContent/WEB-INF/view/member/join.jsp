<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
//아이디 중복체크하는 제이쿼리와 아직스
function checkID(){
	const member_id = $("#member_id").val()
	if(member_id.length == 0){ alert('入力して ください。'); return; }
    
    $.ajax({
      url: '${root}member/checkID/'+member_id, 
      type: 'get',
      dataType: 'text',
      success: 
    	
    	function(result){
    	  
        	if(result.trim() == 'true'){
          		alert('You can use this  ID..');
          		$('#inputMemberID').val('true');
        	}else{
          		alert('The ID is used by another user. You had better other ID..');  
          		$('#inputMemberID').val('false');
          }
      	}
    })
  }
function resetInputMemberID(){	$("#inputMemberID").val('false')}
</script>
</head>
<body>
<c:import url="/WEB-INF/view/include/head_meta.jsp" />
<c:import url="/WEB-INF/view/include/top_menu.jsp" />
<!-- 회원가입 폼 -->
<div class="container" style="margin-top:50px">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-7"><h5>会員登録(Membership form)</h5>
		<div class="card shadow-none">
		<div class="card-body">
			<form:form action="${root }member/join_proc" method="post" modelAttribute="joinMemberDTO">
			<form:hidden path="inputMemberID" />
				<div class="form-group" >
					<form:label path="member_name">氏名</form:label>
					<form:input path="member_name" class="form-control"/>
					<form:errors path="member_name" style="color:red;" />
				</div>  
				<div class="form-group" >
					<form:label path="member_id">会員ID</form:label>
				<div class="input-group">
					<form:input path="member_id" class="form-control" onkeypress="resetInputMemberID()"/>
					<div class="input-group-append">
						<button type="button" class="btn btn-danger" onClick="checkID();">IDの重複確認</button>
					</div>
				</div>
					<form:errors path="member_id" style="color:red;" />
				</div>                
				<div class="form-group">
					<form:label path="member_pw">パスワード</form:label>
					<form:password path="member_pw" class="form-control" />
					<form:errors path="member_pw" style="color:red;" />
				</div>                   
				<div class="form-group">
					<form:label path="member_pw2">パスワード確認</form:label>
					<form:password path="member_pw2" class="form-control" />
					<form:errors path="member_pw2" style="color:red;" />
				</div> 
				<div class="form-group">
					<form:label path="member_tel">電話番号(Telephone)</form:label>
					<form:input path="member_tel" class="form-control"/>
				</div> 
				
				<div class="form-group">
                    <form:label path="member_email">メールアドレ(E-mail Address)</form:label>
					<form:input path="member_email" class="form-control"/>
				</div> 
				
				
				<!-- 주소-->
				<div class="form-group">
					<form:label path="member_address">住所(Address)</form:label>
					<div class="input-group-append">
						<input type="text" id="postcode" name="postcode" placeholder="郵便番号(Postcode)" class="form-control">&nbsp;
						<input type="button" class="btn btn-danger btn-sm" id="searchAdd" value="郵便番号を 探す" >
					</div>
					<form:input path="member_address" placeholder="詳しい住所(Detail Address)" id="roadAddress" class="form-control"/>
				</div>
				<br>
				<div class="form-group"> 
					<form:label path="question">IDまたはパスワードを忘れた場合は、<br>忘れたIDとパスワードを探すためのヒント質問を下に入力してください。</form:label>
					<form:input path="question" class="form-control"/>
				</div> 
                 <div class="form-group">
					<form:label path="answer">上の質問に対する答え</form:label>
					<form:input path="answer" class="form-control"/>
				</div>   
				<br><br>   
				<div class="text-right">
					<form:button class="btn btn-danger">会員登録完了</form:button>
				</div>
			</form:form>
		</div>
		</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>
<!-- 하단정보 -->
<c:import url="/WEB-INF/view/include/bottom_info.jsp" />
<%--우편번호 --%>
<script>
function postcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외) 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraRoadAddr !== ''){
                extraRoadAddr = ' (' + extraRoadAddr + ')';
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("roadAddress").value = roadAddr;
           }
	}).open();
}
$("#searchAdd").click(function(event) {
	event.preventDefault();
	postcode();
});

</script>
</body>
</html>
