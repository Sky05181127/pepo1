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
    <%--引入EasyUI的资源--%>
    <%--引入EasyUI的样式--%>
    <link rel="stylesheet" type="text/css" href="themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="themes/icon.css">
    <%--引入jQuery--%>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <%--引入EasyUI的js--%>
    <script type="text/javascript" src="js/jquery.easyui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="themes/color.css">
    <%--引入身份证的校验--%>
    <script type="text/javascript" src="js/card.js"></script>
    <script>
        //声明身份证号和车牌号的自定义校验规则
        $(function () {
            //自定义身份证验证规则
            var flag = false
            $.extend($.fn.validatebox.defaults.rules, {
                //身份证验证
                cardRule: {
                    validator: function(value, param){
                        if(isIDCard(value)){
                            flag = true
                            //验证车牌号
                             if($("#carnumber").textbox('isValid')){
                                 $("#search").linkbutton('enable');
                              }else{
                                 $("#search").linkbutton('disable');
                              }
                        }else{
                            $("#search").linkbutton('disable');
                        }
                        return flag
                    },
                    message: '身份证信息不正确'
                },
                //车牌号验证
                carNo: {
                    validator : function(value) {
                        if(/^[\u4E00-\u9FA5][\da-zA-Z]{6}$/.test(value)){
                            flag=true;
                             //验证身份证号
                             if(flag){
                                 $("#search").linkbutton('enable');
                             }else{
                                 $("#search").linkbutton('disable');
                             }
                        }else{
                            $("#search").linkbutton('disable');
                        }
                        return flag;
                    },
                    message : '车牌号码无效'
                }
            });
        })

        //给查询按钮添加单击事件
        $(function () {
            $('#search').click(function () {
                //获取车辆信息
                $('#carInfoTable').datagrid({
                    idField:'carnumber',//设置每行的唯一标识的字段，一般为filed属性中的主键名
                    autoRowHeight:true,
                    queryParams:{
                        carnumber:$("#carnumber").textbox('getValue')
                    },
                    fitColumns:true,
                    url:"carInfoTable",
                    title:'汽车信息',//表格显示标题行
                    columns:[//设置表头列
                        [
                            {field:"carnumber",title:"车牌号",
                                 formatter:function (value,row,index) {
                                     $("#carbacknumber").val(value);
                                     return value;
                                 }
                            },
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
                //根据身份证获取租车单信息
                $("#rentInfoTable").datagrid({
                    idField:'rentid',//设置每行的唯一标识的字段，一般为filed属性中的主键名
                    autoRowHeight:true,
                    fitColumns:true,
                    queryParams:{
                        identity:$("#identity").textbox('getValue')
                    },
                    url:"rentManagerShow",
                    title:'出租单信息',//表格显示标题行
                    columns:[//设置表头列
                        [
                            {field:"rentid",title:"出租单编号",
                                 formatter:function (value,row,index) {
                                     $("#rentid").val(value);
                                     return value;
                                 }
                            },
                            {field:"price",title:"价格"},
                            {field:"begindate",title:"出租日期"},
                            {field:"returndate",title:"归还日期"},
                            {field:"rentflag",title:"出租状态"},
                            {field:"customer",title:"客户姓名",
                                formatter:function (value,row,index) {
                                    return row.customer.custname;
                                }
                            },
                            {field:"identity",title:"客户身份证号"},
                            {field:"carnumber",title:"车牌号"},
                            {field:"opername",title:"操作人"},
                        ]
                    ]
                })
                //数据回显完之后，将检查单窗口显示出来
                $('#checkDiv').css("display","")
            })
        })
    </script>

    <script>
        //给检查单的确认归还添加单击事件
        $(function () {
            $('#back').click(function () {
                $('#fm').form('submit',{
                    success:function(data){
                        if (data){
                            $.messager.alert("提示","还车成功","info")
                            $('#fm').form('reset')//重置表单
                        }
                        $('#carInfoTable').datagrid('load',{
                            carnumber:$("#carnumber").textbox('getValue')
                        })
                        $("#rentInfoTable").datagrid('load',{
                            identity:$("#identity").textbox('getValue')
                        })
                    }
                })
            })
        })
    </script>
</head>

<body>
    请输入身份证号码：
    <input type="text" id="identity" class="easyui-textbox" data-options="required:true,missingMessage:'身份证必填',validType:'cardRule'">
    请输入车牌号：
    <input type="text" id="carnumber" class="easyui-textbox" data-options="required:true,validType:'carNo'">
    <a href="javascript:void(0)" id="search" data-options="disabled:true" class="easyui-linkbutton c4" >查询</a>
    <%--显示车辆信息--%>
    <table id="carInfoTable"></table>
    <%--显示租车单信息--%>
    <table id="rentInfoTable"></table>
    <%--检查车辆，生成检查单--%>
    <div class="easyui-panel" style="display: none" title="检查单录入:" id="checkDiv" data-options="border:false">
        <br>
        <br>
        <form action="checkInfoAdd" id="fm" method="post">
            <%--默认隐藏，rentid为datagrid回显数据--%>
            <input type="hidden" id="rentid" name="rentid" value="">
            <%--默认隐藏，carbacknumber为datagrid回显数据--%>
            <input type="hidden" id="carbacknumber" name="carnumber" value="">
            问题: <input type="text" id="problem" name="problem" class="easyui-textbox">
            赔付金额: <input type="text" id="paymoney" name="paymoney" class="easyui-numberbox">
            描述: <input type="text" id="checkdesc" name="checkdesc" class="easyui-textbox">
            <a href="javascript:void(0)" id="back" class="easyui-linkbutton c5" >确认归还</a>
        </form>
    </div>
</body>
</html>
