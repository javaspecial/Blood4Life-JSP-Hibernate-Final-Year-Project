<%-- 
    Document   : blog_comment_insert
    Created on : Jul 6, 2017, 7:52:06 AM
    Author     : Shadath Hossain
--%>

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

        <link rel="stylesheet" href="css/iziToast.min.css">
        <script src="js/iziToast.min.js"></script>
    </head>
    <body style="background-color: teal;">
        <%

            String comment_name = (String) session.getAttribute("txtFullName");
            String comment_data = request.getParameter("ajaxcomment_txtarea");
            String post_id = request.getParameter("ajaxpost_id");
            String username = (String) session.getAttribute("memberusername");

            if (comment_data.equals("") || comment_data.trim().equals("") || comment_data.equals(null)) {
        %>
        <script>
            iziToast.error({
                title: 'Error!',
                progressBar: false,
                message: 'Write something please...!',
                color: 'red',
                timeout: 8000
            });
        </script>
        <%
        } else {
            try {
                //insert data
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection1 = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/blood4life", "root", "root");
                Statement st1 = (Statement) connection1.createStatement();
                int inserted1 = st1.executeUpdate("insert into post_comment(comment_name,comment_data,post_id,username) values('" + comment_name + "','" + comment_data + "','" + post_id + "','" + username + "')");
                if (inserted1 == 0) {
                    out.println("error");
                } else {
        %>
        <script>
            iziToast.success({
                title: '',
                progressBar: false,
                message: 'You commented on this....',
                color: 'green',
                timeout: 8000
            });
        </script>
        <%
                    }
                } catch (Exception e) {
                    out.println("comment_insert_error");
                    e.printStackTrace();
                }

            }
        %>
    </body>
</html>

