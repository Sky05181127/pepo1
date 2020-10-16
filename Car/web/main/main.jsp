<%--
  Created by IntelliJ IDEA.
  User: apple
  Date: 2019/11/16
  Time: 3:50 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>$Title$</title>
    <%--引入EasyUI资源--%>
    <%--引入主题样式--%>
    <link rel="stylesheet" type="text/css" href="themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="themes/icon.css">
    <%--引入js文件--%>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <script type="text/javascript" src="js/jquery.easyui.min.js"></script>
    <script>
        $(function () {
            $('#tt').tree({
                url: 'selMenuInfo',
                onClick:function (node) {
                    //判断是否为子节点，父节点无需创建选项卡
                    var url=node.attributes.url;
                    if(url=="" || url==null){
                        return ;
                    }
                    //判断是否已经存储对应的选项卡
                    var flag=$("#tab").tabs('exists',node.text);
                    if(flag){
                        //已经存在，则选中即可
                        $("#tab").tabs('select',node.text);
                    }else{
                        //新增菜单选项卡
                        $("#tab").tabs('add',{
                            title:node.text,
                            content:'<iframe name="child" id="if" src="'+url+'" frameborder="0" width="100%" height="100%"></iframe>',
                            closable:true
                        })
                    }
                }
            });

            $('#Out').click(function () {
                $.messager.confirm('用户退出', '你确定要退出吗?', function(r){
                    if (r){
                        //用户退出
                        window.location.href="userOut";
                    }
                });
            })

        })

        //给修改密码增加单击事件
        $(function () {
            //给修改密码增加单击事件
            $("#UpdatePWD").click(function () {
                //显示密码修改框
                $("#pwdWindow").window('open');
            })
            //给取消按钮增加单击事件
            $("#cancelPwd").click(function () {
                //关闭密码修改框
                $("#pwdWindow").window('close');
            })
        });

        //声明函数完成增加车辆信息页面的跳转
        function goAddCar() {
            //获取选择的选项卡面板
            var tab=$("#tab").tabs('getSelected');
            //更新选项卡内容为增加页面
            $("#tab").tabs('update',{
                tab: tab,
                options: {
                    content:'<iframe src="car/carAdd.jsp" frameborder="0" width="100%" height="100%"></iframe>',
                }
            })
        }
        //声明函数完成增加车辆信息返回按钮的效果
        function goBackShowCar() {
            //获取选择的选项卡面板
            var tab=$("#tab").tabs('getSelected');
            //更新选项卡内容为增加页面
            $("#tab").tabs('update',{
                tab: tab,
                options: {
                    content:'<iframe src="car/carShow.jsp" frameborder="0" width="100%" height="100%"></iframe>',
                }
            })
        }


        //声明函数完成修改车辆信息跳转修改页面
        function goEditCar(car) {
            //获取选择的选项卡面板
            var tab=$("#tab").tabs('getSelected');
            //更新选项卡内容为增加页面
            $("#tab").tabs('update',{
                tab: tab,
                options: {
                    content:"<iframe src=car/carEdit.jsp?carnumber="+car.carnumber+" frameborder=0 width=100% height=100%></iframe>",
                }
            })
        }

        function goRentCar(car) {
            //获取选择的选项卡面板
            var tab=$("#tab").tabs('getSelected');
            //更新选项卡内容为增加页面
            $("#tab").tabs('update',{
                tab: tab,
                options: {
                    content:"<iframe src=service/rentCarInfo.jsp?carnumber="+car.carnumber+" frameborder=0 width=100% height=100%></iframe>",
                }
            })
        }
        //声明函数加载汽车出租单详情信息
        function goRentInfo(rentid) {
            //获取选择的选项卡面板
            var tab=$("#tab").tabs('getSelected');
            //更新选项卡内容为增加页面
            $("#tab").tabs('update',{
                tab: tab,
                options: {
                    content:"<iframe src=service/rentInfo.jsp?rentid="+rentid+" frameborder=0 width=100% height=100%></iframe>",
                }
            })
        }

        //声明函数加载角色修改页面
        function goRoleEdit(row) {
            //获取选择的选项卡面板
            var tab=$("#tab").tabs('getSelected');
            //更新选项卡内容为增加页面
            $("#tab").tabs('update',{
                tab: tab,
                options: {
                    content:"<iframe src=role/roleEdit.jsp?roleid="+row.roleid+"&rolename="+row.rolename+"&roledesc="+row.roledesc+"  frameborder=0 width=100% height=100%></iframe>",
                }
            })
        }

        //声明函数加载角色增加页面
        function goRoleAdd() {
            //获取选择的选项卡面板
            var tab=$("#tab").tabs('getSelected');
            //更新选项卡内容为增加页面
            $("#tab").tabs('update',{
                tab: tab,
                options: {
                    content:"<iframe src='role/roleAdd.jsp' frameborder=0 width=100% height=100%></iframe>",
                }
            })
        }

        //声明函数完成增加角色信息返回按钮的效果
        function goRoleback() {
            //获取选择的选项卡面板
            var tab=$("#tab").tabs('getSelected');
            //更新选项卡内容为增加页面
            $("#tab").tabs('update',{
                tab: tab,
                options: {
                    content:'<iframe src="role/roleManager.jsp" frameborder="0" width="100%" height="100%"></iframe>',
                }
            })
        }
    </script>
</head>

<body class="easyui-layout">
    <div data-options="region:'north'" style="height:55px; background-image: url('images/layout-browser-hd-bg.gif')">
          <span>
             <img src="images/blocks.gif" style="position: relative; top: 10px; left: 20px">
          </span>
          <span style="position: relative; left: 20px">
              <b style="color: white; font-size: 18px;">汽车租赁系统</b>
          </span>
          <span  style="float: right; font-size: 18px; position: relative; top: 10px; right: 20px">
             <span style="font-weight: bold">
                 当前用户：${sessionScope.user.realname}
             </span>
             <span>
                <a href="javascript:void(0)" id="Out">退出</a>
             </span>&nbsp;&nbsp;
              <span>
                <a href="javascript:void(0)" id="UpdatePWD">修改密码</a>
             </span>
          </span>
    </div>


    <div data-options="region:'south'" style="height:50px; background-color: rgb(50,50,50);font-family: 'AppleGothic'">
        <div style="width: 600px; margin: auto; text-align: center">
            <span style="font-size: 20px; color: white; position: relative; top: 5px;">&copy;未成年人禁止进入本网站，少儿不宜</span>
        </div>
    </div>


    <div data-options="region:'west',split:false" style="width:150px;">
            <ul id="tt" class="easyui-tree">
            </ul>
    </div>

    <%--声明js到代码域--%>
    <script type="text/javascript">
        //声明页面加载事件
        $(function () {
            //声明颜色数组
            var arr=["red","blue","black"];
            window.setInterval(function () {
                //获取内容
                var content=$("#fn").text();
                //遍历
                var s=content.split("");//将字符串转换为数组
                //声明变量记录最终结果
                // var str="";
                //清空原有内容
                $("#fn").empty();
                //给字体设置颜色
                for(var i=0;i<s.length;i++){
                    var index=Math.floor(Math.random()*3);
                    $("#fn").append("<span style='color:"+arr[index]+"'>"+s[i]+"</span>");
                }
            },100);
        })
    </script>
    <div data-options="region:'center'" style="padding:2px;">
        <%--显示选项卡的效果--%>
        <div id="tab" class="easyui-tabs" data-options="fit:true,border:true" >
            <div title="首页" data-options="selected:true" style="padding:20px;">
                <marquee direction="right" scrollamount="10" behavior="alternate">
                    <font style="color:red; font-family: 'Apple Braille'" id="fn" size="15px;">欢迎来到506汽车租赁系统</font>
                </marquee>
            </div>
        </div>
    </div>
    </div>

    <%--声明js代码域--%>
    <script type="text/javascript">
        $(function () {
            $('#pwdWindow').window('close');

            $.extend($.fn.validatebox.defaults.rules, {
                minLength: {
                    validator: function(value, param){
                        var flag = false;
                        $.ajax({
                            type:"get",
                            url:"checkUserPwd",
                            data:"oldPwd="+value,
                            async:false,//设置ajax为同步请求
                            success:function (data) {
                                flag=data;
                            }
                        })
                        return flag;
                    },
                    message: '请输入正确的密码！'
                }
            });
            //声明新密码和确认密码的校验规则
            $.extend($.fn.validatebox.defaults.rules, {
                confirmPass: {
                    validator: function(value, param){
                        var newPwd = $(param[0]).passwordbox('getValue');
                        return value == newPwd;
                    },
                    message: '两次密码不一致'
                }
            })
            //确认修改密码，进行表单提交
            $('#confirmPwd').click(function () {
                // 验证表单数据
                var flag = $('#fm').form('enableValidation').form('validate')
                // 发起Ajax请求
                if(flag){
                    $.post('updatePwd',{newPwd:$('#newPwd').passwordbox('getValue')},function (data) {
                        if(data){
                            //返回data为true，密码修改成功，退出到登录界面
                            window.location.href="Login.jsp?str=密码修改成功";
                        }else {
                            $.messager.alert('提示','密码修改失败!','error');
                        }
                    })
                }else{
                    $.messager.alert('警告','请填写正确的密码信息!','warning');
                }
            })
        })
    </script>
    <div class="easyui-window" id="pwdWindow" title="密码修改" data-options="width:400,height:300,left:444,top:105,inline:true,border:'thin',cls:'c6',collapsible:false,minimizable:false,maximizable:false,draggable:false,resizable:false,modal:true">
        <div class="easyui-panel" style="width:400px;padding:30px 50px" data-options="fit:true">
            <%--定义表单--%>
            <form id="fm" method="post">
                <div style="margin-bottom:15px">
                    <input class="easyui-textbox" id="oldPwd" prompt="原始密码" data-options="delay:1000,validType:'minLength[5]'" iconWidth="28" style="width:100%;height:34px;padding:10px;">
                </div>
                <div style="margin-bottom:15px">
                    <input id="newPwd" class="easyui-passwordbox" prompt="新密码" iconWidth="28" style="width:100%;height:34px;padding:10px">
                </div>
                <div style="margin-bottom:30px">
                    <input class="easyui-passwordbox" validType="confirmPass['#newPwd']" prompt="确认密码" iconWidth="28"  style="width:100%;height:34px;padding:10px">
                </div>
                <div>
                    <a href="javascript:void(0)" id="confirmPwd"  class="easyui-linkbutton c6" style="width:120px">确认修改</a>
                    &nbsp;&nbsp;
                    <a href="javascript:void(0)" id="cancelPwd"  class="easyui-linkbutton c6" style="width:120px">取消</a>
                </div>
            </form>
        </div>
    </div>

    <%--增加客户信息窗口--%>
    <script type="text/javascript">
        $(function(){
            //隐藏增加客户的窗口。
            $("#customerWindow").window('close');
            //给取消按钮增加单击事件
            $("#cancelAdd").click(function () {
                $("#customerWindow").window('close');
            })
            //给确认增加添加单击事件，完成增加客户信息的请求发送
            $("#confirmAdd").click(function () {
                $("#ff").form('submit',{
                    url:"customerAdd",
                    success:function () {
                        $.messager.alert("增加","增加成功","info");
                        //关闭增加客户信息窗口
                        $("#customerWindow").window('close');
                        //清空表单
                        $("#ff").form('reset');
                        //刷新子页面中的datagrid表格
                        $("#if")[0].contentWindow.refreshMenuTree();
                        //child.window.refreshDatagrid();
                    }
                })
            })


        });
        //声明函数弹出增加客户信息的窗口
        function showCustomer() {
            $("#customerWindow").window('open');
        }



    </script>
    <%--声明增加客户信息的窗口--%>
    <div class="easyui-window" id="customerWindow" title="增加客户" data-options="width:450,height:380,left:444,top:105,inline:true,border:'thin',cls:'c6',collapsible:false,minimizable:false,maximizable:false,draggable:false,resizable:false,modal:true">
        <div class="easyui-panel"  style="width:300px;padding:10px;" data-options="fit:true">
            <form id="ff" action="customerAdd"  method="post">
                <table style="margin: auto;margin-top: 10px;" cellpadding="5px">
                    <tr>
                        <td>客户身份证号:</td>
                        <td><input name="identity" class="f1 easyui-textbox"></input></td>
                    </tr>
                    <tr>
                        <td>姓名:</td>
                        <td><input name="custname" class="f1 easyui-textbox"></input></td>
                    </tr>
                    <tr>
                        <td>性别:</td>
                        <td>
                            <input class="easyui-radiobutton" name="sex" value="1" label="男:">
                            <input class="easyui-radiobutton" name="sex" value="0" label="女:">
                        </td>
                    </tr>
                    <tr>
                        <td>地址:</td>
                        <td><input name="address" class="f1 easyui-textbox"></input></td>
                    </tr>
                    <tr>
                        <td>手机号:</td>
                        <td><input name="phone" class="f1 easyui-textbox"></input></td>
                    </tr>
                    <tr>
                        <td>职业:</td>
                        <td><input name="career" class="f1 easyui-textbox"></input></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">

                            <a href="javascript:void(0)" id="confirmAdd"  class="easyui-linkbutton c6" style="width:120px">确认增加</a>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="javascript:void(0)"  id="cancelAdd"  class="easyui-linkbutton c6" style="width:120px">取消</a>
                        </td>
                    </tr>
                </table>

            </form>
        </div>
    </div>

    <script>
        //声明页面加载函数，完成菜单增加功能
        $(function () {
            //页面加载，窗口默认隐藏
            $("#menuAddWindow").window('close')

            //给确定按钮添加单击事件
            $('#confirmMenuAdd').click(function () {
                $('#menuff').form('submit',{
                    url:"menuAdd",
                    success:function () {
                        $.messager.alert("增加","增加成功","info");
                        //关闭增加客户信息窗口
                        $("#menuAddWindow").window('close');
                        //清空表单
                        $("#menuff").form('reset');
                        //刷新子页面中的tree异步树
                        $("#if")[0].contentWindow.refreshMenuTree();
                    }
                })
            })
        })

        //显示菜单增加窗口页面
        function menuAddWindowShow(pnode) {
            //将父菜单名显示到窗口中
            $('#pname').textbox('setValue',pnode.text)
            //将父菜单的Id值记录
            $('#pid').val(pnode.id)
            //将隐藏的窗口显示
            $('#menuAddWindow').window('open')
        }
    </script>
    <%--声明菜单增加窗口页面--%>
    <div class="easyui-window" id="menuAddWindow" title="增加菜单" data-options="width:450,height:380,left:444,top:105,inline:true,border:'thin',cls:'c1',collapsible:false,minimizable:false,maximizable:false,draggable:false,resizable:false,modal:true">
        <div class="easyui-panel"  style="width:300px;padding:10px;" data-options="fit:true">
            <form id="menuff" action="menuAdd"  method="post">
                <input type="hidden" name="pid" id="pid" value="">
                <table style="margin: auto;margin-top: 10px;" cellpadding="5px">
                    <tr>
                        <td>父菜单名:</td>
                        <td><input id="pname" class="c1 easyui-textbox" disabled="disabled" style="color: red;" value=""></input></td>
                    </tr>
                    <tr>
                        <td>菜单名:</td>
                        <td><input name="name" class="c1 easyui-textbox"></input></td>
                    </tr>
                    <tr>
                        <td>url地址:</td>
                        <td><input name="url" class="c1 easyui-textbox"></input></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <a href="javascript:void(0)" id="confirmMenuAdd"  class="easyui-linkbutton c1" style="width:120px">确认增加</a>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="javascript:void(0)"  id="cancelMenuAdd"  class="easyui-linkbutton c1" style="width:120px">取消</a>
                        </td>
                    </tr>
                </table>

            </form>
        </div>
    </div>


    <script type="text/javascript">
        //声明页面加载函数，修改菜单信息
        function menuEditWindow(node) {
            $('#id').val(node.id)
            $('#name').textbox('setValue',node.text)
            $('#url').textbox('setValue',node.attributes.url)
            //显示修改窗口
            $('#menuEditShow').window('open')
        }
        $(function () {
            //1、隐藏修改页面
            $('#menuEditShow').window('close')

            //给确认修改按钮添加单击事件
            $('#confirmMenuEdit').click(function () {
                $('#menuForm').form('submit',{
                    success:function (data) {
                        $.messager.alert('提示','修改成功','info')
                        $("#menuEditShow").window('close');//关闭修改窗口
                        //修改完成之后刷新子页面的异步树
                        $("#if")[0].contentWindow.refreshMenuTree();
                    }
                })
            })

            //给取消按钮添加单击事件
            $('#cancelMenuEdit').click(function () {
                $('#menuEditShow').window('close')
            })
        })
 0   </script>
    <%--声明菜单修改窗口页面--%>
    <div class="easyui-window" id="menuEditShow" title="增加菜单" data-options="width:450,height:380,left:444,top:105,inline:true,border:'thin',cls:'c1',collapsible:false,minimizable:false,maximizable:false,draggable:false,resizable:false,modal:true">
        <div class="easyui-panel"  style="width:300px;padding:10px;" data-options="fit:true">
            <form id="menuForm" action="menuEdit"  method="post">
                <input type="hidden" name="id" id="id" value="">
                <table style="margin: auto;margin-top: 10px;" cellpadding="5px">
                    <tr>
                        <td>新的父菜单:</td>
                        <td>
                            <input class="easyui-combotree" name="pid" value="请选择" data-options="url:'menuMangerInfo',method:'get'" style="width:100%">
                        </td>
                    </tr>
                    <tr>
                        <td>菜单名:</td>
                        <td><input name="name" id="name" class="c1 easyui-textbox"/></td>
                    </tr>
                    <tr>
                        <td>url地址:</td>
                        <td><input name="url" id="url" class="c1 easyui-textbox"/></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <a href="javascript:void(0)" id="confirmMenuEdit"  class="easyui-linkbutton c3" style="width:120px">确认修改</a>
                            &nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="javascript:void(0)"  id="cancelMenuEdit"  class="easyui-linkbutton c3" style="width:120px">取消</a>
                        </td>
                    </tr>
                </table>

            </form>
        </div>
    </div>
</body>
</html>
