<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生充值记录</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/table.css"/>
</head>
<body>
<form action="${pageContext.request.contextPath}/ManagerController/RechargeSchoolCardList.do" method="get">
    <table>
        <tr>
            <th>学生学号</th>
            <th>充值时间</th>
            <th>充值金额</th>
        </tr>
        <c:forEach items="${rechargeSchoolCards}" var="rechargeSchoolCard">
            <tr>
                <td>${rechargeSchoolCard.studentNum}</td>
                <td><fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm:ss" value="${rechargeSchoolCard.rechargeTime}"/></td>
                <td>${rechargeSchoolCard.rechargeMoney}</td>
            </tr>
        </c:forEach>
        <c:forEach begin="1" end="${13 - count}">
            <tr>
                <td></td><td></td><td></td>
            </tr>
        </c:forEach>
        <tfoot>
        <tr>
            <td>
                <a href="${pageContext.request.contextPath}/ManagerController/RechargeSchoolCardList.do?page=${page - 1}&condition=${condition}">上一页</a>
            </td>
            <td>
                <label>
                    <input type="text" name="condition" placeholder="输入学号" value="${condition}">
                    <input type="submit" value="查询">
                </label>
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/ManagerController/RechargeSchoolCardList.do?page=${page + 1}&condition=${condition}">下一页</a>
            </td>
        </tr>
        </tfoot>
    </table>
</form>
</body>
</html>