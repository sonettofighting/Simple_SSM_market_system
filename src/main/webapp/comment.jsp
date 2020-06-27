<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@include file="WEB-INF/jsp/head.jsp" %>

<script type="text/javascript">
    let named;

    function delete1(id) {
        localStorage.removeItem(id);
        this.Storage.writeData();
    }

    const Storage =
        {
            saveData: function ()//保存数据
            {

                var data = document.querySelector("#post textarea");
                if (data.value !== "") {
                    var time = new Date().getTime() + Math.random() * 5;//getTime是Date对象中的方法，作用是返回 1970年01月01日至今的毫秒数
                    if (named) {
                        localStorage.setItem(time, data.value + "|" + this.getDateTime());//将毫秒数存入Key值中，可以降低Key值重复率
                    } else {
                        localStorage.setItem(time, data.value + "|" + this.getDateTime());//将毫秒数存入Key值中，可以降低Key值重复率
                    }

                    data.value = "";
                    this.writeData();
                } else {
                    alert("请填写您的留言！");
                }
            },
            writeData: function ()//输出数据
            {
                var dataHtml = "", data = "";
                for (var i = localStorage.length - 1; i >= 0; i--)//效率更高的循环方法
                {
                    data = localStorage.getItem(localStorage.key(i)).split("|");

                    //dataHtml += "<p><span class=\"msg\">" + data[0] + "</span><span class=\"datetime\">" + data[1] + "</span><span>" + data[2]+"</span></p>";
                    dataHtml += "<span style=>" + data[1] + "<span style=\"float:right\">" + data[2] + "</span><p><span class=\"msg\">" + data[0] + "<input style=\"float:right;border:none;border-radius:5px;\" id=\"clearBt\" type=\"button\" onclick=\"delete1(" + localStorage.key(i) + ");\" value=\"删除\"/>" + "</span></p>";
                }
                document.getElementById("comment").innerHTML = dataHtml;
            },
            clearData: function ()//清空数据
            {
                if (localStorage.length > 0) {
                    if (window.confirm("清空后不可恢复，是否确认清空？")) {
                        localStorage.clear();
                        this.writeData();
                    }
                } else {
                    alert("没有需要清空的数据！");
                }
            },
            getDateTime: function ()//获取日期时间
            {
                const isZero = function (num)//私有方法，自动补零
                {
                    if (num < 10) {
                        num = "0" + num;
                    }
                    return num;
                };

                var d = new Date();
                return d.getFullYear() + "-" + isZero(d.getMonth() + 1) + "-" + isZero(d.getDate()) + " " + isZero(d.getHours()) + ":" + isZero(d.getMinutes()) + ":" + isZero(d.getSeconds());
            }
        };

    window.onload = function () {
        Storage.writeData();//当打开页面的时候，先将localStorage中的数据输出一边，如果没有数据，则输出空
        document.getElementById("postBt").onclick = function () {
            Storage.saveData();
        }//发表评论按钮添加点击事件，作用是将localStorage中的数据输出
        document.getElementById("clearBt").onclick = function () {
            Storage.clearData();
        }//清空所有已保存的数据
    }


</script>
<body>
<h1 class="text-center">
    <span class="section">留言</span>
</h1>

<div id="content-pane">
    <div id="post" class="col-md-12">
        <div>
            <textarea class="transition col-md-12"></textarea>
        </div>

        <input id="postBt" type="button"
               style="background-color:lightpink; no-repeat; width:80px; height:37px;border:none; color:white;border-radius:5px;"
               value="发表留言"/>
        <input id="clearBt" type="button"
               style="background-color:lightpink; no-repeat; width:80px; height:37px;border:none; color:white;border-radius:5px;"
               value="清空"/>
    </div>
<hr>
    <div id="comment"></div>
</div>
</body>
