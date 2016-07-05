<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<div class="col-md-12">
	<nav class="navbar navbar-default">
	  <div class="container-fluid">				    
	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	      	<li class="active"><a class="navbar-brand" href="${pageContext.request.contextPath}/index.html" onclick="changeClass(this)">博客首页</a></li>
	        <li><a class="navbar-brand" href="${pageContext.request.contextPath}/blogger/aboutme.html" onclick="changeClass(this)">关于博主</a></li>
	        <li><a class="navbar-brand" href="#" onclick="changeClass(this)">我的相册</a></li>
	        <li><a class="navbar-brand" href="#" onclick="changeClass(this)">资源小站</a></li>
	        <li><a class="navbar-brand" href="#" onclick="changeClass(this)">程序人生</a></li>
	        <li><a class="navbar-brand" href="http://blog.csdn.net/eson_15" target="blank">CSDN</a></li>
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
