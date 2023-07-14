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
    <title>昵称修改</title>
    <base href="<%=basePath%>">
    <%--导入风格样式表--%>
    <!-- 引入Bootstrap -->
    <link href="./assets/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/other_style.css">
    <script src="./assets/js/jquery.min.js"></script>
    <script src="./assets/js/bootstrap.min.js"></script>
    <!-- 引入Bootstrap结束 -->
    <script type="text/javascript">
            $("#up").click(function (){
                    //收集参数
                    var edit=$.trim($("#edit").val());
                    var uid=$.trim($("#edit-id").val());
                    //对参数进行表单验证
                    //判断是否为空
                    if(edit==""){
                        $("#msg").html("用户昵称不能为空");
                        return;
                    }
                    $.ajax({
                        url:'account/settings/screenNameEdit.do',
                        data:{
                            uid:uid,
                            screenname:edit
                        },
                        type:'post',
                        dataType:'json',
                        success:function(data){
                            if(data.code=="1"){
                                location.reload();
                                $("#close").click();
                            }else{
                                //提示信息
                                $("#msg").html(data.message);
                            }
                        }
                    })
                }
            );
    </script>
</head>
<body class="login_body">
<div class="login_center">
    <div class="login">
        <h1>修改昵称</h1>
        <form calss="form">
            <input type="hidden" id="edit-id" value="${sessionScope.userSession.uid}">
            <span id="msg"></span>
            <p>
                <br>
                <input type="text" id="edit" name="edit" class="login_input_text" placeholder="用户昵称" autofocus />
            </p>
            <p class="submit">
                <button type="button" id="up" class="login_button btn btn-primary">提交</button>
                <button id="close" type="hidden" data-dismiss="modal" style="display:none;"></button>
            </p>
        </form>
        <br>
        <p>
            不想修改了？<a type="button" data-dismiss="modal">点击此返回。</a>
        </p>
    </div>
</div>
</body>
</html>
