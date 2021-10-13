
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    <h2 style="text-align: center">园区门禁管理系统</h2>
    <form action="/show" method="post">
        <table>
            <tr>
                <input type="hidden" name="pageIndex" id="pageIndex" value="1">
                <input type="hidden" id="hot" value="${param.hotId}">
                <th>
                    <select name="hotId" id="hotId">
                        <option value='-1'>--请选择--</option>
                    </select>
                </th>
                <th>
                    <input type="submit" value="查询"/>
                </th>
                <th>
                    <input type="button" value="添加" onclick="location.href='/add.jsp'">
                </th>
            </tr>
        </table>
    </form>
    <table id="aa">
        <tr>
            <th>负责人</th>
            <th>供应商</th>
            <th>品牌</th>
            <th>所属楼宇</th>
            <th>安装日期</th>
            <th>运行状态</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${page.list}" var="p">
            <tr>
                <th>${p.principal}</th>
                <th>${p.supplier}</th>
                <th>${p.brand}</th>
                <th>${p.name}</th>
                <th>${p.add_time}</th>
                <th>
                    <c:if test="${p.status==0}">禁用</c:if>
                    <c:if test="${p.status==1}">启用</c:if>
                </th>
                <th>
                    <a href="javascript:void(0)" onclick="bt(${p.id},this,${p.status})">
                        <c:if test="${p.status==1}">禁用</c:if>
                        <c:if test="${p.status==0}">启用</c:if>
                    </a>
                </th>
            </tr>
        </c:forEach>
    </table>
    <div>
        <table>
            <tr>
                <th><a href="javascript:pageShow(1)">首页</a></th>
                <c:if test="${page.pageIndex>1}">
                    <th><a href="javascript:pageShow(${page.pageIndex-1})">上一页</a></th>
                </c:if>
                <c:forEach begin="1" end="${page.pageCount}" varStatus="i">
                    <th><a href="javascript:pageShow(${i.index})">${i.index} </a></th>
                </c:forEach>
                <c:if test="${page.pageIndex<page.pageCount}">
                    <th><a href="javascript:pageShow(${page.pageIndex+1})">下一页</a></th>
                </c:if>
                <th><a href="javascript:pageShow(${page.pageCount})">尾页</a></th>
                <th>第${page.pageIndex}页/共${page.pageCount}页</th>
            </tr>
        </table>
    </div>
</div>
</body>
</html>
<script src="${pageContext.request.contextPath}/static/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
    $(function () {
        xia();
        $("#aa tr:even").css("background","red");
        $("#aa tr:first").css("background","#878586");
    })
    function xia() {
        var hot=$("#hot").val();
        $("#hotId").empty();
        $("#hotId").html("<option value='-1'>--请选择--</option>")
        $.ajax({
            url:"/ajax/sho",
            data:"",
            type:"post",
            dataType:"json",
            success:function (result) {
                for (var i=0;i<result.length;i++){
                    if (result[i].id==hot) {
                        $("#hotId").append("<option value='"+result[i].id+"'  selected>"+result[i].name+"</option>");
                    }
                    $("#hotId").append("<option value='"+result[i].id+"'  >"+result[i].name+"</option>");
                }
            }
        })/* end */
    }
    function pageShow(index) {
        $("#pageIndex").val(index);
        $("form").submit();
    }
    function bt(id,e,s) {
        var sta="";
        if (s==0){
            sta="启用";
        } else{
            sta="禁用";
        }
        if (confirm("是否"+sta+"")){
            $.ajax({
                url:"/ajax/toqi",
                data:{"id":id,"status":s},
                type:"post",
                dataType:"text",
                success:function (result) {
                    if (result=="ok") {
                        if (sta=="启用") {
                            $(e).html("<a href='#' onclick='bt("+id+",this,"+0+")'>禁用</a>")
                            $(e).parent().prev().html("启用");
                        }else{
                            $(e).html("<a href='#' onclick='bt("+id+",this,"+1+")'>启用</a>")
                            $(e).parent().prev().html("禁用");
                        }
                    }
                }
            })/*end*/
        }
    }
</script>
