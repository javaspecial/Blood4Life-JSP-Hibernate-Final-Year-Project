<%-- 
    Document   : member_logout
    Created on : Jul 24, 2017, 2:35:17 AM
    Author     : 14cseshadath
--%>


<%@page import="java.lang.String"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<!--Created on : Feb 14, 2017, 12:06:12 AM
   Author     : Shadath Hossain
-->
<!DOCTYPE html>
<html>
    <head>
        <script src="js/sweetalert.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/sweetalert.css"> 
    </head>
    <body>
        <%
            session.invalidate();
        %>
        <script>
            swal({
                title: 'Logout Successfully...',
                text: 'Continue with Blood4Life',
                timer: 500
            }, function () {
                window.location.href = 'MemberLogin.jsp';
            }).then(
                    function () {},
                    function (dismiss) {
                        if (dismiss === 'timer') {
                            console.log('I was closed by the timer');
                        }
                    }
            );
        </script>
    </body>
</html>

