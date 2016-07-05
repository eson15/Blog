<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap3/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap3/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/blog.css">
<script src="${pageContext.request.contextPath}/static/bootstrap3/js/jquery-1.11.2.min.js"></script>
<script src="${pageContext.request.contextPath}/static/bootstrap3/js/bootstrap.min.js"></script>
<title>${title }</title>
<script type="text/javascript">
	function changeClass(obj) {
		var li = obj.parentNode; //获取父节点
		alert(li);
		li.className = "active";
	}
</script>
<style type="text/css">
	body{
		padding-top:60px;
		padding-bottom:40px;
		background-color: #F8F8FF;
		font-family: microsoft yahei;
	}
</style>
</head>

<body>
	<div class="container">
	
		<div class="row">
			<jsp:include page="/foreground/common/head.jsp"/>
		</div>
	
		<div class="row" style="padding-top: 20px">
			<jsp:include page="/foreground/common/menu.jsp"/>
		</div>
				
		<div class="row">		  	  
			  <div class="col-md-9">
				  <jsp:include page="${commonPage }"/>
			  </div>	
			  <div class="col-md-3">		  	
				  <jsp:include page="/foreground/blog/rightList.jsp"/>		  	
			  </div>		  
		</div>
		
		<div class="row">
			<jsp:include page="/foreground/common/footer.jsp"/>
		</div>
		
	</div>
</body>
</html>
