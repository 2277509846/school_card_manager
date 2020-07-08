<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>个人中心</title>
    <style type="text/css">
        body {
            text-align: center;
        }
        #menu {
            width: 20%;
            float: left;
        }
        #menu * {
            background: blue;
            color: white;
            font-weight: bold;
            display: block;
            width: 100%;
            height: 72px;
            line-height: 72px;
            text-decoration: none;
        }
        #menu *:hover {
            background: red;
        }
        iframe {
            width: 80%;
            display: block;
            float: left;
        }
    </style>
</head>
<body>
    <div class="menuNav" id="menu">
        <a href="${pageContext.request.contextPath }/StudentController/RechargeSchoolCardList.do" id="menu3" target="content3" class="menu">我的校园卡</a>
        <a href="${pageContext.request.contextPath }/StudentController/reportTheLoss.do?c=first" id="menu5" target="content3" class="menu">挂失</a>
        <a href="${pageContext.request.contextPath }/student/resetPassword.jsp" id="menu6" target="content3" class="menu">修改密码</a>
    </div>
    <iframe width="600px" height="600px" name="content3" frameBorder="0">

    </iframe>
</body>
<script type="text/javascript">
    var menus = document.getElementsByClassName("menu");
    for (var i = 0; i < menus.length; i++) {
        menus[i].onclick = function() {
            for (var j = 0; j < menus.length; j++) {
                menus[j].style = 'background: blue';
            }
            this.style = 'background: red';
        }
    }
</script>
</html>