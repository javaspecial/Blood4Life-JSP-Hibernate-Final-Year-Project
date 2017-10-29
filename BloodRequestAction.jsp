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
            String group = request.getParameter("ajax_group");
            String country = request.getParameter("ajax_country");
            String state = request.getParameter("ajax_division");
            String district = request.getParameter("ajax_district");
            String date = request.getParameter("ajax_date");
            String amount = request.getParameter("ajax_amount");
            String contact = request.getParameter("ajax_contact");

            String user_name = request.getParameter("ajax_username");
            String user_id = request.getParameter("ajax_userid");

            LocalDate localDate = LocalDate.now();
            PreparedStatement psmnt = null;
            String userid = (String) session.getAttribute("memberusername");

            if (group.equals("") || country.equals("") || state.equals("") || district.equals("") || date.equals("") || amount.equals("") || contact.equals("")) {
                out.println("Please fill up all fields");
            } else {
                try {
                    String id_n = "";
                    Connection connnection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/blood4life", "root", "root");

                    Statement st = (Statement) connnection.createStatement();
                    ResultSet resultSet = st.executeQuery("select * from prescription_capture ");
                    while (resultSet.next()) {
                        id_n = resultSet.getString("id");
                    }

                    int id_no = 1;
                    int seen = 0;

                    psmnt = (PreparedStatement) connnection.prepareStatement("insert into bloodrequest(dpBloodGroup,txtDOB,txtHowManyUnits,txtMobileNumber,dpCountry,dpState,dpDistrict,username,user_id,currentDate,id_no,image_id,seen) values(?,?,?,?,?,?,?,?,?,?," + id_no + "," + id_n  + ","+seen+")");
                    psmnt.setString(1, group);
                    psmnt.setString(2, date);
                    psmnt.setString(3, amount);
                    psmnt.setString(4, contact);
                    psmnt.setString(5, country);
                    psmnt.setString(6, state);
                    psmnt.setString(7, district);
                    psmnt.setString(8, user_name);
                    psmnt.setString(9, user_id);
                    psmnt.setString(10, DateTimeFormatter.ofPattern("yyy/MM/dd").format(localDate).toString());
                    int check = psmnt.executeUpdate();
                    if (check > 0) {
                        out.println("Request Successfully Submited....");
        %>
        <br>If you want to see view&nbsp;&nbsp;<a href="Home.jsp" style="color: red;">Click Me</a>
        <%
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
