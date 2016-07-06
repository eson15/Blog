<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript" src="${pageContext.request.contextPath}/static/ueditor/third-party/SyntaxHighlighter/shCore.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/ueditor/third-party/SyntaxHighlighter/shCoreDefault.css">
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
			<h3>
				<strong>${blog.title }</strong>
			</h3>
		</div>
		<div class="blog_info">
			发布时间：『
			<fmt:formatDate value="${blog.releaseDate }" type="date"
				pattern="yyyy-MM-dd HH:mm" />
			』&nbsp;&nbsp;博客类别：${blog.blogType.typeName }&nbsp;&nbsp;阅读(${blog.clickHit }) 评论(${blog.replyHit })
		</div>
		<div class="blog_content">
			${blog.content }
		</div>
	</div>
</div>