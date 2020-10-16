<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/27 0027
  Time: 下午 14:43
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
        $(function () {
            //给确认增加按钮添加单击事件
            $("#confirmRoleAdd").click(function () {
                //获取选择的节点
                    var nodesChk=$("#menuTree").tree('getChecked')
                //获取不确定的节点
                    var nodesNotConfirm=$("#menuTree").tree('getChecked','indeterminate');
                //声明字符串拼接选择的菜单的ID
                var str="";
                for(var i=0;i< nodesChk.length;i++){
                    str+=nodesChk[i].id+",";
                }
                for(var i=0;i<nodesNotConfirm.length;i++){
                    str+=nodesNotConfirm[i].id+",";
                }
                //发送ajax请求完成角色的增加
                var reqData={
                    rolename:$("#rolename").textbox('getValue'),
                    roledesc:$("#roledesc").textbox('getValue'),
                    ids:str
                }
               $.get("roleEdit",reqData,function (data) {
                   if(data){
                       $.messager.alert("提示","角色增加成功","info");
                       //清空原有数据
                       $("#rolename").textbox('setValue',"");
                       $("#roledesc").textbox('setValue',"");
                       $("#menuTree").tree('reload')
                   }
               })

            })

            //给返回按钮添加单击事件
            $('#back').click(function () {
                window.parent.goRoleback();
            })
        })
    </script>
</head>
<body>
    角色名: <input type="text" id="rolename" name="rolename" class="easyui-textbox">
    角色描述: <input type="text" id="roledesc" name="roledesc" class="easyui-textbox">
    <a href="javascript:void(0)" id="confirmRoleAdd" class="easyui-linkbutton c8" style="width:120px">确认增加</a>
    <a href="javascript:void(0)" id="back" class="easyui-linkbutton c5" style="width:120px">返回</a>
    <ul class="easyui-tree"  id="menuTree" data-options="url:'menuMangerInfo',animate:true,checkbox:true"></ul>
</body>
</html>