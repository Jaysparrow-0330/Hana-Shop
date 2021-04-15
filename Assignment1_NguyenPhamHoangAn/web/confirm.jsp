<%-- 
    Document   : confirm
    Created on : Jan 19, 2021, 9:38:21 PM
    Author     : jack3
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="h-100"><head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Hugo 0.79.0">
        <title>HANA Steak & Wine</title>

        <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/cover/">



        <!-- Bootstrap core CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

        <!-- Favicons -->
        <link rel="apple-touch-icon" href="/docs/5.0/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
        <link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
        <link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
        <link rel="manifest" href="/docs/5.0/assets/img/favicons/manifest.json">
        <link rel="mask-icon" href="/docs/5.0/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
        <link rel="icon" href="/docs/5.0/assets/img/favicons/favicon.ico">
        <meta name="theme-color" content="#7952b3">


        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }
            body{
                background-image: url('image/355-3559242_wine-and-steak-house.jpg');
                background-repeat: no-repeat;
            }
        </style>


        <!-- Custom styles for this template -->
        <link href="style/cover.css" rel="stylesheet">
    </head>
    <body class="d-flex h-100 text-center text-white bg-dark" data-new-gr-c-s-check-loaded="14.991.0" data-gr-ext-installed="">

        <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
            <header class="mb-auto">
                <div>
                    <h3 class="float-md-start mb-0"><img src="image/logohanashop.jpg" width="100" height="100"></h3>
                    <nav class="nav nav-masthead justify-content-center float-md-end">
                        <a class="nav-link active" aria-current="page" href="mainPage.jsp">Home</a>
                        <a class="nav-link" href="MainController?btnAction=Menu">Menu</a>
                        

                            <c:if test="${sessionScope.LOGIN_USER.roleID eq 'MB'}">
                                <a class="nav-link" href="cart.jsp">Cart</a>
                            </c:if>

                            <a class="nav-link" href="MainController?btnAction=Logout">Logout</a>

                   
                        <c:if test="${sessionScope.LOGIN_USER != null}">
                            <a class="nav-link" class="nav-link" href="#" style="color: bisque"> ${sessionScope.LOGIN_USER.fullname}</a>
                        </c:if>

                    </nav>
                </div>
            </header>
                         <c:set var="c" value="${requestScope.CONFIRM}"/>
            <main class="px-3">
                <h1>Thank you for Order at HANA Steak & Wine Restaurant</h1>
                <p class="lead">${c}</p>
                <p class="lead">
                    
                    <c:if test="${sessionScope.LOGIN_USER.roleID eq 'MB'}">
                        <a  href="mainPage.jsp" class="btn btn-lg btn-secondary fw-bold border-white bg-white"> Back To Home Page</a>
                    </c:if>  

                </p>
            </main>

            <footer class="mt-auto text-white-50">
                <p></a>.</p>
            </footer>
        </div>





    </body></html>
