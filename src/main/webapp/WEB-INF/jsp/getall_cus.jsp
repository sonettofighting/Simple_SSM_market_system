<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="head.jsp" %>
<div class="right_col" role="main">
    <div class="clearfix"></div>
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title row">
                <h2>用户信息列表 </h2>
                <div class="clearfix"></div>
            </div>
            <!-- 按钮 -->
            <div class="row">
                <a href="${pageContext.request.contextPath}/staff/main" class="btn btn-info"
                   role="button">返回主页</a>

                <a href="${pageContext.request.contextPath }/custom/toadd"
                   class="btn btn-primary " role="button">新增</a>
                <form class="form-inline" action="getbyparams" method="post">
			                      <span class="row">
			                       <div class="form-group">
								    <label>用户编号</label>
								    <input type="text" class="form-control" id="cusid" name="cusid">
								  </div>
								  <div class="form-group">
								    <label>用户姓名</label>
								    <input type="text" class="form-control" id="cusname" name="cusname">
								  </div>
								  <button class="btn btn-primary" type="submit">查询</button>

								  </span>

                </form>
            </div>
            <div class="row">
                <div class="x_content">
                    <table id="datatable" class="table table-bordered table-hover  info">
                        <tr>
                            <th>编号</th>
                            <th>姓名</th>
                            <th>电话</th>
                            <th>负责人</th>
                            <th>地址</th>
                            <th>邮箱</th>
                            <th>操作</th>
                        </tr>
                        <c:forEach items="${pageInfo.list}" var="custom">
                            <tr>
                                <th>${custom.cusid}</th>
                                <th>${custom.cusname}</th>
                                <th>${custom.tel}</th>
                                <th>${custom.person}</th>
                                <th>${custom.address}</th>
                                <th>${custom.emali}</th>
                                <th>
                                    <a href="${pageContext.request.contextPath }/custom/toupdate?cusid=${custom.cusid}"
                                       class="btn btn-primary btn-xs">修改</a>
                                    <a onclick="del(${custom.cusid})" class="btn btn-danger btn-xs"
                                       aria-label="Left Align" role="button">删除</a>
                                </th>
                            </tr>
                        </c:forEach>
                    </table>
                </div>

                <!-- 显示分页信息 -->
                <div class="row">
                    <!--分页文字信息  -->
                    <div class="col-md-6">当前 ${pageInfo.pageNum }页,总${pageInfo.pages }
                        页,总 ${pageInfo.total } 条记录
                    </div>
                    <!-- 分页条信息 -->
                    <div class="col-md-4">
                        <nav aria-label="Page navigation">
                            <ul class="pagination">
                                <li>
                                    <a href="${pageContext.request.contextPath }/custom/getall?pn=1">首页</a>
                                </li>
                                <c:if test="${pageInfo.hasPreviousPage }">
                                    <li>
                                        <a href="${pageContext.request.contextPath }/custom/getall?pn=${pageInfo.pageNum-1}"
                                           aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                                        </a></li>
                                </c:if>


                                <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
                                    <c:if test="${page_Num == pageInfo.pageNum }">
                                        <li class="active"><a href="#">${page_Num }</a></li>
                                    </c:if>
                                    <c:if test="${page_Num != pageInfo.pageNum }">
                                        <li>
                                            <a href="${pageContext.request.contextPath }/custom/getall?pn=${page_Num }">${page_Num }</a>
                                        </li>
                                    </c:if>

                                </c:forEach>
                                <c:if test="${pageInfo.hasNextPage }">
                                    <li>
                                        <a href="${pageContext.request.contextPath }/custom/getall?pn=${pageInfo.pageNum+1 }"
                                           aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                                        </a></li>
                                </c:if>
                                <li>
                                    <a href="${pageContext.request.contextPath }/custom/getall?pn=${pageInfo.pages}">末页</a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
<!-- <script type="text/javascript">
/* function gettype(protypeid){
alert(1);
$.ajax({
type:'post',
url:'${pageContext.request.contextPath }/getbyid?protypeid'=protypeid,
success : function(result) {
var typedata=result.extend.type;
$("#protypeid").attr("value",typedata.protypeid);
$("#typename").attr("value",typedata.typename);
}
});
} */

function get(){
alert(1);

}
</script> -->
<%@include file="footer.jsp" %>
<script type="text/javascript">
    function del(id) {
        var message = confirm("是否确认要删除?");
        if (message === true) {
            // 确认时做的操作 var
            window.location.href = "${pageContext.request.contextPath }/custom/delete?cusid=" + id;
            alert("删除成功");
        } else {
            // 取消时做的操作
            alert("删除失败");
        }
    }</script>