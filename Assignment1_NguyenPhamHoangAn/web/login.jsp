<%-- 
    Document   : login
    Created on : Jan 17, 2021, 1:58:56 PM
    Author     : jack3
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login to HANA</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

        <link href="style/style.css" rel="stylesheet">
    </head>
    <body>
        <c:set var="errorMessage" value="${sessionScope.LOGIN_ERROR}"/>
        <c:if test="${errorMessage != null}">
            <c:if test="${not empty errorMessage}">
                <script>alert("${errorMessage}");</script>
            </c:if>
        </c:if>
        <div class="sidenav">
            <div class="login-main-text">
                <h3> <img src="image/logohanashop.jpg" width="300" height="300"></h3>
                <h2> HANA  <br>  Steak and Wine </h2>
                <p>Login or register from here to access.</p>
            </div>
        </div>
        <div class="main">
            <div class="col-md-6 col-sm-12">
                <div class="login-form">
                    <h1> Sign In to Cuisine Paradise </h1><br><br>
                    <form action="MainController" method = "POST">
                        <div class="form-group" data-validate="Valid username is required">

                            <input type="text" name="username" class="form-control" placeholder="Username" required pattern="[A-Za-z0-9]{3,15}" title="3-15 characters symbols not allowed">
                        </div>
                        <div class="form-group" data-validate="Password is required">

                            <input type="password" name="password" class="form-control" placeholder="Password" required="" pattern="[A-Za-z0-9!@#$%^&*?|\/~]{3,15}" title="3-15 characters & symbols">
                        </div> <br><br>
                        <button type="submit" name="btnAction" value="Login" class="btn btn-black">Login</button>
                        <button type="submit" name="btnAction"  value="Register" class="btn btn-secondary">Register</button>
                    </form>
                </div>
            </div>
        </div>
        <script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script><script src="vendor/jquery/jquery-3.2.1.min.js"></script>

        <script src="vendor/bootstrap/js/popper.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>

        <script src="vendor/select2/select2.min.js"></script>

        <script src="vendor/tilt/tilt.jquery.min.js"></script>
        <script>
                $('.js-tilt').tilt({
                    scale: 1.1
                });
        </script>

        <script async="" src="https://www.googletagmanager.com/gtag/js?id=UA-23581568-13"></script>
        <script>
                window.dataLayer = window.dataLayer || [];
                function gtag() {
                    dataLayer.push(arguments);
                }
                gtag('js', new Date());

                gtag('config', 'UA-23581568-13');
        </script>

        <script src="js/main.js"></script>
    </body>
</html>
