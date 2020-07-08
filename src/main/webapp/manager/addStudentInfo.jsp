<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>注册学生信息</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/ManagerController/registerStudent.do" method="post">
    <table style="margin: 200px auto 20px">
        <tr>
            <td>学号：</td>
            <td>
                <label>
                    <input type="text" name="studentNum" value="${studentNum}">
                </label>
            </td>
        </tr>
        <tr>
            <td>姓名：</td>
            <td>
                <label>
                    <input type="text" name="studentName" value="${studentName}">
                </label>
            </td>
        </tr>
        <tr>
            <td>手机号码：</td>
            <td>
                <label>
                    <input type="text" name="phoneNumber" value="${phoneNumber}">
                </label>
            </td>
        </tr>
        <tr>
            <td>宿舍号：</td>
            <td>
                <label>
                    <input type="text" name="dormitoryNum" value="${dormitoryNum}">
                </label>
            </td>
        </tr>
        <tr>
            <td>所在系：</td>
            <td>
                <label>
                    <input type="text" name="department" value="${department}">
                </label>
            </td>
        </tr>
        <tr>
            <td>设置校园卡密码：</td>
            <td>
                <label>
                    <input type="password" name="password" value="${password}">
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
<form action="${pageContext.request.contextPath}/ManagerController/registerLotOfStudent.do" enctype="multipart/form-data" method="post">
    <div style="margin: 0 auto; width: 400px; height: 20px">
        <input type="file" accept=".xlsx" name="studentFile">
        <input type="submit" value="批量导入数据">
    </div>
</form>
</body>
<script type="text/javascript">
    if ("${message}" != "") {
        alert("${message}");
    }
</script>
</html>