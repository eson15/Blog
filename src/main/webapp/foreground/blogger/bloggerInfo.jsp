<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<div class="data_list">
	<div class="data_list_title">
		<img src="${pageContext.request.contextPath}/static/images/about_icon.png"/>&nbsp;关于博主
	</div>	
	<div class="datas">
			<ul>	
				<li>
					${blogger.profile }
				</li>
				<hr style="height:5px;border:none;border-top:1px dashed gray;padding-bottom:10px;" />																												
			</ul>			
	</div>  	
</div>