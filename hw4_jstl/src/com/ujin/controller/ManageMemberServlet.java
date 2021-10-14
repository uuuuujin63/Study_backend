package com.ujin.controller;

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

import com.ujin.dto.ManageMemberDto;
import com.ujin.util.DBUtil;


@WebServlet("/user")
public class ManageMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private DBUtil dbUtil = DBUtil.getInstance();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		process(request,response);
	}

	private void process(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String act = request.getParameter("act");
		String path = "/index.jsp";
		String root = request.getContextPath();
		
		if("join".equals(act)) { //회원가입
			path = joinMember(request,response);
			response.sendRedirect(root + path);
		} else if("login".equals(act)) { //로그인
			path = loginMember(request,response);
			request.getRequestDispatcher(path).forward(request, response);
		} else if("logout".equals(act)) {
			path = logoutMember(request,response);
			response.sendRedirect(root + path);
		}
	}

	private String logoutMember(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "/index.jsp";
	}

	private String loginMember(HttpServletRequest request, HttpServletResponse response) {
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		ManageMemberDto mmd = null;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder loginMember = new StringBuilder();
			loginMember.append("select userid \n");
			loginMember.append("from user \n");
			loginMember.append("where userid = ? and userpwd = ? \n");
			pstmt = conn.prepareStatement(loginMember.toString());
			pstmt.setString(1, userid);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				mmd = new ManageMemberDto();
				mmd.setUserid(rs.getString("userid"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbUtil.close(rs, pstmt, conn);
		}
		
		if(mmd != null) {
//			session 설정
			HttpSession session = request.getSession();
			session.setAttribute("userinfo", mmd);
			return "/index.jsp";
		} else {
			request.setAttribute("msg", "아이디 또는 비밀번호 확인 후 다시 로그인하세요!");
			return "/user/login.jsp";
		}
	}

	private String joinMember(HttpServletRequest request, HttpServletResponse response) {
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = dbUtil.getConnection();
			StringBuilder registerMember = new StringBuilder();
			registerMember.append("insert into user (userid, userpwd) \n");
			registerMember.append("values (?, ?)");
			pstmt = conn.prepareStatement(registerMember.toString());
			pstmt.setString(1, userid);
			pstmt.setString(2, pwd);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dbUtil.close(pstmt, conn);
		}
		return "/index.jsp";
	}

}
