<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>评论管理页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">
	function formatBlogTitle(val,row) {
		if(val == null) {
			return "<font color=red>该博客已删除</font>";
		} else {
			return "<a href='${pageContext.request.contextPath}/blog/articles/"+val.id+".html' target='_blank'>"+val.title+"</a>";
		}
	}
	
	function formatState(val,row) {
		if(val == 0) {
			return "待审核";
		} else if(val == 1) {
			return "审核通过";
		} else {
			return "审核未通过";
		}
	}
	
	function deleteComment() {
		var selectedRows = $("#dg").datagrid("getSelections");
		if(selectedRows.length == 0) {
			$.messager.alert("系统提示", "请选择要删除的评论");
			return;
		}
		var idsStr = [];
		for(var i = 0; i < selectedRows.length; i++) {
			idsStr.push(selectedRows[i].id);
		}
		var ids = idsStr.join(","); //1,2,3,4
		$.messager.confirm("系统提示", "<font color=red>您确定要删除选中的这"+selectedRows.length+"条评论么？</font>", function(r) {
			if(r) {
				$.post("${pageContext.request.contextPath}/admin/comment/deleteComment.do",
						{ids: ids}, function(result){
							if(result.success) {
								$.messager.alert("系统提示", "评论删除成功！");
								$("#dg").datagrid("reload");
							} else {
								$.messager.alert("系统提示", "评论删除失败！");
							}
						}, "json");
			}
		});
	}
	
	function reload() {
		$("#dg").datagrid("reload");
	}
</script>

</head>

<body style="margin: 1px; font-family: microsoft yahei">
<table id="dg" title="评论管理" class="easyui-datagrid" fitColumns="true" pagination="true"
	url="${pageContext.request.contextPath}/admin/comment/listComment.do" toolbar="#tb">
	<thead>
		<tr>
			<th field="cb" checkbox="true" align="center"></th>
			<th field="id" width="20" align="center">编号</th>
			<th field="blog" width="200" align="center" formatter="formatBlogTitle">博客标题</th>
			<th field="userIp" width="50" align="center">用户的IP</th> 
			<th field="content" width="200" align="center">评论内容</th> 
			<th field="commentDate" width="50" align="center">评论日期</th> 
			<th field="state" width="50" align="center" formatter="formatState">评论状态</th> 
		</tr>
	</thead>
</table>
<div id="tb"> 
	<div>
		<a href="javascript:deleteComment()" class="easyui-linkbutton" iconCls="icon-ok" plain="true">删除</a> 	
		<a href="javascript:reload()" class="easyui-linkbutton" iconCls="icon-reload" plain="true">刷新</a>	
	</div>
</div>

</body>
</html>
