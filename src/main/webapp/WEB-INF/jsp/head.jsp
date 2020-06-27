<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>福建师范大学兰苑学霸超市</title>
    <link href="${pageContext.request.contextPath}/statics/css/bootstrap.min.css" rel="stylesheet">
</head>
<script type="text/javascript">
    function update(id) {
        window.location.href = "${pageContext.request.contextPath}/staff/toupdate?staffid=" + id;
    }

    function get(id) {
        window.location.href = "${pageContext.request.contextPath}/staff/getbyid?staffid=" + id;
    }
</script>

<body class="nav-md" background="${pageContext.request.contextPath}/statics/images/bg-main.jpg">
<%--<body class="col-lg-10 col-lg-offset-1 col-md-10 col-md-offset-1 col-sm-10 col-sm-offset-1">--%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="nav navbar-nav navbar-left">

            <li><a class="navbar-brand" href="${pageContext.request.contextPath}/main">主页</a></li>
            <li><a href="${pageContext.request.contextPath}/kcxx/getall">库存管理</a></li>

            <li><a href="${pageContext.request.contextPath}/purchase/getall">进货管理</a></li>
            <li><a href="${pageContext.request.contextPath}/export/getall">出货管理</a></li>

            <li><a href="${pageContext.request.contextPath}/product/getlist">商品管理</a></li>
            <li><a href="${pageContext.request.contextPath}/type/getall">商品单位</a></li>

            <li><a href="${pageContext.request.contextPath}/custom/getall">用户管理</a></li>
        </ul>

        <ul class="nav navbar-nav navbar-right form-inline">
            <li><a>当前用户：${staffSession.staffname}💬</a></li>
            <li><a class="dropdown-item" onclick="update(${staffSession.staffid})">修改资料</a></li>
            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/staff/logout">退出</a></li>
        </ul>
    </div>

</nav>


<div class="container body">
    <div class="main_container">
        <div class="col-md-3 left_col">

        </div>
    </div>
</body>
</html>