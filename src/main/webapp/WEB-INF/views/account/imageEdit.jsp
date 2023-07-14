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
    <title>密码修改</title>
    <base href="<%=basePath%>">
    <%--导入风格样式表--%>
    <!-- 引入Bootstrap -->
    <link href="./assets/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/style.css">

</head>
<body>
<button class="open">修改头像</button>
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
</body>
<script src="./assets/js/scripts.js"></script>
<script src="./assets/js/jquery.min.js"></script>
<script src="./assets/js/iscroll-zoom.js"></script>
<script src="./assets/js/hammer.js"></script>
<script src="./assets/js/lrz.all.bundle.js"></script>
<script src="./assets/js/jquery.photoClip.min.js"></script>
<!-- 引入Bootstrap结束 -->
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
</html>
