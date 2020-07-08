<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>校园卡充值记录</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/table.css"/>
</head>
<body>
<table>
    <caption>
        校园卡id:${schoolCard.id}&nbsp剩余${schoolCard.balance}元
        <a href="${pageContext.request.contextPath}/student/rechargeSchoolCard.jsp">充值</a>
    </caption>
    <tr>
        <th>充值时间</th>
        <th>充值金额</th>
    </tr>
    <c:forEach items="${rechargeSchoolCards}" var="rechargeSchoolCard">
        <tr>
            <td><fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm:ss" value="${rechargeSchoolCard.rechargeTime}"/></td>
            <td>${rechargeSchoolCard.rechargeMoney}</td>
        </tr>
    </c:forEach>
    <c:forEach begin="1" end="${13 - count}">
        <tr>
            <td></td><td></td>
        </tr>
    </c:forEach>
    <tfoot>
    <tr>
        <td>
            <a href="${pageContext.request.contextPath}/StudentController/RechargeSchoolCardList.do?page=${page - 1}">上一页</a>
        </td>
        <td>
            <a href="${pageContext.request.contextPath}/StudentController/RechargeSchoolCardList.do?page=${page + 1}">下一页</a>
        </td>
    </tr>
    </tfoot>
</table>
</body>
<script type="text/javascript">
    if ("${message}" != "") {
        alert("${message}");
    }
</script>
</html>