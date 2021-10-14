<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ include file="/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ujin</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/namecard/bootstrap.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#registerBtn").click(function() {
			if (!$("#isbn").val()) {
				alert("도서번호 입력!!!!");
				return;
			} else if (!$("#bname").val()) {
				alert("도서명 입력!!!!");
				return;
			} else if (!$("#author").val()) {
				alert("저자 입력!!!!");
				return;
			} else if (!$("#price").val()) {
				alert("가격 입력!!!!");
				return;
			} else if (!$("#desc").val()) {
				alert("설명 입력!!!!");
				return;
			}else {
				$("#writeform").attr("action", "/managebook_cookie/managebook").submit();
			}
		});
		
		$("#cancelBtn").click(function() {
			location.href="<%=root%>/index.jsp";
		})
	});
</script>

</head>
<body>
	<div class="content" style="height: 900px; text-align: center;">
		<div class="page-header">
			<h1 style="padding-bottom: 10px; padding-top: 20px">도서 관리</h1>
			<div class="row" style="float: none; margin: 0 auto;">
				<div class="col-lg-6" style="float: none; margin: 0 auto;">
				<% if(manageMember != null) {
						%>
						<div class="form-group" style="text-align: right">
							<label for="exampleInputEmail1" class="form-label mt-4"><strong><%=manageMember.getUserid() %>님 안녕하세요.</strong>
							</label> 
							<a href="<%= root %>/user?act=logout">로그아웃</a>
						</div>

						<%
							}
						%>
					<form id="writeform" class="text-left mb-3" method="post" action="">
						<input type="hidden" name="action" value="regist">
						<fieldset>
							<legend>[ 도서 등록 ]</legend>
							<div class="form-group">
								<label class="form-label mt-4" style="float: left;">도서번호</label> 
								<input type="text" class="form-control" id="isbn" name="isbn" >
							</div>
							<div class="form-group">
								<label class="form-label mt-4" style="float: left;">도서명</label> 
								<input type="text" class="form-control" id="bname" name="bname">
							</div>
							<div class="form-group">
								<label class="form-label mt-4" style="float: left;">저자</label> 
								<input type="text" class="form-control" id="author" name="author">
							</div>
							<div class="form-group">
								<label class="form-label mt-4" style="float: left;">가격</label> 
								<input type="text" class="form-control" id="price" name="price" >
							</div>
							<div class="form-group" >
								<label class="form-label mt-4" style="float: left;">설명</label> 
								<input type="text" class="form-control" id="desc" name="desc">
							</div>
							<div style="padding-top: 20px; padding-bottom: 20px">
							<button type="button" class="btn btn-primary" id="cancelBtn">Cancel</button>
							<button type="submit" class="btn btn-primary" id="registerBtn">Submit</button>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>