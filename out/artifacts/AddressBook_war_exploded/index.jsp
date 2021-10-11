<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: pan15
  Date: 011 10-11
  Time: 下午 5:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>通讯录首页</title>
    <script>
      function add() {
          window.location = "addFriend.jsp";
      }
      function deleteSelected() {
          var ids = document.getElementsByName("cbx");
          var str = "";
          for (var i=0;i<ids.length;i++){
              if (ids[i].checked){
                  str += ids[i].value+",";
              }
          }
//          alert(str);
          window.location = "deleteSelected.jsp?str="+str;
      }
      function changeAdd() {
          window.location = "index.jsp?Add="+document.getElementById("sl").value;
      }
      function selects() {
          var selectName = document.getElementById("selectName").value;
          var str = "";
          if (selectName !== "") {
              str += "?selectName=" + selectName;
          }
          window.location = "index.jsp"+str;
      }
    </script>
    <style>
      td{
        text-align: center;
      }
      .top{
        width: 896px;
        margin: auto;
        border: solid 2px;
        text-align: center;
        margin-top: 50px;
        padding: 10px 0 10px 0;
      }
      .line1{
        background-color: aquamarine;
      }
    </style>
  </head>
  <body>
  <jsp:useBean id="conn" class="com.jdbc.Conn"></jsp:useBean>
  <%
    request.setCharacterEncoding("utf-8");
    String sql = "select * from addressBook";
    if (request.getParameter("selectName")!=null){
        sql += " where friendName='"+request.getParameter("selectName")+"'";
    }
    if (request.getParameter("Add")!=null){
        if ("所有地区".equals(request.getParameter("Add"))){

        }else {
            sql += " where friendAdd='"+request.getParameter("Add")+"'";
        }
    }
    ResultSet rs = conn.executeQuery(sql);

    if ("delete".equals(request.getParameter("action"))){
        String fId = request.getParameter("fId");
        sql = "delete from addressBook where friendId='"+fId+"'";
        conn.executeUpdate(sql);
        response.sendRedirect("index.jsp");
    }

    if ("modify".equals(request.getParameter("action"))){
      String modifyId = request.getParameter("modifyId");
      String modifyName = request.getParameter("modifyName");
      String modifySex = request.getParameter("modifySex");
      if ("male".equals(modifySex)){
        modifySex = "男";
      }else {
        modifySex = "女";
      }
      String modifyAdd = request.getParameter("modifyAdd");
      String modifyTel = request.getParameter("modifyTel");
      String modifyMail = request.getParameter("modifyMail");
      sql = "update addressBook set friendName='"+modifyName+"', friendSex='"+modifySex+"', friendAdd='"+modifyAdd+"', friendTel='"+modifyTel+"', friendMail='"+modifyMail+"' where friendId='"+modifyId+"'";
      conn.executeUpdate(sql);
      response.sendRedirect("index.jsp");
    }
  %>
  <div class="top">
    姓名
    <input type="text" id="selectName" value="" style="width: 100px">
    &nbsp;&nbsp;&nbsp;&nbsp;
    <input type="submit" value="查询" onclick="selects()">
    &nbsp;&nbsp;&nbsp;&nbsp;
    所在地区
    <select id="sl" name="address" onchange="changeAdd()">
      <option>------------</option>
      <option value="所有地区">所有地区</option>
      <%
        String sql2 = "select distinct friendAdd from addressBook";
        ResultSet rs2 = conn.executeQuery(sql2);
        while (rs2.next()){
      %>
        <option value="<%=rs2.getString(1)%>"><%=rs2.getString(1)%></option>
      <%
        }
      %>
    </select>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <input type="button" value="添加通讯人" onclick="add()">
    &nbsp;&nbsp;&nbsp;&nbsp;
    <input type="button" value="删除所选项" onclick="deleteSelected()">
  </div>
  <table cellpadding="10px" cellspacing="0" border="1px" align="center" width="900px">
    <tr>
      <th colspan="9">通讯录</th>
    </tr>
    <tr class="line1">
      <td>选择</td>
      <td>序号</td>
      <td>ID</td>
      <td>姓名</td>
      <td>性别</td>
      <td>地址</td>
      <td>电话</td>
      <td>邮箱</td>
      <td>操作</td>
    </tr>
    <%
      int number = 1;
      while (rs.next()){
        String fId = rs.getString(1);
        String fName = rs.getString(2);
        String fSex = rs.getString(3);
        String fAdd = rs.getString(4);
        String fTel = rs.getString(5);
        String fMail = rs.getString(6);
    %>
    <tr>
      <td><input type="checkbox" id="id" value="<%=fId%>" name="cbx"></td>
      <td><%=number++%></td>
      <td><%=fId%></td>
      <td><%=fName%></td>
      <td><%=fSex%></td>
      <td><%=fAdd%></td>
      <td><%=fTel%></td>
      <td><%=fMail%></td>
      <td>
        <a href="modifyFriend.jsp?action=modify&fId=<%=fId%>">编辑</a>
        /
        <a href="index.jsp?action=delete&fId=<%=fId%>">删除</a>
      </td>
    </tr>
    <%

      }
    %>
  </table>
  </body>
</html>
