<%-- 
    Document   : deleteBloodRequestFromLoginField
    Created on : Mar 29, 2017, 5:48:13 PM
    Author     : Shadath Hossain
--%>

<%@page import="java.util.Calendar"%>
<%@page import="java.util.GregorianCalendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Untitled Page</title>
    </head>
    <body>

        <%
            SimpleDateFormat sdf_new = new SimpleDateFormat("MM/dd/yyyy");
            GregorianCalendar cal = new GregorianCalendar();
            cal.set(Calendar.DATE, cal.get(Calendar.DATE));
            String date = sdf_new.format(cal.getTime());

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/blood4life", "root", "root");
                Statement statement = (Statement) connection.createStatement();
                String SQL = "DELETE FROM bloodrequest WHERE txtDOB = '" + date + "'";
                statement.executeUpdate(SQL);
            } catch (Exception e) {
                e.printStackTrace();
            }

        %>

    </body>
</html>
