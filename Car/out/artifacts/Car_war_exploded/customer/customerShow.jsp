
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
    <script>
        $(function () {
            $('#tab').datagrid({
                idField:'identity',//设置每行的唯一标识的字段，一般为filed属性中的主键名
                url:"customerShow",
                title:'客户信息',//表格显示标题行
                pagination:true,//表格底部显示分页插件
                rownumbers:true,//表格显示行号列
                singleSelect:true,//设置表格行为单元效果
                pageSize:2,//设置每页显示的数据量
                pageList:[2,4,6],//设置分页插件中的每页显示的数据量
                toolbar:'#bar',//加载工具栏效果
                columns:[//设置表头列
                    [
                        {field:"ck",checkbox:true},//增加多选框列
                        {field:"identity",title:"身份证号",width:200},
                        {field:"custname",title:"用户名",width:100,editor:"text"},
                        {field:"sex",title:"性别",width:100,editor:"text"},
                        {field:"address",title:"地址",width:100,editor:"text"},
                        {field:"phone",title:"手机号",width:150,editor:"text"},
                        {field:"career",title:"职业",width:100,editor:"text"},
                        {field:'option',title:'操作', width:100,
                            formatter: function(value,row,index){
                                if(row.editing){
                                    var del="<a id=del href=javascript:void(0) onclick=del("+"'"+row.identity+"'"+")>删除</a>";
                                    //声明修改按钮
                                    var up="<a href=javascript:void(0) onclick=end("+index+")>保存</a>";
                                    return del+"&nbsp;&nbsp;&nbsp;"+up;
                                }else{
                                    var del="<a id=del href=javascript:void(0) onclick=del("+"'"+row.identity+"'"+")>删除</a>";
                                    //声明修改按钮
                                    var up="<a href=javascript:void(0) onclick=edit("+index+")>修改</a>";
                                    return del+"&nbsp;&nbsp;&nbsp;"+up;
                                }
                            }
                        }
                    ]
                ],
                onBeforeEdit:function (rowIndex, rowData){//启动编辑前监听函数
                    rowData.editing=true;
                    //更新行
                    $('#tab').datagrid('refreshRow',rowIndex);
                },
                onAfterEdit:function (rowIndex, rowData){//启动编辑前监听函数
                    //发起ajax请求完成后台的更新
                    $.get("customerUpdate",rowData,function (data) {
                        if(data){
                            alert("更新成功");
                            rowData.editing=false;
                            //更新行
                            $('#tab').datagrid('refreshRow',rowIndex);
                        }else{
                            alert("更新失败");
                        }
                    })

                }
            })
        })

        //声明函数刷新表格数据
        function refreshDatagrid() {
            $('#tab').datagrid('reload',{
                identity: $("#identity").textbox('getValue'),
                phone: $("#phone").textbox('getValue')
            });
        }
        //声明行数据关闭编辑状态
        function end(index) {
            $("#tab").datagrid('endEdit',index);//退出指定行的可编辑状态，并保存新的数据。
        }
        //声明编辑行函数
        function edit(index) {
            $("#tab").datagrid('beginEdit',index);
        }
        //声明删除函数
        function del(identity) {
            //提示用户是否要删除
            $.messager.confirm('删除', '你确定要删除吗?', function(r){
                if (r){
                    //发起ajax请求，删除当前行数据
                    //发起请求
                    $.get("customerDel",{identity:identity},function (data) {
                        if(data){
                            $.messager.alert('删除','删除成功','info');
                            //刷新datagrid表格数据
                            //加载数据
                            $('#tab').datagrid('load',{
                                identity: $("#identity").textbox('getValue'),
                                phone: $("#phone").textbox('getValue')
                            });
                        }else{
                            $.messager.alert('删除','删除失败','error');
                        }
                    })
                }
            });
        }
        //查询条件功能实现
        $(function () {
            //给查询按钮增加单击事件
            $("#search").click(function () {
                //创建请求数据
                var identity=$("#identity").textbox('getValue');
                var phone=$("#phone").textbox('getValue');
                //加载数据
                $('#tab').datagrid('load',{
                    identity: identity,
                    phone: phone
                });
            })
        })
    </script>
</head>

<body>
    <table id="tab"></table>

    <%--声明工具栏--%>
    <div id="bar">
        查询条件:
        <input class="easyui-textbox" id="identity"  prompt="请输入身份证号" labelPosition="top" style="width:200px;">
        <input class="easyui-textbox" id="phone"  prompt="请输入手机号" labelPosition="top" style="width:200px;">
        <a href="javascript:void(0)"  id="search" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="width:80px">查询</a>
        <a href="javascript:void(0)" id="add" class="easyui-linkbutton" data-options="iconCls:'icon-add'">Add</a>
    </div>
    <%--声明js代码域--%>
    <script type="text/javascript">
        //声明页面加载事件
        $(function () {
            //给增加按钮添加单击事件
            $("#add").click(function () {
                window.parent.showCustomer();
            })
        })
    </script>
</body>
</html>
