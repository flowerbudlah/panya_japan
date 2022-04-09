<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var='root' value="${pageContext.request.contextPath }/"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Panya</title>
<link rel="icon" type="image/x-icon" href="${root }image/favicon.png">
<!-- Bootstrap CDN -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<!-- 상단 -->
<c:import url="/WEB-INF/view/include/head_meta.jsp" />
<c:import url="/WEB-INF/view/include/top_menu.jsp"/>
<!-- 본문 -->
<div class="container" style="margin-top:50px; margin-bottom:50px;">
	<div class="row">
		<div class="col-sm-3"></div>
		<div class="col-sm-7"><h5>会員情報の変更</h5>
			<div class="card shadow-none">
				<div class="card-body">
					<form:form action='${root }member/modify_proc' method='post' modelAttribute="modifyMemberDTO">
						<div class="form-group">
							<form:label path="member_name">Name</form:label>
							<form:input path="member_name" class='form-control' />
						</div>
						<div class="form-group">
							<form:label path="member_id">ID</form:label>
							<form:input path="member_id" class='form-control' readonly="true"/>
						</div>
						<div class="form-group">
							<form:label path="member_pw">Password</form:label>
							<form:password path="member_pw" class='form-control'/>
							<form:errors path='member_pw' style='color:red'/>
						</div>
						<div class="form-group">
							<form:label path="member_pw2">Checking above Password</form:label>
							<form:password path="member_pw2" class='form-control'/>
							<form:errors path='member_pw2' style='color:red'/>
						</div>
							<div class="form-group">
							<form:label path="member_tel">Telephone Number</form:label>
							<form:input path="member_tel" class='form-control'/>
						</div>
						<div class="form-group">
						<%--이메일 --%>
							<form:label path="member_email">E-mail Address</form:label>
							<form:input path="member_email" class="form-control"/>
	
						<%--이메일 끝 --%>	
						</div>
					
						<div class="form-group">
							<form:label path="member_address">Address</form:label>
							<div class="input-group-append">
								<form:input path="postcode" class='form-control' />&nbsp;
								<input type="button" class="btn btn-danger btn-sm" id="searchAdd" value="郵便番号を 探す" >
							</div>
							<form:input path="member_address" class='form-control' id="roadAddress"/>
					
						</div>
						<div class="form-group">
							<form:label path="question">
							Please write the sentence questions to get the correct ID and Password in case of forgetting Your ID and Password.
							</form:label>
							<form:input path="question" class='form-control'/>
						</div>
						<div class="form-group">
							<form:label path="answer">The response with above question</form:label>
							<form:input path="answer" class='form-control' />
						</div>
						<br><br>
						<div class="form-group">
							<div class="text-right">
								<form:button class='btn btn-danger'>Completation of modification</form:button>
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
</div>
<!--하단정보-->
<c:import url="/WEB-INF/view/include/bottom_info.jsp"/>
<%--Daum address api --%>
<%--postal code--%>
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
    