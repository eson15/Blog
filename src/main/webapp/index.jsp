<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap3/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap3/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/blog.css">
<script src="${pageContext.request.contextPath}/static/bootstrap3/js/jquery-1.11.2.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap3/js/bootstrap.min.js"></script>
<title>博客主页</title>
<style type="text/css">
	body{
		padding-top:10px;
		padding-bottom:40px;
		background-color: #F8F8FF;
		font-family: microsoft yahei;
	}
</style>
</head>

<body>
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<div class="blog"><strong>倪升武的博客</strong></div>
			</div>
			<div class="col-md-8">
				<iframe style="float:right" width="420" scrolling="no" height="60" frameborder="0"
					allowtransparency="true"
					src="http://i.tianqi.com/index.php?c=code&id=12&icon=1&num=5"></iframe>
			</div>
		</div>
		
		<div class="row" style="padding-top: 10px">
			<div class="col-md-12">
				<nav class="navbar navbar-default">
				  <div class="container-fluid">				    
				    <!-- Collect the nav links, forms, and other content for toggling -->
				    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				      <ul class="nav navbar-nav">
				      	<li class="active"><a class="navbar-brand" href="#">博客首页</a></li>
				        <li><a class="navbar-brand" href="#">关于博主</a></li>
				        <li><a class="navbar-brand" href="#">我的相册</a></li>
				        <li><a class="navbar-brand" href="#">资源小站</a></li>
				        <li><a class="navbar-brand" href="#">程序人生</a></li>
				        <li><a class="navbar-brand" href="#">CSDN</a></li>
				      </ul>
				      <form class="navbar-form navbar-right" role="search">
				        <div class="form-group">
				          <input type="text" class="form-control" placeholder="请输入要查询的关键字">
				        </div>
				        <button type="submit" class="btn btn-default">搜索</button>
				      </form>
				    </div><!-- /.navbar-collapse -->
				  </div><!-- /.container-fluid -->
				</nav>
			</div>
		</div>
		
		<div class="row">	
		  <div class="col-md-3">
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
							<li><span><a href="#">Java核心基础(33)</a></span></li>						
							<li><span><a href="#">Mysql(1)</a></span></li>						
							<li><span><a href="#">Spring(5)</a></span></li>						
							<li><span><a href="#">Hibernate(1)</a></span></li>						
							<li><span><a href="#">Struts2(1)</a></span></li>						
							<li><span><a href="#">MyBatis(1)</a></span></li>						
							<li><span><a href="#">maven(1)</a></span></li>						
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
							<li><span><a href="#">2016年06月(36)</a></span></li>						
							<li><span><a href="#">2016年05月(10)</a></span></li>						
							<li><span><a href="#">2016年04月(19)</a></span></li>						
							<li><span><a href="#">2016年03月(14)</a></span></li>					
							<li><span><a href="#">2016年02月(23)</a></span></li>						
							<li><span><a href="#">2016年01月(1)</a></span></li>						
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
			
			  	
		  </div>
		  	  
		  <div class="col-md-9">
		  	<div class="data_list">
		  		<div class="data_list_title">
					<img src="${pageContext.request.contextPath}/static/images/list_icon.png"/>&nbsp;最新博客
				</div>	
				<div class="datas">
					<ul>
														
						<li style="margin-bottom: 30px">
						  	<span class="title">
						  		<img alt="文章类型" src="${pageContext.request.contextPath}/static/userImages/yuan.jpg">
						  		<a href="#">这是一篇测试博客</a>
						  	</span>
						  	<span class="summary">摘要: 这是用来测试的静态数据，为了多搞一点数据，于是我开始喋喋不休的说一些废话，包括我很帅之类的，虽然我一直强调自己要低调，但不知为何，自己的容颜非得和内心背道而驰....</span>
						  	<span class="img">
						  		
							  		<a href="#"><img src="${pageContext.request.contextPath}/static/userImages/dog.jpg" title="dog" alt="dog.jpg" width="823" height="489" style="width: 823px; height: 489px;"></a>
							  		<a href="#"><img src="${pageContext.request.contextPath}/static/userImages/dog.jpg" title="dog" alt="dog.jpg" width="823" height="489" style="width: 823px; height: 489px;"></a>
							  		<a href="#"><img src="${pageContext.request.contextPath}/static/userImages/dog.jpg" title="dog" alt="dog.jpg" width="823" height="489" style="width: 823px; height: 489px;"></a>
							  		&nbsp;&nbsp;
						  		
						  	</span>
						  	<span class="info">
						  		<font color="#999">2016-07-03 10:39</font> &nbsp;&nbsp;
						  		<font color="#33a5ba"><a href="#">阅读</a><font color="#999">(404)</font>&nbsp;&nbsp;</font>
						  		<font color="#33a5ba"><a href="#">评论</a><font color="#999">(8)</font>&nbsp;&nbsp;</font>  	
						  	</span>
						</li>
						<hr style="height:5px;border:none;border-top:1px dashed gray;padding-bottom:10px;" />													
						
						<li style="margin-bottom: 30px">
						  	<span class="title">
						  		<img alt="文章类型" src="${pageContext.request.contextPath}/static/userImages/yuan.jpg">
						  		<a href="#">这是一篇测试博客</a>
						  	</span>
						  	<span class="summary">摘要: 这是用来测试的静态数据，为了多搞一点数据，于是我开始喋喋不休的说一些废话，包括我很帅之类的，虽然我一直强调自己要低调，但不知为何，自己的容颜非得和内心背道而驰....</span>
						  	<span class="img">
						  		
							  		<a href="#"><img src="${pageContext.request.contextPath}/static/userImages/dog.jpg" title="dog.jpg" alt="dog.jpg" width="823" height="489" style="width: 823px; height: 489px;"></a>
							  		<a href="#"><img src="${pageContext.request.contextPath}/static/userImages/dog.jpg" title="dog.jpg" alt="dog.jpg" width="823" height="489" style="width: 823px; height: 489px;"></a>
							  		<a href="#"><img src="${pageContext.request.contextPath}/static/userImages/dog.jpg" title="dog.jpg" alt="dog.jpg" width="823" height="489" style="width: 823px; height: 489px;"></a>
							  		&nbsp;&nbsp;
						  		
						  	</span>
						  	<span class="info">
						  		<font color="#999">2016-07-03 10:39</font> &nbsp;&nbsp;
						  		<font color="#33a5ba"><a href="#">阅读</a><font color="#999">(404)</font>&nbsp;&nbsp;</font>
						  		<font color="#33a5ba"><a href="#">评论</a><font color="#999">(8)</font>&nbsp;&nbsp;</font>	  	
						  	</span>
						</li>
						<hr style="height:5px;border:none;border-top:1px dashed gray;padding-bottom:10px;" />													
						
						<li style="margin-bottom: 30px">
						  	<span class="title">
						  		<img alt="文章类型" src="${pageContext.request.contextPath}/static/userImages/yuan.jpg">
						  		<a href="#">这是一篇测试博客</a>
						  	</span>
						  	<span class="summary">摘要: 这是用来测试的静态数据，为了多搞一点数据，于是我开始喋喋不休的说一些废话，包括我很帅之类的，虽然我一直强调自己要低调，但不知为何，自己的容颜非得和内心背道而驰....</span>
						  	<span class="img">
						  		
							  		<a href="#"><img src="${pageContext.request.contextPath}/static/userImages/dog.jpg" title="dog.jpg" alt="dog.jpg" width="823" height="489" style="width: 823px; height: 489px;"></a>
							  		<a href="#"><img src="${pageContext.request.contextPath}/static/userImages/dog.jpg" title="dog.jpg" alt="dog.jpg" width="823" height="489" style="width: 823px; height: 489px;"></a>
							  		<a href="#"><img src="${pageContext.request.contextPath}/static/userImages/dog.jpg" title="dog.jpg" alt="dog.jpg" width="823" height="489" style="width: 823px; height: 489px;"></a>
							  		&nbsp;&nbsp;
						  		
						  	</span>
						  	<span class="info">
						  		<font color="#999">2016-07-03 10:39</font> &nbsp;&nbsp;
						  		<font color="#33a5ba"><a href="#">阅读</a><font color="#999">(404)</font>&nbsp;&nbsp;</font>
						  		<font color="#33a5ba"><a href="#">评论</a><font color="#999">(8)</font>&nbsp;&nbsp;</font>  	
						  	</span>
						</li>
						<hr style="height:5px;border:none;border-top:1px dashed gray;padding-bottom:10px;" />													
					</ul>
				</div>  		
		  	</div>
		  </div>
		  
		</div>
		
		<div class="row">
			<div class="col-md-12" >
				<div class="footer" align="center" style="padding-top: 120px" >
					<font>Copyright © 2012-2016 倪升武SSM个人博客系统 版权所有</font>
					  
				</div>
			</div>			
		</div>
	</div>
</body>
</html>
