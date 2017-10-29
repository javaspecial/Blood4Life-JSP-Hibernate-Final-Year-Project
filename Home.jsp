<%-- 
    Document   : Home
    Created on : Aug 2, 2017, 2:29:48 PM
    Author     : 14cseshadath
--%>

<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="java.io.OutputStream"%>
<%@page import="com.mysql.jdbc.Blob"%>
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
        <!--        notification api-->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
        <script src="js/jquery.min.js"></script>
        <%
            String user_id = (String) session.getAttribute("memberusername");
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection connections = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/blood4life", "root", "root");
                Statement statements = (Statement) connections.createStatement();

                ResultSet rs = statements.executeQuery("SELECT seen, SUM(id_no) FROM bloodrequest WHERE seen NOT LIKE '%" + user_id + "%'  ");
                while (rs.next()) {

                    String seen_id_no = rs.getString("SUM(id_no)");
                    session.setAttribute("seen_id_no", seen_id_no);

                }
            } catch (Exception e) {
                e.printStackTrace();
            }


        %>

        <script>
            $(document).ready(function () {
                // ANIMATEDLY DISPLAY THE NOTIFICATION COUNTER.
            <%                String seen_id_no = (String) session.getAttribute("seen_id_no");
                if (seen_id_no == null) {
                    seen_id_no = "";
                }
            %>
                $('#noti_Counter')
                        .css({opacity: 0})
                        .text('<%= seen_id_no%>')// ADD DYNAMIC VALUE (YOU CAN EXTRACT DATA FROM DATABASE OR XML).
                        .css({top: '-10px'})
                        .animate({top: '-2px', opacity: 1}, 500);
                $('#noti_Button').click(function () {
                    // TOGGLE (SHOW OR HIDE) NOTIFICATION WINDOW.
                    $('#notifications').fadeToggle('fast', 'linear', function () {
                        if ($('#notifications').is(':hidden')) {
                            $('#noti_Button').css('background-color', 'yellow');
                        } else
                            $('#noti_Button').css('background-color', '#FFF'); // CHANGE BACKGROUND COLOR OF THE BUTTON.
                    });
                    $('#noti_Counter').fadeOut('slow'); // HIDE THE COUNTER.
                    return false;
                });
                // HIDE NOTIFICATIONS WHEN CLICKED ANYWHERE ON THE PAGE.
                $(document).click(function () {
                    $('#notifications').hide();
                    // CHECK IF NOTIFICATION COUNTER IS HIDDEN.
                    if ($('#noti_Counter').is(':hidden')) {
                        // CHANGE BACKGROUND COLOR OF THE BUTTON.
                        $('#noti_Button').css('background-color', '#2E467C');
                    }
                });
                $('#notifications').click(function () {
                    return false; // DO NOTHING WHEN CONTAINER IS CLICKED.
                });
            });
        </script>

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
        <style>
            #GooglePlus{
                border-style: solid; 
                border-color: red; 
                height: 27px; 
                width: 54px;
                background-image: url('images/google-plus.png');
            }
            #twitter{
                border-style: solid;
                border-color: red;
                height: 27px;
                width: 54px;
                background-image: url('images/twitter.png');
            }
            /*            notification*/
            ul {
                display:block;
                list-style:none;
                margin:0;
                padding:12px 10px;
                height:21px;
            }
            ul li {
                float:left;
                font:13px helvetica;
                font-weight:bold;
                margin:3px 0;
            }
            ul li a {
                color:#FFF;
                text-decoration:none;
                padding:6px 15px;
                cursor:pointer;
            }
            ul li a:hover {
                background:#425B90;
                text-decoration:none;
                cursor:pointer;
            }

            #noti_Container {
                position:relative;
            }

            /* A CIRCLE LIKE BUTTON IN THE TOP MENU. */
            #noti_Button {
                width:22px;
                height:22px;
                line-height:22px;
                border-radius:50%;
                -moz-border-radius:50%; 
                -webkit-border-radius:50%;
                background:#FFF;
                margin:-3px 10px 0 10px;
                cursor:pointer;
            }

            /* THE POPULAR RED NOTIFICATIONS COUNTER. */
            #noti_Counter {
                display:block;
                position:absolute;
                background:green;
                color:#FFF;
                font-size:12px;
                font-weight:normal;
                padding:1px 3px;
                margin:-8px 0 0 25px;
                border-radius:2px;
                -moz-border-radius:2px; 
                -webkit-border-radius:2px;
                z-index:1;
            }

            /* THE NOTIFICAIONS WINDOW. THIS REMAINS HIDDEN WHEN THE PAGE LOADS. */
            #notifications {
                display:none;
                width:430px;
                position:absolute;
                top:120px;
                overflow: auto;
                left:0;
                background:#FFF;
                border:solid 1px rgba(100, 100, 100, .20);
                -webkit-box-shadow:0 3px 8px rgba(0, 0, 0, .20);
                z-index: 0;
            }
            /* AN ARROW LIKE STRUCTURE JUST OVER THE NOTIFICATIONS WINDOW */
            #notifications:before {         
                content: '';
                display:block;
                width:0;
                height:0;
                color:transparent;
                border:10px solid #CCC;
                border-color:transparent transparent #FFF;
                margin-top:-20px;
                margin-left:10px;
            }

            h3 {
                display:block;
                color:#333; 
                background:#FFF;
                font-weight:bold;
                font-size:13px;    
                padding:8px;
                margin:0;
                border-bottom:solid 1px rgba(100, 100, 100, .30);
            }

            .seeAll {
                background:#F6F7F8;
                padding:8px;
                font-size:12px;
                font-weight:bold;
                border-top:solid 1px rgba(100, 100, 100, .30);
                text-align:center;
            }
            .seeAll a {
                color:#3b5998;
            }
            .seeAll a:hover {
                background:#F6F7F8;
                color:#3b5998;
                text-decoration:underline;
            }
            #inputString{
                height: 20px;
                border-color: red;
                border-style: solid;
                border-bottom-width: 1px;
                border-top-width: 1px;
                border-left-width: 1px;
                border-right-width: 1px;
            }

            /*            search*/

            .suggestionsBox {
                margin: 0px 0px 0px 0px;
                width: 100%;
                background-color: gold;
                -moz-border-radius: 7px;
                -webkit-border-radius: 7px;
                border: 2px solid #000;
                color: black;
            }
            .suggestionList {
                margin: 0px;
                padding: 0px;
            }
            .suggestionList li {
                margin: 0px 0px 3px 0px;
                padding: 3px;
                cursor: pointer;
            }
            .suggestionList li:hover {
                background-color: #DD45CD;
            }
            /*            search*/
        </style>
        <script src="http://code.jquery.com/jquery-2.1.1.js"></script>
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
        <script type="text/javascript">
            function startshare(platform) {//share social media
                if (platform === 'twitter') {
                    var message = 'Name=' + $('#name').val() + ",\n" + 'Location=' + $('#address').val() + ",\n" + 'Blood group=' + $('#bloodgroup').val() + ",\n" + 'Request amount=' + $('#unit').val() + '-bag/pound' + ",\n" + 'Mobile number=' + $('#mobile').val() + ",\n\n" + 'Please share this post to save a life.';
                    sharetwitter(message);
                } else if (platform === 'GooglePlus') {
                    var message = 'Name=' + $('#name').val() + ",\n" + 'Location=' + $('#address').val() + ",\n" + 'Blood group=' + $('#bloodgroup').val() + ",\n" + 'Request amount=' + $('#unit').val() + '-bag/pound' + ",\n" + 'Mobile number=' + $('#mobile').val() + ",\n\n" + 'Please share this post to save a life.';
                    var URL = 'https://plus.google.com';
                    sharegoogleplus(message, URL);
                } else {
                    alert('Invalid refference issue....');
                }
            }
            function sharegoogleplus(message, URL) {
                var shareurl = 'https://plus.google.com/share?' + '&text=' + encodeURIComponent(message) + '&url=' + encodeURIComponent(URL);
                sharecore(shareurl);
            }

            function sharetwitter(message) {
                var shareurl = 'https://twitter.com/intent/tweet?text=' + encodeURIComponent(message) + '&url=' + encodeURIComponent('https://www.blood4life.com');
                sharecore(shareurl);
            }

            function sharecore(shareurl) {
                var newpage = window.open(shareurl, '_blank');
                if (newpage) {
                    newpage.focus();
                } // new window opened successfully
                else {
                    window.location = shareurl;
                } // browser blocked the new window, so redirect the current window instead
            }
        </script>
        <!--      //search-->
        <script type="text/javascript" src="js/jquery-1.4.2.js"></script>
        <script type="text/javascript">
            function lookup(inputString) {

                if (inputString.length === 0) {
                    $('#suggestions').hide();
                } else {
                    $.post("search_member_into_textfield_action.jsp", {queryString: "" + inputString + ""}, function (data) {
                        if (data.length > 0) {
                            $('#suggestions').show();
                            $('#autoSuggestionsList').html(data);
                        }
                    });
                }
            }
            function fill(thisValue) {
                $('#inputString').val(thisValue);
                setTimeout("$('#suggestions').hide();", 200);
            }
        </script>
        <!-------ajax post request------->
        <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#noti_Button").click(function () {
                    $.post("seen_notification_action.jsp", function () {
                    });
                });
            });
        </script>
        <!-------ajax post request------->
        <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
        <script>
            function visit_profile(id) {
                $.post("MemberProfileVisit.jsp", {ajax_id: id}, function (data) {
                    $("#span_visit_profile").html(data);
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
                    <jsp:include page="cookie_session_expire.jsp"/>
                    <div id="row">
                        <table style="margin: 0 auto;">
                            <tr>
                                <td>
                                    <input style="color: black;" type="text" placeholder="Search by donor name" id="inputString" onkeyup="lookup(this.value);" onblur="fill();"/>
                                    <div class="suggestionsBox" id="suggestions" style="display: none;">
                                        <div class="suggestionList" id="autoSuggestionsList"></div>
                                    </div>
                                </td>
                                <td>
                                    <ul>
                                        <li id="noti_Container">
                                            <div id="noti_Counter"></div>   <!--SHOW NOTIFICATIONS COUNT.-->
                                            <!--A CIRCLE LIKE BUTTON TO DISPLAY NOTIFICATION DROPDOWN.-->
                                            <button  id="noti_Button" class="noti_Button">&nbsp;&nbsp;&nbsp;&nbsp;Notification </button>    
                                            <!--THE NOTIFICAIONS DROPDOWN BOX.-->
                                            <div id="notifications">
                                                <h3>Notifications</h3>
                                                <div style="height:300px;">

                                                    <%
                                                        ResultSet rs4 = null;
                                                        PreparedStatement psmnt4 = null;
                                                        Connection connection4 = null;
                                                        String userid = (String) session.getAttribute("memberusername");

                                                        try {
                                                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                                                            connection4 = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/blood4life", "root", "root");
                                                            psmnt4 = (PreparedStatement) connection4.prepareStatement("SELECT * FROM bloodrequest,registrationtable WHERE bloodrequest.user_id = registrationtable.memberusername AND seen NOT LIKE '%" + userid + "%' ");
                                                            rs4 = psmnt4.executeQuery();
                                                            while (rs4.next()) {
                                                                String name = rs4.getString("username");
                                                                String group = rs4.getString("dpBloodGroup");

                                                    %>
                                                    <br> 
                                                    <img src="profile_images/<%= rs4.getString("images")%>" style="margin-top:3px;margin-left: 5px; width: 25px;height: 25px;border-style: solid;border-color:red;border-bottom-width: 1px;border-left-width: 1px;border-right-width: 1px;border-top-width: 1px;"/>
                                                    <strong style="color: black;margin-left: 5%;margin-top: 100px;"><%= name%> requested for <%= group%> blood</strong><br>

                                                    <%
                                                            }
                                                        } catch (Exception ex) {
                                                            ex.printStackTrace();
                                                        }
                                                    %>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </td>
                            </tr>
                        </table>
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
                            <span id="span_visit_profile"/>
                        </div>
                    </div>

                </section></div>

        </header> 
        <!-- end main-header  -->

        <!--  SECTION COUNTER member view   -->
        <div style="height: 620px;overflow: auto;">
            <section class="section-counter" data-stellar-background-ratio="0.3" style="background-position: 0px -565.635px;">
                <div class="container wow fadeInUp animated" style="visibility: visible; animation-name: fadeInUp;">
                    <div class="row section-heading-wrapper">
                        <div class="col-md-12 col-sm-12 text-center">
                            <h2 class="section-heading" style="color: white;">Our Blood Donor's</h2>
                        </div> <!-- end .col-sm-10  -->                      
                    </div> <!-- end .row  -->
                    <div class="row">
                        <%
                            ResultSet rs1 = null;
                            PreparedStatement psmnt1 = null;
                            Connection connection1 = null;
                            try {
                                Class.forName("com.mysql.jdbc.Driver").newInstance();
                                connection1 = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/blood4life", "root", "root");
                                psmnt1 = (PreparedStatement) connection1.prepareStatement("SELECT * FROM registrationtable WHERE memberusername = username");
                                rs1 = psmnt1.executeQuery();
                                while (rs1.next()) {

                                    String ato_inc_id = rs1.getString("id");

                                    String ok = rs1.getString("images");
                                    session.setAttribute(ok, "ok");

                                    String profile_name = rs1.getString("txtFullName");
                                    session.setAttribute(profile_name, "profile_name");

                                    String profile_blood_group = rs1.getString("dpBloodGroup");
                                    session.setAttribute(profile_blood_group, "profile_blood_group");

                                    String profile_contact = rs1.getString("txtMobileNumber");
                                    session.setAttribute(profile_contact, "profile_contact");


                        %>  
                        <div class="col-lg-4 col-md-offset-0 col-md-4 col-md-offset-0 col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1">
                            <div style="margin-top: 5px;" class="team-layout-1">       
                                <!--               small size <div class="col-lg-4 col-md-4 col-sm-12">-->

                                <figure class="team-member">
                                    <a href="#" title="Visit Profile">
                                        <img src="profile_images/<%= ok%>" height="300" width="300"/>
                                    </a>
                                </figure> <!-- end. team-member  -->
                                <!--                               </div>-->
                                <article class="team-info" style="background: #f8f9fa;">
                                    <input title="View Profile" style="border-style: solid;border-color:red;border-bottom-width: 1px;border-top-width: 1px;border-left-width: 1px;border-right-width: 1px;" type="submit" value="<%= profile_name%>" id="visit<%= ato_inc_id%>" onclick="visit_profile(<%= ato_inc_id%>)"/>                                 
                                    <h5><strong>Blood Group:&nbsp;&nbsp;<%= profile_blood_group%></strong></h5>
                                    <h5><strong>Contact:&nbsp;&nbsp;<%= profile_contact%></strong></h5>
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
        </div>
        <!--  end .section-counter -->  
        <!--        section display blood request-->
        <section class="section-content-block">
            <div class="container">
                <div class="row section-heading-wrapper">
                    <div class="col-md-12 col-sm-12 text-center">
                        <h2 class="section-heading" style="color: black;">ALL BLOOD REQUEST</h2>
                    </div> <!-- end .col-sm-10  -->                      
                </div> <!-- end .row  -->
                <div class="row">
                    <jsp:include page="deleteBloodRequestAutomatically.jsp"/>

                    <%
                        ResultSet rs3 = null;
                        PreparedStatement psmnt3 = null;
                        Connection connection3 = null;

                        try {
                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                            connection3 = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/blood4life", "root", "root");
                            psmnt3 = (PreparedStatement) connection3.prepareStatement("SELECT * FROM bloodrequest,prescription_capture  WHERE   bloodrequest.user_id = prescription_capture.username AND bloodrequest.image_id = prescription_capture.id  ");
                            rs3 = psmnt3.executeQuery();
                            while (rs3.next()) {

                                String image_path = rs3.getString("path");

                                String profile_name = rs3.getString("username");
                                String curr_date = rs3.getString("currentDate");
                                String req_date = rs3.getString("txtDOB");

                                String bgroup = rs3.getString("dpBloodGroup");
                                String req_amount = rs3.getString("txtHowManyUnits");
                                String location = rs3.getString("dpDistrict");
                                String mcontact = rs3.getString("txtMobileNumber");
                    %>

                    <div class="col-lg-4 col-md-offset-0 col-md-4 col-md-offset-0 col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1">
                        <div style="margin-top: 5px;" class="team-layout-1">       
                            <!--               small size <div class="col-lg-4 col-md-4 col-sm-12">-->

                            <figure class="team-member">
                                <a href="#" title="Patient capture">
                                    <center><img src="blood_request_images/<%= image_path%>" style="height: 150px;border-style: solid;border-color:red;border-bottom-width: 1px;border-left-width: 1px;border-right-width: 1px;border-top-width: 1px;" alt="Capture identify truthness"/></center>
                                </a>
                            </figure> <!-- end. team-member  -->
                            <!--                               </div>-->
                            <article class="team-info" style="background: #f8f9fa;border-style: solid;border-color:red;border-bottom-width: 1px;border-left-width: 1px;border-right-width: 1px;">
                                <h3> <a href="#"><%= profile_name%></a>
                                    <input type="hidden" id="name" value="<%= profile_name%>"/>
                                </h3> 
                                <strong>Requested at:&nbsp;&nbsp;&nbsp;<%= curr_date%></strong><br>
                                <strong>Required Date:&nbsp;&nbsp;&nbsp;<%= req_date%></strong>
                                <div> <strong>Blood group:&nbsp;<%= bgroup%></strong></div>
                                <input type="hidden" id="bloodgroup" value="<%= bgroup%>"/>
                                <div>  <strong> Amount:&nbsp;<%= req_amount%></strong></div>
                                <input type="hidden" id="unit" value="<%= req_amount%>"/>
                                <div>  <strong> Location :&nbsp;<%= location%></strong></div>
                                <input type="hidden" id="address" value="<%= location%>"/>
                                <div>  <strong> Contact:&nbsp;<%= mcontact%></strong></div>
                                <input type="hidden" id="mobile" value="<%= mcontact%>"/><br>
                                <strong> Share request on</strong>&nbsp;&nbsp;<button id= "twitter"  onclick="startshare('twitter')" ></i></button>
                                <button id= "GooglePlus"  onclick="startshare('GooglePlus')"></i></button>
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
        <!--                    end display blood reuest-->
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
