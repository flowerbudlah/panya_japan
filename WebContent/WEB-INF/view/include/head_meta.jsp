<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="root" value="${pageContext.request.contextPath }/" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메뉴</title>
<style>   
.logo{text-align: center; margin-top:5px; }
.test a{text-decoration: black; } 
a:visited{ color: black;  }
.test li{list-style: none; float: right;      }
.test li::after{ content: ''; padding-right: 20px; }
.test li:last-child::after{ content: ''; }   
</style>
</head>
<body>
<nav class="bg-light navbar-dark fixed-top">

<div class="logo"><a href="${root }main"><img src="${root}image/banner.png" ></a></div>

<div class="menu">
	<ul class="test">
		<c:choose>
			<c:when test="${loginMemberDTO.memberLogin == true }">
				<li><a href="${root }member/delete" style="color:black;">会員退会</a></li>
				<li><a href="${root }member/modify" style="color:black;">会員情報変更</a></li>
				<li><a href="${root }member/logout" style="color:black;">ログアウト</a></li>
			</c:when>
        	<c:otherwise>
        		<li><a href="${root }member/join" style="color:black;">会員登録(無料)</a></li>
        		<li><a href="${root }member/login" style="color:black;">ログイン</a></li>
        	</c:otherwise>    
		</c:choose>
		
	</ul>
</div>


</nav>

</body>
</html>