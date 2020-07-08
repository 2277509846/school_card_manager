<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>目录</title>
</head>
<body>
    <a href="${pageContext.request.contextPath}/CashierController/shoppingList.do">学生消费记录</a><br>
    <a href="${pageContext.request.contextPath}/cashier/shopping.jsp">消费记录录入</a><br>
    <a href="${pageContext.request.contextPath}/cashier/addGood.jsp">商品录入</a><br>
    <a href="${pageContext.request.contextPath}" target="_top">退出</a><br>
</body>
</html>