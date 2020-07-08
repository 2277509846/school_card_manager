<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学生信息查询</title>
<style type="text/css">
	body {
		text-align: center;
	}
	#menu {
		width: 20%;
		float: left;
	}
	#menu * {
		background: blue;
		color: white;
		font-weight: bold;
		display: block;
		width: 100%;
		height: 72px;
		line-height: 72px;
		text-decoration: none;
	}
	#menu *:hover {
		background: red;
	}
	iframe {
		width: 80%;
		display: block;
		float: left;
	}
</style>
</head>
<body>
	<div class="menuNav" id="menu">
		<a href="${pageContext.request.contextPath }/ManagerController/shoppingList.do" id="menu0" target="content2" class="menu">学生消费记录</a>
		<a href="${pageContext.request.contextPath }/ManagerController/lendBookRecordList.do" id="menu1" target="content2" class="menu">学生借书记录</a>
		<a href="${pageContext.request.contextPath }/ManagerController/studentList.do" id="menu2" target="content2" class="menu">学生信息列表</a>
		<a href="${pageContext.request.contextPath }/ManagerController/RechargeSchoolCardList.do" id="menu3" target="content2" class="menu">学生充值记录</a>
		<a href="${pageContext.request.contextPath }/ManagerController/AccessRecordList.do" id="menu5" target="content2" class="menu">学生出入记录</a>
	</div>
	<iframe width="600px" height="600px" name="content2" frameBorder="0">
		
	</iframe>
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