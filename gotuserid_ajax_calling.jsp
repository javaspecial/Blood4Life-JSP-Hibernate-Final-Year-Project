<%-- 
    Document   : got_userid_ajaxcalling
    Created on : Apr 7, 2017, 4:16:38 PM
    Author     : Shadath Hossain
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
         try {
                //if username exist
                Class.forName("com.mysql.jdbc.Driver");
                Connection connnection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/blood4life", "root", "root");
                PreparedStatement ps = (PreparedStatement) connnection.prepareStatement("SELECT  * FROM registrationtable WHERE memberusername = ?");
                ps.setString(1, request.getParameter("txtUserName"));
                ResultSet res = ps.executeQuery();
                if (res.next()) {
                    out.print("Correct userid");
                } else {
                    out.print("Hey,this isn't you");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
%>