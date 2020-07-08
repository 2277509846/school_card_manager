<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生消费记录</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/table.css"/>
</head>
<body>
<form action="${pageContext.request.contextPath}/ManagerController/shoppingList.do" method="get">
    <table>
        <tr>
            <th>学生学号</th>
            <th>商品id</th>
            <th>商品名称</th>
            <th>消费时间</th>
            <th>消费数量</th>
            <th>消费金额</th>
        </tr>
        <c:forEach items="${shoppingList}" var="shopping">
            <tr>
                <td>${shopping.studentNum}</td>
                <td>${shopping.goodId}</td>
                <td>${shopping.goodName}</td>
                <td><fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm:ss" value="${shopping.shoppingTime}"/></td>
                <td>${shopping.shoppingCount}</td>
                <td>${shopping.shoppingMoney}</td>
            </tr>
        </c:forEach>
        <c:forEach begin="1" end="${13 - count}">
            <tr>
                <td></td><td></td><td></td><td></td><td></td><td></td>
            </tr>
        </c:forEach>
        <tfoot>
        <tr>
            <td colspan="2">
                <a href="${pageContext.request.contextPath}/ManagerController/shoppingList.do?page=${page - 1}&condition=${condition}">上一页</a>
            </td>
            <td colspan="2">
                <label>
                    <input type="text" name="condition" placeholder="输入学生学号或商品id" value="${condition}">
                    <input type="submit" value="查询">
                </label>
            </td>
            <td colspan="2">
                <a href="${pageContext.request.contextPath}/ManagerController/shoppingList.do?page=${page + 1}&condition=${condition}">下一页</a>
            </td>
        </tr>
        </tfoot>
    </table>
</form>
</body>
</html>