<%-- 
    Document   : cookie_session_expire
    Created on : Apr 4, 2017, 11:38:23 AM
    Author     : Shadath Hossain
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Untitled Page</title>
    </head>
    <body>


        <%
            //ALLOW ACCESS IF SESSION EXIST
            String memberusername = null;
            if (session.getAttribute("memberusername") == null) {

        %>
        <script>
            window.swal({
                title: "",
                text: 'Login session expired!',
                type: "error",
                confirmButtonText: "Login continue"
            }, function () {
                window.location.href = 'MemberLogin.jsp';
            });
        </script>
        <%            
            } else {
                memberusername = (String) session.getAttribute("memberusername");
            }
            //keep stay in page about setMaxInactive time 1min in LoginServlet.java
            String user_name = null;
            String sessionid = null;
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("memberusername")) {
                        user_name = cookie.getValue();
                    }
                    if (cookie.getName().equals("JSESSIONID")) {
                        sessionid = cookie.getValue();
                    }
                }
            } else {
                sessionid = session.getId();
            }


        %>
    </body>
</html>
