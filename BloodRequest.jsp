<%-- 
    Document   : Home
    Created on : Aug 2, 2017, 2:29:48 PM
    Author     : 14cseshadath
--%>

<%@page import="java.io.DataInputStream"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
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
        <!--        <link href="css/bootstrap.min.css" rel="stylesheet"/>-->

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
        <script type="text/javascript">

            var submitField = {//select country-division-district
                "Bangladesh": {
                    "Barisal": ["Barguna", "Barisal", "Bhola", "Jhalokati", "Patuakhali", "Pirojpur"],
                    "Dhaka": ["Dhaka", "Faridpur", "Gazipur", "Gopalganj", "Jamalpur", "Kishoreganj", "Madaripur", "Manikgang", "Munshigang", "Tangail"],
                    "Chittagong": ["Bandarbon", "Brahmonbaria", "Chandpur", "Chittagong", "Comilla", "Coxsbazar", "Feni", "Khagrachhari", "Lakshmipur", "Noakhali", "Rangamati"],
                    "Khulna": ["Bagherhat", "Cuadanga", "Jessore", "Jhinaida", "Khulna", "Shatkhira", "Narail"],
                    "Rajshahi": ["Bogra", "Jaipurhat", "Naogoan", "Natore", " Naoabganj", "Pabna", "Rajshahi", "Shirajganj"],
                    "Rangpur": ["Dinajpur", "Gaibandha", "Kurigram", "Lalmonirhat", "Nilphamari", "Panchgharh", "Rangpur", "Thakurgaong"],
                    "Sylhet": ["Hobiganj", "Moulovibazar", "Sunamganj", "Sylhet"]
                }
            };
            window.onload = function () { //select country-division-district
                var countrySel = document.getElementById("dpCountry");
                var divisionSel = document.getElementById("dpState");
                var districtSel = document.getElementById("dpDistrict");
                for (var country in submitField) {
                    countrySel.options[countrySel.options.length] = new Option(country, country);
                }
                countrySel.onchange = function () {
                    divisionSel.length = 1;
                    districtSel.length = 1;
                    if (this.selectedIndex < 1)
                        return;//done
                    for (var state in submitField[this.value]) {
                        divisionSel.options[divisionSel.options.length] = new Option(state, state);
                    }
                };
                countrySel.onchange();
                divisionSel.onchange = function () {
                    districtSel.length = 1;
                    if (this.selectedIndex < 1)
                        return;
                    var district = submitField[countrySel.value][this.value];
                    for (var i = 0; i < district.length; i++) {
                        districtSel.options[districtSel.options.length] = new Option(district[i], district[i]);
                    }
                };

            };
        </script>
        <script>
            $("#dpBloodGroup").change(function () { //required to insert data both hidden field & jquery function
                $("#dpBloodGroup").val($(this).find('option:selected').val());
            });
        </script>

        <script>
            $("#dpCountry").change(function () {
                $("#dpCountry").val($(this).find('option:selected').val());

            });
        </script>
        <script>
            $("#dpState").change(function () {
                $("#dpState").val($(this).find('option:selected').val());

            });
        </script>
        <script>
            $("#dpDistrict").change(function () {
                $("#dpDistrict").val($(this).find('option:selected').val());
            });
        </script>
        <!-------ajax post request------->
        <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
        <script>//
            $(document).ready(function () {
                $("#btn_submit").click(function () {
                    var group = $("#dpBloodGroup").val();
                    var country = $("#dpCountry").val();
                    var division = $("#dpState").val();
                    var district = $("#dpDistrict").val();
                    var date = $("#datepicker").val();
                    var amount = $("#txtamount").val();
                    var contact = $("#txtMobileNumber").val();
                    var username = $("#username").val();
                    var user_id = $("#user_id").val();


                    $.post("BloodRequestAction.jsp", {ajax_group: group, ajax_country: country, ajax_division: division, ajax_district: district, ajax_date: date, ajax_amount: amount, ajax_contact: contact, ajax_username: username, ajax_userid: user_id}, function (data) {
                        $("#blood_request").html(data);
                        document.getElementById('datepicker').value = null;
                        document.getElementById('txtamount').value = null;
                        document.getElementById('txtMobileNumber').value = null;
                    });
                });
            });
        </script>


        <link rel="stylesheet" href="css/jquery-ui.css">
        <link rel="stylesheet" href="css/style.css">
        <script src="js/jquery-1.12.4.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script>
            jQuery(document).ready(function ($) {
                $("#datepicker").datepicker();
            });
        </script>
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
        </style>
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
                            <input type="hidden" value="<%= rs.getString("txtFullName")%>" name="username" id="username"/>
                            <input type="hidden" value="<%= rs.getString("memberusername")%>" name="user_id" id="user_id"/>

                            <%
                                        String username = request.getParameter("username");
                                        session.setAttribute("username", username);

                                        String user_id = request.getParameter("user_id");
                                        session.setAttribute("user_id", user_id);
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
                                        <a href="AdminProfile.jsp">Admin</a>
                                    </li>
                                    <li>
                                        <a href="MemberProfile.jsp">Member</a>
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
            <section class="section-appointment">
                <div class="container wow fadeInUp animated" style="visibility: visible; animation-name: fadeInUp;">
                    <div class="appointment-form-wrapper text-center clearfix">
                        <h3 class="join-heading">Blood Request Form</h3>                        
                        <div  class="appoinment-form" name="from" id="form"> 
                            <div class="form-group col-md-6">
                                <form name="form" id="form" enctype="multipart/form-data" method="post" action="BloodRequest.jsp">                                            
                                    <div class="select-style"> 
                                        <div class="fileUpload btn btn-primary">
                                            <span>Patient or Prescription capture</span>
                                            <input type="file" class="upload" id="txtprescription" name="txtprescription"/>
                                        </div>
                                        <input type="submit" value="Upload capture" id="submit_capture" style="border-style: solid;border-color: #006dcc;border-bottom-width: 1px;border-left-width: 1px;border-right-width: 1px;border-top-width: 1px;background:#0081c2;color: white;"/>
                                        <strong><span id="span_upload"></span></strong>
                                    </div>
                                </form>
                                <%
                                    String saveFile = "";
                                    String contentType = request.getContentType();
                                    if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
                                        DataInputStream in = new DataInputStream(request.getInputStream());
                                        int formDataLength = request.getContentLength();
                                        byte dataBytes[] = new byte[formDataLength];
                                        int byteRead = 0;
                                        int totalBytesRead = 0;
                                        while (totalBytesRead < formDataLength) {
                                            byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                                            totalBytesRead += byteRead;
                                        }
                                        String file = new String(dataBytes);
                                        saveFile = file.substring(file.indexOf("filename=\"") + 10);
                                        saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
                                        saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));
                                        int lastIndex = contentType.lastIndexOf("=");
                                        String boundary = contentType.substring(lastIndex + 1, contentType.length());
                                        int pos;
                                        pos = file.indexOf("filename=\"");
                                        pos = file.indexOf("\n", pos) + 1;
                                        pos = file.indexOf("\n", pos) + 1;
                                        pos = file.indexOf("\n", pos) + 1;
                                        int boundaryLocation = file.indexOf(boundary, pos) - 4;
                                        int startPos = ((file.substring(0, pos)).getBytes()).length;
                                        int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
                                        File ff = new File("C:/Users/14cseshadath/Documents/NetBeansProjects/Blood 4 Life/web/blood_request_images/" + saveFile);

                                        FileOutputStream fileOut = new FileOutputStream(ff);
                                        fileOut.write(dataBytes, startPos, (endPos - startPos));
                                        fileOut.flush();
                                        fileOut.close();

                                        PreparedStatement psmnt = null;
                                        String user_id = (String) session.getAttribute("memberusername");
                                        try {
                                            Class.forName("com.mysql.jdbc.Driver").newInstance();
                                            Connection connection = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/blood4life", "root", "root");
                                          
                                            psmnt = (PreparedStatement) connection.prepareStatement("insert into prescription_capture(path,capture,username) values(?,?,?)");
                                            psmnt.setString(1, ff.getName());
                                            psmnt.setString(2, ff.getPath());
                                            psmnt.setString(3, user_id);

                                            int s = psmnt.executeUpdate();
                                            if (s > 0) {
                                                out.println("Capture uploaded successfully....");
                                            } else {
                                                out.println("Capture upload failed.....");
                                            }
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                    }

                                %>
                            </div>
                            <div class="form-group col-md-6" >
                                <div class="select-style">                                    
                                    <select required class="form-control" name="dpBloodGroup" id="dpBloodGroup">
                                        <option value="" selected>Select Blood Group</option>
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


                            <div class="form-group col-md-6">
                                <div class="select-style">                                    
                                    <select required class="form-control" name="dpCountry" id="dpCountry">
                                        <option value="" selected>Select country first</option>
                                    </select>
                                    <input type='hidden' id='dpCountry' name="dpCountry">
                                </div>
                            </div>


                            <div class="form-group col-md-6">
                                <input required id="datepicker" name="datepicker" name="datepicker" class="form-control" placeholder="Enter required date" type="text">
                            </div>

                            <div class="form-group col-md-6">
                                <div class="select-style">                                    
                                    <select class="form-control" required name="dpState" id="dpState">
                                        <option value="" selected>Current division</option>
                                    </select>
                                    <input type='hidden' id='dpState' name="dpState">
                                </div>
                            </div>


                            <div class="form-group col-md-6">
                                <div class="select-style">                                    
                                    <input required type="text" placeholder="Enter required amount" class="form-control" name="txtamount" id="txtamount" onkeyup="mobileCheck(this)"/>
                                </div>
                            </div>


                            <div class="form-group col-md-6">
                                <div class="select-style">                                    
                                    <select class="form-control" required name="dpDistrict" id="dpDistrict">
                                        <option value="" selected>Current district</option>
                                    </select>
                                    <input type='hidden' id='dpDistrict' name="dpDistrict">
                                </div>
                            </div>

                            <div class="form-group col-md-6">
                                <div class="select-style">                                    
                                    <input required type="text" placeholder="Enter contact number" class="form-control" name="txtMobileNumber" id="txtMobileNumber" onkeyup="mobileCheck(this)"/>
                                </div>
                            </div>


                            <div class="form-group col-md-12 col-sm-12 col-xs-12">
                                <button id="btn_submit" class="btn-submit" style="color: black;">Submit Request</button><br>
                            </div>
                            <div class="form-group col-md-12 col-sm-12 col-xs-12">
                                <strong><span id="blood_request"/></strong>
                            </div>
                        </div>
                    </div> <!-- end .appointment-form-wrapper  -->
                </div> <!--  end .container -->
            </section>  <!--  end .appointment-section  -->
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
