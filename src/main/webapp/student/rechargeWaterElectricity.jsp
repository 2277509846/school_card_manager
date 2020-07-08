<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>充值水电费</title>
</head>
<script type="text/javascript">
    function check() {
        var rechargeMoney = document.getElementsByName("rechargeMoney")[0].value;
        if (rechargeMoney <= 0) {
            alert("充值金额必须为正整数！");
            return false;
        }
        return true;
    }
</script>
<body>
<form action="${pageContext.request.contextPath}/StudentController/rechargeWaterElectricity.do" onsubmit="return check()">
    <table style="margin: 200px auto">
        <tr>
            <td>宿舍号：</td>
            <td>
                <label>
                    <input type="text" name="dormitoryNum">
                </label>
            </td>
        </tr>
        <tr>
            <td>类型：</td>
            <td>
                <label>
                    <select name="type">
                        <option>水费</option>
                        <option>电费</option>
                    </select>
                </label>
            </td>
        </tr>
        <tr>
            <td>金额：</td>
            <td>
                <label>
                    <input type="number" name="rechargeMoney">
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
            <td><input type="submit" value="提交"></td>
            <td><a href="${pageContext.request.contextPath}/StudentController/rechargeWaterElectricityRecordList.do">返回</a></td>
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