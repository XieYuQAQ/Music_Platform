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
            <div id="login-btn-div" class="col-md-1 column pull-right">
            </div>
          </div>
          <hr class="bold" color="#000000" />
          <div id="album-info" class="row clearfix">
          <%--显示专辑信息--%>
            <div class="col-md-12 column">
              <div class="col-md-4 column">
                  <input type="hidden" id="Alid">
                  <input type="hidden" id="Uid" value="${sessionScope.userSession.uid}">
                <img src="assets/images/album/noMusic.jpg" class="album-info-i box" id="album-image">
              </div>
              <div class="col-md-8 column col-center-block">
                <div class="col-md-12 column">
                  <h1 id="title"></h1>
                </div>
                <div class="col-md-12 column album-info-artist">
                  <h3 id="artist"></h3>
                </div>
                <div class="col-md-6">
                  <p><a id="label">类别</a> · <a id="created">时间</a></p>
                  <button id="play" class="play-btn">
                    <span>&nbsp播&nbsp&nbsp放&nbsp</span>
                  </button>
                  <button id="add-btn" class="play-btn">
                    <span>&nbsp收&nbsp&nbsp藏&nbsp</span>
                  </button>
                  <button id="del-btn" class="play-btn">
                    <span>取&nbsp消&nbsp收&nbsp藏</span>
                  </button>
                </div>
              </div>
            </div>
            <%--歌曲列表--%>
            <div id="albumMusicList" class="col-md-12 album-play-list ">

              <%--此部分用于重复--%>

            </div>

            <div class="col-md-12 column album-footer-div">
              <p class="album-footer-text" id="created-f"></p>
              <p class="album-footer-text" id="album-about"></p>
              <p class="album-footer-text2" id="rc"></p>
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
    getAlbumInfo(),
    getSessionAdd(${sessionScope.userSession.uid}),
  )
</script>
<script>
  $("#play").click(function (){
    var rid =window.location.search;
    $.ajax({
      url:'album/music/list.do'+rid,
      type:'post',
      dataType:'json',
      success:function(data){
        songs=[];
        $.each(data.allList,function (index,obj){
          songs=songs.concat(obj.mid);
        })
        window.parent.postMessage(songs,'/');
      }
    })
  });

  $("#add-btn").click(function (){
    var Alid=$.trim($("#Alid").val());
    var Uid=$.trim($("#Uid").val());
    $.ajax(
            {
              url: './library/add.do',
              data: {
                  alid:Alid,
                  uid:Uid
              },
              type: 'post',
              dataType: 'json',
              success: function (data) {
                if(data.code=="1"){
                  location.reload();
                }
              }
            })
  });
  $("#del-btn").click(function (){
    var Alid=$.trim($("#Alid").val());
    var Uid=$.trim($("#Uid").val());
    $.ajax(
            {
              url: './library/del.do',
              data: {
                alid:Alid,
                uid:Uid
              },
              type: 'post',
              dataType: 'json',
              success: function (data) {
                if(data.code=="1"){
                  location.reload();
                }
              }
            })
  });
</script>
</html>
