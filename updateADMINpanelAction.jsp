<%-- 
    Document   : updateMeberProfilePopupAction
    Created on : Jul 3, 2017, 12:02:55 PM
    Author     : Shadath Hossain
--%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
    <head>
    </head>
    <body>
        <%
            String name = request.getParameter("txtFullName");
            String country = request.getParameter("country");
            String division = request.getParameter("division");
            String district = request.getParameter("district");

            String mail = request.getParameter("mail");
            String mobile = request.getParameter("mobile");
            String address = request.getParameter("ajaxaddress");

            if (name.equals("") || country.equals("") || division.equals("") || district.equals("") || mail.equals("") || mobile.equals("") || address.equals("")) {
                out.println("Every field is required !");
            } else {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/blood4life", "root", "root");
                    String sql = "UPDATE admin_profile SET txtFullName = ?,dpCountry = ?,dpState = ?,dpDistrict =? ,txtMobileNumber = ?,txtPermentAddress = ?, txtEmailId = ?";
                    PreparedStatement ps = connection.prepareStatement(sql);
                    ps.setString(1, name);
                    ps.setString(2, country);
                    ps.setString(3, division);
                    ps.setString(4, district);
                    ps.setString(5, mobile);
                    ps.setString(6, address);
                    ps.setString(7, mail);

                    int updated = ps.executeUpdate();
                    if (updated > 0) {
                        out.println("Successfully updated your profile");
                    } else {
                        out.println("Unexpected error occured!");
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        %>
    </body>
</html>