<%-- 
    Document   : loginPopup
    Created on : Apr 22, 2017, 9:24:37 PM
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

        <script>
            function validate() {

                var x = document.getElementById("new_pass");
                var y = document.getElementById("con_pass");
                if (x.value === y.value) {
                    var message = "Matching Password";
                    document.getElementById('changemessages').innerText = message;
                    return true;
                } else {
                    var message = "Mismatch Password";
                    document.getElementById('changemessages').innerText = message;
                    return false;
                }

            }
        </script>

        <!-------ajax post request------->
        <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#submitchange").click(function () {
                    var con_pass = $("#con_pass").val();
                    var cur_pass = $("#cur_pass").val();
                    $.post("change_password_action.jsp", {ajaxcon_pass: con_pass, ajaxcur_pass: cur_pass}, function (data) {
                        $("#changemessages").html(data);
                    });
                });
            });
        </script>

    </head>
    <body>   
        <strong style="font-size: 80%;color: black;margin-top: 10%;">Change Your Password</strong><br><br>
        <table>
            <tr>
                <td> <input placeholder="New Password" style="margin-top: 1%;border-style: solid;border-color: red;border-bottom-width: 1px;border-left-width: 1px;border-right-width: 1px;border-top-width: 1px;background:white;width: 100%;color: black;text-align: center;" type="password" id="new_pass" name="new_pass"  onblur="validate()" required/></td>
            </tr>
            <tr>
                <td><input placeholder="Confirm Password" style="margin-top: 1%;border-style: solid;border-color: red;border-bottom-width: 1px;border-left-width: 1px;border-right-width: 1px;border-top-width: 1px;background:white;width: 100%;color: black;text-align: center;" type="password" id="con_pass" name="con_pass"  onblur="validate()" required/></td>
            </tr>
            <tr>
                <td><input placeholder=" Current Password" style="margin-top: 1%;border-style: solid;border-color: red;border-bottom-width: 1px;border-left-width: 1px;border-right-width: 1px;border-top-width: 1px;background:white;width: 100%;color: black;text-align: center;" type="password" id="cur_pass" name="cur_pass"  required/></td>
            </tr>
            <tr>
                <td>
                    <button id="submitchange"style="margin-top: 1%;width: 100%; margin-bottom: 3%;cursor: progress;border-style: solid;border-color: red;border-bottom-width: 1px;border-left-width: 1px;border-right-width: 1px;border-top-width: 1px;background:white;color: black;"><strong>Change</strong></button>
                    <div id="changemessages"/></div>
                </td>
            </tr>
        </table>

    </body>
</html>
