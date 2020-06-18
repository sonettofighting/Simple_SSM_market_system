<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="common/head.jsp" %>
<div class="right_col" role="main">
    <div class="clearfix"></div>
    <div class="col-md-12 col-sm-12 col-xs-12">
        <div class="x_panel">
            <div class="x_title row">
                <div class="row">
                <form action="getsoldout" method="post">
                    <h2 class="fa-font">库存管理</h2>
                    <p>以下是当前学霸超市的库存情况，您可以根据当前的情况进行查看、删除、修改等操作。</p>
                    <hr>
                    <div>
                        <span>
               <p>       <a href="${pageContext.request.contextPath}/staff/flatform/main" class="btn btn-info"
                           role="button">返回主页</a>
                        <button class="btn btn-danger" type="submit">查看缺货</button>
</p>
</span>
                    </div>
                </form>
                </div>
            </div>
            <div class="row">
                <form class="form-inline" action="getbyparams" method="post">
                    <div class="form-group">
                        <div class="input-group">
                  <span class="input-group-addon">
   <label>商品名称</label>
                    <input type="checkbox" aria-label="商品名称">
                  </span>

                            <input type="text" class="form-control" id="pname" name="pname" aria-label="...">
                        </div>


                    </div>
                    <div class="form-group">

                        <div class="input-group">
                  <span class="input-group-addon">
                        <label>商品编号</label>
                    <input type="checkbox" aria-label="商品ID">
                  </span>
                            <input type="text" class="form-control" id="proid" name="proid" aria-label="...">
                        </div>

                    </div>
                    <button class="btn btn-primary" type="submit">查询</button>

                </form>

            </div>
            <div class="row">
                <div class="x_content">
                    <table id="datatable" class="table table-bordered table-hover info">
                        <tr>
                            <th>商品编号</th>
                            <th>商品名称</th>
                            <th>数量</th>
                            <th>备注</th>
                            <th>操作</th>
                        </tr>
                        <c:forEach items="${pageInfo.list}" var="kcxx">
                            <tr>
                                <th>${kcxx.proid}</th>
                                <th>${kcxx.pname}</th>
                                <th>${kcxx.num}</th>
                                <th>${kcxx.marks}</th>
                                <th>
                                    <a href="${pageContext.request.contextPath}/staff/flatform/kcxx/kcxxWithPro?proid=${kcxx.proid}"
                                       class="btn btn-default btn-xs">查看该商品信息</a>
                                    <a href="${pageContext.request.contextPath}/staff/flatform/kcxx/toupdate?proid=${kcxx.proid}"
                                       class="btn btn-xs btn-success">进货</a>
                                </th>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
            <!-- 显示分页信息 -->
            <div class="row">
                <!--分页文字信息  -->
                <div class="col-md-4">
                    <p class="">当前${pageInfo.pageNum}页,总${pageInfo.pages }
                        页,总${pageInfo.total}条记录</p>
                </div>
                <!-- 分页条信息 -->
                <div class="col-md-6">
                    <nav aria-label="Page navigation">
                        <ul class="pagination">
                            <li><a href="${pageContext.request.contextPath}/staff/flatform/kcxx/getall?pn=1">首页</a>
                            </li>
                            <c:if test="${pageInfo.hasPreviousPage}">
                                <li>
                                    <a href="${pageContext.request.contextPath}/staff/flatform/kcxx/getall?pn=${pageInfo.pageNum-1}"
                                       aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
                                    </a></li>
                            </c:if>


                            <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
                                <c:if test="${page_Num == pageInfo.pageNum}">
                                    <li class="active"><a href="#">${page_Num}</a></li>
                                </c:if>
                                <c:if test="${page_Num != pageInfo.pageNum}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/staff/flatform/kcxx/getall?pn=${page_Num}">${page_Num}</a>
                                    </li>
                                </c:if>

                            </c:forEach>
                            <c:if test="${pageInfo.hasNextPage }">
                                <li>
                                    <a href="${pageContext.request.contextPath}/staff/flatform/kcxx/getall?pn=${pageInfo.pageNum+1}"
                                       aria-label="Next"> <span aria-hidden="true">&raquo;</span>
                                    </a></li>
                            </c:if>
                            <li>
                                <a href="${pageContext.request.contextPath}/staff/flatform/kcxx/getall?pn=${pageInfo.pages}">末页</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>

        </div>
    </div>
</div>
<%@include file="common/footer.jsp" %>
