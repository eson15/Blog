<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>友情链接管理页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">

	var url;
	
	function openLinkAddDialog() {
		$("#dlg").dialog("open").dialog("setTitle", "添加友情链接信息");
		url = "${pageContext.request.contextPath}/admin/link/save.do";
	}
	
	function openLinkModifyDialog() {
		var selectedRows = $("#dg").datagrid("getSelections");
		if(selectedRows.length != 1) {
			$.messager.alert("系统提示", "请选择一个要修改的友情链接");
			return;
		}
		var row = selectedRows[0];
		$("#dlg").dialog("open").dialog("setTitle", "修改友情链接信息");
		$("#fm").form("load", row);//会自动识别name属性，将row中对应的数据，填充到form表单对应的name属性中
		url = "${pageContext.request.contextPath}/admin/link/save.do?id=" + row.id;
	}
	
	function saveLink() {
		$("#fm").form("submit",{
			url: url,
			onSubmit: function() {
				return $(this).form("validate");
			}, //进行验证，通过才让提交
			success: function(result) {
				var result = eval("(" + result + ")"); //将json格式的result转换成js对象
				if(result.success) {
					$.messager.alert("系统提示", "友情链接保存成功");
					closeLinkDialog();
					$("#dg").datagrid("reload"); //刷新一下
				} else {
					$.messager.alert("系统提示", "友情链接保存失败");
					return;
				} 
			}
		});
	}
	
	function closeLinkDialog() {
		$("linkname").val(""); //保存成功后将内容置空
		$("linkurl").val("");
		$("order").val("");
		$("#dlg").dialog("close"); //关闭对话框
	}
	
	
	function deleteLink() {
		var selectedRows = $("#dg").datagrid("getSelections");
		if(selectedRows.length == 0) {
			$.messager.alert("系统提示", "请选择要删除的数据");
			return;
		}
		var idsStr = [];
		for(var i = 0; i < selectedRows.length; i++) {
			idsStr.push(selectedRows[i].id);
		}
		var ids = idsStr.join(","); //1,2,3,4
		$.messager.confirm("系统提示", "<font color=red>您确定要删除选中的"+selectedRows.length+"条数据么？</font>", function(r) {
			if(r) {
				$.post("${pageContext.request.contextPath}/admin/link/delete.do",
						{ids: ids}, function(result){
							if(result.success) {
								$.messager.alert("系统提示", "数据删除成功！");
								$("#dg").datagrid("reload");
							} else {
								$.messager.alert("系统提示", "数据删除失败！");
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
<table id="dg" title="友情链接管理" class="easyui-datagrid" fitColumns="true" pagination="true"
	url="${pageContext.request.contextPath}/admin/link/listLink.do" toolbar="#tb">
	<thead>
		<tr>
			<th field="cb" checkbox="true" align="center"></th>
			<th field="id" width="20" align="center">编号</th>
			<th field="linkname" width="100" align="center">友情链接名称</th>
			<th field="linkurl" width="200" align="center">友情链接地址</th> 
			<th field="order" width="50" align="center">友情链接序号</th> 
		</tr>
	</thead>
</table>
<div id="tb"> 
	<div>
		<a href="javascript:openLinkAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
		<a href="javascript:deleteLink()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		<a href="javascript:openLinkModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>		
		<a href="javascript:reload()" class="easyui-linkbutton" iconCls="icon-reload" plain="true">刷新</a>		
	</div>
</div>
<div id="dlg" class="easyui-dialog" style="width:500px; height:180px; padding:10px 20px" 
	closed="true" buttons="#dlg-buttons">
	<form id="fm" method="post">
		<table cellspacing="8px">
			<tr>
				<td>友情链接名称</td>
				<td>
					<input type="text" id="linkname" name="linkname" class="easyui-validatebox" required="true">
				</td>
			</tr>
			<tr>
				<td>友情链接地址</td>
				<td>
					<input type="text" id="linkurl" name="linkurl" class="easyui-validatebox" 
						validtype="url" required="true" style="width:250px">
				</td>
			</tr>
			<tr>
				<td>友情链接排序</td>
				<td>
					<input type="text" id="order" name="order" class="easyui-numberbox" required="true" 
						style="width:60px">&nbsp;(友情链接会根据序号从小到大排列)
				</td>
			</tr>
		</table>
	</form>
</div>

<div id="dlg-buttons">
	<div>
		<a href="javascript:saveLink()" class="easyui-linkbutton" iconCls="icon-ok" plain="true">保存</a>
		<a href="javascript:closeLinkDialog()" class="easyui-linkbutton" iconCls="icon-cancel" plain="true">关闭</a>
	</div>
</div>
</body>
</html>
