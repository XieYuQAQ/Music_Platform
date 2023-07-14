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
    <title>添加推荐</title>
</head>
<body>
<article class="cl pd-20">
    <form method="post" enctype="multipart/form-data" class="form form-horizontal" id="form-admin-role-add">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>名称：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="name" name="name" datatype="*4-16" nullmsg=标签不能为空">
                <p></p>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>封面：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="file" id="commendImage">
                <p></p>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>推荐标题：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="title" name="title" datatype="*4-16">
                <p></p>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>推荐副标题：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="subtitle" name="subtitle" datatype="*4-16">
                <p></p>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>推荐相关专辑：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="album" name="album" datatype="*4-16">
                <p></p>
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
                var commendImageName=$("#commendImage").val();
                var index= commendImageName.lastIndexOf(".");
                var check=commendImageName.substr(index+1);
                if(check!="jpg"){
                    alert("只支持jpg文件");
                    return;
                }
                //收集参数
                var name=$.trim($("#name").val());
                var title=$.trim($("#title").val());
                var subtitle=$.trim($("#subtitle").val());
                var album=$.trim($("#album").val());
                //对参数进行表单验证
                if(name==""){
                    alert("名称不能为空");
                    return;
                }
                if(title==""){
                    alert("名称不能为空");
                    return;
                }
                if(subtitle==""){
                    alert("名称不能为空");
                    return;
                }
                if(album==""){
                    alert("名称不能为空");
                    return;
                }
                $.ajax({
                    url:'admin/commend/add.do',
                    data:{
                        name:name,
                        title:title,
                        subtitle:subtitle,
                        album:album
                    },
                    type:'post',
                    dataType:'json',
                    success:function(data){
                        if(data.code=="1"){
                            var formData = new FormData();
                            formData.append("image", $("#commendImage")[0].files[0]);
                            $.ajax({
                                url:'admin/commend/image.do?id='+data.returnData,
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
            }
        );
    });
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>