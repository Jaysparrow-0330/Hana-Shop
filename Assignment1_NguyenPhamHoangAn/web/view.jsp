<%-- 
    Document   : view.jsp
    Created on : Jan 19, 2021, 8:44:51 AM
    Author     : jack3
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hana Steak & Wine</title>
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
    </head>
     <body class="d-flex h-100 text-center text-white bg-dark" data-new-gr-c-s-check-loaded="14.991.0" data-gr-ext-installed="">

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
                        </c:if>

                        <a class="nav-link" href="MainController?btnAction=Logout">Logout</a>

                    </c:if>
                    <c:if test="${sessionScope.LOGIN_USER != null}">
                        <a class="nav-link" class="nav-link" href="#" style="color: bisque"> ${sessionScope.LOGIN_USER.fullname}</a>
                    </c:if>

                </nav>

            </header><br><br>
             <div class="mc-menu" style="background-color:rgba(86, 55, 40, 0.5); " > 
                                
                                  
                                        <div class="mc-piced">
                                            <a  href="#"  ><img src="${param.PRODUCT_IMAGE_LINK}" width="400" height="480"></a>
                                        </div>
                                        <div class="mc-readed" >
                                         
                                            <h3 class="mc-name">${param.PRODUCT_NAME}</h3>
                                            <p class="mc-info">${param.PRODUCT_DESCRIPTION}</p>
                                            <br>
                                            <h4>Available : ${param.PRODUCT_QUANTITY}</h4>
                                            <input type="number"  name="prodQuantity" value="1" required min="0"/>
                                            <br><br><br><br><br><br><br><br>
                                            <h4>Price $</h4>
                                            <h4>${param.PRODUCT_PRICE}</h4>
                                            
                                            <br><br>
                                            <c:if test="${sessionScope.LOGIN_USER == null}">
                                                <a class="mc-btn" href="login.jsp" >LOGIN TO ORDER</a>
                                            </c:if>
                                            <c:if test="${sessionScope.LOGIN_USER.roleID eq 'MB'}">
                                                <c:url var="add" value="MainController" >
                                                <c:param name="btnAction" value="AddProd"/>    
                                                <c:param name="PRODUCT_ID" value="${param.PRODUCT_ID}"/>
                                                <c:param name="PRODUCT_NAME" value="${param.PRODUCT_NAME}"/>
                                                <c:param name="PRODUCT_CATE" value="${param.PRODUCT_CATE}"/>
                                                <c:param name="PRODUCT_QUANTITY" value="${prodQuantity}"/>
                                                <c:param name="PRODUCT_IMAGE_LINK" value="${param.PRODUCT_IMAGE_LINK}"/>
                                                <c:param name="PRODUCT_DATE" value="${param.PRODUCT_DATE}"/>
                                                <c:param name="PRODUCT_PRICE" value="${param.PRODUCT_PRICE}"/>
                                                <c:param name="PRODUCT_STATUS" value="${param.PRODUCT_STATUS}"/>
                                                <c:param name="PRODUCT_DESCRIPTION" value="${param.PRODUCT_DESCRIPTION}"/>
                                               
                                                
                                                </c:url>
                                                 <a class="mc-btn" href="${add}" >ADD TO CART</a>
                                               
                                            </c:if>
                                            <c:if test="${sessionScope.LOGIN_USER.roleID eq 'AD'}">
                                                <a class="mc-btn" href="MainController?btnAction=Manage" >MANAGE ITEMS</a>
                                            </c:if>
                                        </div>
                                    
                               
                            </div>
            </div>
    </body>
</html>
