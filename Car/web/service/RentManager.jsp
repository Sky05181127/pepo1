<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/25 0025
  Time: 下午 16:53
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
    <%--声明 js代码域--%>
        <script type="text/javascript">
            //初始化datagrid
            $(function () {
                $("#ta").datagrid({
                    idField:'rentid',//设置每行的唯一标识的字段，一般为filed属性中的主键名
                    autoRowHeight:true,
                    fitColumns:true,
                    url:"rentManagerShow",
                    title:'出租单信息',//表格显示标题行
                    pagination:true,//表格底部显示分页插件
                    rownumbers:true,//表格显示行号列
                    singleSelect:false,//设置表格行为单元效果
                    pageSize:2,//设置每页显示的数据量
                    pageList:[2,4,6],//设置分页插件中的每页显示的数据量
                    toolbar:'#bar',//加载工具栏效果
                    columns:[//设置表头列
                        [
                            {field:"ck",checkbox:true},//增加多选框列
                            {field:"rentid",title:"出租单编号"},
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
                            {field:"opername",title:"操作人"}
                        ]
                    ]
                })
            })
            //声明页面加载函数,重置日期的格式
            $(function () {
                //设置结束日期的自定义格式
                $("#returndate").datetimebox({
                    required: false,
                    formatter:myFormatter,
                    parser:myParse,
                    onChange:function (date) {//当结束日期发生变更时校验日期是否合理
                        //获取开始出租的日期
                        var begindate=$("#begindate").datetimebox('getValue');
                        //将字符日期转换为日期对象
                        var bdate=new Date(begindate);
                        var rdate=new Date(date);
                        //比较开始日期和结束日期的大小
                        if(rdate<=bdate){
                            $.messager.alert('提示',"结束日期必须大于开始日期",'info');
                        }

                    }

                })
                //设置开始日期的自定义格式
                $("#begindate").datetimebox({
                    required: false,
                    formatter:myFormatter,
                    parser:myParse,
                    onChange:function (date) {//当开始日期发生变更时校验日期是否合理
                        //获取开始出租的日期
                        var returndate=$("#returndate").datetimebox('getValue');
                        if(returndate){
                            //将字符日期转换为日期对象
                            var bdate=new Date(date);
                            var rdate=new Date(returndate);
                            //比较开始日期和结束日期的大小
                            if(rdate<bdate){
                                $.messager.alert('提示',"结束日期必须大于开始日期",'info');
                            }
                        }
                    }
                })
            })
            //声明formatter日期格式化函数
            var myFormatter= function (date) {
                var year = date.getFullYear();
                var month = date.getMonth()+1;
                var day = date.getDate();
                var hour = date.getHours().toString();
                var minute = date.getMinutes().toString();
                var second = date.getSeconds().toString();
                return year + '-' + month + '-' + day + ' ' + hour + ':' + minute + ':' +second;
            }

            //声明parse日期解析函数
            function myParse(date) {
                //重写formatter 必须 重写parser, 否则无论选择哪天, 日期均为当天日期
                //xxxx-x-x xx:xx:xx
                if (!date) return new Date();
                var array = date.split(" ");// 分成日期和时间两部分
                var arrayDate = array[0].split("-");
                var yearStr = arrayDate[0];
                var monthStr = arrayDate[1];
                var dayStr = arrayDate[2];
                var arrayTime = array[1].split(":");
                var hour = arrayTime[0];
                var minute = arrayTime[1];
                var second = arrayTime[2];
                var year = parseInt(yearStr,10);
                var month = parseInt(monthStr,10);
                var day = parseInt(dayStr,10);
                if (!isNaN(year) && !isNaN(month) && !isNaN(day) && !isNaN(hour) && !isNaN(minute) && !isNaN(second)){
                    return new Date(year,month-1,day,hour,minute,second);
                } else {
                    return new Date();
                }
            }
        </script>
        <script type="text/javascript">
            //给查询按钮增加单击事件
            $(function () {
                $("#search").click(function () {

                    $("#ta").datagrid('load',{
                        identity:$("#identity").textbox('getValue'),
                        carnumber:$("#carnumber").textbox('getValue'),
                        begindate:$("#begindate").datetimebox('getValue'),
                        returndate:$("#returndate").datetimebox('getValue')
                    })
                })
            })

        </script>
</head>
<body>
    <%--创建出租单表格--%>
    <table id="ta"></table>
    <%--创建工具栏--%>
    <div id="bar">
        客户身份证号: <input type="text" id="identity" class="easyui-textbox">
        车牌号: <input type="text" id="carnumber" class="easyui-textbox">
        从: <input id="begindate" id="begindate" name="begindate" class="easyui-datetimebox">
        到: <input id="returndate" id="returndate"  name="returndate" class="easyui-datetimebox">
        <a href="javascript:void(0)" id="search" class="easyui-linkbutton c4" style="width:120px">查询</a>
    </div>
</body>
</html>