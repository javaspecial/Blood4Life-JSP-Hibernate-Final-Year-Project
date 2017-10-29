<%-- 
    Document   : requestResult
    Created on : Mar 25, 2017, 10:36:02 PM
    Author     : Shadath Hossain
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            #name {
                padding: 10px 5px;
                font: bold 12px'lucida sans', 'trebuchet MS', 'Tahoma';
                border: 1px solid #a4c3ca;
                background: #f1f1f1;
                border-radius: 5px;
                width: 100%;
                box-shadow: 0 1px 3px rgba(0, 0, 0, 0.25) inset, 0 1px 0 rgba(255, 255, 255, 1);
            }
            #contact {
                padding: 10px 5px;
                font: bold 12px'lucida sans', 'trebuchet MS', 'Tahoma';
                border: 1px solid #a4c3ca;
                background: #f1f1f1;
                border-radius: 5px;
                width: 100%;
                box-shadow: 0 1px 3px rgba(0, 0, 0, 0.25) inset, 0 1px 0 rgba(255, 255, 255, 1);
            }
            #email {
                padding: 10px 5px;
                font: bold 12px'lucida sans', 'trebuchet MS', 'Tahoma';
                border: 1px solid #a4c3ca;
                background: #f1f1f1;
                border-radius: 5px;
                width: 100%;
                box-shadow: 0 1px 3px rgba(0, 0, 0, 0.25) inset, 0 1px 0 rgba(255, 255, 255, 1);
            }
            #address {
                padding: 10px 5px;
                font: bold 12px'lucida sans', 'trebuchet MS', 'Tahoma';
                border: 1px solid #a4c3ca;
                background: #f1f1f1;
                border-radius: 5px;
                width: 100%;
                box-shadow: 0 1px 3px rgba(0, 0, 0, 0.25) inset, 0 1px 0 rgba(255, 255, 255, 1);
            }
            body {
                background: #f5fffa;
                font-family: 'Lora', serif;
                font-family: 'Montserrat', sans-serif;
            }
        </style>
    </head>
    <body>
        <div style="margin-top: 4px;">
            <%
                String donorBloodGoup = request.getParameter("ajax_group");
                String donorDistrict = request.getParameter("ajax_district");
                if (donorBloodGoup.equals("") || donorDistrict.equals("")) {
                    out.println("Please select all ");
                } else {
                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/blood4life", "root", "root");
                        Statement statement = (Statement) connection.createStatement();
                        ResultSet rs = statement.executeQuery("SELECT * FROM registrationtable WHERE dpBloodGroup = '" + donorBloodGoup + "' AND dpDistrict = '" + donorDistrict + "'");
                        while (rs.next()) {
            %>
            <center>
                <table border='1'>
                    <tr>
                        <td><div id="name" type="text" readonly style="text-align: center;background-color: azure;color: black;margin-top: 4px;">Name : <%= rs.getString("txtFullName")%></div></td>
                        <td><div id="contact" type="text"readonly style="text-align: center;background-color: azure;color: black;margin-top: 4px;">Contact : <%= rs.getString("txtMobileNumber")%></div></td>
                        <td><div id="email" type="text"readonly style="text-align: center;background-color: azure;color: black;margin-top: 4px;"> Email : <%= rs.getString("txtEmailId")%></div></td>
                        <td><div id="address" type="text"readonly style="text-align: center;background-color: azure;color: black;margin-top: 4px;">Address : <%= rs.getString("txtPermentAddress")%></div></td>

                    </tr>
                </table>
            </center>
            <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            %>   
        </div>
    </body>
</html>
