<%--
  Created by IntelliJ IDEA.
  User: xyl32
  Date: 2023/3/8
  Time: 11:51
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

  <title>网站概要</title>
</head>
<body class="big-page">

<!-- header-->
  <jsp:include page="static/header.jsp"/>
<!-- header-->

<section class="Hui-article-box">
  <nav class="breadcrumb"><i class="Hui-iconfont"></i> 控制台
    <span class="c-999 en">&gt;</span>
    <span class="c-666">概要</span>
    <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
  <div class="Hui-article">
    <article class="cl pd-20">
      <p class="f-20 text-success">网站概要
      <p>目前有 <a id="user"> </a> 用户。
      <br>
      平台收录<a id="album"> </a>张专辑（共<a id="music"> </a>首音乐）
      <br>
      并有 <a id="artist"> </a>艺人和<a id="label"> </a>个标签。</p>
    </article>
    <footer class="footer">
      <p>感谢jQuery、layer、laypage、Validform、UEditor、My97DatePicker、iconfont、Datatables、WebUploaded、icheck、highcharts、bootstrap-Switch<br> Copyright &copy;2015 H-ui.admin v3.0 All Rights Reserved.<br> 本后台系统由<a href="http://www.h-ui.net/" target="_blank" title="H-ui前端框架">H-ui前端框架</a>提供前端技术支持</p>
    </footer>
  </div>
</section>

<!--_footer 作为公共模版分离出去-->
<jsp:include page="static/footer.jsp"/>
<!--/_footer /作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript">
  $.ajax({
    url:'admin/about.do',
    type:'post',
    dataType:'json',
    success:function(data){
      $("#user").text(data.allUser);
      $("#album").text(data.allAlbum);
      $("#music").text(data.allMusic);
      $("#artist").text(data.allArtist);
      $("#label").text(data.allLabel);

    }
  })
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>