<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>修改图书</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/table.css">
</head>
<script type="text/javascript">
    function check() {
        var name = document.getElementsByName("name")[0].value;
        var author = document.getElementsByName("author")[0].value;
        var publish = document.getElementsByName("publish")[0].value;
        if (name == "") {
            alert("图书名不能为空")
            return false;
        }
        if (author == "") {
            alert("作者名不能为空")
            return false;
        }
        if (publish == "") {
            alert("出版社不能为空")
            return false;
        }
        return true;
    }
</script>
<body>
    <form action="${pageContext.request.contextPath}/LibraryManagerController/updateBook.do" method="get" onsubmit="return check()">
        <input type="hidden" name = "bookId" value="${bookId}">
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
                <td>作者</td>
                <td>
                    <label>
                        <input type="text" name="author" value="${author}">
                    </label>
                </td>
            </tr>
            <tr>
                <td>出版社</td>
                <td>
                    <label>
                        <input type="text" name="publish" value="${publish}">
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
                    <a href="${pageContext.request.contextPath}/LibraryManagerController/bookList.do">返回</a>
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