<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/22 0022
  Time: 上午 10:59
  To change this template use File | Settings | File Templates.

  进度条效果
    https://blog.csdn.net/w1014074794/article/details/70210461
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>

<head>
    <base href="<%=basePath%>">
    <title>汽车增加</title>
    <%--引入EasyUI的资源--%>
        <%--引入EasyUI的样式--%>
        <link rel="stylesheet" type="text/css" href="themes/default/easyui.css">
        <link rel="stylesheet" type="text/css" href="themes/icon.css">
        <%--引入jQuery--%>
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <%--引入EasyUI的js--%>
        <script type="text/javascript" src="js/jquery.easyui.min.js"></script>
        <link rel="stylesheet" type="text/css" href="themes/color.css">
    <%--声明js代码域--%>
        <script type="text/javascript">
            //页面加载成功后根据车牌号获取车辆信息
            $(function () {
                var carnumber='${param.carnumber}';
               //发起ajax请求获取汽车信息
                $.get("carByCarnumberInfo",{carnumber:carnumber},function (data) {
                    //将数据显示到页面中
                    $("#cartype").combobox('setValue',data.cartype);
                    $("#color").textbox('setValue',data.color);
                    $("#price").textbox('setValue',data.price);
                    $("#rentprice").textbox('setValue',data.rentprice);
                    $("#deposit").textbox('setValue',data.deposit);
                    $("#description").textbox('setValue',data.description);
                    $("#oldImg").attr("src",data.carimg);
                })
            })


        </script>
</head>
<body>
<div class="easyui-panel" title="车辆增加" data-options="fit:true,border:false" style="padding:10px;">
    <form id="ff" action="carEdit" method="post" enctype="multipart/form-data">
        <table cellpadding="6px;">
            <tr>
                <td>车牌号:</td>
                <td><input name="carnumber"  value="${param.carnumber}" class="f1 easyui-textbox" data-options="readonly:true"></input></td>
            </tr>
            <tr>
                <td>车型:</td>
                <td>
                    <select class="easyui-combobox" id="cartype" name="cartype"  style="width:200px;">
                        <option value="SUV">SUV</option>
                        <option value="轿车">轿车</option>
                        <option value="越野车">越野车</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>颜色:</td>
                <td><input name="color" id="color" class="f1 easyui-textbox"  data-options="required:true,missingMessage:'颜色不能为空'"></input></td>
            </tr>
            <tr>
                <td>价格:</td>
                <td>
                    <input class="f1 easyui-numberbox" id="price" name="price"  precision="2"   data-options="required:true,missingMessage:'价格不能为空'">
                </td>
            </tr>
            <tr>
            <td>出租价格:</td>
            <td> <input class="f1 easyui-numberbox" id="rentprice" name="rentprice" precision="2"   data-options="required:true,missingMessage:'租车价格不能为空'"></td>
        </tr>
            <tr>
            <td>押金:</td>
            <td> <input class="f1 easyui-numberbox" id="deposit" name="deposit"  precision="2"   data-options="required:true,missingMessage:'押金不能为空'"></td>
         </tr>
            <tr>
                <td>描述:</td>
                <td>
                    <input class="easyui-textbox" id="description" name="description" style="width:100%;height:60px" data-options="multiline:true">
                </td>
            </tr>
            <tr>
                <td>原始图片:</td>
                <td><img id="oldImg" src=""  width="100px"></td>
            </tr>
            <tr>
                <td>选择新的图片:</td>
                <td><input name="file" id="file" data-options="accept: 'image/*'" class="f1 easyui-filebox"></input></td>
            </tr>
            <tr>

                <td colspan="2">
                    <a href="javascript:void(0)" id="confirmEdit"  class="easyui-linkbutton c6" style="width:120px">确认修改</a>
                    &nbsp;&nbsp;
                    <a href="javascript:void(0)"  id="cancelEdit"  class="easyui-linkbutton c6" style="width:120px">返回</a>
                </td>
            </tr>
        </table>
    </form>
</div>
<style scoped>
    .f1 {
        width: 200px;
    }
</style>
<script type="text/javascript">
    $(function(){
        //给返回添加单击事件
        $("#cancelEdit").click(function () {
            window.parent.goBackShowCar();
        })
        //给确认增加添加单击事件
        $("#confirmEdit").click(function () {
            $('#ff').form('submit', {
                onSubmit: function(){
                    var isValid = $(this).form('enableValidation').form('validate');
                    //获取上传的fileBox的值
                    var upload=$("#file").filebox('getValue');
                    //判断是否选择图片
                    if(upload!=""){
                        //获取文件后缀名
                        var suffix=upload.substring(upload.lastIndexOf("."));
                        //校验文件后缀
                        if(!(".jpg"==suffix||".png"==suffix || ".jpeg"==suffix || ".bmp"==suffix)){
                            $.messager.alert("提示","你选择正确的文件格式: jpg|png|jpeg|bmp",'info');
                            return false;
                        }
                    }
                    //校验表单是否填写完整
                    if (!isValid){
                       $.messager.alert('提示','请填写完整信息','info');	// 如果表单是无效的则隐藏进度条
                    }
                    return isValid;	// 返回false终止表单提交
                },
                success: function(){
                    //清空表单
                    $("#ff").form('reset');
                    $.messager.alert('提示','修改成功','info');
                }
            });
        })
    });
</script>
</body>
</html>