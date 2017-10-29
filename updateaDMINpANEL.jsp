<%-- 
    Document   : updateMemberProfileRetrive
    Created on : Aug 12, 2017, 2:05:36 PM
    Author     : 14cseshadath
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--------start ajax request------->
        <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#submit_update_profile").click(function () {
                    var txtFullName = $("#txtFullName").val();
                    var country = $("#country").val();
                    var division = $("#division").val();
                    var district = $("#district").val();
                    var mobile = $("#mobile").val();
                    var mail = $("#mail").val();
                    var addres = $("#txtaddress").val();
                    $.post("updateADMINpanelAction.jsp", {txtFullName: txtFullName, country: country, division: division, district: district, mobile: mobile, mail: mail, ajaxaddress: addres}, function (data) {
                        $("#messag").html(data);
                    });
                });
            });
        </script>
        <!--------end ajax request------->
    </head>
    <body>

        <%
            String txtFullName = "";
            String country = "";
            String division = "";
            String district = "";

            String group = "";
            String mail = "";
            String mobile = "";
            String address = "";
            String admin_pic = "";
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection7 = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/blood4life", "root", "root");
                Statement statement7 = (Statement) connection7.createStatement();

                ResultSet rs7 = statement7.executeQuery("SELECT * FROM admin_profile");
                while (rs7.next()) {

                    txtFullName = rs7.getString("txtFullName");
                    country = rs7.getString("dpCountry");
                    division = rs7.getString("dpState");
                    district = rs7.getString("dpDistrict");

                    group = rs7.getString("dpBloodGroup");
                    mail = rs7.getString("txtEmailId");
                    mobile = rs7.getString("txtMobileNumber");
                    address = rs7.getString("txtPermentAddress");

        %>

        <%                }

            } catch (Exception e) {
                e.printStackTrace();
            }

        %>
        <!--        <div style="margin-top: 4%;border-style: solid;border-color: red;width: 30%;border-bottom-width: 1px;border-left-width: 1px;border-right-width: 1px;border-top-width: 1px;">-->
        <strong style="font-size: 80%;color: black;margin-top: 0%;">Update Your Profile</strong><br><br>
        <table>
            <tr>
                <td>  <strong > Name:</strong> </td>
                <td><input type="text" id="txtFullName" name="name" value="<%out.print(txtFullName);%>" style="margin-top: 0%;border-style: solid;border-color: red;border-bottom-width: 1px;border-left-width: 1px;border-right-width: 1px;border-top-width: 1px;background:white;width: 100%;color: black;text-align: center;" required></td>
            </tr>
            <tr>
                <td> <strong > Country:</strong></td>
                <td> <input type="text" id="country" name="country" value="<%out.print(country);%>" required style="margin-top: 1%;border-style: solid;border-color: red;border-bottom-width: 1px;border-left-width: 1px;border-right-width: 1px;border-top-width: 1px;background:white;width: 100%;color: black;text-align: center;"></td>
            </tr>
            <tr>
                <td> <strong > Division:</strong></td>
                <td><input type="text" id="division" name="division" value="<%out.print(division);%>" required style="margin-top: 1%;border-style: solid;border-color: red;border-bottom-width: 1px;border-left-width: 1px;border-right-width: 1px;border-top-width: 1px;background:white;width: 100%;color: black;text-align: center;"></td>
            </tr>
            <tr>
                <td><strong > District:</strong></td>
                <td><input type="text" id="district" name="district" value="<%out.print(district);%>" required style="margin-top: 1%;border-style: solid;border-color: red;border-bottom-width: 1px;border-left-width: 1px;border-right-width: 1px;border-top-width: 1px;background:white;width: 100%;color: black;text-align: center;"></td>
            </tr>

            <tr>
                <td> <strong > Contact:</strong></td>
                <td><input type="text" id="mobile" name="mobile" value="<%out.print(mobile);%>" required style="margin-top: 1%;border-style: solid;border-color: red;border-bottom-width: 1px;border-left-width: 1px;border-right-width: 1px;border-top-width: 1px;background:white;width: 100%;color: black;text-align: center;"></td>
            </tr>
            <tr>
                <td> <strong> Email:</strong></td>
                <td><input type="text" id="mail" name="mail" value="<%out.print(mail);%>" style="margin-top: 1%;border-style: solid;border-color: red;border-bottom-width: 1px;border-left-width: 1px;border-right-width: 1px;border-top-width: 1px;background:white;width: 100%;color: black;text-align: center;" required></td>
            </tr>
            <tr>
                <td> <strong > Address:</strong></td>
                <td><input type="text" id="txtaddress" name="address" value="<%out.print(address);%>" required style="margin-top: 1%;border-style: solid;border-color: red;border-bottom-width: 1px;border-left-width: 1px;border-right-width: 1px;border-top-width: 1px;background:white;width: 100%;color: black;text-align: center;"></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    &nbsp;<button id="submit_update_profile"   style="margin-top: -3%;width: 100%; margin-bottom: 3%;cursor: progress;border-style: solid;border-color: red;border-bottom-width: 1px;border-left-width: 1px;border-right-width: 1px;border-top-width: 1px;background:white;color: black;" >Update</button>
                    <div id="messag" ></div>
                </td>
            </tr>
        </table>
        <!--        </div>-->
    </body>
</html>
