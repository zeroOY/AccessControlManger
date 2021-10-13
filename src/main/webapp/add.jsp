
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    <form method="post" action="/doadd">
    <table border="1">
        <tr>
            <th colspan="2"><h1>园区门禁管理系统</h1></th>
        </tr>
        <tr>38i
            <th>负责人<span>(*)</span></th>
            <th><input type="text" name="principal" id="principal"></th>
        </tr>              w33
        <tr>
            <th>供应商<span>(*)</span></th>
            <th><input type="text" name="supplier" id="supplier"></th>
        </tr>
        <tr>
            <th>品牌<span>(*)</span></th>
            <th><input type="text" name="brand" id="brand"></th>
        </tr>
        <tr>
            <th>所属楼宇<span>(*)</span></th>
            <th>
                <select id="hospital_id" name="hospital_id">

                </select>
            </th>
        </tr>
        <tr>
            <th>安装日期<span>(*)</span></th>
            <th><input type="text" name="add_time" id="add_time"></th>
        </tr>
        <tr>
            <th colspan="2" style="text-align: center">
                <input type="submit" value="提交" >
            <input type="button" value="返回" onclick="location.href='/show'"></th>
        </tr>
    </table>
    </form>
</div>
</body>
</html>
<script src="${pageContext.request.contextPath}/static/js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
    $(function () {
        xia();
        $("span").css("color","red");

    })
   /* function aa() {
        $("#bt").submit(function () {
            var principal=$("#principal").val();
            var supplier=$("#supplier").val();
            var brand=$("#brand").val();
            var hospital_id=$("#hospital_id").val();
            var add_time=$("#add_time").val();
            if (principal==null||principal==''||supplier==null||supplier==''||brand==null||brand==''||add_time==null||add_time==''||) {
                alert("请填写完整信息");
                return false;
            }
            if (hospital_id==-1){
                alert("请选择楼宇");
                return false;
            }
            var $time=/^\d{4}-\d{2}-\d{2}$/;
            if ($time.test(add_time)==false){
                alert("日期格式不正确！");
                return false;
            }
            return true;
        })
    }*/
    function xia() {
        var hot=$("#hot").val();
        $("#hospital_id").empty();
        $("#hospital_id").html("<option value='-1'>--请选择--</option>")
        $.ajax({
            url:"/ajax/sho",
            data:"",
            type:"post",
            dataType:"json",
            success:function (result) {
                for (var i=0;i<result.length;i++){
                    $("#hospital_id").append("<option value='"+result[i].id+"'>"+result[i].name+"</option>");
                }
            }
        })/* end */
    }
</script>
