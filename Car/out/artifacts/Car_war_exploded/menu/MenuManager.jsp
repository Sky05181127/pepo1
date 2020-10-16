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
    <title>菜单管理</title>
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
         //声明页面加载函数,给增加菜单按钮添加单击事件
        $(function () {
            $('#menuAdd').click(function () {
                var node = $('#menuTree').tree('getSelected')
                if(node!=null){
                    window.parent.menuAddWindowShow(node)
                }else{
                    $.messager.alert("提示","请选择父菜单","info")
                }
            })
        })
         //刷新页面中的tree
         function refreshMenuTree() {
             $('#menuTree').tree('reload');
         }

         //声明页面加载函数，给删除菜单添加单击事件
        $(function () {
            $('#menuDel').click(function () {
                var node = $('#menuTree').tree('getSelected')
                if(node==null){//判断是否选择
                    $.messager.alert("提示","请选择要删除的菜单","info")
                }else if(node.attributes.isparent==1){//判断选择的菜单是否为父菜单
                    $.messager.alert("提示","不能删除此菜单","info")
                }else {//如果选中的菜单为子菜单
                    //发起Ajax请求
                    $.get("menuDel",{id:node.id},function (data) {
                        if (data){
                            $.messager.alert("提示","删除成功","info")
                            //刷新异步树
                            refreshMenuTree();
                        }
                    })
                }
            })
        })

        //声明页面加载函数，给修改菜单添加单击事件
        $(function () {
            $('#menuEdit').click(function () {
                //获取当前选中的菜单
                var node = $('#menuTree').tree('getSelected')
                //判断
                if (null!=node){
                    window.parent.menuEditWindow(node);
                }else{
                    $.messager.alert("提示","请选择要修改的菜单","info")
                }
            })
        })

    </script>
</head>

<body>
    <%--使用面板嵌套效果--%>
    <div class="easyui-panel" data-options="fit:true,border:false" style="padding:10px;">
        <div class="easyui-layout" data-options="fit:true">
            <div data-options="region:'west',split:true" style="width:150px;padding:10px">
                <a href="javascript:void(0)" id="menuAdd" class="easyui-linkbutton c1" style="width:120px">增加菜单</a><br><br>
                <a href="javascript:void(0)" id="menuDel" class="easyui-linkbutton c2" style="width:120px">删除菜单</a><br><br>
                <a href="javascript:void(0)" id="menuEdit" class="easyui-linkbutton c3" style="width:120px">修改菜单</a><br><br>
                <a href="javascript:void(0)" class="easyui-linkbutton c4" onclick="refreshMenuTree()" style="width:120px">刷新菜单</a>
            </div>
            <div data-options="region:'center'" style="padding:10px">
                <ul class="easyui-tree"  id="menuTree" data-options="url:'menuMangerInfo',animate:true"></ul>
            </div>
        </div>
    </div>
</body>
</html>
