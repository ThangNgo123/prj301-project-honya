
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--begin of menu-->

<style>
    .img-fluid{
        width: 750px;
        height: 320px;

    }

    .jumbotron{
        height: 400px;
        margin-top: 55px;
    }
</style>
<nav class="navbar navbar-expand-md navbar-dark bg-danger fixed-top">
    <div class="container">
        <div class="navbar-header col-md-3">
            <a class="navbar-brand" href="home"> HonYa</a>
            <!--            <a style="text-decoration: none; color: white" class="active" href="home" role="button">Home</a>-->
        </div>
        <div class="col-md-6">
            <form action="search" method="post" class="form-inline my-2 my-lg-0">
                <div  class="input-group input-group-sm">
                    <input style="padding-right: 300px;" value="${txtS}" name="txt" type="text" class="form-control" aria-label="Small" aria-describedby="inputGroup-sizing-sm" placeholder="Search...">
                    <div class="input-group-append">
                        <button type="submit" class="btn btn-secondary btn-number">
                            <i class="fa fa-search"></i>
                        </button>
                    </div>
                </div>

            </form>
        </div>


        <div class="navbar-nav col-md-3">
            <div class="nav-item">
                <!--                <a class="btn btn-success btn-sm mr-2 mt-1" href="Cart.jsp">
                                    <i class="fa fa-shopping-cart"></i> Cart
                                    <span class="badge badge-light" id="amountCart" ></span>
                                </a>-->

                <a class="btn btn-success btn-sm ml-3" style="margin-right: 10px" href="managercart">
                    <i class="fa fa-shopping-cart"></i> <span style="font-size: 18.5px;">Cart</span>
                    <b><span id="amountCart" class="badge badge-light" style="color:black; font-size: 12px;"></span></b>
                </a>
            </div>
            <div class="dropdown nav-item">
                <button id="account-dropdown" class="btn btn-primary dropdown-toggle" type="button" data-bs-toggle="dropdown" >
                    Account
                </button>

                <ul class="dropdown-menu" aria-labelledby="account-dropdown">
                    <c:if test="${sessionScope.ac!=null}">
                        <li><a class="dropdown-item" href="#">${sessionScope.ac.user}</a></li>
                        </c:if>

                    <c:if test="${sessionScope.ac==null}">
                        <li><a class="dropdown-item" href="Login.jsp">Login</a></li>
                        </c:if>

                    <c:if test="${sessionScope.ac!=null}">
                        <li><a class="dropdown-item" href="myOrder">My Orders</a></li>
                        </c:if>

                    <c:if test="${sessionScope.ac.isAdmin==1}">
                        <li><a class="dropdown-item" href="dashBoard">DashBoard Admin</a></li>
                        </c:if>

                    <c:if test="${sessionScope.ac.isSell==1}">
                        <li><a class="dropdown-item" href="dashBoard">DashBoard Seller</a></li>
                        </c:if>

                    <c:if test="${sessionScope.ac!=null}">
                        <li><a class="dropdown-item" href="logout">Logout</a></li>
                        </c:if>

                </ul>
            </div>
        </div>


    </div>
</nav>
<!--<section class="jumbotron text-center">
    <div class="container">
        <h1 class="jumbotron-heading">Cung cấp giáo trình tiếng Nhật chất lượng đảm bảo từ cơ bản đến nâng cao</h1>
        <p class="lead text-muted mb-0">Sách đảm bảo chất lượng, hình ảnh thật, cam kết sản phẩm như hình</p>
    </div>
</section>-->
<!--<section class="jumbotron jumbotron-fluid text-center">
    <div class="container">
        <h1 class="display-4 jumbotron-heading">Cung cấp giáo trình tiếng Nhật chất lượng đảm bảo từ cơ bản đến nâng cao</h1>
        <p class="lead">Sách đảm bảo chất lượng, hình ảnh thật, cam kết sản phẩm như hình</p>
    </div>
</section>-->

<!--end of menu-->
