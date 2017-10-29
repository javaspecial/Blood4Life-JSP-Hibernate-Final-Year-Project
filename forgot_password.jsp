<%@ page import="net.tanesha.recaptcha.ReCaptcha"%>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory"%>

<%-- 
Document   : Home
Created on : Aug 2, 2017, 2:29:48 PM
Author     : 14cseshadath
--%>

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

        <!-- The styles -->
        <script src="js/sweetalert.min.js"></script>
        <link rel="stylesheet" type="text/css" href="css/sweetalert.css">

        <link rel="stylesheet" href="css/bootstrap.css">
        <link href="css/font-awesome.css" rel="stylesheet" type="text/css">
        <link href="css/animate.css" rel="stylesheet" type="text/css">
        <link href="css/owl.css" rel="stylesheet" type="text/css">
        <link href="css/venobox.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="css/styles.css">

        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="jquery-3.0.0.js" type="text/javascript"></script>
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

        <link rel="stylesheet" href="css/jquery-ui.css">
        <link rel="stylesheet" href="css/style.css">
        <script src="js/jquery-1.12.4.js"></script>
        <script src="js/jquery-ui.js"></script>


        <script>
            function mobileCheck(txtmobile) {
                var mobile_number_validation;
                var checkMobileNumberPattern = /^\d{11}$/;
                if (!txtmobile.value.match(checkMobileNumberPattern)) {
                    mobile_number_validation = "You entered an invalid number!";
                } else {
                    mobile_number_validation = "Valid  Number"
                }
                document.getElementById('mobile_number').innerHTML = mobile_number_validation;
            }

        </script>
        <script>
            function emailCheck(txtemail) {
                var email_address_validation;
                var checkEmailId = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                if (!txtemail.value.match(checkEmailId)) {
                    email_address_validation = "You entered an invalid email!"
                } else {
                    email_address_validation = "Valid Email";
                }
                document.getElementById('email_address').innerHTML = email_address_validation;
            }

        </script>
        <script>
            //using ajax for check exists user id
            function checkExist() {
                var xmlhttp = new XMLHttpRequest();
                var username = document.forms["form"]["txtUserName"].value;
                var url = "gotuserid_ajax_calling.jsp?txtUserName=" + username;
                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {

                        if (xmlhttp.responseText === "Correct userid") {
                            document.getElementById("user_id").style.color = "white";
                        } else {
                            document.getElementById("user_id").style.color = "white";
                        }
                        document.getElementById("user_id").innerHTML = xmlhttp.responseText;
                    }

                };
                try {
                    //using get metthod to check database username
                    xmlhttp.open("GET", url, true);
                    xmlhttp.send();
                } catch (e) {
                    alert("unable to connect to server");
                }
            }
        </script>
        <!-------ajax post request------->
        <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#submit_forgot_pass").click(function () {
                    var email = $("#txtemail").val();
                    var mobile = $("#txtmobile").val();
                    var username = $("#txtUserName").val();

                    $.post("forgot_password_reset_action.jsp", {ajax_email : email,ajax_mobile : mobile,ajax_username : username}, function (data) {
                        $("#resetspan_id").html(data);
                        document.getElementById('txtemail').value = null;
                        document.getElementById('txtmobile').value = null;
                        document.getElementById('txtemail').focus();

                    });
                });
            });
        </script>
    </head>
    <body style=""> 

        <div id="preloader" style="display: none;">
            <span class="margin-bottom"><img src="images/loader.gif" alt=""></span>
        </div>

        <!--  HEADER -->

        <header class="main-header clearfix" data-sticky_header="1">

            <div class="top-bar clearfix">

                <div class="container">

                    <div class="row">


                    </div>
                </div> <!--  end .container -->
            </div> <!--  end .top-bar  -->
        </header> 
        <!-- end main-header  -->

        <!--  SECTION APPOINTMENT   -->  
    <center>
        <div>
            <section class="section-appointment">
                <div class="container wow fadeInUp animated" style="visibility: visible; animation-name: fadeInUp;">
                    <div class="appointment-form-wrapper text-center clearfix">
                        <h3 class="join-heading">Reset Password</h3>
                        <!--  <form name="form" method="post" action="forgot_password_reset_action.jsp">-->
                        <div class="form-group col-md-6">
                            <input required  id="txtemail" name="txtemail" placeholder="Enter Email Address" onkeyup="emailCheck(this)"  class ="form-control" type="email"/>
                        </div>
                        <div class="form-group col-md-6">
                            <input required  id="txtmobile" name="txtmobile"  placeholder="Enter Your Contact" onkeyup="mobileCheck(this)"  class ="form-control"  type="text"/>
                        </div>
                        <div class="form-group col-md-6">
                            <input required id="txtUserName" name="txtUserName"  placeholder="Enter User ID" class="form-control"  type="text">
                        </div>
                        <div class="form-group col-md-6">
                            <button id="submit_forgot_pass" class="btn-submit" style="color: black;">Reset Your Password</button><br>
                        </div>

                        <!--                        </form>-->
                    </div> <!--  end .container -->
                    <span id="resetspan_id"></span>
                    <div id="email_address" style="background-color: red;color: white;text-align: center"></div>
                    <div id="mobile_number" style="margin-top: 4px;background-color: red;color: white;text-align: center"></div>
                    <div id="user_id" style="margin-top: 4px;background-color: red;color: white;text-align: center"></div>
            </section>  <!--  end .appointment-section  -->
        </div>
    </center>


    <!--  end .section-counter -->  
</body></html>
