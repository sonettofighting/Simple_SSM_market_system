<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
</head>

<body class="text-center" background="https://img1.doubanio.com/view/group_topic/l/public/p168111987.webp">

<form action="${pageContext.request.contextPath}/staff/dologin" method="post">
    <h1>福建师范大学兰苑学霸超市</h1>

    <h3>FJNU GOOD STUDENT MARKET</h3>
    <div>
        <label>
            <input type="text" class="form-control" name="staffid" placeholder="请输入用户名" required autofocus/>
        </label>
    </div>
    <div>
        <label>
            <input type="password" class="form-control" name="pwd" placeholder="请输入密码" required autofocus/>
        </label>
    </div>

    <div>
        <button type="submit" class="btn btn-success">登录</button>
        <button type="reset" class="btn btn-default">取消</button>
    </div>

    <div class="separator">
        <p>福建师范大学 数学与信息学院 2017级软件工程闽台合作 116072017040 朱静雯</p>
    </div>
</form>

</body>
</html>