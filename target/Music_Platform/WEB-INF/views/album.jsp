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
<div class="container">
  <div class="row clearfix">
    <div class="col-md-12 column">
      <div class="row clearfix">
        <div class="col-md-12 column">
          <div class="row clearfix">
            <div class="col-md-11 column">
              <h1>所有专辑</h1>
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
          getAllAlbum("",0,18)
  )
  function getAllAlbum(name,pageNo,pageSize){
    var name=name;
    var pageNo=pageNo;
    var pageSize=pageSize;
    $.ajax({
      url:'album/list.do',
      data:{
        name:name,
        pageNo:pageNo,
        pageSize:pageSize
      },
      type:'post',
      dataType:'json',
      success:function(data){
        var htmlStr="";
        $.each(data.allList,function (index,obj){
          htmlStr+="<div class=\"col-md-2 column\" onclick=\"window.open('album/info?alid="+obj.alid+"','_self')\">";;
          htmlStr+="    <img src=\"assets/images/album/"+obj.alid+".jpg\" class=\"album-i box\">";
          htmlStr+="    <div class=\"album-text\">";
          htmlStr+="    <div class=\"album-text-title\">"+obj.title+"</div>";
          htmlStr+="    <div class=\"album-text-artist\">"+obj.artists+"</div>";
          htmlStr+="</div></div>";
        })
        $("#list-album").html(htmlStr);
        var totalPages=1;
        if(data.allRows%pageSize==0){
          totalPages=data.allRows/pageSize;
        }else
          totalPages=parseInt(data.allRows/pageSize)+1;
        $('#pageLimit').bootstrapPaginator({
          currentPage: data.pageNo,
          totalPages: totalPages,
          size:"normal",
          bootstrapMajorVersion: 3,
          alignment:"right",
          numberOfPages:5,
          itemTexts: function (type, page, current) {
            switch (type) {
              case "first": return "首页";
              case "prev": return "上一页";
              case "next": return "下一页";
              case "last": return "末页";
              case "page": return page;
            }
          },
          onPageClicked : function(event, originalEvent, type, page) {
            var selectNo=0;
            if(page==1){
              selectNo=0;
            }else{
              selectNo=(page-1)*pageSize;
            }
            getAllAlbum("",selectNo,pageSize)
          }
        })
      }
    })
  }
  ;
</script>
</html>
