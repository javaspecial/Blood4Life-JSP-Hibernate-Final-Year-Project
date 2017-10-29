<%-- 
    Document   : profile_picture_test_page
    Created on : Jul 15, 2017, 8:21:59 AM
    Author     : Shadath Hossain
--%>

<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" %>
<html>
    <head>

    </head>
    <body>
    <center>
        <div style="width: 150px;height: 150px;color: black;border-color: black;border-style: solid;border-bottom-width:  2px;border-left-width:  2px;border-right-width:  2px;border-top-width:  2px;">

            <%

                ResultSet rs = null;
                PreparedStatement psmnt = null;
                Connection connection = null;
                String username = (String) session.getAttribute("memberusername");
                String id_no = (String) session.getAttribute("s");

                try {
                    Class.forName("com.mysql.jdbc.Driver").newInstance();
                    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/blood4life", "root", "root");
                    psmnt = connection.prepareStatement("SELECT * FROM admin WHERE username = '" + username + "' AND id_no = '" + id_no + "'");
                    rs = psmnt.executeQuery();
                    while (rs.next()) {
                        
                        String ok = rs.getString("images");
            %>  
            <img src="profile_images/<%= ok %>" style="height: 150px;width: 150px;"/>
            <%
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            %>
        </div>
    </center>
    <form enctype="multipart/form-data" ACTION="Profile_image_action.jsp" METHOD=POST>
        <center>
            <table border="0" bgcolor=#ccFDDEE>
                <tr>
                <center><td colspan="2" align="center"><B>UPLOAD THE FILE</B></center></td>
                </tr>
                <tr><td colspan="2" align="center"> </td></tr>
                <tr><td><b>Choose the file To Upload:</b></td>
                    <td><INPUT NAME="file" TYPE="file"></td>
                </tr>
                <tr><td colspan="2" align="center"> </td></tr>
                <tr><td colspan="2" align="center"><input type="submit" value="Send File"> </td></tr>
            </table>
        </center>
    </form>
</body>
</html>
