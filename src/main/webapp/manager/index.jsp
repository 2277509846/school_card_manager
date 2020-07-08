<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>校园卡管理系统</title>
<style type="text/css">
	body {
		text-align: center;
	}
	#menu {
		width: 88%;
		height: 72px;
		margin: 0 auto;
	}
	#menu * {
		background: blue;
		color: white;
		font-weight: bold;
		display: block;
		width: 25%;
		height: 72px;
		line-height: 72px;
		float: left;
		text-decoration: none;
	}
	#menu *:hover {
		background: red;
	}
}
</style>
</head>
<body>
	<div class="menuNav" id="menu">
		<a href="${pageContext.request.contextPath }/manager/studentInfo.jsp" id="menu0" target="content" class="menu">学生信息查询</a>
		<a href="${pageContext.request.contextPath }/manager/reportTheLoss.jsp" id="menu1" target="content" class="menu">补办校园卡</a>
		<a href="${pageContext.request.contextPath }/manager/addStudentInfo.jsp" id="menu2" target="content" class="menu">注册学生信息</a>
		<a href="${pageContext.request.contextPath }/manager/refund.jsp" id="menu3" target="content" class="menu">退卡办理</a>
	</div>
	<iframe width="85%" height="650px" name="content" frameBorder="0">
		
	</iframe>
	<a href="${pageContext.request.contextPath }/index.jsp" style="position: absolute; right: 0; top: 0;">退出</a>
</body>
<script type="text/javascript">
	var menus = document.getElementsByClassName("menu");
	for (var i = 0; i < menus.length; i++) {
		menus[i].onclick = function() {
			for (var j = 0; j < menus.length; j++) {
				menus[j].style = 'background: blue';
			}
			this.style = 'background: red';
		}
	}
</script>
</html>