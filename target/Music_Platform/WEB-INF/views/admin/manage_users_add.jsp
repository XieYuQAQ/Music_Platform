<%--
  Created by IntelliJ IDEA.
  User: xyl32
  Date: 2023/3/8
  Time: 16:50
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
<!-- meta-->
<jsp:include page="static/meta.jsp"/>
<!-- meta-->
<base href="<%=basePath%>">
    <title>添加用户</title>
</head>
<body>
<article class="cl pd-20">
    <form method="post" class="form form-horizontal" id="form-admin-role-add">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>用户名：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="name" name="name" datatype="*4-16" nullmsg="用户名不能为空">
                <p>此用户名将作为用户登录时所用的名称,请不要与系统中现有的用户名重复。</p>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">昵称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="screenname" name="screenname">
                <p>昵称可以与用户名不同, 用于前台显示。</p>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">邮箱：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="mail" name="mail">
                <p>电子邮箱地址将作为此用户的主要联系方式,请不要与系统中现有的电子邮箱地址重复。</p>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">密码：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="password" class="input-text" value="" placeholder="" id="password" name="password">
                <p>为此用户分配一个密码,建议使用特殊字符与字母、数字的混编样式,以增加系统安全性。</p>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">用户组：</label>
            <div class="formControls col-xs-8 col-sm-9">
                    <select name="group" id="group">
                        <option value="visitor">
                            游客</option>
<%--                        <option value="creater">--%>
<%--                            创作者</option>--%>
                        <option value="admin">
                            管理员</option>
                    </select>
                    <p class="description">
                        不同的用户组拥有不同的权限。</p>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"></label>
            <div class="formControls col-xs-8 col-sm-9">
                <p id="msg" ></p>
            </div>
        </div>
        <div class="row cl">
            <div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-3">
                <button type="button" class="btn btn-success radius" id="check" name="check"><i class="icon-ok"></i> 确定</button>
            </div>
        </div>
    </form>
</article>

<!--footer-->
<jsp:include page="static/footer.jsp"/>
<!--footer-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="assets/admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="assets/admin/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="assets/admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">
    $(function (){
        $("#check").click(function (){
                //收集参数
                var name=$.trim($("#name").val());
                var password=$.trim($("#password").val());
                var mail=$.trim($("#mail").val());
                var screenname=$.trim($("#screenname").val());
                var group=$.trim($("#group").val());
                //对参数进行表单验证
                if(name==""){
                    alert("用户名不能为空");
                    return;
                }
                if(password==""){
                    alert("密码不能为空");
                    return;
                }
                if(mail==""){
                    alert("邮箱不能为空");
                    return;
                }
                if(mail.match(/^\w+@\w+\.\w+$/i)){

                }else {
                    alert('邮箱格式错误！');
                    return;
                }
                if(screenname==""){
                    alert("昵称不能为空");
                    return;
                }
                $.ajax({
                    url:'admin/users/add.do',
                    data:{
                        name:name,
                        password:password,
                        screenname:screenname,
                        mail:mail,
                        group:group
                    },
                    type:'post',
                    dataType:'json',
                    success:function(data){
                        if(data.code=="1"){
                                var index = parent.layer.getFrameIndex(window.name);
                                parent.layer.close(index);
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
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>