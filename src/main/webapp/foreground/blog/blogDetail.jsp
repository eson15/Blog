<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/static/ueditor1_4_3_3/third-party/SyntaxHighlighter/shCore.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/static/ueditor1_4_3_3/third-party/SyntaxHighlighter/shCoreDefault.css">
<script type="text/javascript">
	SyntaxHighlighter.all(); //ueditor代码高亮

	function showOtherComment() {
		$(".otherComment").show();
	}
	
	function loadimage(){
		document.getElementById("randImage").src="${pageContext.request.contextPath}/image.jsp?"+Math.random();
	}
	
	function submitData() {
		var content = $("#content").val();
		var imageCode = $("#imageCode").val();
		if(content == null || content == "") {
			alert("请输入评论内容");
		} else if( imageCode == null || imageCode == "") {
			alert("请填写验证码");
		} else {
			$.post(
				"${pageContext.request.contextPath}/comment/save.do",
				{"content":content,"imageCode":imageCode,"blog.id":"${blog.id}"},
				function(result) {
					if(result.success) {
						alert("评论已提交成功，博主审核后添加");
						$("#content").val(""); //评论成功后，将评论框和验证码输入框中内容清空
						$("#imageCode").val("");
					} else {
						alert(result.errorInfo);
					}
				},"json");
		}
	}
	
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
			<div style="float: left">
				<strong>标签</strong>：
				<c:choose>
					<c:when test="${keyWords==null }">
					&nbsp;&nbsp;无
				</c:when>
					<c:otherwise>
						<c:forEach items="${keyWords }" var="keyword">
							&nbsp;&nbsp;<a href="#">${keyword }</a>&nbsp;
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>
			<div style="float:right;">
				发布于：『
				<fmt:formatDate value="${blog.releaseDate }" type="date"
					pattern="yyyy-MM-dd HH:mm" />
				』&nbsp;&nbsp; 博客类别：<a
					href="${pageContext.request.contextPath}/index.html?typeId=${blog.blogType.id }">${blog.blogType.typeName }</a>&nbsp;&nbsp;
				阅读(${blog.clickHit })&nbsp;&nbsp; 评论(${blog.replyHit })
			</div>
		</div>
		<br><br>
		<div class="xian" style="clear:both; margin:0 auto; border-top:1px solid #ddd"></div>
		<div style="line-height:3; background-color: #F8F8FF">
			<font style="color:#8B2323">作者：倪升武&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;尊重博主原创文章，转载请注明文章出于此处。</font>
		</div>
		<div class="xian" style="margin:0px auto; border-top:1px solid #ddd"></div>
		<div class="blog_content">${blog.content }</div>
		<div class="xian" style="margin:0 auto; border-top:1px solid #ddd"></div>
		<div style="margin-top: 25px;">${pageCode }</div>
	</div>
</div>

<div class="data_list">
	<div class="data_list_title">
		<img
			src="${pageContext.request.contextPath}/static/images/comment_icon.png" />&nbsp;用户评论
		<c:if test="${commentList.size()>10 }">
			<a href="javascript:showOtherComment()"
				style="float:right; padding-right:40px;">显示所有用户评论</a>
		</c:if>
	</div>
	<div class="commentDatas">
		<ul>
			<c:choose>
				<c:when test="${commentList.size()==0 }">
						暂无评论
				</c:when>
				<c:otherwise>
					<c:forEach items="${commentList }" var="comment" varStatus="status">
						<c:choose>
							<c:when test="${status.index<10 }">
								<div class="comment">
									<span><font>
											${status.index+1}楼&nbsp;&nbsp;&nbsp;&nbsp;${comment.userIp }</font>
										&nbsp;&nbsp;&nbsp;&nbsp;${comment.content }&nbsp;&nbsp;&nbsp;&nbsp;
										[<fmt:formatDate value="${comment.commentDate }" type="date"
											pattern="yyyy-MM-dd HH:mm" />] </span>
								</div>
							</c:when>
							<c:otherwise>
								<div class="otherComment">
									<span><font>
											${status.index+1}楼&nbsp;&nbsp;&nbsp;&nbsp;${comment.userIp }</font>
										&nbsp;&nbsp;&nbsp;&nbsp;${comment.content }&nbsp;&nbsp;&nbsp;&nbsp;
										[<fmt:formatDate value="${comment.commentDate }" type="date"
											pattern="yyyy-MM-dd HH:mm" />] </span>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</div>

<div class="data_list">
	<div class="data_list_title">
		<img
			src="${pageContext.request.contextPath}/static/images/publish_comment_icon.png" />&nbsp;发表评论
	</div>
	<div class="publish_comment">
		<div>
			<textarea style="width: 100%" rows="3" id="content" name="content"
				placeholder="来说两句吧..."></textarea>
		</div>
		<div class="verCode">
			验证码：<input type="text" value="" name="imageCode" id="imageCode"
				size="10" onkeydown="if(event.keyCode==13)form1.submit()" />&nbsp;
				<img onclick="javascript:loadimage();" title="换一张试试" name="randImage"
				id="randImage" src="/image.jsp" width="60" height="20" border="1"
				align="absmiddle">
		</div>
		<div class="publishButton">
			<button class="btn btn-primary" type="button" onclick="submitData()">发表评论</button>
		</div>
		</form>
	</div>

</div>