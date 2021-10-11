package com.jdbc;

import java.sql.*;

public class Conn {
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    public Conn(){

        try{
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public ResultSet executeQuery(String sql){
        try{
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/addressBook?useUnicode=true&characterEncoding=UTF-8","root","123456");
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            return rs;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public int executeUpdate(String sql){
        try{
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/addressBook?useUnicode=true&characterEncoding=UTF-8","root","123456");
            stmt = conn.createStatement();
            int er = stmt.executeUpdate(sql);
            return er;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public void close(){
        try{
            if (rs!=null) {
                rs.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try{
            if (stmt!=null) {
                stmt.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try{
            if (conn!=null){
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
