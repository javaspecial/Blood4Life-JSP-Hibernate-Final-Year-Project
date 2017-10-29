<%-- 
    Document   : Home
    Created on : Aug 2, 2017, 2:29:48 PM
    Author     : 14cseshadath
--%>

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
                    $.post("updateMemberProfileRetrive.jsp", function (data) {
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
        <jsp:include page="cookie_session_expire.jsp"/>
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


        <div style="height: 1500px;width: 60%;margin-top: 3%;margin-left:20%;margin-right: 20%;overflow: auto;background: #f8f9fa;border-style: solid;border-color:red;border-bottom-width: 1px;border-left-width: 1px;border-right-width: 1px;border-top-width: 1px;">


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
                String pro_pic = "";
                String username = (String) session.getAttribute("memberusername");
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection connection7 = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/blood4life", "root", "root");
                    Statement statement7 = (Statement) connection7.createStatement();
                    ResultSet rs7 = statement7.executeQuery("SELECT * FROM registrationtable WHERE memberusername = '" + username + "'  ");
                    while (rs7.next()) {
                        pro_pic = rs7.getString("images");
                        txtFullName = rs7.getString("txtFullName");
                        session.setAttribute("txtFullName", txtFullName);

                        country = rs7.getString("dpCountry");
                        division = rs7.getString("dpState");
                        district = rs7.getString("dpDistrict");

                        group = rs7.getString("dpBloodGroup");
                        mail = rs7.getString("txtEmailId");
                        mobile = rs7.getString("txtMobileNumber");
                        address = rs7.getString("txtPermentAddress");
            %>     

            <table>
                <tr>
                    <td>
                        <div style="overflow: auto; height: 100%;width: 100%;margin-top: 0%;background: #f8f9fa;border-style: solid;border-color:red;border-bottom-width: 1px;border-left-width: 1px;border-right-width: 1px;border-top-width: 1px;">
                            <center>
                                <div style="">
                                    <img src="profile_images/<%= pro_pic%>" style="width: 80%;height: 80%;margin-top: 10%;margin-left:10%;margin-right: 10%;border-style: solid;border-bottom-width: 1px;border-left-width: 1px;border-right-width: 1px;border-top-width: 1px;background:white;color: black; "/>
                                </div>
                                <form name="form" id="form" enctype="multipart/form-data" method="post" action="MemberProfile.jsp">                                            
                                    <div class="fileUpload btn btn-primary" style="width: 40%;">
                                        <span>Open Picture</span>
                                        <input type="file" class="upload" id="txtprescription" name="txtprescription"/>
                                    </div>
                                    <input type="submit" value="Upload Picture" id="submit_capture" style="width: 40%;font-size: 14px;border-style: solid;border-color:red;border-bottom-width: 1px;border-left-width: 1px;border-right-width: 1px;border-top-width: 1px;background:white;color: black;"/>
                                    <strong><span id="span_upload"></span></strong>
                                </form>
                                <jsp:include page="Profile_image_action.jsp"/>
                            </center>
                            <center>
                                <span id="update_profile_retrive_span" style=""/>
                                <span id="change_password" style=""/>
                                <strong style="font-size: 90%;"> 
                                    <h6>  Division:&nbsp;<%= division%><br>
                                        District:&nbsp;<%= district%><br>
                                        Blood Group:&nbsp;<%= group%><br>
                                        Contact:&nbsp;<%= mobile%><br>
                                        Address:&nbsp;<%= address%></h6>
                                </strong>
                            </center>
                            <center>
                                <button class="update_profile_retrive"id="update_profile_retrive" style="margin-top: 3%;font-size: 150%;border-style: solid;border-color: red;border-bottom-width: 1px;border-left-width: 1px;border-right-width: 1px;border-top-width: 1px;background:white;width: 60%;text-decoration: none;color: black;" ><strong>Update Profile</strong></button><br>
                                <button id="change_pass_btn" class="change_pass_btn"style="margin-top: 1%;font-size: 150%;border-style: solid;border-color:red;border-bottom-width: 1px;border-left-width: 1px;border-right-width: 1px;border-top-width: 1px;background:white;width: 60%;text-decoration: none;color: black;"><strong>Change Password</strong> </button><br>
                                <form method="post" action="member_logout.jsp">
                                    <button id="logout" style="margin-top: 1%;margin-bottom: 3%;width: 60%;text-decoration: none;font-size: 150%;border-style: solid;border-color:red;border-bottom-width: 1px;border-left-width: 1px;border-right-width: 1px;border-top-width: 1px;background:white; color: black;"><strong>Log out</strong> </button>
                                </form>
                            </center>
                        </div>
                    </td>
                </tr>
            </table>
            <%                }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
            %>   


            <div style="margin-top:0%;background-color: red;height: 25px;width: 100%;">
                <strong style="color: white;text-align: center;margin-left: 10%;">Share an update status</strong><br><br>
            </div>
            <textarea id="content" maxlength="150" placeholder="What's on your mind?" style="margin-top: 2%;margin-left: 20%;height:150px; width: 60%;border-style: solid; border-color: red; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px; border-top-width: 1px;"></textarea>
            <button id="post_status_btn" onclick="status_insert_display(this)"style="margin-left: 20%;height: 40px;width: 60%;margin-top: 3%;border-style: solid; border-color: red; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px; border-top-width: 1px;"><strong>Submit Post</strong></button><br>
            <center><strong> <span id="message"/></strong></center>
            <div style="margin-top:3%;background-color: red;height: 25px;width: 100%;">
                <strong style="color: white;text-align: center;margin-left: 10%;">See update status</strong><br><br>
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
            <div id="" style="background: azure;overflow: auto;margin-left: 10%;margin-right: 10%;width: 80%;margin-top: 2%;border-style: solid; border-color: red; border-bottom-width: 1px; border-left-width: 1px; border-right-width: 1px; border-top-width: 1px;">
                <div>
                    <img src="profile_images/<%= rs2.getString("images")%>" style="margin-top:1%;margin-left: 4%; width: 60px;height: 60px;border-style: solid;border-color:red;border-bottom-width: 1px;border-left-width: 1px;border-right-width: 1px;border-top-width: 1px;"/>
                    <strong style="font-size: 15px;margin-left: 1%;text-align: left;background-color: azure;"><%= rs2.getString("name")%> was posted about: </strong><br>
                    <strong style="font-size: 12px; width: 80%;height: 100%; background-color: azure;color: green; " ><p style="margin-left: 4%;margin-right: 4%;"><%= rs2.getString("data")%></p> </strong><br><br>
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
        <!--  SECTION APPOINTMENT   -->
        <br><br>
        <section class="section-appointment">

            <div class="container wow fadeInUp animated" style="visibility: visible; animation-name: fadeInUp;">

                <div class="row">

                    <div class="col-lg-6 col-md-6 hidden-sm hidden-xs"> 

                        <figure class="appointment-img">
                            <img src="images/appointment.jpg" alt="appointment image">
                        </figure>
                    </div> <!--  end col-lg-6  -->


                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12"> 

                        <div class="appointment-form-wrapper text-center clearfix">
                            <h3 class="join-heading">General People Registration Form</h3>
                            <div class="appoinment-form"> 
                                <div class="form-group col-md-6">
                                    <input id="your_name" class="form-control" placeholder="Name" type="text">
                                </div>
                                <div class="form-group col-md-6">
                                    <input id="your_location" class="form-control" placeholder="His/her district" type="text">
                                </div>
                                <div class="form-group col-md-6">
                                    <input id="your_phone" class="form-control" placeholder="Phone" type="text">
                                </div>
                                <div class="form-group col-md-6">
                                    <div class="select-style">                                    

                                        <select required class="form-control" name="dpBloodGroup" id="dpBloodGroup">
                                            <option value="" selected>Select blood group</option>
                                            <option value="A+">A+</option>
                                            <option value="A-">A-</option>
                                            <option value="A1+">A1+</option>
                                            <option value="A1-">A1-</option>
                                            <option value="A1B+">A1B+</option>
                                            <option value="A1B-">A1B-</option>
                                            <option value="A2+">A2+</option>
                                            <option value="A2-">A2-</option>
                                            <option value="A2B+">A2B+</option>
                                            <option value="A2B-">A2B-</option>
                                            <option value="AB+">AB+</option>
                                            <option value="AB-">AB-</option>
                                            <option value="B+">B+</option>
                                            <option value="B-">B-</option>
                                            <option value="Bombay Blood Group">Bombay Blood Group</option>
                                            <option value="INRA">INRA</option>
                                            <option value="O+">O+</option>
                                            <option value="O-">O-</option>
                                        </select>
                                        <input type='hidden' id='dpBloodGroup' name="dpBloodGroup">
                                    </div>
                                </div>


                                <div class="form-group col-md-12 col-sm-12 col-xs-12">
                                    <textarea id="textarea_message" class="form-control" rows="4" placeholder="Write something about his/her..."></textarea>
                                </div>         

                                <div class="form-group col-md-12 col-sm-12 col-xs-12">
                                    <button id="g_people_btn" class="btn-submit" type="submit">Submit</button>
                                </div>
                                <span id="gpeople_reg"/>
                            </div>

                        </div> <!-- end .appointment-form-wrapper  -->

                    </div> <!--  end .col-lg-6 -->

                </div> <!--  end .row  -->

            </div> <!--  end .container -->

        </section>  <!--  end .appointment-section  -->


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
