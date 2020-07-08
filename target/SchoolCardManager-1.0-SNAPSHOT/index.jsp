<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">
    <title>校园卡管理系统</title>
</head>
<body>
<div id="login-bg" class="container-fluid">
    <div class="bg-img" style="background-image: url('${pageContext.request.contextPath}/img/bg-image.gif')"></div>
</div>
<div class="container" id="login">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="login">
                <h1>登录</h1>
                <form action="${pageContext.request.contextPath}/LoginController/login.do" method="post">
                    <div class="form-group">
                        <input type="text" class="form-control" name="username" placeholder="请输入用户名">
                    </div>
                    <div class="form-group">
                        <input type="password" class="form-control" name="password" placeholder="请输入密码">
                    </div>
                    <div class="form-check">
                        <label class="forgot-password"><a href="#">忘记密码?</a></label>
                    </div>
                    <br>
                    <button type="submit" class="btn btn-lg btn-block btn-success">登录</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    var message = "${message}";
    if (message != "") {
        alert(message);
    }
</script>
</html>