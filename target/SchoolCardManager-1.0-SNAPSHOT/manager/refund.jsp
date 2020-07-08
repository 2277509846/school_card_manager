<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>退卡办理</title>
</head>
<script>
    function check() {
        var studentNum = document.getElementsByName('studentNum').value;
        var password = document.getElementsByName('password').value;
        if (studentNum === '') {
            alert('学号不能为空！');
            return false;
        }
        if (password === '') {
            alert('密码不能为空！');
            return false;
        }
        return confirm("确定删除此学生？");
    }
</script>
<body>
<form action="${pageContext.request.contextPath}/ManagerController/refund.do" method="post" onsubmit="return check()">
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
            <td>校园卡密码：</td>
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