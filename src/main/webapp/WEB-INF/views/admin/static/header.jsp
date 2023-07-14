<%--
  Created by IntelliJ IDEA.
  User: xyl32
  Date: 2023/3/8
  Time: 11:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header class="navbar-wrapper">
  <div class="navbar navbar-fixed-top">
    <nav class="nav navbar-nav">
      <ul class="cl">
        <li class="dropDown dropDown_hover"><a href="javascript:;" class="dropDown_A"><i class="Hui-iconfont"></i> 控制台 <i class="Hui-iconfont">&#xe6d5;</i></a>
          <ul class="dropDown-menu menu radius box-shadow">
            <li><a href="admin/">概要</a></li>
          </ul>
        </li>
        <li class="dropDown dropDown_hover"><a href="javascript:;" class="dropDown_A"><i class="Hui-iconfont">&#xe681;</i> 内容管理 <i class="Hui-iconfont">&#xe6d5;</i></a>
          <ul class="dropDown-menu menu radius box-shadow">
            <li><a href="admin/artist"> 艺人</a></li>
            <li><a href="admin/album"> 专辑</a></li>
            <li><a href="admin/music"> 音乐</a></li>
            <li><a href="admin/label"> 标签</a></li>
          </ul>
        </li>
        <li class="dropDown dropDown_hover"><a href="javascript:;" class="dropDown_A"><i class="Hui-iconfont">&#xe681;</i> 内容推荐 <i class="Hui-iconfont">&#xe6d5;</i></a>
          <ul class="dropDown-menu menu radius box-shadow">
            <li><a href="admin/commend"> 推荐</a></li>
          </ul>
        </li>
        <li class="dropDown dropDown_hover"><a href="javascript:;" class="dropDown_A"><i class="Hui-iconfont">&#xe681;</i> 系统管理 <i class="Hui-iconfont">&#xe6d5;</i></a>
          <ul class="dropDown-menu menu radius box-shadow">
            <li><a href="admin/users"> 用户</a></li>
          </ul>
        </li>
      </ul>
    </nav>
    <nav id="Hui-userbar" class="nav navbar-nav navbar-userbar hidden-xs">
      <ul class="cl">
        <li class="dropDown dropDown_hover"> <a href="#" class="dropDown_A">${sessionScope.userSession.screenname} <i class="Hui-iconfont">&#xe6d5;</i></a>
          <ul class="dropDown-menu menu radius box-shadow">
            <li><a href="account/settings">个人信息</a></li>
            <li><a href="logout">退出</a></li>
          </ul>
        </li>
        <li id="Hui-msg"> <a href="" title="消息">返回平台</a> </li>
      </ul>
    </nav>
  </div>
  </div>
</header>