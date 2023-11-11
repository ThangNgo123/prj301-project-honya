<%-- 
    Document   : OrderDetail
    Created on : Oct 29, 2023, 1:36:03 AM
    Author     : asus
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <link herf="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link herf="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js">
        <link herf="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
        <link herf="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
        <jsp:useBean id="dao" class="dao.DAO" scope="request"></jsp:useBean>
        </head>
        <style>
            @import url('https://fonts.googleapis.com/css?family=Open+Sans&display=swap');
            /*        body{
                        background-color: #eeeeee;
                        font-family: 'Open Sans',serif
                    }*/
            .container{
                margin-top:50px;
                margin-bottom: 50px
            }
            .card{
                position: relative;
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex;
                -webkit-box-orient: vertical;
                -webkit-box-direction: normal;
                -ms-flex-direction: column;
                flex-direction: column;
                min-width: 0;
                word-wrap: break-word;
                background-color: #fff;
                background-clip: border-box;
                border: 1px solid rgba(0, 0, 0, 0.1);
                border-radius: 0.10rem
            }
            .card-header:first-child{
                border-radius: calc(0.37rem - 1px) calc(0.37rem - 1px) 0 0
            }
            .card-header{
                padding: 0.75rem 1.25rem;
                margin-bottom: 0;
                background-color: #fff;
                border-bottom: 1px solid rgba(0, 0, 0, 0.1)
            }
            .track{
                position: relative;
                background-color: #ddd;
                height: 7px;
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex;
                margin-bottom: 60px;
                margin-top: 50px
            }
            .track .step{
                -webkit-box-flex: 1;
                -ms-flex-positive: 1;
                flex-grow: 1;
                width: 25%;
                margin-top: -18px;
                text-align: center;
                position: relative
            }
            .track .step.active:before{
                background: #FF5722
            }
            .track .step::before{
                height: 7px;
                position: absolute;
                content: "";
                width: 100%;
                left: 0;
                top: 18px
            }
            .track .step.active .icon{
                background: #ee5435;
                color: #fff
            }
            .track .icon{
                display: inline-block;
                width: 40px;
                height: 40px;
                line-height: 40px;
                position: relative;
                border-radius: 100%;
                background: #ddd
            }
            .track .step.active .text{
                font-weight: 400;
                color: #000
            }
            .track .text{
                display: block;
                margin-top: 7px
            }
            .itemside{
                position: relative;
                display: -webkit-box;
                display: -ms-flexbox;
                display: flex;
                width: 100%
            }
            .itemside .aside{
                position: relative;
                -ms-flex-negative: 0;
                flex-shrink: 0
            }
            .img-sm{
                width: 80px;
                height: 80px;
                padding: 7px
            }
            ul.row, ul.row-sm{
                list-style: none;
                padding: 0
            }
            .itemside .info{
                padding-left: 15px;
                padding-right: 7px
            }
            .itemside .title{
                display: block;
                margin-bottom: 5px;
                color: #212529
            }
            p{
                margin-top: 0;
                margin-bottom: 1rem
            }
            .btn-warning{
                color: #ffffff;
                background-color: #ee5435;
                border-color: #ee5435;
                border-radius: 1px
            }
            .btn-warning:hover{
                color: #ffffff;
                background-color: #ff2b00;
                border-color: #ff2b00;
                border-radius: 1px
            }
            .gradient-custom {
                /* fallback for old browsers */
                /*background: red;*/

                /* Chrome 10-25, Safari 5.1-6 */
                /*background: -webkit-linear-gradient(to top left, red, rgba(246, 243, 255, 1));*/

                /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
                /*background: linear-gradient(to top left, rgba(205, 156, 242, 1), rgba(246, 243, 255, 1))*/
            }
        </style>
        <body>
            <script src="https://kit.fontawesome.com/5f5fd6fd49.js" crossorigin="anonymous"></script>
            <div class="container">

                <section class="h-100 gradient-custom">
                    <div class="container py-5">
                        <div class="row d-flex justify-content-center my-4">
                            <div class="col-md-8">
                                <div class="card mb-4">
                                    <div class="card-header py-3">
                                        <h5 class="mb-0">Detail Order</h5>
                                    </div>
                                    <div class="card-body">


                                        <div class="row">
                                            <div class="col-lg-3 col-md-12 mb-4 mb-lg-0">
                                                <!-- Image -->
                                                <div class="bg-image hover-overlay hover-zoom ripple rounded" data-mdb-ripple-color="light">
                                                    <p><strong>Product</strong></p>
                                                </div>
                                                <!-- Image -->
                                            </div>

                                            <div class="col-lg-3 col-md-6 mb-4 mb-lg-0">
                                                <!-- Data -->
                                                <p><strong>Name</strong></p>
                                                <!-- Data -->
                                            </div>

                                            <div class="col-lg-2 col-md-6 mb-4 mb-lg-0">
                                                <!-- Data -->
                                                <p><strong>Quantity</strong></p> 
                                                <!-- Data -->
                                            </div>

                                            <div class="col-lg-2 col-md-6 mb-4 mb-lg-0">
                                                <p><strong>Price</strong></p>
                                            </div>

                                            <div class="col-lg-2 col-md-6 mb-4 mb-lg-0">
                                                <!-- Price -->
                                                <p class="text-start text-md-center">
                                                    <strong>Total</strong>
                                                </p>
                                                <!-- Price -->
                                            </div>
                                        </div>
                                        <!-- Single item -->



                                        <!-- Single item -->
                                    <c:forEach items="${listD}" var="d">
                                        <div class="row">
                                            <div class="col-lg-3 col-md-12 mb-4 mb-lg-0">
                                                <!-- Image -->
                                                <div class="bg-image hover-overlay hover-zoom ripple rounded" data-mdb-ripple-color="light">
                                                    <img src="${dao.getProductById(d.productID).image}"
                                                         class="w-100" alt="Blue Jeans Jacket" />
                                                    <a href="#!">
                                                        <div class="mask" style="background-color: rgba(251, 251, 251, 0.2)"></div>
                                                    </a>
                                                </div>
                                                <!-- Image -->
                                            </div>

                                            <div class="col-lg-3 col-md-6 mb-4 mb-lg-0">
                                                <!-- Data -->
                                                <p>${dao.getProductById(d.productID).name}</p>
                                                <!-- Data -->
                                            </div>

                                            <div class="col-lg-2 col-md-6 mb-4 mb-lg-0">
                                                <!-- Data -->
                                                <p>${d.amount}</p> 
                                                <!-- Data -->
                                            </div>

                                            <div class="col-lg-2 col-md-6 mb-4 mb-lg-0">
                                                <p>${dao.getProductById(d.productID).price}$</p>
                                            </div>

                                            <div class="col-lg-2 col-md-6 mb-4 mb-lg-0">
                                                <!-- Price -->
                                                <p class="text-start text-md-center">
                                                    ${dao.getProductById(d.productID).price * d.amount}$
                                                </p>
                                                <!-- Price -->
                                            </div>
                                        </div>
                                        <!-- Single item -->

                                        <hr class="my-4" />
                                    </c:forEach>

                                </div>
                            </div>
                            <div class="card mb-4">
                                <article class="card">
                                    <header class="card-header"> My Orders / Tracking </header>
                                    <div class="card-body">
                                        <h6>Order ID: #${invoice.maHD}</h6>
                                        <article class="card">
                                            <div class="card-body row">
                                                <div class="col"> <strong>Estimated Delivery time:</strong> <br>${estimateDelivary} </div>
                                                <div class="col"> <strong>Shipping BY:</strong> <br> BLUEDART, | <i class="fa fa-phone"></i> +1598675986 </div>
                                                <div class="col"> <strong>Status:</strong> <br> ${dao.getStatusName(invoice.stid)} </div>
                                                <div class="col"> <strong>Delivery Address:</strong> <br> ${invoice.deliveryAddress} </div>
                                            </div>
                                        </article>
                                        <div class="track">

                                            <c:if test="${invoice.stid==1}">
                                                <div class="step active"> <span class="icon"> <i class="fa fa-check"></i> </span> <span class="text">Order confirmed</span> </div>
                                                <div class="step"> <span class="icon"><i class="fas fa-dolly"></i>  </span> <span class="text"> In Transit</span> </div>
                                                <div class="step"> <span class="icon"><i class="fa fa-truck"></i>  </span> <span class="text"> Out of delivery </span> </div>
                                                <div class="step"> <span class="icon"> <i class="fa fa-box"></i> </span> <span class="text">Delivered</span> </div>
                                            </c:if>

                                            <c:if test="${invoice.stid==2}">
                                                <div class="step active"> <span class="icon"> <i class="fa fa-check"></i> </span> <span class="text">Order confirmed</span> </div>
                                                <div class="step active"> <span class="icon"><i class="fas fa-dolly"></i>  </span> <span class="text"> In Transit</span> </div>
                                                <div class="step"> <span class="icon"><i class="fa fa-truck"></i>  </span> <span class="text"> Out of delivery </span> </div>
                                                <div class="step"> <span class="icon"> <i class="fa fa-box"></i> </span> <span class="text">Delivered</span> </div>
                                            </c:if>

                                            <c:if test="${invoice.stid==3}">
                                                <div class="step active"> <span class="icon"> <i class="fa fa-check"></i> </span> <span class="text">Order confirmed</span> </div>
                                                <div class="step active"> <span class="icon"><i class="fas fa-dolly"></i>  </span> <span class="text"> In Transit</span> </div>
                                                <div class="step active"> <span class="icon"><i class="fa fa-truck"></i>  </span> <span class="text"> Out of delivery </span> </div>
                                                <div class="step"> <span class="icon"> <i class="fa fa-box"></i> </span> <span class="text">Delivered</span> </div>
                                            </c:if>

                                            <c:if test="${invoice.stid==4}">
                                                <div class="step active"> <span class="icon"> <i class="fa fa-check"></i> </span> <span class="text">Order confirmed</span> </div>
                                                <div class="step active"> <span class="icon"><i class="fas fa-dolly"></i>  </span> <span class="text"> In Transit</span> </div>
                                                <div class="step active"> <span class="icon"><i class="fa fa-truck"></i>  </span> <span class="text"> Out of delivery </span> </div>
                                                <div class="step active"> <span class="icon"> <i class="fa fa-box"></i> </span> <span class="text">Delivered</span> </div>
                                            </c:if>

                                            <c:if test="${invoice.stid==5}">
                                                <div class="step active"> <span class="icon"> <i class="fas fa-window-close"></i></span> <span class="text">Cancelled</span> </div>
                                                    </c:if>

                                        </div>
                                            
                                        <c:if test="${l==0}">
                                            <a href="myOrder" class="btn btn-warning" data-abc="true"> <i class="fa fa-chevron-left"></i> Back to orders</a>
                                        </c:if>
                                            
                                        <c:if test="${l==1}">
                                            <a href="managerInvoiceDB" class="btn btn-warning" data-abc="true"> <i class="fa fa-chevron-left"></i> Back to DashBoard</a>
                                        </c:if>
                                            
                                    </div>
                                </article>
                            </div>

                        </div>
                        <div class="col-md-4">
                            <div class="card mb-4">
                                <div class="card-header py-3">
                                    <h5 class="mb-0">Summary</h5>
                                </div>
                                <div class="card-body">
                                    <ul class="list-group list-group-flush">
                                        <li
                                            class="list-group-item d-flex justify-content-between align-items-center px-0 pb-0">
                                            SubTotal
                                            <c:set var="total" value="${0}"/>
                                            <c:forEach var="detail" items="${listD}">
                                                <c:set var="total" value="${total + dao.getProductById(detail.productID).price * detail.amount}" />
                                            </c:forEach>
                                            <span><c:out value="${total}"/>$</span>

                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                                            ${s.name}
                                            <span>${s.price}$</span>
                                        </li>
                                        <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                                            VAT
                                            <span>10%</span>
                                        </li>
                                        <li
                                            class="list-group-item d-flex justify-content-between align-items-center px-0 mb-3">
                                            <div>
                                                <strong>Total amount</strong>
                                                <strong>
                                            </div>
                                            <p class="mb-0"><c:set var="total" value="${total + total*0.1 + s.price }" /></p>
                                            <span><strong><c:out value="${total}"/>$</strong></span>
                                        </li>
                                    </ul>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

        </div>

    </body>
</html>
