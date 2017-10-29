<%-- 
    Document   : Home
    Created on : Aug 2, 2017, 2:29:48 PM
    Author     : 14cseshadath
--%>

<%@page import="com.mysql.jdbc.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.jdbc.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mysql.jdbc.Connection"%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html style="" lang="en"><!--<![endif]--><head>
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
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>


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
        <!-- The styles -->
        <link rel="stylesheet" href="css/bootstrap.css">
        <link href="css/font-awesome.css" rel="stylesheet" type="text/css">
        <link href="css/animate.css" rel="stylesheet" type="text/css">
        <link href="css/owl.css" rel="stylesheet" type="text/css">
        <link href="css/venobox.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="css/styles.css">
        <style>
            .fileUpload {
                position: relative;
                overflow: hidden;
                margin: 0px;
            }
            .fileUpload input.upload {
                position: absolute;
                top: 0;
                right: 0;
                margin: 0;
                padding: 0;
                font-size: 20px;
                cursor: pointer;
                opacity: 0;
                filter: alpha(opacity=0);
            }

            /*            display post*/

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
            /*display post*/
        </style>
        <!--        display post-->
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
        <!--display post-->
        <script src="js/sweetalert.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/sweetalert.css">
        <script>
            $("#dpBloodGroup").change(function () { //required to insert data both hidden field & jquery function
                $("#dpBloodGroup").val($(this).find('option:selected').val());
            });
        </script>
        <!-------ajax post request------->
        <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#g_people_btn").click(function () {
                    var name = $("#your_name").val();
                    var phone = $("#your_phone").val();
                    var group = $("#dpBloodGroup").val();
                    var location = $("#your_location").val();
                    var message = $("#textarea_message").val();
                    $.post("general_people_regForm.jsp", {ajax_name: name, ajax_phone: phone, ajax_group: group, ajax_location: location, ajax_mess: message}, function (data) {
                        $("#gpeople_reg").html(data);
                    });
                });
            });
        </script>
        <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#update_profile_retrive").click(function () {
                    $.post("updateaDMINpANEL.jsp", function (data) {
                        $("#update_profile_retrive_span").html(data);
                    });
                });
            });
        </script>
        <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#change_pass_btn").click(function () {
                    $.post("change_member_password.jsp", function (data) {
                        $("#change_password").html(data);
                    });
                });
            });
        </script>
        <!-------ajax post request------->
        <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
        <script>
            function status_insert_display() {
                var data = $("#content").val();
                $.post("blog_post_status_insert.jsp", {your_data: data}, function (data) {
                    $("#message").html(data);
                    document.getElementById('content').value = null;

                });
            }
        </script>
    </head>
    <body> 
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
                                try {
                                    Class.forName("com.mysql.jdbc.Driver");
                                    Connection connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/blood4life", "root", "root");
                                    Statement statement = (Statement) connection.createStatement();
                                    ResultSet rs = statement.executeQuery("SELECT * FROM admin_profile");
                                    while (rs.next()) {
                            %>
                            <p><%= rs.getString("txtFullName")%></p>
                            <%
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                }
                            %>
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
                        </div>
                    </div>

                </section></div>

        </header> 
        <!-- end main-header  -->

            <!-- member profile start   -->
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
                    Connection connection7 = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/blood4life", "root", "root");
                    Statement statement7 = (Statement) connection7.createStatement();

                    ResultSet rs7 = statement7.executeQuery("SELECT * FROM admin_profile,admin WHERE id= '41'");
                    while (rs7.next()) {

                        admin_pic = rs7.getString("images");
                        txtFullName = rs7.getString("txtFullName");
                        country = rs7.getString("dpCountry");
                        division = rs7.getString("dpState");
                        district = rs7.getString("dpDistrict");

                        group = rs7.getString("dpBloodGroup");
                        mail = rs7.getString("txtEmailId");
                        mobile = rs7.getString("txtMobileNumber");
                        address = rs7.getString("txtPermentAddress");
            %>
            <center>
                <div>
                    <table>
                        <tr>
                            <td>
                        <center>
                            <div style="">
                                <img src="profile_images/<%= admin_pic%>" style="width: 50%;height: 50%;margin-top: 10%;border-style: solid;border-bottom-width: 1px;border-left-width: 1px;border-right-width: 1px;border-top-width: 1px;background:white;color: black; "/>
                            </div>
                            <form name="form" id="form" enctype="multipart/form-data" method="post" action="AdminPanel.jsp">                                            
                                <div class="fileUpload btn btn-primary" style="width: 22%;">
                                    <span>Open Picture</span>
                                    <input type="file" class="upload" id="txtprescription" name="txtprescription"/>
                                </div>
                                <input type="submit" value="Upload Picture" id="submit_capture" style="width: 28%;font-size: 14px;border-style: solid;border-color:red;border-bottom-width: 1px;border-left-width: 1px;border-right-width: 1px;border-top-width: 1px;background:white;color: black;"/>
                                <strong><span id="span_upload"></span></strong>
                            </form>
                            <jsp:include page="AdminPanelProfileImage.jsp"/>
                        </center>
                        <center>
                            <span id="change_password" style=""/>
                            <span id="update_profile_retrive_span" style=""/>

                            <strong style="font-size: 90%;"> 
                                <h6>       
                                    <center>
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
                                </h6>
                            </strong>
                        </center>
                        <center>
                            <button class="update_profile_retrive"id="update_profile_retrive" style="margin-top: 3%;font-size: 150%;border-style: solid;border-color: red;border-bottom-width: 1px;border-left-width: 1px;border-right-width: 1px;border-top-width: 1px;background:white;width: 55%;text-decoration: none;color: black;" ><strong>Update Profile</strong></button><br>
                            <form method="post" action="Admin_logout.jsp">
                                <button id="logout" style="margin-top: 1%;margin-bottom: 3%;width: 55%;text-decoration: none;font-size: 150%;border-style: solid;border-color:red;border-bottom-width: 1px;border-left-width: 1px;border-right-width: 1px;border-top-width: 1px;background:white; color: black;"><strong>Log out</strong> </button>
                            </form>
                        </center>
                        </td>
                        </tr>
                    </table>
                </div>
            </center>
            <%                }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            %>
            
            
                    <!--        section display blood request-->
        <section class="section-content-block">
            <div class="container">
                <div class="row section-heading-wrapper">
                    <div class="col-md-12 col-sm-12 text-center">
                        <h2 class="section-heading" style="color: black;">All Report</h2>
                    </div> <!-- end .col-sm-10  -->                      
                </div> <!-- end .row  -->
                <div class="row">

                    <%
                        ResultSet rs3 = null;
                        PreparedStatement psmnt3 = null;
                        Connection connection3 = null;

                        try {
                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                            connection3 = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/blood4life", "root", "root");
                            psmnt3 = (PreparedStatement) connection3.prepareStatement("SELECT * FROM member_report_to_admin");
                            rs3 = psmnt3.executeQuery();
                            while (rs3.next()) {

                                String topic = rs3.getString("topic");
                                String openion = rs3.getString("openion");
                                String message = rs3.getString("message");

                         
                    %>

                    <div class="col-lg-4 col-md-offset-0 col-md-4 col-md-offset-0 col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1">
                        <div style="margin-top: 5px;" class="team-layout-1">       

                            <article class="team-info" style="background: #f8f9fa;border-style: solid;border-color:red;border-bottom-width: 1px;border-left-width: 1px;border-right-width: 1px;border-top-width: 1px;">
                                <h3 style="color: red;">Report Topic:&nbsp;&nbsp;<%= topic %></h3>                                   
                                <h5><strong>Member Openion:&nbsp;&nbsp;<%= openion%></strong></h5>
                                <h5><strong>Report Details:&nbsp;&nbsp;<%= message%></strong></h5>
                          
                            </article>                       
                        </div> <!--  end team-layout-1 -->
                    </div> <!--  end .col-md-4 col-sm-12  -->
                    <%
                            }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }
                    %>
                </div> <!-- end .row  --> 
            </div> <!-- end .container  -->
        </section>
            


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

                   

                    </div> <!-- end .row  -->                                    

                </div> <!--  end .container  -->

            </section> <!--  end .footer-content  -->

        </footer>

        <!-- END FOOTER  -->

        <!-- Back To Top Button  -->

        <a id="backTop" class="custom" style="right: 24px; bottom: 24px; position: fixed; display: block;">Back To Top</a>
    </body></html>
