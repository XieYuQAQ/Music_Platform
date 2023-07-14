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
<link rel="stylesheet" href="assets/css/style.css">
<!-- meta-->
<base href="<%=basePath%>">
    <title>编辑用户</title>
</head>
<body>
<article class="cl pd-20">
    <form method="post" class="form form-horizontal" id="form-admin-role-edit">
        <input type="hidden" id="edit-id">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>用户名：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="name" name="name" datatype="*4-16" nullmsg="用户名不能为空">
                <p>此用户名将作为用户登录时所用的名称,请不要与系统中现有的用户名重复。</p>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>用户头像：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <a class="btn open">上传头像</a>
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

<div id="upload_D">
    <div class="upload_frame">
        <div class="upload_title">
            <span class="upload_title_left">请选择图片</span>
            <span class="upload_title_right"><img src="assets/images/x.jpg"></span>
        </div>
        <div class="upload_fileBtn">
            图片上传
            <input type="file" id="file"/>
            <label for="file">选择图片</label>
        </div>
        <div class="upload_content">
            <div id="clipArea"></div>
            <div class="upload_content_right">
                <p class="upload_view"></p>
                <button id="clipBtn">保存修改</button>
                <label for="file">重新选图片</label>
            </div>
        </div>
    </div>
</div>
<!--footer-->
<jsp:include page="static/footer.jsp"/>
<!--footer-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="assets/admin/lib/jquery.validation/1.14.0/jquery.validate.js"></script>
<script type="text/javascript" src="assets/admin/lib/jquery.validation/1.14.0/validate-methods.js"></script>
<script type="text/javascript" src="assets/admin/lib/jquery.validation/1.14.0/messages_zh.js"></script>
<script type="text/javascript">
    $(function (){
        var rid =window.location.search;
        $.ajax({
            url:'admin/users/edit.do'+ rid,
            type:'post',
            dataType:'json',
            success:function(data){
                $("#edit-id").val(data.uid);
                $("#name").val(data.name);
                $("#name").val(data.name);
                $("#screenname").val(data.screenname);
                $("#mail").val(data.mail);

                $("#group").val(data.group);
            }
        })

    });
    $(function (){
        $("#check").click(function (){
                //收集参数
                var uid=$.trim($("#edit-id").val());
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
                    url:'admin/users/useedit.do',
                    data:{
                        uid:uid,
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
<script src="./assets/js/iscroll-zoom.js"></script>
<script src="./assets/js/hammer.js"></script>
<script src="./assets/js/lrz.all.bundle.js"></script>
<script src="./assets/js/jquery.photoClip.min.js"></script>
<!-- 引入Bootstrap结束 -->
<script>
    $(function(){
        var rid =window.location.search;
        //document.addEventListener('touchmove', function (e) { e.preventDefault(); }, false);
        var clipArea = new bjj.PhotoClip("#clipArea", {
            size: [300, 300],// 截取框的宽和高组成的数组。默认值为[260,260]
            outputSize: [300, 300], // 输出图像的宽和高组成的数组。默认值为[0,0]，表示输出图像原始大小
            outputType: "jpg", // 指定输出图片的类型，可选 "jpg" 和 "png" 两种种类型，默认为 "jpg"
            file: "#file", // 上传图片的<input type="file">控件的选择器或者DOM对象
            view: ".upload_view", // 显示截取后图像的容器的选择器或者DOM对象
            ok: "#clipBtn", // 确认截图按钮的选择器或者DOM对象
            loadStart: function() {
                // 开始加载的回调函数。this指向 fileReader 对象，并将正在加载的 file 对象作为参数传入
                $('.cover-wrap').fadeIn();
                console.log("照片读取中");
            },
            loadComplete: function() {
                // 加载完成的回调函数。this指向图片对象，并将图片地址作为参数传入
                console.log("照片读取完成");
            },
            //loadError: function(event) {}, // 加载失败的回调函数。this指向 fileReader 对象，并将错误事件的 event 对象作为参数传入
            clipFinish: function(dataURL) {
                $.ajax({
                    url:'account/settings/image.do'+ rid,
                    data: {
                        base64:dataURL
                    },
                    type:'post',
                    dataType:'json',
                    success:function (data){
                        if(data.code=="1"){
                            $("#upload_D").fadeOut();
                        }
                    }
                })
            }
        });

        $(".upload_title_right").click(function(){
            $("#upload_D").fadeOut();
        });

        $(".open").click(function(){
            $("#upload_D").fadeIn();
        });
    })

</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>