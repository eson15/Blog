<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="data_list">
	<div class="data_list_title">
		<img
			src="${pageContext.request.contextPath}/static/images/search_icon.png" />&nbsp;
			搜索&nbsp;<font color="red">${q }</font>&nbsp;的结果&nbsp;(共搜索到&nbsp;${resultTotal }&nbsp;条记录)
	</div>
	<div class="datas search">
		<ul>
			<c:choose>
				<c:when test="${blogIndexList.size()==0 }">
					<div align="center" style="padding-top:20px">未查询到结果，请换个关键字试试>_<</div>
				</c:when>
				<c:otherwise>
					<c:forEach items="${blogIndexList }" var="blog">
						 <li style="margin-bottom: 20px">
						  	<span class="title">
						  		<img alt="文章类型" src="${pageContext.request.contextPath}/static/userImages/yuan.jpg">
						  		<a href="${pageContext.request.contextPath}/blog/articles/${blog.id }.html" target="_blank">${blog.title }</a></span>
						  	<span class="summary">摘要: ${blog.content }...</span>
						  	<span class="link"><a href="${pageContext.request.contextPath}/blog/articles/${blog.id }.html">${pageContext.request.contextPath}/blog/articles/${blog.id }.html</a>&nbsp;&nbsp;&nbsp;&nbsp;发布日期：${blog.releaseDateStr }</span>
						 </li>						
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
	${pageCode }
</div>