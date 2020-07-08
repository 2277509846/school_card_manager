<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生出入记录</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/table.css"/>
</head>
<body>
    <table>
        <tr>
            <th>出入时间</th>
            <th>出/入</th>
        </tr>
        <c:forEach items="${accessRecords}" var="accessRecord">
            <tr>
                <td><fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm:ss" value="${accessRecord.accessTime}"/></td>
                <td>${accessRecord.status}</td>
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
                <a href="${pageContext.request.contextPath}/StudentController/accessRecords.do?page=${page - 1}">上一页</a>
            </td>
            <td>
                <a href="${pageContext.request.contextPath}/StudentController/accessRecords.do?page=${page + 1}">下一页</a>
            </td>
        </tr>
        </tfoot>
    </table>
</body>
</html>