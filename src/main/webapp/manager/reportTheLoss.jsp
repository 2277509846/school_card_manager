<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>补办校园卡</title>
</head>
<body>
    <form action="${pageContext.request.contextPath}/ManagerController/reportTheLoss.do" method="post">
        <table style="margin: 200px auto">
            <tr>
                <td>学号：</td>
                <td>
                    <label>
                        <input type="text" name="studentNum">
                    </label>
                </td>
            </tr>
            <tr>
                <td>密码：</td>
                <td>
                    <label>
                        <input type="password" name="password">
                    </label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <label>
                        <input type="submit" value="提交">
                    </label>
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