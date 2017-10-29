<%-- 
    Document   : login_action
    Created on : Jul 10, 2017, 12:29:45 AM
    Author     : Shadath Hossain
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%

    String memberusername = request.getParameter("ajax_username");
    session.setAttribute("memberusername", memberusername);
    String password = request.getParameter("ajax_password");

    if (memberusername.equals("") || password.equals("")) {
        out.println("Username and Password Required!");
    } else {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/blood4life", "root", "root");
            PreparedStatement ps = (PreparedStatement) connection.prepareStatement("select * from registrationtable where memberusername = ? and password = ?");
            ps.setString(1, memberusername);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                HttpSession sesion = request.getSession();
                sesion.setAttribute("memberusername", memberusername);
                //setting session to expire 1min
                sesion.setMaxInactiveInterval(60 * 60);

                //set cookie
                Cookie user_name = new Cookie("memberusername", memberusername);
                response.addCookie(user_name);

%>
<script>
    swal({
        title: 'Login Successfully...',
        confirmButtonText: "Processing.....",
        timer: 1000
    }, function () {
        window.location.href = 'Home.jsp';
    }).then(
            function () {},
            function (dismiss) {
                if (dismiss === 'timer') {
                    console.log('I was closed by the timer');
                }
            }
    );
</script>
<%                    } else {
                out.println("Username and password mismatch!");

            }
        } catch (Exception E) {
            E.printStackTrace();
        }
    }
%>



