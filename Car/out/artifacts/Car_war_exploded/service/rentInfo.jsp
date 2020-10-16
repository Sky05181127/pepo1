<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/11/25 0025
  Time: 下午 15:45
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
    <title>出租单详情页面</title>
    <%--引入jQuery--%>
    <script type="text/javascript" src="js/jquery.min.js"></script>
    <%--声明js代码域--%>
    <script type="text/javascript">
        $(function () {
            $.get("rentInfo",{rentid:'${param.rentid}'},function (data) {
                //遍历行
                var trs=$("#ta tr");
                for(var i=0;i<trs.length;i++){
                    $(trs[i]).append("<td>"+data[i]+"</td>");
                }
            })
        })
    </script>
</head>
<body>
<span style="font-size: 30px;color:red;">租车成功！以下为生成的出租单信息</span>
<hr>
<table id="ta" cellpadding="10px"  style='border: 1px solid red'>
    <tr>
        <td style="font-weight: bold;font-size: 20px;">出租单编号:</td>
    </tr>
    <tr>
        <td style="font-weight: bold;font-size: 20px;">出租价格:</td>
    </tr>
    <tr>
        <td style="font-weight: bold;font-size: 20px;">开始时间:</td>
    </tr>
    <tr>
        <td style="font-weight: bold;font-size: 20px;">结束时间:</td>
    </tr>
    <tr>
        <td style="font-weight: bold;font-size: 20px;" >出租状态:</td>
    </tr>
    <tr>
        <td style="font-weight: bold;font-size: 20px;">身份证号:</td>
    </tr>
    <tr>
        <td style="font-weight: bold;font-size: 20px;">操作人:</td>
    </tr>
</table>
</body>
</html>