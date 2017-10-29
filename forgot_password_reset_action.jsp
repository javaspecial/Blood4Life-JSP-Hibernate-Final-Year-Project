
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

<!---start jdbc to retrive data from database -->
<%
    String email_id = request.getParameter("ajax_email");
    String mobile_no = request.getParameter("ajax_mobile");
    String user_id = request.getParameter("ajax_username");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/blood4life", "root", "root");
        PreparedStatement ps = (PreparedStatement) connection.prepareStatement("SELECT * FROM registrationtable WHERE txtMobileNumber = ? AND txtEmailId = ?   AND memberusername = ?");
        ps.setString(1, mobile_no);
        ps.setString(2, email_id);
        ps.setString(3, user_id);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
%>  
<script>
    window.swal({
        title: "Congratulatins!",
        text: "Your forgot password is: <%= rs.getString("password")%> ",
        type: "success",
        animation: "slide-from-top",
        customClass: 'animated tada',
        confirmButtonText: "Login Continue"
    }, function () {
        window.location.href = 'MemberLogin.jsp';
    });

</script>
<%        } else {
%>  
<script>
    window.swal({
        title: "",
        text: "Provide correct information please.... ",
        type: "error",
        animation: "slide-from-top",
        customClass: 'animated tada',
        confirmButtonText: "Try again"
    }, function () {
        window.location.href = 'forgot_password.jsp';
    });
</script>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

%>    

