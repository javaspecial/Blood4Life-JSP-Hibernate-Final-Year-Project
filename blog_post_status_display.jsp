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
        <style>
            #comment_btn{
                margin-left:0px;
                background-color:#0d47a1;
                border-color: gold; 
                color: white;
                border-style: solid;
                border-right-width: 1px;
                border-top-width: 1px;
                border-bottom-width: 1px;
                border-left-width: 1px;
                height: 34px;
                width: 50%;
            }
            #comment_btn:hover{
                background-color: #900;
                border-style: solid;
                border-color: goldenrod;
                color: white;
            }
            .hidecomment{
                display:none;
                border-style: solid; 
                border-color: red; 
                background-color: gold;
                color: black;
                margin-left: 70%;
                margin-bottom: 3%;
                border-bottom-width: 1px;
                border-left-width: 1px; 
                border-right-width: 1px; 
                border-top-width: 1px;
            }
            .readcontinue{
                border-style: solid; 
                border-color: red; 
                background-color: white;
                color: black;
                margin-left: 70%;
                margin-bottom: 3%;
                border-bottom-width: 1px;
                border-left-width: 1px; 
                border-right-width: 1px; 
                border-top-width: 1px;
            }
        </style>
        <!-------ajax post request------->
        <script>
            function showComments(id)
            {
                $.post("blog_comment_display.jsp", {ajaxpost_id: id}, function (data) {
                    $("#" + id).html(data);
                });
                $('#readcontinue' + id).hide();
                $('#hidecomment' + id).show();
            }
            function hideComments(id)
            {
                $.post("comment_hideShow_empty_page.jsp", {ajaxpost_id: id}, function (data) {
                    $("#" + id).html(data);
                });
                $('#hidecomment' + id).hide();
                $('#readcontinue' + id).show();
            }
        </script>     
        <script>
            var request;
            function sendInfo()
            {
                var url = "blog_comment_display.jsp?";
                if (window.XMLHttpRequest) {
                    request = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    request = new ActiveXObject("Microsoft.XMLHTTP");
                }

                try {
                    request.onreadystatechange = getInfo;
                    request.open("GET", url, true);
                    request.send();
                } catch (e) {
                    alert("Unable to connect to server");
                }
            }

            function getInfo() {
                if (request.readyState === 4) {
                    var val = request.responseText;
                    document.getElementById('m').innerHTML = val;
                }
            }

        </script>
        <script type="text/javascript" src="js/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                loadData();
            });

            function loadData() {
                var reloadData = 0; // store timer
                $('#reload').load('comment_hideShow_empty_page.jsp', function () {
                    if (reloadData !== 0)
                        window.clearTimeout(reloadData);
                    reloadData = window.setTimeout(loadData, 1000);
                }).fadeIn("slow");
            }
        </script>
    </head>
    <body>
        <div id=""style="background-color: azure;margin-top: 3%;border-style: solid; border-color: red; border-bottom-width: 1px; border-left-width: 0px; border-right-width: 0px;">
            <div style="margin-top:0%;background-color: red;height: 25px;width: 100%;">
                <center><strong style="color: white;text-align: center;">See update status</strong><br><br></center>
            </div>
            <%
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection connection2 = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/blood4life", "root", "root");
                    Statement statement2 = (Statement) connection2.createStatement();
                    ResultSet rs2 = statement2.executeQuery("SELECT * FROM post_status,registrationtable WHERE post_status.username = registrationtable.memberusername");
                    while (rs2.next()) {
                        String id = rs2.getString("id");
                        session.setAttribute("id", id);
            %>
            <div id="reload" style=" background-color: azure;border-style: solid; border-color: red; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px; border-top-width: 1px;">
                <div id="">
                    <img src="profile_images/<%= rs2.getString("images")%>" style="margin-top:3px;margin-left: 5px; width: 30px;height: 30px;border-style: solid;border-color:red;border-bottom-width: 1px;border-left-width: 1px;border-right-width: 1px;border-top-width: 1px;"/>
                    <strong style="font-size: 15px;margin-left: 20px;martext-align: left;background-color: azure;">&nbsp;<%= rs2.getString("name")%> was posted about: </strong><br>
                    <strong style="font-size: 12px; width: 80%;height: 100%; background-color: azure;color: green; " ><p style="margin-left: 20px;margin-right: 20px;"><%= rs2.getString("data")%></p> </strong><br><br>
                    <input type="hidden" id="post_id"class="post_id" name="post_id"  value="<%= rs2.getString("id")%>"/>
                </div>
                <div>
                    <input style=" " value="Hide comment" type="button" id="hidecomment<%= rs2.getString("id")%>" class="hidecomment" onclick="hideComments(<%= rs2.getString("id")%>)"/>
                    <input style="" value="Read comment" type="button" id="readcontinue<%= rs2.getString("id")%>" class="readcontinue" onclick="showComments(<%= rs2.getString("id")%>)"/>
                    <strong><span id="<%= rs2.getString("id")%>" class="m" style="height: 20px; width: 200px; margin-top: 8px;color: green;"/></strong>
                </div>
            </div>
            <%    }
                } catch (Exception e) {
                    out.println("Data too much long.....");
                    e.printStackTrace();
                }

            %>
        </div>
    </body>
</html>
