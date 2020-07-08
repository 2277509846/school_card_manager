<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>归还图书</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/LibraryManagerController/giveBackBook.do" method="get">
    <table style="margin: 200px auto">
        <tr>
            <td>图书id：</td>
            <td>
                <label>
                    <input type="text" name="bookId">
                </label>
            </td>
        </tr>
        <tr>
            <td><input type="submit" value="提交"></td>
            <td><a href="${pageContext.request.contextPath}/libraryManager/catalog.jsp">返回</a></td>
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