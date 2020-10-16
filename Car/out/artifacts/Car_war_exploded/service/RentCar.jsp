<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/21 0021
  Time: 下午 15:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>

<head>
    <base href="<%=basePath%>">
    <title>汽车管理</title>
    <%--引入EasyUI的资源--%>
    <%--引入EasyUI的样式--%>
    <link rel="stylesheet" type="text/css" href="themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="themes/icon.css">
    <%--引入jQuery--%>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <%--引入EasyUI的js--%>
    <script type="text/javascript" src="js/jquery.easyui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="themes/color.css">
    <script type="text/javascript">
        $(function () {
            $("#carTa").datagrid({
                idField:'carnumber',//设置每行的唯一标识的字段，一般为filed属性中的主键名
                autoRowHeight:true,
                fitColumns:true,
                url:"rentCar",
                title:'汽车信息',//表格显示标题行
                pagination:true,//表格底部显示分页插件
                rownumbers:true,//表格显示行号列
                singleSelect:true,//设置表格行为单元效果
                pageSize:2,//设置每页显示的数据量
                pageList:[2,4,6],//设置分页插件中的每页显示的数据量
                toolbar:'#bar2,#bar',//加载工具栏效果
                columns:[//设置表头列
                    [
                        {field:"ck",checkbox:true},//增加多选框列
                        {field:"carnumber",title:"车牌号"},
                        {field:"cartype",title:"车型"},
                        {field:"color",title:"颜色"},
                        {field:"price",title:"价格"},
                        {field:"rentprice",title:"租金"},
                        {field:"deposit",title:"押金"},
                        {field:"isrenting",title:"出租状态"},
                        {field:"description",title:"描述"},
                        {field:"carimg",title:"图片",
                            formatter:function (value,row,index) {
                                return "<img src='"+value+"' width='100px' height='100px'/>";
                            }
                        }
                    ]
                ]
            })
        });

        //给查询按钮添加单击事件，单击后按照查询条件进行分页查询
        $(function () {
            $('#search').click(function () {
                $('#carTa').datagrid('load',{
                    carnumer:$('#carnumer').textbox('getValue'),
                    cartype:$('#cartype').textbox('getValue'),
                    color:$('#color').textbox('getValue')
                })
            })
        })

        //给出租按钮增加单击事件
        $(function () {
            $("#rentCar").click(function () {
                //校验选择要修改的行数
                var trs= $("#carTa").datagrid('getChecked');
                if(trs.length>1){
                    $.messager.alert("提示","只能选择一个","info");
                }else if(trs.length==0){
                    $.messager.alert("提示","请选择一条数据","info");
                }else{
                    window.parent.goRentCar(trs[0]);
                }
            })
        })
    </script>
</head>
<body>
    <%--声明表格显示汽车信息--%>
    <table id="carTa"></table>
    <%--声明工具栏，删除选择的车辆信息，修改选择的车辆信息--%>
    <div id="bar2">
        <a href="javascript:void(0)" id="rentCar" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">出租</a>
    </div>
    <%--声明工具栏--%>
    <div id="bar">
        查询条件:
        <input class="easyui-textbox" id="carnumer"  prompt="请输入车牌号" labelPosition="top" style="width:200px;">
        <select class="easyui-combobox" id="cartype" name="state"  style="width:200px;">
            <option value="all">请选择车型</option>
            <option value="SUV">SUV</option>
            <option value="轿车">轿车</option>
            <option value="越野车">越野车</option>
        </select>
        <input class="easyui-textbox" id="color"  prompt="请输入颜色" labelPosition="top" style="width:200px;">
        <a href="javascript:void(0)"  id="search" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="width:80px">查询</a>
    </div>


</body>
</html>