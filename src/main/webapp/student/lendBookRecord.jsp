<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>学生借书记录</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/table.css"/>
</head>
<body>
    <table>
        <tr>
            <th>图书id</th>
            <th>图书名称</th>
            <th>借书时间</th>
            <th>归还时间</th>
        </tr>
        <c:forEach items="${lendBookRecords}" var="lendBookRecord">
            <tr>
                <td>${lendBookRecord.bookId}</td>
                <td>${lendBookRecord.bookName}</td>
                <td><fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm:ss" value="${lendBookRecord.lendTime}"/></td>
                <td><fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm:ss" value="${lendBookRecord.backTime}"/></td>
            </tr>
        </c:forEach>
        <c:forEach begin="1" end="${13 - count}">
            <tr>
                <td></td><td></td><td></td><td></td>
            </tr>
        </c:forEach>
        <tfoot>
        <tr>
            <td colspan="3">
                <a href="${pageContext.request.contextPath}/StudentController/lendBookRecordList.do?page=${page - 1}">上一页</a>
            </td>
            <td colspan="2">
                <a href="${pageContext.request.contextPath}/StudentController/lendBookRecordList.do?page=${page + 1}">下一页</a>
            </td>
        </tr>
        </tfoot>
    </table>
</body>
</html>