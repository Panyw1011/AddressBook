<%--
  Created by IntelliJ IDEA.
  User: pan15
  Date: 011 10-11
  Time: 下午 5:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加通讯人</title>
</head>
<body>
    <jsp:useBean id="conn" class="com.jdbc.Conn"></jsp:useBean>
    <%
        request.setCharacterEncoding("utf-8");
        if ("add".equals(request.getParameter("action"))){
            String addId = request.getParameter("addId");
            String addName = request.getParameter("addName");
            String addSex = request.getParameter("addSex");
            if ("male".equals(addSex)){
                addSex = "男";
            }else {
                addSex = "女";
            }
            String addAdd = request.getParameter("addAdd");
            String addTel = request.getParameter("addTel");
            String addMail = request.getParameter("addMail");
            String sql = "insert into addressBook values('"+addId+"','"+addName+"','"+addSex+"','"+addAdd+"','"+addTel+"','"+addMail+"')";
            conn.executeUpdate(sql);
            response.sendRedirect("index.jsp");
        }
    %>
    <form method="post" name="addForm" action="addFriend.jsp?action=add">
        <table cellpadding="10px" cellspacing="0" border="1px" align="center" width="800px">
            <tr>
                <th colspan="2">添加通讯人</th>
            </tr>
            <tr>
                <td>ID</td>
                <td><input type="text" name="addId"></td>
            </tr>
            <tr>
                <td>姓名</td>
                <td><input type="text" name="addName"></td>
            </tr>
            <tr>
                <td>性别</td>
                <td>
                    <input type="radio" name="addSex" value="male">男
                    <input type="radio" name="addSex" value="female">女
                </td>
            </tr>
            <tr>
                <td>地址</td>
                <td><input type="text" name="addAdd"></td>
            </tr>
            <tr>
                <td>电话</td>
                <td><input type="text" name="addTel"></td>
            </tr>
            <tr>
                <td>邮箱</td>
                <td><input type="text" name="addMail"></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="添加">
                    <input type="reset" value="重置">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
