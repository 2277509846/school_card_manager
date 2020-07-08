<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>商品列表</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/table.css">
</head>
<script type="text/javascript">
    function del(goodId) {
        if (confirm("确认删除此商品？")) {
            window.location = "${pageContext.request.contextPath}/CashierController/deleteGood.do?goodId=" + goodId;
        }
    }
    function upd(goodId) {
        window.location = "${pageContext.request.contextPath}/CashierController/updateGood.do?goodId=" + goodId;
    }
</script>
<body>
    <form action="${pageContext.request.contextPath}/CashierController/goodList.do" method="get">
        <table>
            <tr>
                <th>id</th>
                <th>名称</th>
                <th>价格</th>
                <th>商家名称</th>
                <th>删除</th>
                <th>修改</th>
            </tr>
            <c:forEach items="${goods}" var="good">
                <tr>
                    <td>${good.id}</td>
                    <td>${good.name}</td>
                    <td>${good.price}</td>
                    <td>${good.businessName}</td>
                    <td>
                        <c:if test="${good.isDelete == 0}"><input type="button" value="删除" onclick="del(${good.id})"></c:if>
                        <c:if test="${good.isDelete == 1}">已删除</c:if>
                    </td>
                    <td>
                        <c:if test="${good.isDelete == 0}"><input type="button" value="修改" onclick="upd(${good.id})"></c:if>
                        <c:if test="${good.isDelete == 1}">已删除</c:if>
                    </td>
                </tr>
            </c:forEach>
            <c:forEach begin="1" end="${13 - count}">
                <tr>
                    <td></td><td></td><td></td><td></td><td></td><td></td>
                </tr>
            </c:forEach>
            <tr>
                <td><a href="${pageContext.request.contextPath}/CashierController/goodList.do?page=${page - 1}&condition=${condition}">上一页</a></td>
                <td colspan="3">
                    <label>
                        <input type="text" name="condition" placeholder="输入商品id、名称、或商家名称" value="${condition}">
                        <input type="submit" value="查询">
                    </label>
                </td>
                <td colspan="2"><a href="${pageContext.request.contextPath}/CashierController/goodList.do?page=${page + 1}&condition=${condition}">下一页</a></td>
            </tr>
        </table>
    </form>
</body>
<script type="text/javascript">
    if ("${message}" != "") {
        alert("${message}")
    }
</script>
</html>