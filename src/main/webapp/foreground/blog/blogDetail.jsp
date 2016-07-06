<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/ueditor1_4_3_3/third-party/SyntaxHighlighter/shCore.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/ueditor1_4_3_3/third-party/SyntaxHighlighter/shCoreDefault.css">
<script type="text/javascript">
	SyntaxHighlighter.all();
</script>

<div class="data_list">
	<div class="data_list_title">
		<img
			src="${pageContext.request.contextPath}/static/images/blog_show_icon.png" />&nbsp;博客信息
	</div>
	<div>
		<div class="blog_title">
			<h3><strong>${blog.title }</strong></h3>
		</div>
		<div class="blog_info">		
			<div style="float: left">
			<strong>标签</strong>：
			<c:choose>
				<c:when test="${keyWords==null }">
					&nbsp;&nbsp;无
				</c:when>
				<c:otherwise>
					<c:forEach items="${keyWords }" var="keyword">
					&nbsp;&nbsp;<a href="#">${keyword }</a>&nbsp;
				</c:forEach>
				</c:otherwise>			
			</c:choose>			
			</div>
			<div style="margin-right: 0px;">
			发布于：『
			<fmt:formatDate value="${blog.releaseDate }" type="date"
				pattern="yyyy-MM-dd HH:mm" />
			』&nbsp;&nbsp;
			博客类别：<a href="${pageContext.request.contextPath}/index.html?typeId=${blog.blogType.id }">${blog.blogType.typeName }</a>&nbsp;&nbsp;
			阅读(${blog.clickHit })&nbsp;&nbsp;
			评论(${blog.replyHit })			
			</div>
		</div>
		<div class="xian" style="margin:6px auto; border-top:1px solid #ddd" ></div>
		<div class="blog_content">${blog.content }</div>
		<div class="xian" style="margin:0 auto; border-top:1px solid #ddd" ></div>
		<div style="margin-top: 25px;">
			${pageCode }
		</div>
	</div>
</div>