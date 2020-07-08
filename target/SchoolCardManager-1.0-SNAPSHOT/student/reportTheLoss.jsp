<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>挂失</title>
    <style type="text/css">
        body {
            text-align: center;
        }
    </style>
</head>
<body>
    <c:if test="${message == '已挂失'}">已挂失<a href="${pageContext.request.contextPath}/student/findTheSchoolCard.jsp">解除挂失</a></c:if>
    <c:if test="${message != '已挂失'}">
        <form action="${pageContext.request.contextPath}/StudentController/reportTheLoss.do" method="post">
            <table style="margin: 200px auto">
                <tr>
                    <td>校园卡密码：</td>
                    <td>
                        <label>
                            <input type="password" name="password">
                        </label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="提交"></td>
                </tr>
            </table>
        </form>
    </c:if>
</body>
<script type="text/javascript">
    if ("${message}" != "") {
        alert("${message}");
    }
</script>
</html>