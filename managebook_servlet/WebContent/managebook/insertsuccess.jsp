<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*,com.ujin.managebook.dto.ManageBookDto"%>

<%
ManageBookDto info = (ManageBookDto) request.getAttribute("insertinfo");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert success</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/namecard/bootstrap.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


</head>
<body>
	<div class="content" style="height: 900px; text-align: center;">
		<div class="page-header">
			<h1 style="padding-bottom: 10px; padding-top: 20px">도서 등록 성공</h1>
			<div class="row" style="float: none; margin: 0 auto;">
				<div class="col-lg-6" style="float: none; margin: 0 auto;">
						<input type="hidden" name="action" value="regist">
						<fieldset>
							<legend>[ 등록 내용 ]</legend>
							<div class="form-group">
								<label class="form-label mt-4" style=" font-weight: bold;">도서번호</label> 
								<label class="form-label mt-4" style=""><%= info.getIsbn() %></label> 	
							</div>
							<div class="form-group">
								<label class="form-label mt-4" style="font-weight: bold;">도서명</label> 
								<label class="form-label mt-4" style=""><%= info.getTitle() %></label> 	
							</div>
							<div class="form-group">
								<label class="form-label mt-4" style="font-weight: bold;">저자</label> 
								<label class="form-label mt-4" style=""><%= info.getAuthor() %></label> 	
							</div>
							<div class="form-group">
								<label class="form-label mt-4" style=" font-weight: bold;">가격</label> 
								<label class="form-label mt-4" style=""><%= info.getPrice() %></label> 	
							</div>
							<div class="form-group" >
								<label class="form-label mt-4" style=" font-weight: bold;">설명</label> 
								<label class="form-label mt-4" style=""><%= info.getDesc() %></label> 	
							</div>
						</fieldset>
						<a href="/managebook_servlet/managebook/servletNm.jsp">돌아가기</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>