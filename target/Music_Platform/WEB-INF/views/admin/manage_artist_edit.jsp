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
    <title>编辑艺人</title>
</head>
<body>
<article class="cl pd-20">
    <form method="post" enctype="multipart/form-data" class="form form-horizontal" id="form-admin-role-edit">
        <input type="hidden" id="edit-id">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="name" name="name" datatype="*4-16" nullmsg="艺人名不能为空">
                <p></p>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>歌手图：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="file" id="artistFImage">
                <p></p>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>歌手首页图：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="file" id="artistImage">
                <p></p>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">生日：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="dob" name="dob">
                <p>例如2000年11月11日，或11月11日。</p>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3">介绍：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="about" name="about">
                <p>请填写关于歌手的介绍。</p>
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
        var rid =window.location.search;
        $.ajax({
            url:'admin/artist/edit.do'+ rid,
            type:'post',
            dataType:'json',
            success:function(data){
                $("#edit-id").val(data.aid);
                $("#name").val(data.name);
                $("#dob").val(data.dob);
                $("#about").val(data.about)
            }
        })

    });
    $(function (){
        $("#check").click(function (){
                //收集参数
                var imageName=$("#artistFImage").val();
                var index= imageName.lastIndexOf(".");
                var check=imageName.substr(index+1);
                if(check!="jpg"){
                    alert("只支持jpg文件");
                    return;
                }
                var artistImageName=$("#artistImage").val();
                var index= imageName.lastIndexOf(".");
                check=imageName.substr(index+1);
                if(check!="jpg"){
                    alert("只支持jpg文件");
                    return;
                }
                var aid=$.trim($("#edit-id").val());
                var name=$.trim($("#name").val());
                var dob=$.trim($("#dob").val());
                var about=$.trim($("#about").val())
                //对参数进行表单验证
                if(name==""){
                    alert("名称不能为空");
                    return;
                }
                if(dob==""){
                    alert("生日不能为空");
                    return;
                }
                if(about==""){
                    alert("介绍不能为空");
                    return;
                }
                $.ajax({
                    url:'admin/artist/useedit.do',
                    data:{
                        aid:aid,
                        name:name,
                        dob:dob,
                        about:about
                    },
                    type:'post',
                    dataType:'json',
                    success:function(data){
                        if(data.code=="1"){
                            var formData = new FormData();
                            formData.append("image", $("#artistFImage")[0].files[0]);
                            $.ajax({
                                url:'admin/artist/imagef.do?aid='+aid,
                                data:formData,
                                processData:false,
                                contentType:false,
                                type:'post',
                                dataType:'json',
                                success:function (data){
                                    if(data.code=="1"){
                                        var formData = new FormData();
                                        formData.append("image", $("#artistImage")[0].files[0]);
                                        $.ajax({
                                            url:'admin/artist/image.do?aid='+aid,
                                            data:formData,
                                            processData:false,
                                            contentType:false,
                                            type:'post',
                                            dataType:'json',
                                            success:function (data){
                                                if(data.code=="1"){
                                                    var index = parent.layer.getFrameIndex(window.name);
                                                    parent.layer.close(index);
                                                }else{
                                                    //提示信息
                                                    $("#msg").html(data.message);
                                                }
                                            }
                                        })
                                    }else{
                                        //提示信息
                                        $("#msg").html(data.message);
                                    }
                                }
                            })
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