<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>目录</title>
</head>
<body>
    <a href="${pageContext.request.contextPath}/LibraryManagerController/lendBookRecordList.do">学生借书记录</a><br>
    <a href="${pageContext.request.contextPath}/libraryManager/lendBook.jsp">借书记录录入</a><br>
    <a href="${pageContext.request.contextPath}/libraryManager/giveBackBook.jsp">归还图书</a><br>
    <a href="${pageContext.request.contextPath}/libraryManager/addBook.jsp">添加图书</a><br>
    <a href="${pageContext.request.contextPath}" target="_top">退出</a><br>
</body>
</html>