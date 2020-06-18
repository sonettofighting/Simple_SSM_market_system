<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initialy-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <title>福建师范大学兰苑学霸超市</title>

    <link href="${pageContext.request.contextPath}/statics/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/statics/css/font-awesome.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/statics/css/nprogress.css" rel="stylesheet">
    <style>
        .col-center-block {
            float: none;
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
    </style>

</head>

<body class="text-center" background="https://img1.doubanio.com/view/group_topic/l/public/p168111987.webp">

<div class="container">
    <div class="row myCenter">
        <div class="col-xs-6 col-md-4 col-center-block">
            <form action="${pageContext.request.contextPath}/staff/dologin"  method="post" class="form-signin">
                <h1>福师大兰苑学霸超市</h1>
                <h3>FJNU GOOD STUDENT MARKET</h3>
                <h2 class="form-signin-heading">请登录</h2>
                <label>
                    <input type="text" class="form-control" name="staffid" placeholder="请输入用户名" required autofocus />
                </label>

                <label>
                    <input type="password" class="form-control" name="pwd" placeholder="请输入密码" required autofocus />
                </label>
                <div class="checkbox">
                    <label>
                        <input type="checkbox" value="remember-me">
                        记住我 </label>
                </div>

                <div class="row">
                    <button type="submit" class="btn btn-success">登录</button>
                    <button type="reset" class="btn btn-default">取消</button>
                </div>

            </form>
        </div>
    </div>
</div>
<hr>
<footer class="separator">
    2017级软件工程闽台合作 朱静雯 @sonettofighting
</footer>



</body>
</html>