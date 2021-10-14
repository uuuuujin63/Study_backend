<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/include/header.jsp"%>

<c:if test="${empty userinfo }">
	<script type="text/javascript">
		alert("로그인 후 이용 가능한 페이지입니다.");
		location.href = "${root}/index.jsp";
	</script>
</c:if>
<c:if test="${!empty userinfo }">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ujin</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${root}/product/bootstrap.css">
<script type="text/javascript">
	$(document).ready(function() {searchBtn
		$("#cancelBtn").click(function() {
			location.href = "${root}/index.jsp"
		});
		$("#searchBtn").click(function() {
			$("#searchform").attr("action", "${root}/product").submit();
		});
	});
</script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<div class="container-fluid">
			<a class="navbar-brand" href="${root}/index.jsp">ujin's Product</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarColor01"
				aria-controls="navbarColor01" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarColor01">
				<ul class="navbar-nav me-auto">
					<li class="nav-item"><a class="nav-link active" href="#">${userinfo.userid}님
							안녕하세요. <span class="visually-hidden"></span>
					</a></li>
				</ul>
				<form id="searchform" class="d-flex" method="post" action="">
					<input type="hidden" name="act" value="search">
					<input class="form-control me-sm-2" type="text" name="searchcontent"
						placeholder="Search">
					<button class="btn btn-secondary my-2 my-sm-0" type="submit" id="searchBtn">Search</button>
				</form>
			</div>
		</div>
	</nav>
	<div class="content" style="height: 900px; text-align: center;">
		<div class="page-header">
			<h1 style="padding-bottom: 10px; padding-top: 20px">상품 목록 페이지</h1>
			<div class="row" style="float: none; margin: 0 auto;">
				<div class="col-lg-6"
					style="float: none; margin: 0 auto; text-align: left">
					<form id="registerform" class="text-left mb-3" method="post"
						action="">
						<input type="hidden" name="act" value="register">
						<fieldset>
							<c:if test="${!empty products}">
								<c:forEach var="p" items="${products}">
									<table class="table table-hover">
										<tbody>
											<tr class="table-active">
												<td><strong>작성자</strong> : ${userinfo.userid}</td>
											</tr>
											<tr class="table-active">
												<td><strong>작성일</strong> : ${p.date}</td>
											</tr>
											<tr class="table-active">
												<td><strong>상품번호</strong> : ${p.productid}</td>
												
											</tr>
											<tr class="table-active">
												<td><strong>상품명</strong> : ${p.productname}</td>
											</tr>
											<tr class="table-active">
												<td><strong>가격</strong> : ${p.price}</td>
											</tr>
											<tr class="table-active">
												<td><strong>설명</strong> : ${p.desc}</td>
											</tr>
											
									</table>
								</c:forEach>
							</c:if>
							<br>
							<button type="button" id="cancelBtn" class="btn btn-primary">Home</button>
						</fieldset>
					</form>

				</div>
			</div>
		</div>
	</div>
</body>
	</html>
</c:if>