<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学生信息列表</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/table.css"/>
</head>
<body>
    <form action="${pageContext.request.contextPath}/ManagerController/studentList.do" method="get">
        <table>
            <tr>
                <th>学号</th>
                <th>姓名</th>
                <th>校园卡号</th>
                <th>电话号码</th>
                <th>宿舍号</th>
                <th>所在系</th>
            </tr>
            <c:forEach items="${students}" var="student">
                <tr>
                    <td>${student.num}</td>
                    <td>${student.name}</td>
                    <td>${student.schoolCardId}</td>
                    <td>${student.phoneNumber}</td>
                    <td>${student.dormitoryNum}</td>
                    <td>${student.department}</td>
                </tr>
            </c:forEach>
            <c:forEach begin="1" end="${13 - count}">
                <tr>
                    <td></td><td></td><td></td><td></td><td></td><td></td>
                </tr>
            </c:forEach>
            <tfoot>
                <tr>
                    <td colspan="2">
                        <a href="${pageContext.request.contextPath}/ManagerController/studentList.do?page=${page - 1}&condition=${condition}">上一页</a>
                    </td>
                    <td colspan="2">
                        <label>
                            <input type="text" name="condition" placeholder="输入学号、姓名或校园卡号" value="${condition}">
                            <input type="submit" value="查询">
                        </label>
                    </td>
                    <td colspan="2">
                        <a href="${pageContext.request.contextPath}/ManagerController/studentList.do?page=${page + 1}&condition=${condition}">下一页</a>
                    </td>
                </tr>
            </tfoot>
        </table>
    </form>
</body>
</html>