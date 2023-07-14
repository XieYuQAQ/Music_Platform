<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String path = request.getContextPath();
// 获得本项目的地址(例如: http://localhost:8080/MyApp/)赋值给basePath变量
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
// 将 "项目路径basePath" 放入pageContext中，待以后用EL表达式读出。
  pageContext.setAttribute("basePath",basePath);
%>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="./assets/css/style.css" rel="stylesheet">
<link href="./assets/css/loading.css" rel="stylesheet">
<!-- 引入Bootstrap -->
<link href="./assets/css/bootstrap.min.css" rel="stylesheet">
<!-- 引入依赖jquery 和 Bootstrap js -->
<script src="./assets/js/jquery.min.js"></script>
<script src="./assets/js/bootstrap.min.js"></script>
<script src="./assets/js/bootstrap-paginator.min.js"></script>
<script src="./assets/js/scripts.js"></script>
