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
            jQuery(document).ready(function ($) {
                $("#datepicker").datepicker();
            });
        </script>
        <script>
            function mobileNumberCheck(txtMobileNumber) {
                var checkMobileNumberPattern = /^\d{11}$/;
                if (!txtMobileNumber.value.match(checkMobileNumberPattern)) {
                    txtMobileNumber.setCustomValidity('Invalid contact number');
                    return false;
                } else {
                    txtMobileNumber.setCustomValidity('');
                    document.txtMobileNumber.focus();
                    return  true;
                }
            }

        </script>
        <script type="text/javascript">
            function RegistrationValidation(form) {// all field validation
                for (var i = 0; i < form.elements.length; i++) {
                    if (form.elements[i].value == "") {
                        window.swal({
                            title: "Error Occured!",
                            text: "Every field is required.",
                            type: "error",
                            confirmButtonText: "Try Again"
                        });
                        return false;
                    } else {
                        return true;
                    }
                }
            }
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
            function checkBloodGroup(dpBloodGroup) {//select blood group
                if (dpBloodGroup.value === "") {
                    dpBloodGroup.setCustomValidity('Please select blood group');
                    document.form.bloodGroup.focus();
                } else {
                    dpBloodGroup.setCustomValidity('');
                    return true;
                }
            }
            function checkGender(dpGender) {//select gender
                if (dpGender.value === "") {
                    dpGender.setCustomValidity('Please select gender');
                    document.form.bloodGroup.focus();
                } else {
                    dpGender.setCustomValidity('');
                    return true;
                }
            }

            function checkDistrict(dpDistrict) {//select district
                if (dpDistrict.value === "") {
                    dpDistrict.setCustomValidity('Please select district');
                    document.form.bloodGroup.focus();
                } else {
                    dpDistrict.setCustomValidity('');
                    return true;
                }
            }

            function  checkCategory(category) {//select registered category
                if (category.value === "") {
                    category.setCustomValidity('Please select category');
                    document.form.category.focus();
                } else {
                    category.setCustomValidity('');
                    return true;
                }
            }



        </script>

        <script>
            function strength_or_poor(password) {//password strength or poor verification
                var message;
                if (password.value.length < 8) {
                    message = "Poor";
                } else if (password.value.length > 8 && password.value.length < 12) {
                    message = "Strong";
                } else if (password.value.length > 12) {
                    message = "Too long";
                } else if (password.value.search(/\d/) === -1) {
                    message = "No number";
                } else if (password.value.search(/[a-zA-Z]/) === -1) {
                    message = "No letter";
                } else if (password.value.search(/[^a-zA-Z0-9\!\@\#\$\%\^\&\*\(\)\_\+\.\,\;\:]/) !== -1) {
                    message = "Bad char";
                } else {
                    message = "ok";
                }
                document.getElementById('strength_poor_location').innerText = message;
            }
        </script>

        <script>
            $("#dpBloodGroup").change(function () { //required to insert data both hidden field & jquery function
                $("#dpBloodGroup").val($(this).find('option:selected').val());


            });
        </script>

        <script>
            $("#dpGender").change(function () { //required to insert data both hidden field & jquery function
                $("#dpGender").val($(this).find('option:selected').val());

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
        <script>
            //using ajax for check exists user id
            function checkUserAlreadyExist() {
                var xmlhttp = new XMLHttpRequest();
                var username = document.forms["form"]["txtUserName"].value;
                var url = "user_already_exists.jsp?txtUserName=" + username;
                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {

                        if (xmlhttp.responseText === "User already exists") {
                            document.getElementById("checkUserExistField").style.color = "red";
                        } else {
                            document.getElementById("checkUserExistField").style.color = "red";
                            document.getElementById("checkUserExistField").innerHTML = xmlhttp.responseText;
                        }
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
        <script>
            //using ajax for check exists user id
            function checkEmailAlreadyExist() {
                var xmlhttp = new XMLHttpRequest();
                var username = document.forms["form"]["txtEmailId"].value;
                var url = "email_already_exists.jsp?txtEmailId=" + username;
                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {

                        if (xmlhttp.responseText === "Email already exists")
                            document.getElementById("checkEmailExistField").style.color = "red";
                        else
                            document.getElementById("checkEmailExistField").style.color = "red";
                        document.getElementById("checkEmailExistField").innerHTML = xmlhttp.responseText;
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
        <script>
            function mobileCheck(txtmobile) {
                var mobile_number_validation;
                var checkMobileNumberPattern = /^\d{11}$/;
                if (!txtmobile.value.match(checkMobileNumberPattern)) {
                    mobile_number_validation = "Invalid Number!";
                } else {
                    mobile_number_validation = "Valid  Number....";
                }
                document.getElementById('mobile_number').innerHTML = mobile_number_validation;
            }

        </script>
        <script>
            function emailCheck(txtemail) {
                var email_address_validation;
                var checkEmailId = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                if (!txtemail.value.match(checkEmailId)) {
                    email_address_validation = "Invalid Email!";
                } else {
                    email_address_validation = "Valid Email.....";
                }
                document.getElementById('InvalidEmail').innerHTML = email_address_validation;
            }

        </script>
        <!-------ajax post request------->
        <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#submit").click(function () {
                    var Username = $("#memberusername").val();
                    var Password = $("#showpassword").val();
                    $.post("AdminLoginAction.jsp", {ajax_username: Username, ajax_password: Password}, function (data) {
                        $("#loginspan_id").html(data);
                        document.getElementById('memberusername').value = null;
                        document.getElementById('showpassword').value = null;

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

                        <div class="col-md-8 col-sm-12">
                            <%
                                String username = (String) session.getAttribute("txtUserName");
                                if (username == null) {
                                    username = "";
                                }
                            %>
                            <%
                                String password = (String) session.getAttribute("password");
                                if (password == null) {
                                    password = "";
                                }
                            %>
                            <table>
                                <tr>
                                    <td>
                                        <input style="margin-top: 3px;border-style: solid;border-color: red;border-bottom-width: 1px;border-left-width: 1px;border-right-width: 1px;border-top-width: 1px;width: 120px;height: 24px;" value="<%= username%>"id="memberusername" name="memberusername" class="form-control"placeholder="Enter User Name" type="text">
                                    </td>
                                    <td>
                                        <input style="border-style: solid;border-color: red;border-bottom-width: 1px;border-left-width: 1px;border-right-width: 1px;border-top-width: 1px;margin-top: 3px;margin-left: 3px;width: 120px;height: 24px;" value="<%= password%>" id="showpassword" class="form-control" placeholder="Enter Password" type="password">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div style="margin-top: -10px;">
                                            <a  href="#"></a>
                                        </div>
                                    </td>
                                    <td>
                                        <div style="margin-top: -10px;">
                                            <button style="border-style: solid;border-color: red;border-bottom-width: 1px;border-left-width: 1px;border-right-width: 1px;border-top-width: 1px;margin-left: 3px;width: 120px;margin-top:0px;color:orangered;height: 24px;background-image: url('images/Capture.PNG');" id="submit" class=""></button>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <span id="loginspan_id" style="color: yellow;"/>
                        </div>
                        <div>
                        </div>
                        <div class="col-md-4col-sm-12">
                            <img style="margin-top: 3px;" src="images/logob4l.png" alt="">
                        </div> 
                    </div>
                </div> <!--  end .container -->
            </div> <!--  end .top-bar  -->
        </header> 
        <!-- end main-header  -->

   
    <!-- START FOOTER  -->
    <br><br><br><br><br><br><br><br><br><br><br><br>
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
                    <center>
                        <p class="copyright-text"> Copyright © 2017,February.All Right Reserved - by Shadath </p>
                    </center>
                </div> <!-- end .row  -->                                    

            </div> <!--  end .container  -->

        </section> <!--  end .footer-content  -->

    </footer>

    <!-- END FOOTER  -->

    <!-- Back To Top Button  -->

    <a id="backTop" class="custom" style="right: 24px; bottom: 24px; position: fixed; display: block;">Back To Top</a>
</body></html>
