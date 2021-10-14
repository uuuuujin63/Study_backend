package com.ujin.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ujin.dto.ManageMemberDto;
import com.ujin.dto.ManageProductDto;
import com.ujin.util.DBUtil;


@WebServlet("/product")
public class ManageProductServlet extends HttpServlet {
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
		
		if("register".equals(act)) { //회원가입
			path = registerProduct(request,response);
		} else if("list".equals(act)) { //회원가입
			path = listProduct(request,response);
		} else if("search".equals(act)) { //회원가입
			path = searchProduct(request,response);
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	private String searchProduct(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		ManageMemberDto mmd = (ManageMemberDto) session.getAttribute("userinfo");
		String content = "%"+request.getParameter("searchcontent")+"%";
		
		System.out.println("검색중 "+content);
		if(mmd!=null) {
			List<ManageProductDto> list = new ArrayList<ManageProductDto>();
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = dbUtil.getConnection();
				StringBuilder listArticle = new StringBuilder();
				listArticle.append("select regi_userid, isbn, pname, price, des, regidate \n");
				listArticle.append("from productinfo\n");
				listArticle.append("where pname like ? \n");
				pstmt = conn.prepareStatement(listArticle.toString());
				pstmt.setString(1, content);
				rs = pstmt.executeQuery();
				while (rs.next()) {
					ManageProductDto gbd = new ManageProductDto();
					gbd.setUserid(rs.getString("regi_userid"));
					gbd.setProductid(rs.getString("isbn"));
					gbd.setProductname(rs.getString("pname"));
					gbd.setPrice(rs.getString("price"));
					gbd.setDesc(rs.getString("des"));
					gbd.setDate(rs.getString("regidate"));
					
					list.add(gbd);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				dbUtil.close(rs, pstmt, conn);
			}
			
			request.setAttribute("products", list);
			System.out.println("검색완료");
			for(ManageProductDto p:list) {
				System.out.println(p.getProductname());
			}
			return "/product/list.jsp";
		}
		return "/index.jsp";
	}

	private String listProduct(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		ManageMemberDto mmd = (ManageMemberDto) session.getAttribute("userinfo");
		
		if(mmd!=null) {
			List<ManageProductDto> list = new ArrayList<ManageProductDto>();
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = dbUtil.getConnection();
				StringBuilder listArticle = new StringBuilder();
				listArticle.append("select regi_userid, isbn, pname, price, des, regidate \n");
				listArticle.append("from productinfo\n");
				pstmt = conn.prepareStatement(listArticle.toString());
				rs = pstmt.executeQuery();
				while (rs.next()) {
					ManageProductDto gbd = new ManageProductDto();
					gbd.setUserid(rs.getString("regi_userid"));
					gbd.setProductid(rs.getString("isbn"));
					gbd.setProductname(rs.getString("pname"));
					gbd.setPrice(rs.getString("price"));
					gbd.setDesc(rs.getString("des"));
					gbd.setDate(rs.getString("regidate"));
					
					list.add(gbd);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				dbUtil.close(rs, pstmt, conn);
			}
			
			request.setAttribute("products", list);
			
			return "/product/list.jsp";
		}
		return "/index.jsp";
	}

	private String registerProduct(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		ManageMemberDto mmd = (ManageMemberDto) session.getAttribute("userinfo");
		if(mmd != null) {
			String userid = mmd.getUserid();
			String productname = request.getParameter("productname");
			String productid = request.getParameter("productid");
			String price = request.getParameter("price");
			String desc = request.getParameter("desc");
			
			Connection conn = null;
			PreparedStatement pstmt = null;
			int cnt = 0;
			try {
				conn = dbUtil.getConnection();
				StringBuilder registerArticle = new StringBuilder();
				registerArticle.append("insert into productinfo (regi_userid, isbn, pname, price, des) \n");
				registerArticle.append("values (?, ?, ?, ?, ?)");
				pstmt = conn.prepareStatement(registerArticle.toString());
				pstmt.setString(1, userid);
				pstmt.setString(2, productid);
				pstmt.setString(3, productname);
				pstmt.setString(4, price);
				pstmt.setString(5, desc);
				cnt = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				dbUtil.close(pstmt, conn);
			}
			if(cnt==0) {
				System.out.println("등록 실패");
			}
		} 
		return "/index.jsp";
	}
}
