<%-- 
    Document   : cart
    Created on : Jan 19, 2021, 10:06:15 AM
    Author     : jack3
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hana Steak & Wine</title>
        <link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
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
                background-image: url('image/blur.jpg');
                background-repeat: repeat;
            }
        </style>


        <!-- Custom styles for this template -->
        <link href="style/cover.css" rel="stylesheet">
    </head>
    <body class="d-flex h-100 text-center text-white bg-dark" data-new-gr-c-s-check-loaded="14.991.0" data-gr-ext-installed="">
        <c:set var="productList" value="${requestScope.PRODUCT_LIST}"/>
        <c:set var="cart" value="${sessionScope.CART.cartMap}"/>
        <c:set var="user" value="${sessionScope.LOGIN_USER}"/>
        <c:set var="errorMessage" value="${requestScope.ERROR_MSG}"/>
        <c:set var="totalPrice" value="${0}"/>
        <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
            <header class="mb-auto">
                <div>
                    <h3 class="float-md-start mb-0"><img src="image/logohanashop.jpg" width="100" height="100"></h3>
                    <nav class="nav nav-masthead justify-content-center float-md-end">
                        <a class="nav-link active" aria-current="page" href="mainPage.jsp">Home</a>
                        <a class="nav-link" href="MainController?btnAction=Menu">Menu</a>
                        <c:if test="${sessionScope.LOGIN_USER == null}">    
                            <a class="nav-link" href="login.jsp">Login</a>
                        </c:if>
                        <c:if test="${sessionScope.LOGIN_USER != null}">

                            <c:if test="${sessionScope.LOGIN_USER.roleID eq 'AD'}">
                                <a class="nav-link" href="MainController?btnAction=Manage">Manage</a>
                            </c:if>

                            <c:if test="${sessionScope.LOGIN_USER.roleID eq 'MB'}">
                                <a class="nav-link" href="MainController?btnAction=Cart">Cart</a>
                            </c:if>

                            <a class="nav-link" href="MainController?btnAction=Logout">Logout</a>

                        </c:if>
                        <c:if test="${sessionScope.LOGIN_USER != null}">
                            <a class="nav-link" class="nav-link" href="#" style="color: bisque" > ${sessionScope.LOGIN_USER.fullname}</a>
                        </c:if>

                    </nav>
                </div>
            </header> 
            <br><br><br><br><br>

            <c:if test="${errorMessage != null}">
                <c:if test="${not empty errorMessage}">
                    <center> <span style="color:#a21d1d;font-family: inherit"><b>${errorMessage}</b></span></center>
                            </c:if>
                        </c:if>
            <div class="container" style="background-color: grey;    max-width: 3320px;">
                <div class="row">
                    <div class="col-sm-12 col-md-10 col-md-offset-1" style="    width: 5000px;">
                        <c:if test="${cart!=null}">
                            <c:if test="${not empty cart}">
                                <form class="mc-each" action="MainController" method="POST">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>Item</th>
                                                <th>Quantity</th>
                                                <th class="text-center">Price</th>
                                                <th class="text-center">Total</th>
                                                <th> </th>
                                            </tr>
                                        </thead>



                                        <tbody> 
                                            <c:forEach var="product" items="${cart}" > 
                                                <tr>
                                                    <td class="col-sm-8 col-md-6">
                                                        <div class="media">
                                                            <a class="thumbnail pull-left" href="#"> <img class="media-object" src="${product.value.imageLink}" style="width: 72px; height: 72px;"> </a>
                                                            <div class="media-body">
                                                                <h4 style="text-decoration: none" class="media-heading"><a style="text-decoration: none; color: #333" href="#"></a>${product.value.name}</h4>
                                                                <br>
                                                                <span>Status: </span><span class="text-success"><strong>In Stock</strong></span>
                                                            </div>
                                                        </div></td>
                                                    <td class="col-sm-1 col-md-1" style="text-align: center">
                                                        <input type="number" name="txtQuantity" class="form-control" id="exampleInputEmail1" value="${product.value.quantity}" min="1">
                                                    </td>
                                                    <td class="col-sm-1 col-md-1 text-center"><strong>${product.value.price} $</strong></td>
                                                    <td class="col-sm-1 col-md-1 text-center"><strong>${product.value.price * product.value.quantity}</strong></td>
                                                    <td class="col-sm-1 col-md-1">
                                                        <c:url var="rev" value="MainController" >
                                                            <c:param name="btnAction" value="RemoveProd"/>    
                                                            <c:param name="PRODUCT_ID" value="${product.value.productID}"/>



                                                        </c:url>
                                                        <a class="mc-btn" style="text-decoration: none" href="${rev}" >REMOVE</a>
                                                   
                                                </tr>
                                                <c:set var="totalPrice" value="${totalPrice+product.value.price*product.value.quantity}"/>


                                            </c:forEach>
                                        </tbody>
                                        <tr>
                                            <td>   </td>
                                            <td>   </td>
                                            <td>   </td>
                                            <td><h3>Total</h3></td>
                                            <td class="text-right"><h3><strong>${totalPrice}</strong></h3></td>
                                        </tr>
                                        <tr>
                                            <td>   </td>
                                            <td>   </td>
                                            <td>   </td>

                                            <td><a class="mc-btn" style="text-decoration: none" href="MainController?btnAction=Confirm" >ORDER</a></td>
                                        </tr>


                                    </table>
                                </form>
                            </c:if>
                        </c:if>
                        <c:if test="${cart==null}">
                            <c:if test="${empty cart}">
                                <h1>Empty Cart</h1>
                            </c:if>
                        </c:if>
                    </div>
                </div>
            </div></div>
    </body>
</html>
