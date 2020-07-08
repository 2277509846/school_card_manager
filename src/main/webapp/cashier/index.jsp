<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>收银员主页</title>
</head>
<body>
    <iframe width="50%" height="650px" frameBorder="0" src="${pageContext.request.contextPath}/cashier/catalog.jsp">

    </iframe>
    <iframe width="48%" height="650px" frameBorder="0" src="${pageContext.request.contextPath}/CashierController/goodList.do">

    </iframe>
</body>
</html>