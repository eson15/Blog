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
	<div class="nickName"><strong><font style="color: #EE6A50">昵称：${blogger.nickname }</font></strong></div>
	<%-- <div class="visitNum">访问量：6666</div>  --%>
	<div class="userSign">『<strong><font style="color: #EE6A50">${blogger.sign }</font></strong>』</div>
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
				<div class="bdsharebuttonbox">
					<a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
					<a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
					<a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
					<a href="#" class="bds_tieba" data-cmd="tieba" title="分享到百度贴吧"></a>
					<a href="#" class="bds_sqq" data-cmd="sqq" title="分享到QQ好友"></a>
					<a href="#" class="bds_renren" data-cmd="renren" title="分享到人人网"></a>
					<a href="#" class="bds_more" data-cmd="more"></a>
				</div>
			</div>
		</ul>
	</div>
</div>
