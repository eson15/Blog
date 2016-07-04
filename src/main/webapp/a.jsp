<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!-- 重定向到index.html，让springmvc接收，这里.html是伪静态
	springmvc接收所有.do和.html结尾的请求 -->
<% response.sendRedirect("index.html"); %>
