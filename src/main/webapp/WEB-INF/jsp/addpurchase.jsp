<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="common/head.jsp" %>
<div class="right_col" role="main">
    <form class="form-horizontal form-label-left" method="post" action="insert" onsubmit="return checkall()">
        <h1 class="text-center">
            <span class="section">新增进货信息</span>
        </h1>
        <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-5" width="15">订单编号<span>*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-5">
                <input id="inid" name="inid" class="form-control input-small input-sm " value="${purchase.inid}"
                       onblur="checkinid()" type="text"><span id="demo1" style="color: red;"></span>
            </div>
        </div>
        <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-5" width="15">商品编号<span>*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-5">
                <label for="proid"></label><input id="proid" name="proid" class="form-control input-small input-sm "
                                                  value="${purchase.proid}" type="text" onblur="checkproid()"><span
                    id="demo3" style="color: red;"></span>
            </div>
        </div>
        <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-5">名称<span>*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-5">
                <input id="pname" name="pname" class="form-control col-md-7 col-xs-5" value="${purchase.pname}"
                       onblur="checkname()" type="text"><span id="demo2" style="color: red;"></span>
            </div>
        </div>
        <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-5">进货数量<span>*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-5">
                <label for="num"></label><input id="num" name="num" class="form-control col-md-7 col-xs-5"
                                                value="${purchase.num}" type="text" onblur="checknum()"><span id="demo4"
                                                                                                              style="color: red;"></span>
            </div>
        </div>
        <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-5">进货日期<span>*</span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-5">
                <label for="indate"></label><input id="indate" name="indate" class="form-control col-md-7 col-xs-5"
                                                   value="<fmt:formatDate pattern="yyyy-MM-dd" value="${purchase.indate}"/>"
                                                   type="date">
            </div>
        </div>
        <div class="item form-group">
            <label class="control-label col-md-3 col-sm-3 col-xs-5">处理人<span></span>
            </label>
            <div class="col-md-6 col-sm-6 col-xs-5">
                <label for="marks"></label><input id="marks" name="marks" class="form-control col-md-7 col-xs-5"
                                                  value="${purchase.marks}" type="text">
            </div>
        </div>
        <a onclick="history.back(-1);" class=" text-left btn btn-default" role="button">返回上页</a>
        <button type="submit" class="btn btn-primary text-center  col-md-offset-4 col-lg-offset-4col-xl-offset-4">添加
        </button>
    </form>
    <div class="clearfix"></div>
</div>
<%@include file="common/footer.jsp" %>
<script>
    /*判断输入id是不是数字  */
    function checkinid() {
        const num = document.getElementById('inid').value;
        if (num) {
            if (!isNaN(num)) {
                document.getElementById("demo1").innerHTML = " ";
                return true;
            } else {
                document.getElementById("demo1").innerHTML = "请输入正确的订单id！";
                document.getElementById('inid').value = "";
                document.getElementById('inid').focus();
                return false;
            }
        } else {
            document.getElementById("demo1").innerHTML = "请输入订单id！";
            document.getElementById('inid').focus();
            return false;
        }
    }

    /*  校验商品名称*/
    function checkname() {
        const name = document.getElementById('pname').value;
        if (name) {
            document.getElementById("demo2").innerHTML = " ";
            return true;
        } else {
            document.getElementById("demo2").innerHTML = "请输入商品名称！";
            document.getElementById('pname').focus();
            return false;
        }
    }


    /*判断输入的id是不是数字  */
    function checkproid() {
        const num = document.getElementById('proid').value;
        if (num) {
            if (!isNaN(num)) {
                document.getElementById("demo3").innerHTML = " ";
                return true;
            } else {
                document.getElementById("demo3").innerHTML = "请输入正确的商品id！";
                document.getElementById('proid').value = "";
                document.getElementById('proid').focus();
                return false;
            }
        } else {
            document.getElementById("demo3").innerHTML = "请输入商品id！";
            document.getElementById('proid').focus();
            return false;
        }
    }

    function checknum() {
        const num = document.getElementById('num').value;
        if (num) {
            if (!isNaN(num)) {
                document.getElementById("demo4").innerHTML = " ";
                return true;
            } else {
                document.getElementById("demo4").innerHTML = "请输入正确的商品数量！";
                document.getElementById('num').value = "";
                document.getElementById('num').focus();
                return false;
            }
        } else {
            document.getElementById("demo4").innerHTML = "请输入商品数量！";
            document.getElementById('num').focus();
            return false;
        }
    }

    /* 校验整个表单 */
    function checkall() {
        const inid = checkinid();
        const name = checkname();
        const proid = checkproid();
        const num = checknum();

        if (inid && name && proid && num) {
            alert("添加成功");
            return true;
        } else {
            alert("添加失败，请重新填写数据");
            return false;

        }
    }
</script>