<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="head.jsp" %>
<div class="right_col" role="main">
    <div class="clearfix"></div>
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title row">
                <h2>出货信息列表 </h2>
                <div class="clearfix"></div>
            </div>
            <!-- 按钮 -->

            <div class="row">
                <div class="x_content">
                    <table id="datatable" class="table table-bordered table-hover info">
                        <tr>
                            <th>订单id</th>
                            <th>商品id</th>
                            <th>名称</th>
                            <th>数量</th>
                            <th>进货日期</th>
                            <th>出货日期</th>
                            <th>处理人</th>
                            <th>操作</th>
                        </tr>
                        <c:forEach items="${pageInfo.list}" var="export">
                            <tr>
                                <th>${export.inid}</th>
                                <th>${export.proid}</th>
                                <th>${export.pname}</th>
                                <th>${export.num}</th>
                                <th><fmt:formatDate pattern="yyyy-MM-dd" value="${export.indate}"/></th>
                                <th><fmt:formatDate pattern="yyyy-MM-dd" value="${export.retdate}"/></th>
                                <th>${export.marks}</th>
                                <th>
                                    <a href="${pageContext.request.contextPath }/export/edit?inid=${export.inid}"
                                       class="btn btn-primary btn-xs">修改</a>
                                    <a onclick="del(${export.inid})" class="btn btn-danger btn-xs"
                                       aria-label="Left Align" role="button">删除</a>
                                </th>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
            <!-- 显示分页信息 -->
            <div class="row">
                <!--分页文字信息  -->
                <div class="col-md-6">总 ${pageInfo.total } 条记录</div>

            </div>
            <a href="${pageContext.request.contextPath }/export/getall"
               class=" text-left btn btn-default" role="button">返回上页</a>

        </div>
    </div>
</div>
<%@include file="footer.jsp" %>
<script type="text/javascript">
    function del(id) {
        var message = confirm("是否确认要删除?");
        if (message == true) {
            // 确认时做的操作 var
            window.location.href = "${pageContext.request.contextPath }/export/delete?inid=" + id;
            alert("删除成功");
        } else {
            // 取消时做的操作
            alert("删除失败");
        }
    }
</script>