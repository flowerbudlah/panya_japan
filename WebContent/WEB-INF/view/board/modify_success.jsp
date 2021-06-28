<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath }/" />

<script type="text/javascript">
	alert('その文章が修正されました。');
	location.href = '${root}board/read?board_idx=${modifyPostDTO.post_board_idx}&post_idx=${modifyPostDTO.post_idx}&page=${page}';
</script>   




