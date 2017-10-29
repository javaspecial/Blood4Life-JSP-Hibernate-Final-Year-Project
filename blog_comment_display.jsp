<%-- 
    Document   : blog_comment_display
    Created on : Jul 6, 2017, 9:53:00 AM
    Author     : Shadath Hossain
--%>

<%@page import="java.sql.PreparedStatement"%>
<%-- 
    Document   : blog_post_status_display
    Created on : Jul 5, 2017, 1:06:17 PM
    Author     : Shadath Hossain
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-------ajax post request------->
        <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
        <script>
            function saveComment(id) {

                var comment = $("#comment_txtarea" + id).val();
                $.post("blog_comment_insert.jsp", {ajaxcomment_txtarea: comment, ajaxpost_id: id}, function (data) {
                    $("#cmntinsert" + id).html(data);
                    document.getElementById('comment_txtarea' + id).value = null;
                });
                {
                    $.post("blog_comment_display.jsp", {ajaxpost_id: id}, function (data) {
                        $("#" + id).html(data);
                    });
                }
            }
        </script>
    </head>
    <body>
        <div style="background-color:#c9e2b3;border-style: solid; border-color: red; ">
            <%

                String post_id = request.getParameter("ajaxpost_id");
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection connection4 = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/blood4life", "root", "root");
                    PreparedStatement ps2 = (PreparedStatement) connection4.prepareStatement("select * from post_comment,registrationtable where post_id= '" + post_id + "' and post_comment.username = registrationtable.memberusername ");
                    ResultSet rs11 = ps2.executeQuery();
                    while (rs11.next()) {
            %>
            <br><div style="margin-left: 5%;margin-right: 5%;margin-top: 0%;width: 90%;background: azure;color: black;">
                <img src="profile_images/<%= rs11.getString("images")%>" style="margin-top:1%;margin-left: 4%; width: 50px;height: 50px;border-style: solid;border-color:red;border-bottom-width: 1px;border-left-width: 1px;border-right-width: 1px;border-top-width: 1px;"/>
                <strong style="font-size: 12px;margin-left: 1%;text-align: left;"><%= rs11.getString("comment_name")%> was commented</strong>
                <div style="height: 100%;width: 80%;color: black;">
                    <strong style="font-size: 12px;width: 80%;color:black;"><p style="margin-left: 4%;margin-right: 4%;"><%= rs11.getString("comment_data")%></p> </strong><br><br>
                </div>
            </div>
            <div><span id="<%= request.getParameter("ajaxpost_id")%>"/></div>

            <%
                    }
                } catch (Exception e) {
                    out.println("comment_display_error");
                    e.printStackTrace();
                }
            %>
            <center>
                <table>
                    <tr>
                        <td>
                            <input type="text" maxlength="40" id="comment_txtarea<%= request.getParameter("ajaxpost_id")%>" class="comment_txtarea" placeholder="Write Comment..." style="border-color: red; height:42px;border-style: solid;border-right-width: 1px;border-top-width: 1px;border-bottom-width: 1px;border-left-width: 1px; width: 100%;margin-top: 4%; margin-bottom: 4%;background-color:azure;color: black;"/>                    
                        </td>
                        <td>
                            <button id = "comment_btn" class= "comment_btn" style="border-color: red; border-style: solid;border-right-width: 1px;border-top-width: 1px;border-bottom-width: 1px;border-left-width: 1px; width: 100%; margin-left: 3%;margin-top: 5%;height:100%; background-color:azure;color: black;margin-bottom: 4%;" onclick="saveComment(<%= request.getParameter("ajaxpost_id")%>)"><strong>Submit Comment</strong > </button>
                            <span id="cmntinsert<%= request.getParameter("ajaxpost_id")%>"  style=" width:100%; margin-top: 5%;color: red;"/>
                        </td>
                    </tr>
                </table> 
            </center>
        </div>
    </body>
</html>

