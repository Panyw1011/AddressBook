<%--
  Created by IntelliJ IDEA.
  User: pan15
  Date: 011 10-11
  Time: 下午 6:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除所选项</title>
</head>
<body>
    <jsp:useBean id="conn" class="com.jdbc.Conn"></jsp:useBean>
    <%
        String str = request.getParameter("str");
        String ids[] = str.split(",");
        String sql = "delete from addressBook where friendId='"+ids[0]+"'";
        for (int i=1;i<ids.length;i++){
            sql += " or friendId='"+ids[i]+"'";
        }
//        System.out.println(sql);
        conn.executeUpdate(sql);
        response.sendRedirect("index.jsp");
    %>
</body>
</html>
