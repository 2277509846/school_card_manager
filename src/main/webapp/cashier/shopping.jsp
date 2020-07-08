<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>消费记录录入</title>
</head>
<script type="text/javascript">
    function check() {
        var shoppingCount = document.getElementsByName("shoppingCount")[0].value;
        if (shoppingCount <= 0) {
            alert("消费数量必须为正整数！");
            return false;
        }
        return true;
    }
</script>
<body>
    <form action="${pageContext.request.contextPath}/CashierController/shopping.do" method="post" onsubmit="return check()">
        <table style="margin: 200px auto">
            <tr>
                <td>校园卡id：</td>
                <td>
                    <label>
                        <input type="text" name="schoolCardId">
                    </label>
                </td>
            </tr>
            <tr>
                <td>商品id：</td>
                <td>
                    <label>
                        <input type="text" name="goodId">
                    </label>
                </td>
            </tr>
            <tr>
                <td>消费数量：</td>
                <td>
                    <label>
                        <input type="number" name="shoppingCount">
                    </label>
                </td>
            </tr>
            <tr>
                <td><input type="submit" value="提交"></td>
                <td><a href="${pageContext.request.contextPath}/cashier/catalog.jsp">返回</a></td>
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