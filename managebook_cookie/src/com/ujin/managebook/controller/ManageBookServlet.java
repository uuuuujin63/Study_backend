package com.ujin.managebook.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ujin.managebook.dto.ManageBookDto;
import com.ujin.util.DBUtil;

@WebServlet("/managebook")
public class ManageBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private final DBUtil util = DBUtil.getInstance();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		String act = request.getParameter("action");

		String isbn = request.getParameter("isbn");
		String bname = request.getParameter("bname");
		String price = request.getParameter("price");
		String desc = request.getParameter("desc");
		String author = request.getParameter("author");

		if (act.equals("regist")) {
			ManageBookDto info = new ManageBookDto(isbn, bname, author, price, desc);

			Connection conn = null;
			PreparedStatement pstmt = null;
			int cnt = 0;
			try {
				conn = util.getConnection();
				StringBuilder registerbookinfo = new StringBuilder();
				registerbookinfo.append("insert into book (isbn, bname, author, price, des) \n");
				registerbookinfo.append("values (?, ?, ?, ?, ?)");
				pstmt = conn.prepareStatement(registerbookinfo.toString());
				pstmt.setString(1, isbn);
				pstmt.setString(2, bname);
				pstmt.setString(3, author);
				pstmt.setString(4, price);
				pstmt.setString(5, desc);
				cnt = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				util.close(pstmt, conn);
			}

			request.setAttribute("insertinfo", info);

			String path = cnt!= 0 ? "/managebook/insertsuccess.jsp" : "/managebook/insertfail.jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(path);
			dispatcher.forward(request, response);
		}
	}

}
