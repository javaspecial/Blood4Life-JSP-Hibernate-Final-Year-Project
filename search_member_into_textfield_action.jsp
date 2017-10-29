<%-- 
    Document   : Sayed_sir_work3
    Created on : Aug 21, 2017, 2:07:24 PM
    Author     : 14cseshadath
--%>
<!-------ajax post request------->
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script>
    function visit_profile(id) {
        $.post("MemberProfileVisit.jsp", {ajax_id: id}, function (data) {
            $("#span_visit_profile").html(data);
        });
    }
</script>
<%@ page language="java" import="java.sql.*" %>
<% response.setContentType("text/html");%>
<%
    String str = request.getParameter("queryString");
    try {
        Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blood4life", "root", "root");

        String sql = "SELECT * FROM registrationtable WHERE txtFullName LIKE '" + str + "%' LIMIT 10";
        Statement stm = con.createStatement();
        stm.executeQuery(sql);
        ResultSet rs = stm.getResultSet();
        while (rs.next()) {
%>
&nbsp;&nbsp;&nbsp;&nbsp;<%= rs.getString("txtFullName")%>&nbsp;&nbsp;<input style="background: yellow;color: black;height: 20px;" title="View Profile"  value="View" type="submit" onclick="visit_profile(<%= rs.getString("id")%>)"/><br>
<%
        }
    } catch (Exception e) {
        out.println("Exception is ;" + e);
    }
%>

