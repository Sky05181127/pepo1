<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2019/11/16
  Time: 3:50 PM
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
    <title>$</title>
    <%--引入EasyUI资源--%>
    <%--引入主题样式--%>
    <link rel="stylesheet" type="text/css" href="themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="themes/icon.css">
    <%--引入js文件--%>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.min.js"></script>
    <%--声明js代码域--%>
    <script type="text/javascript">
        //初始化datagrid表格
        $(function () {
            $("#roleTable").datagrid({
                idField:'roleid',
                url:"roleInfo",
                title:'角色管理',
                pagination:true,//表格底部显示分页插件
                rownumbers:true,//表格显示行号列
                singleSelect:false,//设置表格行为单元效果
                pageSize:2,//设置每页显示的数据量
                pageList:[2,4,6],//设置分页插件中的每页显示的数据量
                toolbar:'#bar',
                columns:[//设置表头列
                    [
                        {field:"roleid",title:"角色ID"},
                        {field:"rolename",title:"角色名"},
                        {field:"roledesc",title:"角色描述"},
                        {field:"操作",title:"操作",
                            formatter:function (value,row,index) {
                                var edit="<a href='javascript:void(0)' onclick='roleEdit("+index+")'>编辑</a>"
                                return edit;
                            }
                        }

                    ]
                ]
            })
        })
        //声明编辑函数
        function roleEdit(index) {
            var rows= $("#roleTable").datagrid('getRows');
            //跳转角色编辑页面
            window.parent.goRoleEdit(rows[index]);
        }
        //给增加按钮添加单击事件
        $(function () {
            $("#roleAdd").click(function () {
                window.parent.goRoleAdd();
            })
        })
    </script>
</head>

<body>
    <%--创建角色表格--%>
    <table id="roleTable"></table>
    <%--声明工具栏--%>
    <div id="bar">
        <a href="javascript:void(0)" id="roleAdd" class="easyui-linkbutton c1" data-options="iconCls:'icon-add'">增加</a>
    </div>
</body>
</html>
