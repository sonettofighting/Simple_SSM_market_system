<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="common/head.jsp" %>

<main role="main" class="container">
    <div class="jumbotron bg-white panel panel-default">
        <h1 class="mt-5">南区兰苑学霸超市</h1>
        <p class="lead">欢迎使用福建师范大学进销存管理系统！ 这是Web的一次期末作业。</p>
        <p>请在GiuHub上关注<a href="https://github.com/sonettofighting">我</a>！🐾</p>

        <a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/staff/flatform/kcxx/getall"
           role="button">库存管理
            &raquo;</a>
        <a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/staff/flatform/purchase/getall"
           role="button">进货管理
            &raquo;</a>
        <a class="btn btn-primary btn-lg" href="${pageContext.request.contextPath}/staff/flatform/export/getall"
           role="button">出货管理
            &raquo;</a>
        <hr>
        <a class="btn btn-default btn-lg" href="${pageContext.request.contextPath}/staff/flatform/product/getlist"
           role="button">商品管理
            &raquo;</a>
        <a class="btn btn-default btn-lg" href="${pageContext.request.contextPath}/staff/flatform/type/getall"
           role="button">商品单位
            &raquo;</a>
        <hr>
        <a class="btn btn-info btn-lg" href="${pageContext.request.contextPath}/staff/flatform/custom/getall"
           role="button">用户管理
            &raquo;</a>
        <a class="btn btn-info btn-lg" onclick="update(${staffSession.staffid})">修改资料
            &raquo;</a>
       <a class="btn btn-info btn-lg"  href="../../comment.jsp">联系我们
           &raquo;</a>
    </div>
    <div class="container">

    </div>
</main>
<script type="text/javascript">
    function update(id) {
        window.location.href = "${pageContext.request.contextPath}/staff/toupdate?staffid=" + id;
    }

    function get(id) {
        window.location.href = "${pageContext.request.contextPath}/staff/getbyid?staffid=" + id;
    }
</script>
<%@include file="common/footer.jsp" %>
