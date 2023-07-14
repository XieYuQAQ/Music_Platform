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
<div id="main" class="container" style="display:none">
  <div class="row clearfix">
    <div class="col-md-12 column">
      <div class="row clearfix">
        <div class="col-md-12 column">
          <div class="row clearfix">
            <div class="col-md-11 column">
              <h1>所有艺人</h1>
            </div>
            <div id="login-btn-div" class="col-md-1 column pull-right">
            </div>
          </div>
          <hr class="bold" color="#000000" />
          <div id="list-album" class="row clearfix">
            <!-- 此处用于重复 -->
          </div>
          <div class="col-md-12 column">
            <div id="Paginator" style="text-align: center">
              <ul id="pageLimit"></ul>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
  $.ajax(
          getSession(${sessionScope.userSession.uid}),
          getAllArtist("",0,18)
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
