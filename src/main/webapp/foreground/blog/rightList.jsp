<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="data_list">
	<div class="data_list_title">
		<img src="${pageContext.request.contextPath}/static/images/user_icon.png"/>
		博主信息
	</div>
	<div class="user_image">
		<img src="${pageContext.request.contextPath}/static/userImages/${blogger.imagename}"/>
	</div>
	<div class="nickName">${blogger.nickname }</div>
	<div class="userSign">${blogger.sign }</div>
</div>	

<div class="data_list">
	<div class="data_list_title">
		<img src="${pageContext.request.contextPath}/static/images/byType_icon.png"/>
		文章分类
	</div>
	<div class="datas">
		<ul>						
				<c:forEach items="${blogTypeList }" var="blogType">
					<li><span>
					<a href="${pageContext.request.contextPath}/index.html?typeId=${blogType.id }">${blogType.typeName }（${blogType.blogCount }）
					</a></span>
					</li>		
				</c:forEach>					
		</ul>
	</div>
</div>

<div class="data_list">
	<div class="data_list_title">
		<img src="${pageContext.request.contextPath}/static/images/byDate_icon.png"/>
		文章存档
	</div>
	<div class="datas">
		<ul>						
				<c:forEach items="${blogTimeList }" var="blog">							
					<li><span>
					<a href="${pageContext.request.contextPath}/index.html?releaseDateStr=${blog.releaseDateStr }">${blog.releaseDateStr }（${blog.blogCount }）
					</a></span>
					</li>						
				</c:forEach>						
		</ul>
	</div>
</div>

<div class="data_list">
	<div class="data_list_title">
		<img src="${pageContext.request.contextPath}/static/images/link_icon.png"/>
		友情链接
	</div>
	<div class="datas">
		<ul>						
			<c:forEach items="${linkList }" var="link">
				<li><span><a href="${link.linkurl }" target="_blank">${link.linkname }</a></span></li>
			</c:forEach>											
		</ul>
	</div>
</div>
