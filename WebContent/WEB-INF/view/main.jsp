<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <c:url var="root" value="/" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Panya</title>
<link rel="icon" type="image/x-icon" href="image/favicon.png">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Single+Day&display=swap" rel="stylesheet">
<style>
thead{ background-color: #df4759; }
.carousel-caption{ font-family: 'Single Day', cursive;  }
.card-title{font-family: 'Single Day', cursive; }
</style>
</head>
<body>
<!-- Upper Menu -->
<c:import url="/WEB-INF/view/include/head_meta.jsp" />
<c:import url="/WEB-INF/view/include/top_menu.jsp" />
<!-- main -->
<div class="container" style="margin-top: 20px; margin-bottom:50px;">
<div id="landscape" class="carousel slide" data-ride="carousel" data-interval="4200">
	<!-- indicator -->
	<ul class="carousel-indicators">
        <li data-target="#landscape" data-slide-to="0" class="active"></li>
        <li data-target="#landscape" data-slide-to="1" ></li>
        <li data-target="#landscape" data-slide-to="2" ></li>
        <li data-target="#landscape" data-slide-to="3" ></li>
        <li data-target="#landscape" data-slide-to="4" ></li>
        <li data-target="#landscape" data-slide-to="5" ></li>
        <li data-target="#landscape" data-slide-to="6" ></li>
        <li data-target="#landscape" data-slide-to="7" ></li>
        <li data-target="#landscape" data-slide-to="8" ></li>
	</ul>
	<!-- image -->
	<div class="carousel-inner">
	<div class="carousel-item active"><img src="image/4.png" width="1200" height="500">
	<div class="carousel-caption">
		<h1>ようこそ。 </h1>
		<h2>ありがとうございます。</h2>
	</div>
	</div>
	
	<div class="carousel-item"><img src="image/1.png" width="1200" height="500"></div>
	<div class="carousel-item"><img src="image/2.png" width="1200" height="500"></div>
	<div class="carousel-item"><img src="image/3.png" width="1200" height="500"></div>
	<div class="carousel-item"><img src="image/5.png" width="1200" height="500"></div>
	<div class="carousel-item"><img src="image/6.png" width="1200" height="500"></div>
	<div class="carousel-item"><img src="image/7.png" width="1200" height="500"></div>
	<div class="carousel-item"><img src="image/8.png" width="1200" height="500"></div>
	<div class="carousel-item"><img src="image/9.png" width="1200" height="500"></div>
	</div>
	<!-- move button -->
	<a class="carousel-control-prev" href="#landscape" data-slide="prev"><span class="carousel-control-prev-icon"></span></a>
	<a class="carousel-control-next" href="#landscape" data-slide="next"><span class="carousel-control-next-icon"></span></a>
</div>
</div> 

<!-- Notification preview -->
<c:forEach var="sub_list" items="${listAll}" varStatus="status">
<div class="container" style="margin-top:50px; margin-bottom:100px">
	<div class="row">
		<div class="col-lg-12" style="margin-top:20px; ">
			<div class="card shadow-none">
				<div class="card-body">
				<h2 class="card-title">Notification　(おしらせ)</h2>
					<table class="table table-hover" id='board_list'>
					<thead>
						<tr>
							<th class="text-center d-none d-md-table-cell" style="color:white">No</th>
							<th class="w-50" style="color:white">Title</th>
							<th class="text-center d-none d-md-table-cell" style="color:white">Writer</th>
							<th class="text-center d-none d-md-table-cell" style="color:white">Date Created</th>
							<th class="text-center d-none d-md-table-cell" style="color:white">Hits</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="postDTO" items="${sub_list }">
					<tr>
						<td class="text-center">${postDTO.post_idx }</td>
						<td>
						<a href='${root }board/read?board_idx=${boardNameList[0].board_idx }&post_idx=${postDTO.post_idx}&page=1'>${postDTO.post_subject }
							<!-- A small picture image appears in title of the notification board in case of uploading photo file -->
							<c:if test="${postDTO.post_file != null }">
								<img src="${root }image/uploadingPhoto.png" width=20px;>
							</c:if>
							<c:if test="${postDTO.reply_cnt > 0}">
								<span style="color: red;">[${postDTO.reply_cnt}]</span>
							</c:if>
						</a>
						</td>
						<td class="text-center">${postDTO.post_writer_name }</td> 
						<td class="text-center">${postDTO.post_date }</td>
						<td class="text-center">${postDTO.post_read_count }</td>
					</tr>
					</c:forEach>
					</tbody>
					</table>
					<!-- more(detail..) -->
					<div class="text-right">
						<a href="${root }board/main?board_idx=${boardNameList[status.index].board_idx }" class="btn btn-danger" style="color:white">more..</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div> 
</c:forEach>
<!-- Bottom -->  
<c:import url="/WEB-INF/view/include/bottom_info.jsp" />
</body>
</html>