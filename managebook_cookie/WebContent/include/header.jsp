<%@ page import="com.ujin.managebook.dto.ManageMember"%>
<%@ page import="com.ujin.managebook.dto.ManageBookDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String root = request.getContextPath();
ManageMember manageMember= (ManageMember) session.getAttribute("userinfo");%>