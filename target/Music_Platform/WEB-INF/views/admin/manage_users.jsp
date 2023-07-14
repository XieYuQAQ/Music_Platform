<%--
  Created by IntelliJ IDEA.
  User: xyl32
  Date: 2023/3/8
  Time: 13:29
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

<title>管理用户</title>
</head>
<body class="big-page">
<!-- header-->
<jsp:include page="static/header.jsp"/>
<!-- header-->

<section class="Hui-article-box">
  <nav class="breadcrumb"><i class="Hui-iconfont">&#xe681;</i> 系统管理 <span class="c-gray en">&gt;</span> 用户 <span class="c-gray en">&gt;</span> 管理用户 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
  <div class="Hui-article">
    <article class="cl pd-20">
      <div class="cl pd-5 bg-1 bk-gray">
        <span class="l">
          <a href="javascript:;" id="deleteActivityBtn" class="btn btn-danger radius">
			<i type="button" class="Hui-iconfont">&#xe6e2;</i> 批量删除
		  </a>
          <a class="btn btn-primary radius" href="javascript:;" onclick="admin_role_add('添加用户','./admin/users/add','800')">
            <i class="Hui-iconfont">&#xe600;</i> 添加用户
          </a>
        </span>
        <span class="r">共有数据：
          <strong id="usersRows"> </strong> 条
        </span>
      </div>
      <div class="mt-20">
        <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper no-footer">
          <div id="DataTables_Table_0_filter" class="dataTables_filter">
            <div class="dataTables_paginate paging_simple_numbers" id="">
            <label>从当前数据中检索：
              <input type="search" id="name" class="" placeholder="用户名" aria-controls="DataTables_Table_0">
              <a type="button" class="paginate_button previous disabled" aria-controls="DataTables_Table_0" data-dt-idx="0" tabindex="0" id="search">检索</a>
            </label>
            </div>
          </div>
          <table class="table table-border table-bordered table-hover table-bg table-sort dataTable no-footer" id="DataTables_Table_0" role="grid" aria-describedby="DataTables_Table_0_info">
          <thead>
          <tr class="text-c" role="row">
            <th width="25"><input type="checkbox" id="chckAll"></th>
            <th width="80" class="sorting_disabled" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="ID: 升序排列" style="width: 80px;">ID</th>
            <th width="100" class="sorting_disabled" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="用户名: 升序排列" style="width: 100px;">用户名</th>
            <th width="40" class="sorting_disabled" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="昵称: 升序排列" style="width: 40px;">昵称</th>
            <th width="150" class="sorting_disabled" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-sort="descending" aria-label="邮箱: 升序排列" style="width: 150px;">邮箱</th>
            <th width="90" class="sorting_disabled" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" aria-label="权限: 升序排列" style="width: 90px;">权限</th>
            <th width="100" class="sorting_disabled" rowspan="1" colspan="1" aria-label="操作" style="width: 100px;">操作</th>
          </tr>
          </thead>
          <tbody id="tBody">

<%--          <tr class="text-c odd" role="row">--%>
<%--            <td><input type="checkbox" value="1" name=""></td>--%>
<%--            <td>1</td>--%>
<%--            <td><u style="cursor:pointer" class="text-primary" onclick="member_show('张三','member-show.html','10001','360','400')">张三</u></td>--%>
<%--            <td>男</td>--%>
<%--            <td>13000000000</td>--%>
<%--            <td class="sorting_1">admin@mail.com</td>--%>
<%--            <td class="td-manage"><a style="text-decoration:none" onclick="member_stop(this,'10001')" href="javascript:;" title="停用"><i class="Hui-iconfont"></i></a> <a title="编辑" href="javascript:;" onclick="member_edit('编辑','member-add.html','4','','510')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont"></i></a> <a style="text-decoration:none" class="ml-5" onclick="change_password('修改密码','change-password.html','10001','600','270')" href="javascript:;" title="修改密码"><i class="Hui-iconfont"></i></a> <a title="删除" href="javascript:;" onclick="member_del(this,'1')" class="ml-5" style="text-decoration:none"><i class="Hui-iconfont"></i></a></td>--%>
<%--          </tr></tbody>--%>
          </tbody>
        </table>
<%--          <div class="dataTables_paginate paging_simple_numbers" id="DataTables_Table_0_paginate">--%>
<%--            <a class="paginate_button previous disabled" aria-controls="DataTables_Table_0" data-dt-idx="0" tabindex="0" id="DataTables_Table_0_previous">上一页</a>--%>
<%--            <span>--%>
<%--              <a class="paginate_button current" aria-controls="DataTables_Table_0" data-dt-idx="1" tabindex="0">1</a>--%>

<%--            </span>--%>
<%--            <a class="paginate_button next disabled" aria-controls="DataTables_Table_0" data-dt-idx="2" tabindex="0" id="DataTables_Table_0_next">下一页</a>--%>
<%--          </div>--%>
          <div id="usersList"></div>
        </div>
      </div>

    </article>
  </div>
</section>

<!--_footer 作为公共模版分离出去-->
<jsp:include page="static/footer.jsp"/>
<!--/_footer /作为公共模版分离出去-->


<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="assets/admin/lib/My97DatePicker/4.8/WdatePicker.js"></script>
<script type="text/javascript" src="assets/admin/lib/datatables/1.10.15/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="assets/admin/lib/laypage/1.2/laypage.js"></script>
<!--  PAGINATION plugin -->
<link rel="stylesheet" type="text/css" href="assets/jquery/bs_pagination-master/css/jquery.bs_pagination.min.css">
<script type="text/javascript" src="assets/jquery/bs_pagination-master/js/jquery.bs_pagination.min.js"></script>
<script type="text/javascript" src="assets/jquery/bs_pagination-master/localization/en.js"></script>
<script type="text/javascript">
  //收集列表参数
  $(function (){
    selectUserList(1);
  });

  //检索按钮
  $("#search").click(function (){
    selectUserList(1);
  });

  /*管理员-角色-添加*/
  function admin_role_add(title,url,w,h){
    layer_show(title,url,w,h);
    selectUserList(1);
  }
  /*管理员-角色-编辑*/
  function admin_role_edit(title,url,id,w,h){
    layer_show(title,url,w,h);
    selectUserList(1);
  }

  //全选

  $("#chckAll").click(function () {
    //如果"全选"按钮是选中状态，则列表中所有checkbox都选中
    /*if(this.checked==true){
        $("#tBody input[type='checkbox']").prop("checked",true);
    }else{
        $("#tBody input[type='checkbox']").prop("checked",false);
    }*/

    $("#tBody input[type='checkbox']").prop("checked",this.checked);
  });

  /*$("#tBody input[type='checkbox']").click(function () {
      //如果列表中的所有checkbox都选中，则"全选"按钮也选中
      if($("#tBody input[type='checkbox']").size()==$("#tBody input[type='checkbox']:checked").size()){
          $("#chckAll").prop("checked",true);
      }else{//如果列表中的所有checkbox至少有一个没选中，则"全选"按钮也取消
          $("#chckAll").prop("checked",false);
      }
  });*/
  $("#tBody").on("click","input[type='checkbox']",function () {
    //如果列表中的所有checkbox都选中，则"全选"按钮也选中
    if($("#tBody input[type='checkbox']").size()==$("#tBody input[type='checkbox']:checked").size()){
      $("#chckAll").prop("checked",true);
    }else{//如果列表中的所有checkbox至少有一个没选中，则"全选"按钮也取消
      $("#chckAll").prop("checked",false);
    }
  });

  //删除用户
  $("#deleteActivityBtn").click(function () {
    //收集参数
    //获取列表中所有被选中的checkbox
    var chekkedIds=$("#tBody input[type='checkbox']:checked");
    if(chekkedIds.size()==0){
      alert("请选择要删除的用户");
      return;
    }
    if(window.confirm("确定删除吗？")){
      var id="";
      $.each(chekkedIds,function () {//id=xxxx&id=xxx&.....&id=xxx&
        id+="id="+$(this).attr("ID")+"&";
      });
      //this.value只能获取checkbox的开关状态，不能获取到对应属性的id
      id=id.substr(0,id.length-1);//id=xxxx&id=xxx&.....&id=xxx
      //发送请求
      $.ajax({
        url:'./admin/users/del.do',
        data:id,
        type:'post',
        dataType:'json',
        success:function (data) {
          if(data.code=="1"){
            //刷新列表
            selectUserList(1);
          }else{
            //提示信息
            alert(data.message);
          }
        }
      });
    }
  });

  function selectUserList(pageNo){
    var name=$("#name").val();
    var pageSize=10;
    //发送请求
    $.ajax({
      url:'admin/users/list.do',
      data:{
        name:name,
        pageNo:pageNo,
        pageSize:pageSize
      },
      type:'post',
      dataType:'json',
      success:function(data){
        //显示总条数
        $("#usersRows").text(data.usersRows);
        //显示市场活动的列表
        var htmlStr="";
        $.each(data.usersList,function (index,obj){
          htmlStr+="<tr class=\"text-c odd\" role=\"row\">";
          htmlStr+="<td><input type=\"checkbox\" id=\""+obj.uid+"\" name=\""+obj.uid+"\"></td>";
          htmlStr+="<td>"+obj.uid+"</td>";
          htmlStr+="<td>"+obj.name+"</td>";
          htmlStr+="<td>"+obj.screenname+"</td>";
          htmlStr+="<td>"+obj.mail+"</td>";
          htmlStr+="<td class=\"sorting_1\">"+obj.group+"</td>";
          htmlStr+="<td class=\"td-manage\"> <a title=\"编辑\" href=\"javascript:;\" onclick=\"admin_role_edit('编辑','./admin/users/edit?uid="+obj.uid+"','4','','510')\" class=\"ml-5\" style=\"text-decoration:none\"><i class=\"Hui-iconfont\"></i></a></td>";
          htmlStr+="</tr>";
        });
        $("#tBody").html(htmlStr);

        //计算总页数
        var totalPages=1;
        if(data.usersRows%pageSize==0){
          totalPages=data.usersRows/pageSize;
        }else
          totalPages=parseInt(data.usersRows/pageSize)+1;

        //嗲用bs_pagination工具函数
        $("#usersList").bs_pagination({
          currentPage:pageNo,//当前页号,相当于pageNo

          rowsPerPage:pageSize,//每页显示条数,相当于pageSize
          totalRows:data.usersRows,//总条数
          totalPages: totalPages,  //总页数,必填参数.

          visiblePageLinks:5,//最多可以显示的卡片数

          showGoToPage:false,//是否显示"跳转到"部分,默认true--显示
          showRowsPerPage:false,//是否显示"每页显示条数"部分。默认true--显示
          showRowsInfo:false,//是否显示记录的信息，默认true--显示

          //用户每次切换页号，都自动触发本函数;
          //每次返回切换页号之后的pageNo和pageSize
          onChangePage: function(event,pageObj) { // returns page_num and rows_per_page after a link has clicked
            //js代码
            // alert(pageObj.currentPage);
            // alert(pageObj.rowsPerPage);
            selectUserList(pageObj.currentPage);
          }
        });
      }
    })}
</script>
<!--/请在上方写此页面业务相关的脚本-->
</body>
</html>