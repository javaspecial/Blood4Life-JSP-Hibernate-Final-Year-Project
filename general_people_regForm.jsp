<%-- 
    Document   : general_people_regForm
    Created on : Aug 12, 2017, 1:03:15 PM
    Author     : 14cseshadath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <%

            //connection
            String name = request.getParameter("ajax_name");
            String phone = request.getParameter("ajax_phone");
            String group = request.getParameter("ajax_group");
            String location = request.getParameter("ajax_location");
            String message = request.getParameter("ajax_mess");

            PreparedStatement psmnt = null;
            if (name.equals("") || phone.equals("") || group.equals("") || location.equals("")) {
                out.println("Please fill up all fields");
            } else {
                try {
                    Connection connnection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/blood4life", "root", "root");

                    psmnt = (PreparedStatement) connnection.prepareStatement("insert into gpeople(name,phone,location,message,bgroup) values(?,?,?,?,?)");
                    psmnt.setString(1, name);
                    psmnt.setString(2, phone);
                    psmnt.setString(3, location);
                    psmnt.setString(4, message);
                    psmnt.setString(5, group);

                    int check = psmnt.executeUpdate();
                    if (check > 0) {
                        out.println("Registration Successfully Completed");
                    } else {
                        out.println("Registration  Failed");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }

            }
        %>
    </body>
</html>
