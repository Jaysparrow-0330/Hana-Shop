<%-- 
    Document   : createProduct
    Created on : Jan 19, 2021, 6:58:18 PM
    Author     : jack3
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <title>Create Productt</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.1/css/all.css" integrity="sha384-vp86vTRFVJgpjF9jiIGPEEqYqlDwgyBgEF109VFjmqGmIY/Y4HV4d3Gp2irVfcrp" crossorigin="anonymous">
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
            background-repeat: no-repeat;
        }
    </style>


    <!-- Custom styles for this template -->
    <link href="style/cover.css" rel="stylesheet">
    <body>
        <div class="cover-containered d-flex w-100 h-100 p-3 mx-auto flex-column">
            <header class="mb-auto">

                <h3 class="float-md-start mb-0"><img src="image/logohanashop.jpg" width="100" height="100"></h3>
                <nav class="nav nav-masthead justify-content-center float-md-end">
                    <a class="nav-link active" aria-current="page" href="mainPage.jsp">Home</a>
                    <c:if test="${sessionScope.LOGIN_USER == null}">    
                        <a class="nav-link" href="login.jsp">Login</a>
                    </c:if>
                    <c:if test="${sessionScope.LOGIN_USER != null}">

                        <c:if test="${sessionScope.LOGIN_USER.roleID eq 'AD'}">
                            <a class="nav-link" href="MainController?btnAction=Manage">Manage</a>
                        </c:if>

                        <c:if test="${sessionScope.LOGIN_USER.roleID eq 'MB'}">
                            <a class="nav-link" href="MainController?btnAction=Cart">Cart</a>
                        </c:if>>

                        <a class="nav-link" href="MainController?btnAction=Logout">Logout</a>

                    </c:if>
                    <c:if test="${sessionScope.LOGIN_USER != null}">
                        <a class="nav-link" class="nav-link" href="#" style="color: bisque"> ${sessionScope.LOGIN_USER.fullname}</a>
                    </c:if>

                </nav>

            </header><br><br>
            <c:set var="error" value="${requestScope.ERROR}"></c:set>
            <c:set var="categoryMap" value="${sessionScope.CATEGORY_MAP}"/>
            <form action="MainController" class="w3-container w3-card-4 w3-light-grey w3-text-blue w3-margin" method="POST">
                <h2 class="w3-center">Create new Product</h2>

                <div class="w3-row w3-section">
                    <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-hotel"></i></div>
                    <div class="w3-rest">
                        <input class="w3-input w3-border" type="text" name="txtProductID" value="${param.productID}" placeholder="Product ID" required/>${error.productIDError}
                    </div>
                </div>

                <div class="w3-row w3-section">
                    <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-hotel"></i></div>
                    <div class="w3-rest">
                        <input class="w3-input w3-border" type="text" name="txtProductName" value="${param.productName}" placeholder="Product Name" required/>
                    </div>
                </div>
                <div class="w3-row w3-section">
                    <div class="w3-col" style="width:50px"><i class="w3-xxlarge fas fa-window-restore"></i></div>
                    <div class="form-row align-items-center">
                        <div class="col-auto my-1">
                            <label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">Preference</label>
                            <select class="custom-select mr-sm-2" id="inlineFormCustomSelect" name="txtCategory">
                                <c:forEach var="entry" items="${categoryMap}">
                                    
                                   <option value="${entry.key}"<c:if test="${product.category eq entry.value}"> selected</c:if>>${entry.value}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="w3-row w3-section">
                    <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-tags"></i></div>
                    <div class="w3-rest">
                        <input class="w3-input w3-border" type="text" name="txtPrice" value="${param.price}" placeholder="Price" required/>${error.priceError}
                    </div>
                </div>

                <div class="w3-row w3-section">
                    <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-audio-description"></i></div>
                    <div class="w3-rest">
                        <input class="w3-input w3-border" type="text" name="txtDescription" value="${param.description}" placeholder="Drescription"/>${error.descriptionError}
                    </div>
                </div>

                <div class="w3-row w3-section">
                    <div class="w3-col" style="width:50px"><i class="w3-xxlarge fas fa-sort-amount-up-alt"></i></div>
                    <div class="w3-rest">
                        <input class="w3-input w3-border" type="number" name="txtQuantity" value="${param.quantity}" min ="1" placeholder="Quantity" required/>${error.quantityError}
                    </div>
                </div>

                <div class="w3-row w3-section">
                    <div class="w3-col" style="width:50px"><i class="w3-xxlarge fas fa-images"></i></div>
                    <div class="w3-rest">
                        <input class="w3-input w3-border" type="text" name="txtImage" value="${param.image}" placeholder="Link Image" required/>${error.imageError}
                    </div>
                </div>

                <p class="w3-center">
                    <input type="submit" name="btnAction" value="Create" class="w3-button w3-section w3-blue w3-ripple"/>
                    <a href="admin.jsp" class="w3-button w3-section w3-blue w3-ripple">Back</a>
                </p>
            </form>
        </div>
    </body>
</html>