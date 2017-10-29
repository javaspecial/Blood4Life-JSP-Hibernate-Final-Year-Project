<%-- 
    Document   : post_status_insert
    Created on : Jul 5, 2017, 8:14:49 AM
    Author     : Shadath Hossain
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.lang.Thread.State"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="java.io.IOException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Untitled page</title>

    </head>
    <body style="background-color: teal;">
        <%

            String name = (String) session.getAttribute("txtFullName");
            String data = request.getParameter("your_data");
            String username = (String) session.getAttribute("memberusername");
            if (data.equals("")) {
                out.println("Write something please");
            } else {
                try {
                    //insert data
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection connection3 = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/blood4life", "root", "root");
                    String inserted = "insert into post_status(name,data,username) values(?,?,?)";
                    PreparedStatement ps = (PreparedStatement) connection3.prepareStatement(inserted);
                    ps.setString(1, name);
                    ps.setString(2, data);
                    ps.setString(3, username);

                    int updated = ps.executeUpdate();

                    if (updated == 0) {
        %>
        <strong style="color:red;">Post Submited Faild !</strong>
        <%                    } else {
        %>
        <strong style="color:green;">Successfully Submitted Your Post</strong>
        <%                 }
                } catch (Exception e) {
                    out.println("Insert error....");
                    e.printStackTrace();
                }

            }
        %>
    </body>
</html>
