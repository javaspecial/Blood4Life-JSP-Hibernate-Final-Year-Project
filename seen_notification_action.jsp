<%-- 
    Document   : seen_notification_action
    Created on : Aug 22, 2017, 2:39:11 AM
    Author     : 14cseshadath
--%>

<%@page import="com.mysql.jdbc.ResultSetMetaData"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
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
            String user_name = (String) session.getAttribute("memberusername");
            String pattern_userid = "";
            String all_seen = "";

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/blood4life", "root", "root");
                Statement st = (Statement) connection.createStatement();
                ResultSet rst = st.executeQuery("SELECT * FROM bloodrequest  WHERE seen NOT LIKE '%" + user_name + "%' ");
                while (rst.next()) {
                    
                    String id_no = rst.getString("id");
                    int id = Integer.parseInt(id_no);
                    
                    //while (id <= 42) {
                        pattern_userid = rst.getString("seen");
                        all_seen = user_name + pattern_userid;
                        PreparedStatement ps = (PreparedStatement) connection.prepareStatement("UPDATE bloodrequest SET seen = ? WHERE seen NOT LIKE '%" + user_name + "%' AND id = '"+id+"' ");
                        ps.setString(1, all_seen);
                        ps.executeUpdate();
                      //  id++;
                    //}
                }
            } catch (Exception e) {
                e.printStackTrace();
            }

        %>

    </body>
</html>
