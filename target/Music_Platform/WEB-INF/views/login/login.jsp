<%--
  Created by IntelliJ IDEA.
  User: xyl32
  Date: 2023/3/6
  Time: 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
// 获得本项目的地址(例如: http://localhost:8080/MyApp/)赋值给basePath变量
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
// 将 "项目路径basePath" 放入pageContext中，待以后用EL表达式读出。
    pageContext.setAttribute("basePath",basePath);
%>
<html>
<head>
    <title>登录</title>
    <base href="<%=basePath%>">
    <%--导入风格样式表--%>
    <link rel="stylesheet" href="assets/css/other_style.css">
    <script type="text/javascript" src="assets/lib/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript">
        $(function (){
           //给整个浏览器窗口添加键盘按下事件
            $(window).keydown(function(event){
                //如果按下的是回车键，则提交登录请求
                if(event.keyCode==13){
                    $("#loginbtn").click();
                }
           });
           $("#loginbtn").click(function (){
               //收集参数
               var name=$.trim($("#name").val());
               var password=$.trim($("#password").val());
               //对参数进行表单验证
               //判断用户名和密码是否为空
               if(name==""){
                   alert("用户名不能为空");
                   return;
               }
               //判断密码是否为空
               if(password==""){
                   alert("密码不能为空");
                   return;
               }
               $.ajax({
                   url:'login/login_check.do',
                   data:{
                       name:name,
                       password:password
                   },
                   type:'post',
                   dataType:'json',
                   success:function(data){
                       if(data.code=="1"){
                           window.location.href="admin";
                       }else{
                            //提示信息
                           $("#msg").html(data.message);
                       }
                   }
               })
               }
           );
        });
    </script>
</head>
<body class="login_body">
    <div class="login_center">
        <div class="login">
            <h1>登录</h1>
            <form calss="form">
                <p>
                    <label for="name"></label>
                    <input type="text" id="name" name="name" class="login_input_text" placeholder="用户名" autofocus />
                </p>
                <p>
                    <label for="password"></label>
                    <input type="password" id="password" name="password" class="login_input_text" placeholder="密码" />
                </p>
                <span id="msg"></span>
                <p class="submit">
                    <button type="button" id="loginbtn" class="login_button">登录</button>
                </p>
            </form>
            <br>
<%--            <p>--%>
<%--                <a href="./" class="login_link">忘记了账户密码。</a>--%>
<%--            </p>--%>
            <p>
                没有平台账户？
                <a href="register" class="login_link">现在创建一个。</a>
            </p>
        </div>
    </div>
</body>
</html>
