<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
// 获得本项目的地址(例如: http://localhost:8080/MyApp/)赋值给basePath变量
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
// 将 "项目路径basePath" 放入pageContext中，待以后用EL表达式读出。
    pageContext.setAttribute("basePath",basePath);
%>
<base href="<%=basePath%>">
<link rel="stylesheet" href="assets/css/all.min.css">
<html lang="zh-cn">
<head>
    <jsp:include page="head.jsp"/>
    <!-- 引入Bootstrap结束 -->
    <title>Music Platform</title>
</head>
<body>
<div class="nav-bar">
    <div class="nav-bar-content">
        <div id="logo" name="logo">
            <h1>Music</h1>
        </div>
        <div>
            <a class="nav-bar-tip">浏览</a>
        </div>
    </div>
    <a class="btn btn-default navBar-group" onclick ="pageNews()">主页</a>
    <a class="btn btn-default navBar-group" onclick ="pageSearch()">搜索</a>
    <a class="btn btn-default navBar-group" onclick ="pageLabel()">标签</a>
    <div class="nav-bar-content">
        <div>
            <a class="nav-bar-tip">我的</a>
        </div>
    </div>
    <a class="btn btn-default navBar-group" onclick ="pageLibrary()">我的收藏</a>
</div>
<div class="main-view list-view::-webkit-scrollbar">
    <!-- 主要内容开始 -->
    <iframe id="main-view-page" src='news' frameborder="no" marginwidth="0" marginheight="0" allowtransparency="yes" style='width: 100%;height: 88.5%;' ></iframe>
    <!-- 主要内容结束 -->
    <%--音乐播放器--%>

        <div class="music-container" id="music-container">
            <audio src="" id="audio"></audio>
            <div class="navigation">
                <img class="img-container img" src="assets/images/album/noMusic.jpg" alt="music-cover" id="cover">
                <button id="prev" class="action-btn">
                    <i class="fas fa-backward"></i>
                </button>
                <button id="play" class="action-btn action-btn-big">
                    <i class="fas fa-play"></i>
                </button>
                <button id="next" class="action-btn">
                    <i class="fas fa-forward"></i>
                </button>
                <div class="music-info">
                    <div class="progress-container" id="progress-container">
                        <div class="progress-play" id="progress"></div>
                    </div>
                </div>
            </div>
        </div>

</div>
</body>
<script>
    var songs = [ ];
    function pageNews(){
        document.getElementById('main-view-page').src="./news";
    }
    function pageSearch(){
        document.getElementById('main-view-page').src="./search";
    }
    function pageLabel(){
        document.getElementById('main-view-page').src="./label";
    }
    function pageLibrary(){
        document.getElementById('main-view-page').src="./library";
    }
</script>
<script src="./assets/js/song.js"></script>
<script>
    window.addEventListener('message',function(event){
        songs=[];
        songs=songs.concat(event.data);
        nextSong()
    })
</script>
</html>
