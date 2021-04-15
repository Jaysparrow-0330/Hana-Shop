<%-- 
    Document   : manage
    Created on : Jan 19, 2021, 12:13:18 AM
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
    <c:if test="${sessionScope.LOGIN_USER.roleID eq 'AD'}">
        

        <body class="d-flex h-100 text-center text-white bg-dark" data-new-gr-c-s-check-loaded="14.991.0" data-gr-ext-installed="">

           <div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
            <header class="mb-auto">

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
                        <a class="nav-link" class="nav-link" href="#" style="color: bisque"> ${sessionScope.LOGIN_USER.fullname}</a>
                    </c:if>

                </nav>

            </header><br><br>
          
            

            <form action="MainController" method="POST">
                <input type="text" name="SEARCH_VALUE" value="${param.SEARCH_VALUE}">
                <input type="submit" name="btnAction" value="Search Product">
            </form> <br><br>

        <c:set var="productList" value="${requestScope.PRODUCT_LIST}"/>

            <c:choose>
                <c:when test="${not empty productList}">
                    <c:set var="categoryMap" value="${sessionScope.CATEGORY_MAP}"/>
                    
                    <form action="MainController" method="POST">
                        
                        <table  border="1">
                            <thead>
                                <tr>
                                    <th>No.</th>
                                    <th>Name</th>
                                    <th>Category</th>
                                    <th>Quantity</th>
                                    <th>Image Link </th>
                                    <th>Price</th>
                                    <th>Create Date</th>
                                    <th>Available</th>
                                    <th>Description</th>
                                    <th>Update</th>
                                    <th>Delete</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="product" items="${productList}" varStatus="counter">
                                <form action="MainController" method="POST">
                                    <tr>
                                        <td>${counter.count}</td>
                                        <td> <input type="text" name="prodName" value="${product.name}" maxlength="50"> </td>
                                        <td>
                                            <select id="categoryCmb" name="prodCategory">
                                                <c:forEach var="entry" items="${categoryMap}">
                                                    <option value="${entry.key}"<c:if test="${product.category eq entry.value}"> selected</c:if>>${entry.value}</option>
                                                </c:forEach>
                                            </select> 
                                        </td>
                                        <td> <input type="number"  name="prodQuantity" value="${product.quantity}" required min="0"/> </td>
                                        <td> <input type="text"  name="prodImgLink" value="${product.imageLink}"  maxlength="200"/> </td>

                                        <td> <input type="number" name="prodPrice"  value="${product.price}" min="0" required /> </td>
                                        <td> <input type="date" name="prodCreateDate"  value="${product.createDate}"/> </td>
                                        <td><input type="checkbox" name="prodStatus" <c:if test="${product.status == true}">checked</c:if> onclick="return false;"/></td>
                                        <td><input type="text" name="prodDescription" value="${product.description}" maxlength="100"/></td>
                                    <input type="hidden" name="prodID" value="${product.productID}"/>

                                    <td><input type="submit" name="btnAction" value="Update" onclick="return confirm('Do you wish to continue update this product ?');"/></td>
                                    <td><input type="submit" name="btnAction" value="Delete" onclick="return confirm('Do you wish to continue delete this product ?');"/></td>
                                    </tr>
                                </form>
                            </c:forEach>
                            </tbody>
                        </table><br><br>
                    </form>
                </c:when>
                <c:otherwise>
                    <h2>The product list is empty</h2><br>
                </c:otherwise>
            </c:choose>
                     <a class="btn btn-lg btn-secondary fw-bold border-white bg-white" href="MainController?btnAction=ViewCreateProduct">CREATE PRODUCT</a><br>
                     <jsp:useBean id="a" class="js.daos.ProductDAO" scope="request"></jsp:useBean>
                        <div class="paging" >
                            <nav aria-label="Page navigation example" style="text-align: center">
                                <ul class="pagination" >
                                <c:forEach begin="1" end="${a.numberPage}" var="i" >
                                    <li class="page-item" ${indexPage==i?"active":""}><a class="page-link" href="ManageController?index=${i}">${i}</a></li>
                                    </c:forEach>

                            </ul>
                        </nav>
                    </div>

                </div>
                <hr>                  
                   
        </body>
    </c:if>
    <c:if test="${sessionScope.LOGIN_USER.roleID != 'AD'}">
        <h2>Sorry , your account can't access this feature</h2>
        <p class="lead">
             <a class="btn btn-lg btn-secondary fw-bold border-white bg-white" href="mainPage.jsp">Home Page</a>
        </p>
       
        
    </c:if>

    <c:set var="errorMessage" value="${requestScope.SEARCH_ERROR}"/>
    <c:if test="${errorMessage != null}">
        <c:if test="${not empty errorMessage}">
            <script>alert("${errorMessage}");</script>
        </c:if>
    </c:if>
            
    <c:set var="updateMessage" value="${requestScope.UPDATE_MESSAGE}"/>
    <c:if test="${updateMessage != null}">
        <c:if test="${not empty updateMessage}">
            <script>alert("${updateMessage}");</script>
        </c:if>
    </c:if>
           
           </div>
</html>
