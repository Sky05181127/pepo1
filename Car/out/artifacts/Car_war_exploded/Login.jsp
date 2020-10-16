<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
    <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/jquery.easyui.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="css/demo.css">
    <script>
      $(function () {
          $('#login').click(function () {
              var loginname = $('#loginname').val()
              var pwd = $('#pwd').val()
              if (loginname==""||pwd==""){
                  $.messager.alert('登录提示','请填写完整的登录名和密码','info');
              }else{
                  $('#fm').submit()
              }
          })
      })
    </script>
  </head>
  <body>
    <form action="userLogin" method="post" id="fm">
      <div style="margin: auto;width:402px;margin-top: 100px; ">
        <div class="easyui-panel" style="width:400px;padding:50px 60px;border-radius: 10px;">
          <div style="margin-bottom:20px;position: relative;bottom: 20px;">
            <marquee direction="right" scrollamount="10" behavior="alternate"><b style="font-size: 15px;">欢迎访问506汽车租赁系统</b></marquee>
          </div>
          <div style="margin-bottom:20px">
            <br>
            <input class="easyui-textbox" id="loginname" name="loginname" prompt="Username" iconWidth="28" style="width:100%;height:34px;padding:10px;">
          </div>
          <div style="margin-bottom:20px">
            <input class="easyui-passwordbox" id="pwd" name="pwd"  prompt="Password" iconWidth="28" style="width:100%;height:34px;padding:10px">
          </div>
          <div style="text-align: center">
            <a  href="javascript:void(0)"  id="login" class="easyui-linkbutton c2" style="width:120px;">login</a>
            <span style="font-weight: bold;color: green">${param.str}</span>
            <%--判断是否需要显示登录失败提示语--%>
            <c:if test="${sessionScope.flag=='false'}">
              <span style="color: red;font-weight: bold;">用户名或密码错误</span>
            </c:if>
            <%--移除session中的登录失败的标记--%>
            <c:remove var="flag" scope="session"></c:remove>
          </div>
        </div>
      </div>
    </form>
  </body>
</html>
