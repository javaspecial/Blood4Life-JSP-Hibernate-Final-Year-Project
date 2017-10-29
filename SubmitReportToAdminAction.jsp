<%-- 
    Document   : bloodRequestAction
    Created on : Mar 22, 2017, 5:19:40 PM
    Author     : Shadath Hossain
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.DataInputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
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
    </head>
    <body>

        <%

            //connection
            String topic = request.getParameter("ajax_topic");
            String openion = request.getParameter("ajax_openion");
            String message = request.getParameter("ajax_message");

            PreparedStatement psmnt = null;
            String userid = (String) session.getAttribute("memberusername");

            if (topic.equals("") || message.equals("")) {
                out.println("Please fill up all fields");
            } else {
                try {
                    Connection connnection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/blood4life", "root", "root");

                    psmnt = (PreparedStatement) connnection.prepareStatement("insert into member_report_to_admin(topic,openion,message,user_id) values(?,?,?,?)");
                    psmnt.setString(1, topic);
                    psmnt.setString(2, openion);
                    psmnt.setString(3, message);
                    psmnt.setString(4, userid);
                    int check = psmnt.executeUpdate();
                    if (check > 0) {
                        out.println("Request Successfully Submited....");
                    } else {
                        out.println("Request Submited Failed");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }

            }
        %>
    </body>
</html>
