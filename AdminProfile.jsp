<%-- 
    Document   : Home
    Created on : Aug 2, 2017, 2:29:48 PM
    Author     : 14cseshadath
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html style="" lang="en"><!--<![endif]-->
    <head>
        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <title>Blood 4 Life</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <meta name="description" content="Blood Donation - Activism &amp; Campaign HTML5 Template">
        <meta name="author" content="xenioushk">
        <link rel="shortcut icon" href="http://projects.bluewindlab.net/tf/2017/blood_donation/images/favicon.png">

        <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
          <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <script src="js/sweetalert.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/sweetalert.css">
        <!-- The styles -->
        <link rel="stylesheet" href="css/bootstrap.css">
        <link href="css/font-awesome.css" rel="stylesheet" type="text/css">
        <link href="css/animate.css" rel="stylesheet" type="text/css">
        <link href="css/owl.css" rel="stylesheet" type="text/css">
        <link href="css/venobox.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="css/styles.css">


        <script src="js/jquery.js"></script>
        <script src="js/bootstrap.js"></script>
        <script src="js/wow.js"></script>
        <script src="js/jquery_003.js"></script>
        <script src="js/waypoints.js"></script>
        <script src="js/waypoints-sticky.js"></script>
        <script src="js/owl.js"></script>
        <script src="js/jquery_002.js"></script>
        <script src="js/jquery_004.js"></script>
        <script src="js/venobox.js"></script>
        <script src="js/custom-scripts.js"></script>
        <!-------ajax post request------->
        <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#report_submit").click(function () {
                    var topic = $("#report_topic").val();
                    var openion = $("#your_openion").val();
                    var message = $("#textarea_message").val();
                    $.post("SubmitReportToAdminAction.jsp", {ajax_topic : topic, ajax_openion : openion, ajax_message : message}, function (data) {
                        $("#report_spanid").html(data);

                    });
                });
            });
        </script>

    </head>
    <body > 
        <div id="preloader" style="display: none;">
            <span class="margin-bottom"><img src="images/loader.gif" alt=""></span>
        </div>

        <!--  HEADER -->

        <header class="main-header clearfix" data-sticky_header="1">

            <div class="top-bar clearfix">

                <div class="container">

                    <div class="row">

                        <div class="col-md-8 col-sm-12">
                            <%
                                String NAME = (String) session.getAttribute("memberusername");
                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/blood4life", "root", "root");
                                    Statement statement = (Statement) connection.createStatement();
                                    ResultSet rs = statement.executeQuery("SELECT * FROM registrationtable WHERE memberusername = '" + NAME + "' ");
                                    while (rs.next()) {
                            %>
                            <p><%= rs.getString("txtFullName")%></p>
                            <%
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>
                            <jsp:include page="cookie_session_expire.jsp"/>
                        </div>

                        <div class="col-md-4col-sm-12">
                            <div class="top-bar-social">

                            </div>   
                        </div> 

                    </div>

                </div> <!--  end .container -->

            </div> <!--  end .top-bar  -->

            <div class="sticky-wrapper" style="height: 93px;"><section class="header-wrapper navgiation-wrapper stuck">

                    <div class="navbar navbar-default">			
                        <div class="container">

                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <a class="logo" href="#"><img alt="" src="images/logob4l.png"></a>
                            </div>

                            <div class="navbar-collapse collapse">
                                <ul class="nav navbar-nav navbar-right">
                                    <li class="drop">
                                        <a href="Home.jsp" title="Home">Home</a>
                                    </li>
                                    <li class="drop">
                                        <a href="AdminProfile.jsp">Admin </a>
                                    </li>
                                    <li>
                                        <a href="MemberProfile.jsp">Member </a>
                                    </li>
                                    <li>
                                        <a href="GeneralPeople.jsp">General People</a>
                                    </li>
                                    <li>
                                        <a href="FindDonor.jsp" title="Find Donor">Find Donor</a>
                                    </li>
                                    <li>
                                        <a href="BloodRequest.jsp">Blood Request</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>

                </section></div>

        </header> 
        <!-- end main-header  -->

        <!--  SECTION APPOINTMENT   --> 
    <center>
        <div>

            <!-- admin profile start   -->
            <%
                String txtFullName = "";
                String country = "";
                String division = "";
                String district = "";

                String group = "";
                String mail = "";
                String mobile = "";
                String address = "";
                String admin_pic = "";
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/blood4life", "root", "root");
                    Statement statement = (Statement) connection.createStatement();
                    ResultSet rs = statement.executeQuery("SELECT * FROM admin_profile,admin WHERE admin.id = 41");
                    while (rs.next()) {

                        admin_pic = rs.getString("images");
                        txtFullName = rs.getString("txtFullName");
                        country = rs.getString("dpCountry");
                        division = rs.getString("dpState");
                        district = rs.getString("dpDistrict");

                        group = rs.getString("dpBloodGroup");
                        mail = rs.getString("txtEmailId");
                        mobile = rs.getString("txtMobileNumber");
                        address = rs.getString("txtPermentAddress");
            %>                                    
            <center>
                <div style="width: 40%;height: 40%;">
                    <a href="#" title="Patient capture">
                        <center><img src="profile_images/<%= admin_pic%>" style="width: 50%;height: 50%;"/></center>
                    </a>
                </div> 
                <!-- end. team-member  -->
                <!--                               </div>-->
                    <h4> <a style="color: black;" href="#"><%= txtFullName%></a></h4>
                    <div style="width: 40%;"> 
                        <h6> <strong>Country:&nbsp;<%= country%></strong><br>
                        <strong> Division:&nbsp;<%= division%></strong><br>
                        <strong> District:&nbsp;<%= district%></strong><br>
                        <strong> B. Group:&nbsp;<%= group%></strong><br>
                        <strong> Email:&nbsp;<%= mail%></strong><br>
                        <strong> Contact:&nbsp;<%= mobile%></strong><br>
                        <strong> Address:&nbsp;<%= address%></strong></h6>
                    </div>
            </center>
            <%
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            %>
            <div class="appointment-form-wrapper text-center clearfix" style="width: 40%;">
                <h3 class="join-heading">Write a report to admin</h3>
                <div class="appoinment-form"> 
                    <div class="form-group col-md-6">
                        <input id="report_topic" class="form-control" placeholder="Report topic" type="text">
                    </div>
                    <div class="form-group col-md-6">
                        <input id="your_openion" class="form-control" placeholder="Your openion(Optional)" type="text">
                    </div>

                    <div class="form-group col-md-12 col-sm-12 col-xs-12">
                        <textarea id="textarea_message" class="form-control" rows="4" placeholder="Write your message..."></textarea>
                    </div>         

                    <div class="form-group col-md-12 col-sm-12 col-xs-12">
                        <button id="report_submit" class="btn-submit" type="submit">Submit Report</button>
                    </div>
                    <span id="report_spanid"/>
                </div>
            </div>
        </div>
    </center>


    <!-- START FOOTER  -->
    <footer>            

        <section class="footer-widget-area footer-widget-area-bg">

            <div class="container">




                <div class="row">

                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                        <img src="images/logob4l.png" alt="">
                    </div> <!--  end col-lg-3-->

                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                        <p>
                            We are largest and 
                            trustful blood donation center in Bangladesh. We have been working since 2017,February with a 
                            prestigious vision to helping patient to provide blood.
                            We are working all over the 
                            Country, organizing blood donation to grow awareness among the 
                            people to donate blood.
                        </p>
                    </div> <!--  end .col-lg-9  -->

                </div> <!--  end .row -->


            </div> <!-- end .container  -->

        </section> <!--  end .footer-widget-area  -->

        <!--FOOTER CONTENT  -->

        <section class="footer-contents">

            <div class="container">

                <div class="row clearfix">

                    <div class="col-md-6 col-sm-12">
                        <p class="copyright-text"> Copyright © 2017,February.All Right Reserved - by Shadath </p>

                    </div>  <!-- end .col-sm-6  -->

                    <div class="col-md-6 col-sm-12 text-right">
                        <div class="footer-nav">
                            <nav>
                                <ul>
                                    <li class="drop">
                                        <a href="Home.jsp" title="Home">Home</a>
                                    </li>
                                    <li class="drop">
                                        <a href="AdminProfile.jsp">Admin</a>
                                    </li>
                                    <li>
                                        <a href="MemberProfile.jsp">Member</a>
                                    </li>
                                    <li>
                                        <a href="GeneralPeople.jsp" title="Find Donor">General People</a>
                                    </li>
                                </ul>
                            </nav>
                        </div> <!--  end .footer-nav  -->
                    </div> <!--  end .col-lg-6  -->

                </div> <!-- end .row  -->                                    

            </div> <!--  end .container  -->

        </section> <!--  end .footer-content  -->

    </footer>

    <!-- END FOOTER  -->

    <!-- Back To Top Button  -->

    <a id="backTop" class="custom" style="right: 24px; bottom: 24px; position: fixed; display: block;">Back To Top</a>
</body></html>
