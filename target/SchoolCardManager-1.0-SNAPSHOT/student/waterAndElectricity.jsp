<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>水电费充值</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/table.css"/>
</head>
<body>
    <table>
        <caption>
            ${dormitory.num}剩余电费：${dormitory.electricity} 水费：${dormitory.water}
            <a href="${pageContext.request.contextPath}/student/rechargeWaterElectricity.jsp">充值</a>
        </caption>
        <tr>
            <th>宿舍号</th>
            <th>充值时间</th>
            <th>充值金额</th>
            <th>类型</th>
        </tr>
        <c:forEach items="${rechargeWaterElectricityRecords}" var="rechargeWaterElectricityRecord">
            <tr>
                <td>${rechargeWaterElectricityRecord.dormitoryNum}</td>
                <td><fmt:formatDate type="both" pattern="yyyy-MM-dd HH:mm:ss" value="${rechargeWaterElectricityRecord.rechargeTime}"/></td>
                <td>${rechargeWaterElectricityRecord.rechargeMoney}</td>
                <td>${rechargeWaterElectricityRecord.type}</td>
            </tr>
        </c:forEach>
        <c:forEach begin="1" end="${13 - count}">
            <tr>
                <td></td><td></td><td></td><td></td>
            </tr>
        </c:forEach>
        <tfoot>
        <tr>
            <td colspan="2">
                <a href="${pageContext.request.contextPath}/StudentController/rechargeWaterElectricityRecordList.do?page=${page - 1}">上一页</a>
            </td>
            <td colspan="2">
                <a href="${pageContext.request.contextPath}/StudentController/rechargeWaterElectricityRecordList.do?page=${page + 1}">下一页</a>
            </td>
        </tr>
        </tfoot>
    </table>
</body>
</html>