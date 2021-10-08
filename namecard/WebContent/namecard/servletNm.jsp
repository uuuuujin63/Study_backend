<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ujin</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/namecard/bootstrap.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#registerBtn").click(function(){
			if(!$("#name").val()){
				alert("아이디 입력!!!!");
                return;
			} else if (!$("#compname").val()) {
                alert("회사명 입력!!!!");
                return;
            } else if (!$("#dename").val()) {
                alert("부서명 입력!!!!");
                return;
            } else if (!$("#position").val()) {
                alert("직급 입력!!!!");
                return;
            } else if (!$("#rank").val()) {
                alert("직위 입력!!!!");
                return;
            } else if (!$("#email").val()) {
                alert("이메일 입력!!!!");
                return;
            } else if (!$("#num").val()) {
                alert("전화번호 입력!!!!");
                return;
            } else if (!$("#phonenum").val()) {
                alert("핸드폰 번호 입력!!!!");
                return;
            } else if (!$("#add").val()) {
                alert("주소 입력!!!!");
                return;
            }else{
            	$("#writeform").attr("action", "/Namecard").submit();
            }
		});
	});
</script>

</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
			<div class="container-fluid">
				<a class="navbar-brand" href="#">UJin JSP</a>
			</div>
		</nav>
	</header>
	<div class="content" style="height: 900px; text-align: center;">
		<div class="page-header">
			<h1 style="padding-bottom: 10px; padding-top:20px">명함 등록</h1>
			<div class="row" style="float: none; margin: 0 auto;">
				<div class="col-lg-8" style="float: none; margin: 0 auto;">
					<form id="writeform" class="text-left mb-3" method="post" action="">
					<table class="table table-hover">
						<tr>
							<th scope="col">이름</th>
							<th scope="col" colspan="3"><input type="text"
								class="form-control" id="name" name="name" style="width: 350px"></th>
						</tr>
						<tr>
							<th scope="col">회사명</th>
							<th scope="col"><input type="text" class="form-control"
								id="compname" name="compname" style="width: 350px"></th>
							<th scope="col">부서명</th>
							<th scope="col"><input type="text" class="form-control"
								id="dename" name="dename" style="width: 350px"></th>
						</tr>
						<tr>
							<th scope="col">직위</th>
							<th scope="col"><input type="text" class="form-control"
								id="position" name="position" style="width: 350px"></th>
							<th scope="col">직급</th>
							<th scope="col"><input type="text" class="form-control"
								id="rank" name="rank" style="width: 350px"></th>
						</tr>
						<tr>
							<th scope="col">이메일주소</th>
							<th scope="col" colspan="3"><input type="text"
								class="form-control" id="email" name="email"
								style="width: 350px"></th>
						</tr>
						<tr>
							<th scope="col">전화번호</th>
							<th scope="col" colspan="3"><input type="text"
								class="form-control" id="num" name="num" style="width: 350px">
							</th>
						</tr>
						<tr>
							<th scope="col">휴대폰</th>
							<th scope="col" colspan="3"><select id="p_option"
								style="float: left">
									<option value="010" selected="selected">010</option>
									<option value="011">011</option>
									<option value="019">019</option>
							</select><input type="text" class="form-control" id="phonenum"
								name="phonenum" style="width: 200px"></th>
						</tr>
						<tr>
							<th scope="col">주소</th>
							<th scope="col" colspan="3"><input type="text"
								class="form-control" id="add" name="add"
								style="width: 350px; float: left;"></th>
						</tr>
						<tr>
							<th scope="col">비고</th>
							<th scope="col" colspan="3"><input type="text"
								class="form-control" id="des" name="des" style="width: 350px"></th>
						</tr>

					</table>
					</form>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-8" style="float: none; margin: 0 auto;">
					<button type="button" id = "registerBtn" class="btn btn-primary"
						style="width: 200px; text-align: center">확인</button>
				</div>
			</div>
		</div>
	</div>
	<footer id="footer">
		<div class="navbar navbar-expand-lg navbar-dark bg-primary">
			<div class="container-fluid navbar-brand">Copyright 2021 UJin</div>
		</div>
	</footer>
</body>
</html>