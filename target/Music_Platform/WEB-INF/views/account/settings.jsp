<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String path = request.getContextPath();
// 获得本项目的地址(例如: http://localhost:8080/MyApp/)赋值给basePath变量
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
// 将 "项目路径basePath" 放入pageContext中，待以后用EL表达式读出。
pageContext.setAttribute("basePath",basePath);
%>
    <jsp:include page="static/head.jsp"/>
    <title>管理账户</title>
</head>
<body>
    <div class="container">
        <!-- 账户信息 头-->
        <div class="row clearfix">
            <div class="col-md-1 column">
                <h3>账户</h3>
            </div>
            <div class="col-md-1 column pull-right pull-down">
                <br>
                <a class="btn" href="infoLogout">注销</a>
            </div>
        </div>
        <hr class="bold" color="#000000" />
        <div class="row clearfix">
            <div class="col-md-5 column">
                <h2>欢迎，<a>${sessionScope.userSession.screenname}</a></h2>
            </div>    
        </div>
        <br>
        <div class="row clearfix">
            <div class="col-md-12 column">
                <div class="col-md-12 column">
                    <div class="col-md-3 column">
                        <h3 class="pull-left">账户摘要</h3>
                    </div>
                    <div class="col-md-9 column">
                        <div class="col-md-12 column"><br></div>
                        <div class="col-md-12 column">
                            <div class="col-md-6 column">
                                <h4>账户ID</h4>
                                <p>${sessionScope.userSession.name}</p>
                            </div>
                            <div class="col-md-6 column">
                                <h4>账户邮箱</h4>
                                <p>
                                    ${sessionScope.userSession.mail}
                                </p>
                            </div>
                        </div>
                        <div class="col-md-12 column"><br><br></div>
                        <div class="col-md-12 column">
                            <div class="account-col-md4 col-md-4 column">
                                <h4>账户昵称</h4>
                                <p>
                                    ${sessionScope.userSession.screenname}
                                </p>
                                <a class="btn" data-toggle="modal" href="account/settings/screenNameEdit" data-target="#snEdit" rel="noopener noreferrer">编辑 »</a>
                            </div>
                            <div class="col-md-4 column account-col-md4">
                                <h4>账户头像</h4>
                                <p>上传或修改头像。</p>
                                <a class="btn open">上传 »</a>
                            </div>
                            <div class="col-md-4 column account-col-md4">
                                <h4>账户密码</h4>
                                <p>
                                    修改账户密码，请点击修改。
                                </p>
                                <a class="btn" data-toggle="modal" href="account/settings/passwordEdit" data-target="#psEdit" rel="noopener noreferrer">修改 »</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--  上传头像  --%>
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

    <%--  模态窗口  --%>
    <div class="modal fade" style="" tabindex="-1" role="dialog" id="snEdit">
        <div class="modal-dialog" role="document">
            <div class="modal-content">

            </div>
        </div>
    </div>
    <%--  模态窗口  --%>
    <div class="modal fade" style="" tabindex="-1" role="dialog" id="psEdit">
        <div class="modal-dialog" role="document">
            <div class="modal-content">

            </div>
        </div>
    </div>
</body>
<%--头像上传--%>
<script src="./assets/js/iscroll-zoom.js"></script>
<script src="./assets/js/hammer.js"></script>
<script src="./assets/js/lrz.all.bundle.js"></script>
<script src="./assets/js/jquery.photoClip.min.js"></script>
<script>
    $(function(){
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
                    url:'account/settings/image.do?uid='+${sessionScope.userSession.uid},
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
<%--头像上传--%>
</html>