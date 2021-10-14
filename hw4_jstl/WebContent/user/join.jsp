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
	$(document).ready(
			function() {
				$("#joinBtn").click(
						function() {
							if (!$("#userid").val()) {
								alert("아이디 입력!!!");
								return;
							} else if (!$("#pwd").val()) {
								alert("비밀번호 입력!!!");
								return;
							} else {
								$("#joinform").attr("action",
										"${root}/user").submit();
							}
						});
				$("#cancelBtn").click(function(){
						location.href="${root}/index.jsp"
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
			<h1 style="padding-bottom: 10px; padding-top: 20px">회원가입 페이지</h1>
			<div class="row" style="float: none; margin: 0 auto;">
				<div class="col-lg-6"
					style="float: none; margin: 0 auto; text-align: left">
					<form id="joinform" class="text-left mb-3" method="post" action="">
						<input type="hidden" name="act" value="join">
							<fieldset>
								<div class="form-group">
									<label for="id" class="form-label mt-4">ID</label> <input type="text" class="form-control" id="userid"
										name="userid" aria-describedby="emailHelp" placeholder="ID">
								</div>
								<div class="form-group">
									<label for="exampleInputPassword1" class="form-label mt-4">Password</label>
									<input type="password" class="form-control" id="pwd" name="pwd"
										placeholder="Password">
								</div>
								<br>
								<button type="button" id="cancelBtn" class="btn btn-primary">Cancel</button>
								<button type="button" id="joinBtn" class="btn btn-primary">Join</button>
							</fieldset>
					</form>

				</div>
			</div>
		</div>
	</div>
</body>
</html>