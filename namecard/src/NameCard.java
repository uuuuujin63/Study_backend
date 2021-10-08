

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Namecard")
public class NameCard extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String compname = request.getParameter("compname");
		String dename = request.getParameter("dename");
		String position = request.getParameter("position");
		String rank = request.getParameter("rank");
		String email = request.getParameter("email");
		String num = request.getParameter("num");
		String phonenum = request.getParameter("phonenum");
		String add = request.getParameter("add");
		String des = request.getParameter("des");
		String f_phonenum = request.getParameter("p_option");
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head>");
		out.println("    <meta charset=\"UTF-8\">");
		out.println("	<title>ujin</title>");
		out.println("<link rel=\"stylesheet\" href=\"/namecard/bootstrap.css\">");
		out.println("</head>");
		out.println("<body>");
		out.println("	<header>");
		out.println("		<nav class=\"navbar navbar-expand-lg navbar-dark bg-primary\">");
		out.println("			<div class=\"container-fluid\">");
		out.println("				<a class=\"navbar-brand\" href=\"#\">UJin JSP</a>");
		out.println("			</div>");
		out.println("		</nav>");
		out.println("	</header>");
		out.println("	<div class=\"content\" style=\"height: 900px; text-align: center;\">");
		out.println("		<div class=\"page-header\">");
		out.println("	<h1 style=\"padding-bottom: 10px; padding-top:20px\">명함 등록</h1>");
		out.println("	<div class=\"row\" style=\"float: none; margin: 0 auto;\">");
		out.println("		<div class=\"col-lg-8\" style=\"float: none; margin: 0 auto;\">");
		out.println("			<form id=\"writeform\" class=\"text-left mb-3\" method=\"post\" action=\"\">");
		out.println("<table class=\"table table-hover\">");
		out.println("	<tr>");
		out.println("		<th scope=\"col\" style=\"color: gray;\">이름</th>");
		out.println("		<th scope=\"col\" colspan=\"3\">"+name+"</th>");
		out.println("	</tr>");
		out.println("	<tr>");
		out.println("		<th scope=\"col\" style=\"color: gray;\">회사명</th>");
		out.println("		<th scope=\"col\">"+compname+"</th>");
		out.println("		<th scope=\"col\" style=\"color: gray;\">부서명</th>");
		out.println("		<th scope=\"col\">"+dename+"</th>");
		out.println("	</tr>");
		out.println("	<tr>");
		out.println("		<th scope=\"col\" style=\"color: gray;\">직위</th>");
		out.println("		<th scope=\"col\">"+position+"</th>");
		out.println("		<th scope=\"col\" style=\"color: gray;\">직급</th>");
		out.println("		<th scope=\"col\">"+rank+"</th>");
		out.println("	</tr>");
		out.println("	<tr>");
		out.println("		<th scope=\"col\" style=\"color: gray;\">이메일주소</th>");
		out.println("		<th scope=\"col\" colspan=\"3\">"+email+"</th>");
		out.println("	</tr>");
		out.println("	<tr>");
		out.println("		<th scope=\"col\" style=\"color: gray;\">전화번호</th>");
		out.println("		<th scope=\"col\" colspan=\"3\">"+num+"</th>");
		out.println("	</tr>");
		out.println("	<tr>");
		out.println("		<th scope=\"col\" style=\"color: gray;\">휴대폰</th>");
		out.println("		<th scope=\"col\" colspan=\"3\">"+f_phonenum+phonenum+"</th>");
		out.println("	</tr>");
		out.println("	<tr>");
		out.println("		<th scope=\"col\" style=\"color: gray;\">주소</th>");
		out.println("		<th scope=\"col\" colspan=\"3\">"+add+"</th>");
		out.println("	</tr>");
		out.println("	<tr>");
		out.println("		<th scope=\"col\" style=\"color: gray;\">비고</th>");
		if(des==null) {
			out.println("		<th scope=\"col\" colspan=\"3\"></th>");
		}else {
			out.println("		<th scope=\"col\" colspan=\"3\">"+des+"</th>");	
		}
		out.println("	</tr>");
		out.println("			</table>");
		out.println("			</form>");
		out.println("		</div>");
		out.println("	</div>");
		out.println("	<div class=\"row\">");
		out.println("		<div class=\"col-lg-8\" style=\"float: none; margin: 0 auto;\">");
		out.println("				<button type=\"button\" id = \"registerBtn\" class=\"btn btn-primary\"\r\n" + 
				"						style=\"width: 200px; text-align: center\">확인</button>");
		out.println("			</div>");
		out.println("		</div>");
		out.println("		</div>");
		out.println("		</div>");
		out.println("<footer id=\"footer\">");
		out.println("	<div class=\"navbar navbar-expand-lg navbar-dark bg-primary\">");
		out.println("		<div class=\"container-fluid navbar-brand\">Copyright 2021 UJin</div>");
		out.println("	</div>");
		out.println("</footer>");
		out.println("</body>");
		out.println("</html>");
	}

}
