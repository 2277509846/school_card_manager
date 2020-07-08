<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>修改密码</title>
    <style type="text/css">
        body{
            text-align: center;
        }
    </style>
</head>
<script type="text/javascript">
    function check() {
        var newPassword = document.getElementsByName("newPassword")[0].value;
        var newPassword2 = document.getElementsByName("newPassword2")[0].value;
        if (newPassword != newPassword2) {
            alert("两次输入密码不一致！");
            return false;
        }
        return true;
    }
</script>
<body>
    <form action="${pageContext.request.contextPath}/StudentController/resetPassword.do" onsubmit="return check()" method="post">
        <table style="margin: 200px auto">
            <tr>
                <td>原来密码：</td>
                <td>
                    <label>
                        <input type="password" name="oldPassword">
                    </label>
                </td>
            </tr>
            <tr>
                <td>输入新密码：</td>
                <td>
                    <label>
                        <input type="password" name="newPassword">
                    </label>
                </td>
            </tr>
            <tr>
                <td>确认密码：</td>
                <td>
                    <label>
                        <input type="password" name="newPassword2">
                    </label>
                </td>
            </tr>
            <tr>
                <td colspan="3"><input type="submit" value="提交"></td>
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
