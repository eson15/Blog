<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="data_list">
	<div class="data_list_title">
		<img
			src="${pageContext.request.contextPath}/static/images/user_icon.png" />
		博主信息
	</div>
	<div class="user_image">
		<img
			src="${pageContext.request.contextPath}/static/userImages/${blogger.imagename}" />
	</div>
	<div class="nickName">昵称：${blogger.nickname }</div>
	<div class="visitNum">访问量：6666</div>
	<div class="userSign">『${blogger.sign }』</div>
</div>

<div class="data_list">
	<div class="data_list_title">
		<img
			src="${pageContext.request.contextPath}/static/images/byType_icon.png" />
		文章分类
	</div>
	<div class="datas">
		<ul>
			<c:forEach items="${blogTypeList }" var="blogType">
				<li><span> <a
						href="${pageContext.request.contextPath}/index.html?typeId=${blogType.id }">${blogType.typeName }（${blogType.blogCount }）
					</a></span></li>
			</c:forEach>
		</ul>
	</div>
</div>

<div class="data_list">
	<div class="data_list_title">
		<img
			src="${pageContext.request.contextPath}/static/images/byDate_icon.png" />
		文章存档
	</div>
	<div class="datas">
		<ul>
			<c:forEach items="${blogTimeList }" var="blog">
				<li><span> <a
						href="${pageContext.request.contextPath}/index.html?releaseDateStr=${blog.releaseDateStr }">${blog.releaseDateStr }（${blog.blogCount }）
					</a></span></li>
			</c:forEach>
		</ul>
	</div>
</div>

<div class="data_list">
	<div class="data_list_title">
		<img
			src="${pageContext.request.contextPath}/static/images/link_icon.png" />
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


<div class="data_list">
	<div class="data_list_title">
		<img
			src="${pageContext.request.contextPath}/static/images/comment_icon.png" />
		分享到
	</div>
	<div class="datas">
		<ul>
			<div style="text-align:left;padding-top:20px;">
				<div class="bshare-custom icon-medium-plus">
					<a title="分享到新浪微博" class="bshare-sinaminiblog"></a>
					<a title="分享到QQ空间" class="bshare-qzone"></a>
					<a title="分享到腾讯微博" class="bshare-qqmb"></a>
					<a title="分享到网易微博" class="bshare-neteasemb"></a>
					<a title="更多平台" class="bshare-more bshare-more-icon more-style-addthis"></a>
				</div>
				<script type="text/javascript" charset="utf-8"
					src="http://static.bshare.com/b/buttonLite.js#style=-1&amp;uuid=&amp;pophcol=2&amp;lang=zh_TW"></script>
				<script type="text/javascript" charset="utf-8"
					src="http://static.bshare.com/b/bshareC0.js"></script>
			</div>
		</ul>
	</div>
</div>