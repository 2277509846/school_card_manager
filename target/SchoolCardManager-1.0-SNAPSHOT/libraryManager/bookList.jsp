<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>图书列表</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/table.css">
</head>
<script type="text/javascript">
    function del(bookId) {
        if(confirm("确实要注销此图书？")){
            window.location = "${pageContext.request.contextPath}/LibraryManagerController/deleteBook.do?bookId=" + bookId;
        }
    }
    function upd(bookId) {
        window.location = "${pageContext.request.contextPath}/LibraryManagerController/updateBook.do?bookId=" + bookId;
    }
</script>
<body>
    <form action="${pageContext.request.contextPath}/LibraryManagerController/bookList.do" method="get">
        <table>
            <tr>
                <th>id</th>
                <th>名称</th>
                <th>作者</th>
                <th>出版社</th>
                <th>借阅次数</th>
                <th>注销</th>
                <th>修改</th>
            </tr>
            <c:forEach items="${books}" var="book">
                <tr>
                    <td>${book.id}</td>
                    <td>${book.name}</td>
                    <td>${book.author}</td>
                    <td>${book.publish}</td>
                    <td>${book.lendCount}</td>
                    <td>
                        <c:if test="${book.isDelete == 0}"><input type="button" onclick="del(${book.id})" value="注销"></c:if>
                        <c:if test="${book.isDelete == 1}">已注销</c:if>
                    </td>
                    <td>
                        <c:if test="${book.isDelete == 0}"><input type="button" onclick="upd(${book.id})" value="修改"></c:if>
                        <c:if test="${book.isDelete == 1}">已注销</c:if>
                    </td>
                </tr>
            </c:forEach>
            <c:forEach begin="1" end="${13 - count}">
                <tr>
                    <td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                </tr>
            </c:forEach>
            <tr>
                <td><a href="${pageContext.request.contextPath}/LibraryManagerController/bookList.do?page=${page - 1}&condition=${condition}">上一页</a></td>
                <td colspan="4">
                    <label>
                        <input type="text" name="condition" placeholder="输入书名、作者或出版社" value="${condition}">
                        <input type="submit" value="查询">
                    </label>
                </td>
                <td colspan="2"><a href="${pageContext.request.contextPath}/LibraryManagerController/bookList.do?page=${page + 1}&condition=${condition}">下一页</a></td>
            </tr>
        </table>
    </form>
</body>
<script>
    if ("${message}" != "") {
        alert("${message}")
    }
</script>
</html>