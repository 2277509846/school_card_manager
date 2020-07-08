<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>校园卡充值</title>
</head>
<script type="text/javascript">
    function check() {
        var total_amount = document.getElementsByName("total_amount")[0].value;
        if (total_amount <= 0) {
            alert("充值金额必须为正整数！");
            return false;
        }
        return true;
    }
</script>
<body>
    <form name="alipayment" action="${pageContext.request.contextPath}/StudentController/RechargeSchoolCard.do" method="post"
          target="_top" onsubmit="return check()">
        <input type="hidden" name="subject" value="校园卡充值">
        <input type="hidden" name="body" value="测试">
        <table style="margin: 200px auto;">
            <tr>
                <td>商户订单号 ：</td>
                <td>
                    <input id="out_trade_no" name="out_trade_no" />
                </td>
            </tr>
            <tr>
                <td>付款金额 ：</td>
                <td>
                    <input id="total_amount" name="total_amount" type="number" />
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" value="付款"/>
                </td>
                <td>
                    <input type="button" value="生成订单号" id="resetTradeNo"/>
                </td>
            </tr>
        </table>
    </form>
</body>
<script type="text/javascript">
    if ("${message}" != "") {
        alert("${message}");
    }
    var resetTradeNo = document.getElementById("resetTradeNo");
    resetTradeNo.onclick = function () {
        var out_trade_no = document.getElementById("out_trade_no");
        out_trade_no.value = Math.round(Math.random() * 900000 + 100000);
    }
</script>
</html>
