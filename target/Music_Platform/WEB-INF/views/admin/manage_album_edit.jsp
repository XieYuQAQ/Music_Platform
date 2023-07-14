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
    <title>编辑专辑</title>
</head>
<body>
<article class="cl pd-20">
    <form method="post" enctype="multipart/form-data" class="form form-horizontal" id="form-admin-role-add">
        <input type="hidden" id="edit-id">
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>专辑名：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="title" name="title">
                <p></p>
            </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>专辑封面：</label>
                <div class="formControls col-xs-8 col-sm-9">
                    <input type="file" id="albumImage">
                    <p></p>
                </div>
        </div>

        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>发行时间：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="created" name="created">
                <p>例如2000年11月11日、11月11日或2000年。</p>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>艺人：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="artists" name="artists">
                <p>请填写专辑相关的艺人。多位艺人请用英文“,”分割，如果所填艺人未创建，则会保留已创建的艺人。</p>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>发行公司：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="rc" name="rc">
                <p>请填写专辑的发行公司。</p>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>介绍：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="text" name="text">
                <p>请填写专辑的介绍。</p>
            </div>
        </div>
        <div class="row cl">
            <label class="form-label col-xs-4 col-sm-3"><span class="c-red">*</span>标签：</label>
            <div class="formControls col-xs-8 col-sm-9">
                <input type="text" class="input-text" value="" placeholder="" id="label" name="label">
                <p>请填写专辑的标签。如果所填标签未创建，则需要创建标签后填写。</p>
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
    //拉取信息
    $(function (){
        var rid =window.location.search;
        $.ajax({
            url:'admin/album/edit.do'+ rid,
            type:'post',
            dataType:'json',
            success:function(data){
                $("#edit-id").val(data.alid);
                $("#title").val(data.title);
                $("#created").val(data.created);
                $("#artists").val(data.artists)
                $("#rc").val(data.rc)
                $("#text").val(data.text)
                $("#label").val(data.label)
            }
        })

    });

    $(function (){
        $("#check").click(function (){
                //收集参数
                var albumImageName=$("#albumImage").val();
                var index= albumImageName.lastIndexOf(".");
                var check=albumImageName.substr(index+1);
                if(check!="jpg"){
                    alert("只支持jpg文件");
                    return;
                }
                //收集参数
                var alid=$.trim($("#edit-id").val());
                var title=$.trim($("#title").val());
                var created=$.trim($("#created").val());
                var artists=$.trim($("#artists").val());
                var rc=$.trim($("#rc").val());
                var text=$.trim($("#text").val());
                var label=$.trim($("#label").val());
                //对参数进行表单验证
                if(title==""){
                    alert("专辑名不能为空");
                    return;
                }
                if(created==""){
                    alert("发行时间不能为空");
                    return;
                }
                if(artists==""){
                    alert("艺人不能为空");
                    return;
                }
                if(rc==""){
                    alert("发行公司不能为空");
                    return;
                }
                if(text==""){
                    alert("介绍不能为空");
                    return;
                }
                if(label==""){
                    alert("标签不能为空");
                    return;
                }

                $.ajax(
                    {
                    url:'admin/album/useedit.do',
                    data:{
                        alid:alid,
                        title:title,
                        created:created,
                        artists:artists,
                        rc:rc,
                        text:text,
                        label,label
                    },
                    type:'post',
                    dataType:'json',
                    success:function(data){
                        if(data.code=="1"){
                            var formData = new FormData();
                            formData.append("image", $("#albumImage")[0].files[0]);
                            $.ajax({
                                url:'admin/album/image.do?alid='+alid,
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