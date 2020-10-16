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
    <%--引入身份证的校验--%>
    <script type="text/javascript" src="js/card.js"></script>
    <%--声明js代码域--%>
    <script type="text/javascript">
        //页面加载成功后根据车牌号获取车辆信息
        $(function () {
            var carnumber='${param.carnumber}';
            //发起ajax请求获取汽车信息
            $.get("carByCarnumberInfo",{carnumber:carnumber},function (data) {
                //将数据显示到页面中
                $("#carTypeSpan").html(data.cartype);
                $("#colorSpan").html(data.color);
                $("#priceSpan").html(data.price);
                $("#rentPriceSpan").html(data.rentprice);
                $("#depositSpan").html(data.deposit);
                $("#descriptionSpan").html(data.description);
                $("#carImgSpan").html("<img src='"+data.carimg+"' title='汽车图片' width='100px'>");
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
                    if(rdate>bdate){
                        //换算租金
                        var d=(rdate-bdate)/(1000*60*60*24);
                        var money=d*Number($("#rentPriceSpan").html());
                        $("#price").numberbox('setValue',money);
                        //校验身份证信息
                        if(isIDCard($("#identity").textbox('getValue'))){
                            $("#confirmRent").linkbutton('enable')
                        }
                    }else{
                        $("#price").numberbox('setValue',"");
                        $.messager.alert('提示',"结束日期必须大于开始日期",'info');
                        $("#confirmRent").linkbutton('disable')
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
                        if(rdate>bdate){
                            //换算租金
                            var d=(rdate-bdate)/(1000*60*60*24);
                            var money=d*Number($("#rentPriceSpan").html());
                            $("#price").numberbox('setValue',money);
                            //校验身份证信息
                            if(isIDCard($("#identity").textbox('getValue'))){
                                $("#confirmRent").linkbutton('enable')
                            }
                        }else{
                            $("#price").numberbox('setValue',"");
                            $.messager.alert('提示',"结束日期必须大于开始日期",'info');
                            $("#confirmRent").linkbutton('disable')
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
            return year + '/' + month + '/' + day + ' ' + hour + ':' + minute + ':' +second;
        }

        //声明parse日期解析函数
        function myParse(date) {
            //重写formatter 必须 重写parser, 否则无论选择哪天, 日期均为当天日期
            //xxxx-x-x xx:xx:xx
            if (!date) return new Date();
            var array = date.split(" ");// 分成日期和时间两部分
            var arrayDate = array[0].split("/");
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
    <%--自定义验证规则--%>
    <script type="text/javascript">
        $(function () {
            //自定义身份证验证规则
            $.extend($.fn.validatebox.defaults.rules, {
                cardRule: {
                    validator: function(value, param){
                        if(isIDCard(value) && $("#price").textbox('getValue')){
                            //确认按钮可以点击
                            $("#confirmRent").linkbutton('enable');
                            return true;
                        }
                        //确认按钮不可以点击
                        $("#confirmRent").linkbutton('disable');
                        return isIDCard(value);
                    },
                    message: '身份证输格式不正确'
                }
            });
        })
        //给确认出租按钮添加单击事件
        $(function () {
            $("#confirmRent").click(function () {
                //提交表单
                $("#fm").form('submit',{
                    success:function (data) {
                        //跳转当前的出租成功的出租单页面
                        window.parent.goRentInfo(data);
                    }
                })

            })
        })
    </script>
    <%--声明css代码域--%>
    <style type="text/css">
        #ta td{
            border: solid 1px;
            border-radius: 10px;"
        }

    </style>
</head>
<body>
<div class="easyui-panel" title="车辆出租" data-options="fit:true,border:false" style="padding:10px;">
    <span>出租单信息:</span>
    <br><br>
    <form action="rentCarInfo" id="fm" method="post">
        <input type="hidden" name="carnumber" value="${param.carnumber}">
        开始日期: <input id="begindate" name="begindate" class="easyui-datetimebox">
        结束日期: <input id="returndate"  name="returndate" class="easyui-datetimebox">
        租金: <input  id="price" name="price"  class="easyui-numberbox" data-options="readonly:true,precision:2" >
        客户身份证号: <input type="text" id="identity" name="identity" class="easyui-textbox" data-options="required:true,missingMessage:'身份证必填',validType:'cardRule'">
        <a href="javascript:void(0)" id="confirmRent" data-options="disabled:true" class="easyui-linkbutton c4" style="width:120px">确认出租</a>
    </form>
    <hr>
    <span style="font-size: 30px;color: red;font-weight: bold;">出租汽车基本信息:</span>
    <table id="ta" cellpadding="10px;" cellspacing="0px" style="border: solid 1px ;border-radius: 10px;">
        <tr>
            <td>车牌号: <span>${param.carnumber}</span></td>
            <td>车型: <span id="carTypeSpan"></span></td>
            <td>颜色: <span id="colorSpan"></span></td>
            <td>价格: <span id="priceSpan"></span></td>
        </tr>
        <tr>
            <td>出租价格: <span id="rentPriceSpan"></span></td>
            <td>押金: <span id="depositSpan"></span></td>
            <td>描述: <span id="descriptionSpan"></span></td>
            <td><span id="carImgSpan"></span></td>
        </tr>
    </table>
</div>
<style scoped>
    .f1 {
        width: 200px;
    }
</style>
<script type="text/javascript">
    $(function() {
        //给返回添加单击事件
        $("#cancelEdit").click(function () {
            window.parent.goBackShowCar();
        })
    });
</script>
</body>
</html>