<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String path = request.getContextPath();
// 获得本项目的地址(例如: http://localhost:8080/MyApp/)赋值给basePath变量
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
// 将 "项目路径basePath" 放入pageContext中，待以后用EL表达式读出。
  pageContext.setAttribute("basePath",basePath);
%>
<base href="<%=basePath%>">
<head>
  <jsp:include page="head.jsp"/>
  <!-- 引入Bootstrap结束 -->
</head>
<div class="loadingTwo">
  <span></span>
</div>
<body id="main">
<div class="jumbotron home" id="artist-image" style="">
  <div class="container">
    <div class="row artist-info-top">
      <div class="col-md-4 copy">
        <h1 id="name"></h1>
      </div>
    </div>
  </div>

</div>
<div class="container">
  <div class="row clearfix">
    <div class="col-md-12 column">

      <!-- 新增专辑 -->
      <div class="row clearfix artist-album">
        <div class="col-md-12 column">
          <div class="row clearfix">
            <div class="col-md-12 column">
              <div class="row clearfix">
                <div class="col-md-4 column"><h3>专辑</h3></div>

              </div>
            </div>
          </div>
          <div id="list-album" class="row clearfix">
            <!-- 此处用于重复 -->
          </div>
        </div>
      </div>

    </div>
  </div>
</div>


<div class="jumbotron">
  <div class="container">
    <div class="row">
      <div class="col-md-6 copy artist-footer-text">
        <p class="col-md-2 pull-left">关于</p>
        <p class="col-md-8 " id="about"></p>
      </div>
      <div class="col-md-6 copy artist-footer-text">
        <p class="col-md-3 pull-right" id="dob"></p>
        <p class="col-md-2 pull-right">生日</p>
      </div>
    </div>
  </div>
</div>
</body>
<script type="text/javascript">
  $.ajax(
          getSession(${sessionScope.userSession.uid}),
          getArtistAlbum(),
          getArtistInfo()
  )
  document.onreadystatechange = function() 　　//当页面加载状态改变的时候执行function
  {
    if(document.readyState == "complete")
    { 　　//当页面加载状态为完全结束时进入
      $(".loadingTwo").hide();
      var temp=document.querySelector('#main');
      temp.style="display:";
    }
  }
</script>
</html>
