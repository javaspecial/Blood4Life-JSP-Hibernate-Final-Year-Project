<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Untitled page</title>
        <script src="sweetAlert/sweetalert.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/sweetalert.css">
    </head>
    <body>
        <%
            String currentPassword = request.getParameter("ajaxcur_pass");
            String conpass = request.getParameter("ajaxcon_pass");
            if (currentPassword.equals("") || conpass.equals("")) {
                out.println("Both field are required!");
            } else {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blood4life", "root", "root");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("select * from registrationtable where password='" + currentPassword + "'");
                    if (rs.next()) {
                        Statement statement = con.createStatement();
                        statement.executeUpdate("update registrationtable set password='" + conpass + "' where  password='" + currentPassword + "'");
                        out.println("Successfully updated your password");
                    } else {
                        out.println("Mismatch current password!");
                    }
                } catch (Exception e) {
                    out.println(e);
                }
            }
        %>
    </body>
</html>