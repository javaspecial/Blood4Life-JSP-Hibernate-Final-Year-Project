<%-- 
    Document   : Sayed_sir_work3
    Created on : Aug 21, 2017, 2:07:24 PM
    Author     : 14cseshadath
--%>

<%@ page language="java" import="java.sql.*" %>
<% response.setContentType("text/html");%>
<%
    String str = request.getParameter("queryString");
    try {
        Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blood4life", "root", "root");

        String sql = "SELECT * FROM registrationtable WHERE txtFullName LIKE '" + str + "%' LIMIT 10";
        Statement stm = con.createStatement();
        stm.executeQuery(sql);
        ResultSet rs = stm.getResultSet();
        while (rs.next()) {
%>
<center>
    <a href="Home.jsp" style="color: wheat;text-decoration: none;" ><%= rs.getString("txtFullName")%></a><br>
</center>
<%
        }
    } catch (Exception e) {
        out.println("Exception is ;" + e);
    }
%>

