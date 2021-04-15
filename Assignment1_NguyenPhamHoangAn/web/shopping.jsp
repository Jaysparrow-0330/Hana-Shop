<%-- 
    Document   : shopping
    Created on : Jan 18, 2021, 3:12:37 AM
    Author     : jack3
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hana Steak & Wine</title> <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/cover/">



        <!-- Bootstrap core CSS -->
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
                            <a class="nav-link" href="cart.jsp">Cart</a>
                        </c:if>

                        <a class="nav-link" href="MainController?btnAction=Logout">Logout</a>

                    </c:if>
                    <c:if test="${sessionScope.LOGIN_USER != null}">
                        <a class="nav-link" class="nav-link" href="#" style="color: bisque"> ${sessionScope.LOGIN_USER.fullname}</a>
                    </c:if>

                </nav>

            </header><br><br>


            <c:set var="productList" value="${requestScope.PRODUCT_LIST}"/>
            <c:set var="cart" value="${sessionScope.CART}"/>
            <c:choose>
                <c:when test="${not empty productList}">
                    <c:set var="categoryMap" value="${requestScope.CATEGORY_MAP}"/>

                    <div class="feature" >
                        <div class="mc">
                            <div class="title" >
                                <h1 style="font-size: 70px">◘ Hana Steak & Wine's Menu ◘</h1>
                                <br><br>
                                <form action="MainController" method="post">
                                    <div class="row">
                                        <div class="col-lg-12">
                                            <div class="row">
                                                <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                                                    <input type="text" class="form-control search-slt" name="productName" placeholder="Item Name" value="${requestScope.SEARCH_NAME}">
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                                                    <select class="form-control search-slt" name="searchProductCategory" id="category_cmb">
                                                        <option value="none">Select Category</option>
                                                        <c:forEach var="entry" items="${requestScope.CATEGORY_MAP}">
                                                            <option value="${entry.key}"<c:if test="${requestScope.SEARCH_CATEGORY eq entry.key}">selected</c:if> >${entry.value}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                                                    <select class="form-control search-slt" id="price_range_cmb" name="searchProductPriceRange">
                                                        <option value="none">Select Price Range</option>
                                                        <option value="0-50">Under 50</option>
                                                        <option value="50-100">50 - 100</option>
                                                        <option value="100-300">100 - 300</option>
                                                        <option value="300-500">300 - 500</option>
                                                        <option value="500">Over 500</option>
                                                    </select>
                                                </div>
                                                <div class="col-lg-3 col-md-3 col-sm-12 p-0">

                                                    <button type="submit" class="btn btn-lg btn-secondary fw-bold border-white bg-white" name="btnAction" value="Search">Search</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form><br><br> 
                            </div><br>

                            <div class="mc-menu" style="background-color:rgba(86, 55, 40, 0.5); " > 
                                <c:forEach var="product" items="${productList}" varStatus="counter"> 
                                    <form class="mc-each" action="MainController" method="POST">
                                        <c:url var="prod" value="view.jsp">

                                            <c:param name="PRODUCT_ID" value="${product.productID}"/>
                                            <c:param name="PRODUCT_NAME" value="${product.name}"/>
                                            <c:param name="PRODUCT_CATE" value="${product.category}"/>
                                            <c:param name="PRODUCT_QUANTITY" value="1"/>
                                            <c:param name="PRODUCT_IMAGE_LINK" value="${product.imageLink}"/>
                                            <c:param name="PRODUCT_DATE" value="${product.createDate}"/>
                                            <c:param name="PRODUCT_PRICE" value="${product.price}"/>
                                            <c:param name="PRODUCT_STATUS" value="${product.status}"/>
                                            <c:param name="PRODUCT_DESCRIPTION" value="${product.description}"/>="${product.imageLink}"/>
                                        </c:url>

                                        <div class="mc-pic">
                                            <a  href="${prod}"  ><img src="${product.imageLink}" width="300" height="400"></a>
                                        </div>
                                        <div class="mc-read" >

                                            <h3 class="mc-name">${product.name}</h3>
                                            <p class="mc-info">${product.description}</p>
                                            <br>
                                            <h4>Price $</h4>
                                            <h4>${product.price}</h4>
                                            <br>
                                            <c:if test="${sessionScope.LOGIN_USER == null}">
                                                <a class="mc-btn" href="login.jsp" >LOGIN TO ORDER</a>
                                            </c:if>
                                            <c:if test="${sessionScope.LOGIN_USER.roleID eq 'MB'}">
                                                <c:url var="add" value="MainController" >
                                                    <c:param name="btnAction" value="AddProd"/>    
                                                    <c:param name="PRODUCT_ID" value="${product.productID}"/>
                                                    <c:param name="PRODUCT_NAME" value="${product.name}"/>
                                                    <c:param name="PRODUCT_CATE" value="${product.category}"/>
                                                    <c:param name="PRODUCT_QUANTITY" value="1"/>
                                                    <c:param name="PRODUCT_IMAGE_LINK" value="${product.imageLink}"/>
                                                    <c:param name="PRODUCT_DATE" value="${product.createDate}"/>
                                                    <c:param name="PRODUCT_PRICE" value="${product.price}"/>
                                                    <c:param name="PRODUCT_STATUS" value="${product.status}"/>
                                                    <c:param name="PRODUCT_DESCRIPTION" value="${product.description}"/>


                                                </c:url>
                                                <a class="mc-btn" href="${add}" >ADD TO CART</a>

                                            </c:if>
                                            <c:if test="${sessionScope.LOGIN_USER.roleID eq 'AD'}">
                                                <a class="mc-btn" href="MainController?btnAction=Manage" >MANAGE ITEMS</a>
                                            </c:if>
                                        </div>
                                    </form>
                                </c:forEach>   
                            </div>



                        </div>
                    </div>
                    <jsp:useBean id="a" class="js.daos.ProductDAO" scope="request"></jsp:useBean>
                        <div class="paging" >
                            <nav aria-label="Page navigation example" style="text-align: center">
                                <ul class="pagination" >
                                <c:forEach begin="1" end="${a.numberPage}" var="i" >
                                    <li class="page-item" ${indexPage==i?"active":""}><a class="page-link" href="ShoppingController?index=${i}">${i}</a></li>
                                    </c:forEach>

                            </ul>
                        </nav>
                    </div>

                </div>
                <hr>
            </c:when>
            <c:otherwise>
                <h2>The product list is empty</h2><br>
            </c:otherwise>
        </c:choose>
    </div>     
</body>
</html>
