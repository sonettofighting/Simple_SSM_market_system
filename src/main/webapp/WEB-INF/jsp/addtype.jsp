<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="common/head.jsp" %>
<div class="right_col" role="main">
    <form class="form-horizontal form-label-left" method="post" action="insert">
        <h1 class="text-center">
            <span class="section">添加新单位</span>
        </h1>
        <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-5">单位编号<span>*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-5">
                <input id="protypeid" name="protypeid" class="form-control col-md-7 col-xs-5" value="${type.protypeid}"
                       type="text">
            </div>
        </div>
        <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-5">商品类型<span>*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-5">
                <input id="typename" name="typename" class="form-control col-md-7 col-xs-5" value="${type.typename}"
                       type="text">
            </div>
        </div>

        <a onclick="history.back(-1);" class=" text-left btn btn-default" role="button">返回上页</a>
        <button type="submit" class="btn btn-primary text-center  col-md-offset-4 col-lg-offset-4col-xl-offset-4">添加
        </button>
    </form>
    <div class="clearfix"></div>
</div>
<%@include file="common/footer.jsp" %>