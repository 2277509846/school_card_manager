<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>修改商品</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/table.css">
</head>
<script type="text/javascript">
    function check() {
        var name = document.getElementsByName("name")[0].value;
        var price = document.getElementsByName("price")[0].value;
        var businessName = document.getElementsByName("businessName")[0].value;
        if (name == "") {
            alert("商品名不能为空")
            return false;
        }
        if (price == "") {
            alert("价格不能为空")
            return false;
        }
        if (businessName == "") {
            alert("商家名称不能为空")
            return false;
        }
        return true;
    }
</script>
<body>
<form action="${pageContext.request.contextPath}/CashierController/updateGood.do" method="get" onsubmit="return check()">
    <input type="hidden" name = "goodId" value="${goodId}">
    <table>
        <tr>
            <td>名称</td>
            <td>
                <label>
                    <input type="text" name="name" value="${name}">
                </label>
            </td>
        </tr>
        <tr>
            <td>价格</td>
            <td>
                <label>
                    <input type="text" name="price" value="${price}">
                </label>
            </td>
        </tr>
        <tr>
            <td>商家名称</td>
            <td>
                <label>
                    <input type="text" name="businessName" value="${businessName}">
                </label>
            </td>
        </tr>
        <tr>
            <td>
                <label>
                    <input type="submit" value="修改">
                </label>
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/CashierController/goodList.do">返回</a>
            </td>
        </tr>
    </table>
</form>
</body>
<script type="text/javascript">
    if ("${message}" != "") {
        alert("${message}");
    }
</script>
</html>