<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生消费记录</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/table.css"/>
</head>
<body>
    <table>
        <tr>
            <th>商品id</th>
            <th>商品名称</th>
            <th>消费时间</th>
            <th>消费金额</th>
            <th>消费数量</th>
        </tr>
        <c:forEach items="${shoppingList}" var="shopping">
            <tr>
                <td>${shopping.goodId}</td>
                <td>${shopping.goodName}</td>
                <td><fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm:ss" value="${shopping.shoppingTime}"/></td>
                <td>${shopping.shoppingMoney}</td>
                <td>${shopping.shoppingCount}</td>
            </tr>
        </c:forEach>
        <c:forEach begin="1" end="${13 - count}">
            <tr>
                <td></td><td></td><td></td><td></td><td></td>
            </tr>
        </c:forEach>
        <tfoot>
        <tr>
            <td colspan="3">
                <a href="${pageContext.request.contextPath}/StudentController/shoppingList.do?page=${page - 1}">上一页</a>
            </td>
            <td colspan="2">
                <a href="${pageContext.request.contextPath}/StudentController/shoppingList.do?page=${page + 1}">下一页</a>
            </td>
        </tr>
        </tfoot>
    </table>
</body>
</html>