package com.ujin.managebook.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ujin.managebook.dto.ManageMember;
import com.ujin.util.DBUtil;

@WebServlet("/user")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private DBUtil util = DBUtil.getInstance();
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		process(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		process(request, response);
	}

	private void process(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String root = request.getContextPath();
		String act = request.getParameter("act");
		String path = "/index.jsp";
		
		if(act.equals("login")) {
			path = loginMember(request, response);
			response.sendRedirect(root + path);
		} else if(act.equals("logout")) {
			path = logoutMember(request, response);
			response.sendRedirect(root + path);
		}
	}

	private String logoutMember(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		session.invalidate();
		return "/index.jsp";
	}

	private String loginMember(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		
		ManageMember memberDto = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = util.getConnection();
			
			String sql = "select * \n";
			sql += "from member \n";
			sql += "where userid=? and userpwd = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				memberDto = new ManageMember();
				memberDto.setUserid(id);
				memberDto.setUserpwd(pwd);
				System.out.println(memberDto.getUserid()+" "+memberDto.getUserpwd());
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			util.close(rs, pstmt, conn);
		}
		
		if(memberDto!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("userinfo", memberDto);
		}
		return "/index.jsp";
	}

}
