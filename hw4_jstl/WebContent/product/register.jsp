<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/include/header.jsp"%>
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
	$(document).ready(function() {
		$("#registerBtn").click(function() {
			if (!$("#productname").val()) {
				alert("상품명 입력!!!");
				return;
			} else if (!$("#productid").val()) {
				alert("상품번호 입력!!!");
				return;
			} else if (!$("#price").val()) {
				alert("가격 입력!!!");
				return;
			} else if (!$("#desc").val()) {
				alert("설명 입력!!!");
				return;
			}  else {
				$("#registerform").attr("action", "${root}/product").submit();
			}
		});
		$("#cancelBtn").click(function() {
			location.href = "${root}/index.jsp"
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
				<c:if test="${not empty userinfo}">
					<li class="nav-item"><a class="nav-link active" href="#">${userinfo.userid}님 안녕하세요.
							<span class="visually-hidden"></span>
					</a></li>
					</c:if>
				</ul>
				<form class="d-flex">
					<input class="form-control me-sm-2" type="text"
						placeholder="Search">
					<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
				</form>
			</div>
		</div>
	</nav>
	<div class="content" style="height: 900px; text-align: center;">
		<div class="page-header">
			<h1 style="padding-bottom: 10px; padding-top: 20px">상품 등록 페이지</h1>
			<div class="row" style="float: none; margin: 0 auto;">
				<div class="col-lg-6"
					style="float: none; margin: 0 auto; text-align: left">
					<form id="registerform" class="text-left mb-3" method="post" action="">
						<input type="hidden" name="act" value="register">
						<fieldset>
							<div class="form-group">
								<label for="id" class="form-label mt-4">상품 번호</label> <input
									type="text" class="form-control" id="productid" name="productid"
									aria-describedby="emailHelp" placeholder="상품 번호">
							</div>
							<div class="form-group">
								<label for="id" class="form-label mt-4">상품명</label> <input
									type="text" class="form-control" id="productname" name="productname"
									aria-describedby="emailHelp" placeholder="상품명">
							</div>
							<div class="form-group">
								<label for="id" class="form-label mt-4">가격(숫자만 작성하세요.)</label> <input
									type="number" class="form-control" id="price" name="price"
									aria-describedby="emailHelp" placeholder="가격">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1" class="form-label mt-4">상품 설명</label>
								<input type="text" class="form-control" id="desc" name="desc"
									placeholder="상품 설명">
							</div>
							<br>
							<button type="button" id="cancelBtn" class="btn btn-primary">Cancel</button>
							<button type="button" id="registerBtn" class="btn btn-primary">Register</button>
						</fieldset>
					</form>

				</div>
			</div>
		</div>
	</div>
</body>
</html>