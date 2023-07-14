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
    <title>编辑用户</title>
</head>
<body>
<article class="cl pd-20">
    <form method="post" enctype="multipart/form-data" class="form form-horizontal" id="form-admin-role-add">
        <input type="hidden" id="edit-id">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>音乐名：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="name" name="name" datatype="*4-16" nullmsg=标签不能为空">
                <p></p>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>上传音乐：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="file" id="musicFile">
                <p></p>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>所属专辑：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="title" name="所属专辑" datatype="*4-16">
                <p>音乐只能对应一个专辑，如果专辑未创建，请先创建专辑。</p>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>音乐时长：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="min" name="音乐时长" datatype="*4-16">
                <p>请填写音乐的时长，例如3:20。</p>
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
            url:'admin/music/edit.do'+ rid,
            type:'post',
            dataType:'json',
            success:function(data){
                $("#edit-id").val(data.mid);
                $("#name").val(data.name);
                $("#title").val(data.title);
                $("#min").val(data.min)
            }
        })

    });

    $(function (){
        $("#check").click(function (){
                //收集参数
                var fileName=$("#musicFile").val();
                var index= fileName.lastIndexOf(".");
                var check=fileName.substr(index+1);
                if(check!="mp3"){
                    alert("只支持mp3文件");
                    return;
                }
                var mid=$.trim($("#edit-id").val());
                var name=$.trim($("#name").val());
                var title=$.trim($("#title").val());
                var min=$.trim($("#min").val());
                //对参数进行表单验证
                if(name==""){
                    alert("音乐名不能为空");
                    return;
                }
                if(title==""){
                    alert("专辑不能为空");
                    return;
                }
                if(min==""){
                    alert("音乐时长不能为空");
                    return;
                }
                $.ajax({
                    url:'admin/music/useedit.do',
                    data:{
                        mid:mid,
                        name:name,
                        title:title,
                        min:min
                    },
                    type:'post',
                    dataType:'json',
                    success:function(data){
                        if(data.code=="1"){
                            var formData = new FormData();
                            formData.append("music", $("#musicFile")[0].files[0]);
                            $.ajax({
                                url:'admin/music/up.do?mid='+mid,
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