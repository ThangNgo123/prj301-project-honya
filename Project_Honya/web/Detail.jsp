
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
                <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
                <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>-->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <style>
            .gallery-wrap .img-big-wrap img {
                height: 450px;
                width: auto;
                display: inline-block;
                cursor: zoom-in;
            }


            .gallery-wrap .img-small-wrap .item-gallery {
                width: 60px;
                height: 60px;
                border: 1px solid #ddd;
                margin: 7px 2px;
                display: inline-block;
                overflow: hidden;
            }

            .gallery-wrap .img-small-wrap {
                text-align: center;
            }
            .gallery-wrap .img-small-wrap img {
                max-width: 100%;
                max-height: 100%;
                object-fit: cover;
                border-radius: 4px;
                cursor: zoom-in;
            }
            .img-big-wrap img{
                width: 100% !important;
                height: auto !important;
            }
            .mt-100{
                margin-top: 100px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include> 
            <div class="container mt-100">
                <div class="row">
                <jsp:include page="Left.jsp"></jsp:include>

                    <div class="col-sm-9 ">
                        <div class="container">
                            <div class="card">
                                <div class="row">
                                    <aside class="col-sm-5 border-right">
                                        <article class="gallery-wrap"> 
                                            <div class="img-big-wrap">
                                                <div> <a href="#"><img class="img-fluid" src="${detail.image}"></a></div>
                                        </div> <!-- slider-product.// -->
                                        <div class="img-small-wrap">
                                        </div> <!-- slider-nav.// -->
                                    </article> <!-- gallery-wrap .end// -->
                                </aside>
                                <aside class="col-sm-7">
                                    <article class="card-body p-5">
                                        <h3 class="title mb-3">${detail.name}</h3>

                                        <p class="price-detail-wrap"> 
                                            <span class="price h3 text-danger"> 
                                                <span class="money">${detail.price}$</span>
                                            </span> 
                                            <!--<span>/per kg</span>--> 
                                        </p> <!-- price-detail-wrap .// -->
                                        <dl class="item-property">
                                            <dt>Description</dt>
                                            <dd><p>${detail.description} </p></dd>
                                        </dl>


                                        <hr>
                                        <form action="buyProduct">
                                            <div class="row">
                                                <div class="col-sm-5">
                                                    <dl class="param param-inline">

                                                        <input type="hidden" value="${detail.id}" name="id" class="form-control" required readonly>
                                                        <dt>Quantity: </dt>
                                                        <dd>
                                                            <input type="${detail.quantity == 0 ? "hidden":"number"}" value="1" name="quantity" min="1" max=${detail.quantity} >
                                                            <c:if test="${detail.quantity==0}">
                                                                <p class="text-danger">Sold out</p>
                                                            </c:if>
                                                        </dd>
                                                    </dl> 
                                                </div> <!-- col.// -->

                                            </div> <!-- row.// -->
                                            <hr>

                                            <input type="submit" class="btn btn-lg btn-primary text-uppercase ${detail.quantity == 0 ? "disabled":""}" value="Buy now">
                                        </form>
                                    </article> <!-- card-body.// -->
                                </aside> <!-- col.// -->
                            </div> <!-- row.// -->
                        </div> <!-- card.// -->


                    </div>
                </div>
            </div>
        </div>


        <!-- tabs -->
        <div class="container">
            <div class="row"  style="margin-top:25px">
                <div class="col-sm-3">

                </div>
                <div class="col-sm-9 ">
                    <nav>
                        <div class="nav nav-tabs " id="nav-tab" role="tablist">
                            <button class="nav-link active text-dark " id="nav-description-tab" data-bs-toggle="tab" data-bs-target="#nav-description" type="button" role="tab" aria-controls="nav-description" aria-selected="true">Information</button>
                            <button class="nav-link text-dark" id="nav-review-tab" data-bs-toggle="tab" data-bs-target="#nav-review" type="button" role="tab" aria-controls="nav-review" aria-selected="false">Reviews (${countAllReview })</button>
                        </div>
                    </nav>
                    <div class="tab-content" id="nav-tabContent">

                        <div class="tab-pane fade show active" id="nav-description" role="tabpanel" aria-labelledby="nav-description-tab">
                            <div style="margin-top:12px">
                                <h5>${detail.name}</h5>
                                <h6>$${String.format("%.02f",detail.price*0.9) }</h6>
                                <p class="pt-1">${detail.description}</p>   
                            </div> 
                        </div>


                        <div class="tab-pane fade" id="nav-review" role="tabpanel" aria-labelledby="nav-review-tab">

                            <!-- Your review -->
                            <div>

                                <div class="md-form md-outline">
                                    <label for="writeReview"><h5 class="mt-4">Review Book</h5></label>
                                    <textarea id="writeReview" class="md-textarea form-control pr-6" placeholder="Write Review Book" rows="4"></textarea>

                                </div>

                                <div class="text-right pb-2" style="margin-top: 10px">
                                    <button type="button" class="btn btn-outline-danger" onclick="addReview(${detail.id})">Post</button>
                                </div>

                            </div>
                            <!-- Your review -->

                            <c:forEach items="${listAllReview}" var="r">

                                <div class="media mt-3 mb-4">
                                    <img class="d-flex mr-3 z-depth-1" src="https://www.kitmiles.co.uk/wp-content/uploads/2021/07/update-details-icon-account-page.jpg.jpg.webp"
                                         width="62" alt="Generic placeholder image">
                                    <div class="media-body">
                                        <div class="d-flex justify-content-between">
                                            <p class="mt-1 mb-2">
                                                <c:forEach items="${listAllAcount}" var="a">
                                                    <c:if test="${r.accountID == a.id }">
                                                        <strong>${a.user } </strong>
                                                    </c:if>
                                                </c:forEach>
                                                <span>– </span><span>${r.dateReview }</span>
                                            </p>
                                        </div>
                                        <p class="mb-0">${r.contentReview }</p>
                                    </div>
                                </div>
                                <hr>    

                            </c:forEach>


                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!-- tabs -->

        <!-- Related Books -->
        <div class="container" style="width: 80%">
            <div class="row" style="margin-top:25px">

                <div>
                    <h2 class="text-capitalize" style="text-align:left;" id="moiNhat">Related Books</h2>
                </div>

                <div class="col-sm-12">
                    <div id="contentRelatedBooks" class="row">
                        <c:forEach items="${listRelatedBooks}" var="n">
                            <div class=" col-12 col-md-6 col-lg-3 productRelatedBooks">
                                <div class="card">
                                    <div class="view zoom z-depth-2 rounded">
                                        <img class="img-fluid w-100" src="${n.image}" alt="Card image cap">

                                    </div>
                                    <div class="card-body">
                                        <h4 class="card-title show_txt"><a class="link-dark" href="detail?pid=${n.id}" title="View Product">${n.name}</a></h4>
                                        <p class="card-text show_txt">${n.title}</p>
                                        <div class="row">
                                            <div class="col">
                                                <p class="btn btn-success btn-block">${n.price} $</p>
                                            </div> 
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <div style="margin-top: 20px" class="d-grid mx-auto col-4">
                        <button onclick="loadMoreRelatedBooks(${detail.cateID})" class="btn btn-outline-danger">Load More</button>
                    </div>
                </div>

            </div>
        </div>
        <!-- Related Books -->

        <jsp:include page="Footer.jsp"></jsp:include>

            <script>
                function addReview(pID) {
                    var cntReview = document.getElementById("writeReview").value;
                    $.ajax({
                        url: "/Project_Honya/addReviewControl",
                        type: "get", //send it through get method
                        data: {
                            productID: pID,
                            contentReview: cntReview
                        },
                        success: function (data) {
                            var row = document.getElementById("nav-review");
                            row.innerHTML += data;
                        },
                        error: function (xhr) {
                            //Do Something to handle error
                        }
                    });
                }

                function loadMoreRelatedBooks(cateID) {
                    var amount = document.getElementsByClassName("productRelatedBooks").length;
                    $.ajax({
                        url: "/Project_Honya/loadMoreRelatedBooks",
                        type: "get", //send it through get method

                        data: {
                            exits: amount,
                            cid: cateID
                        },
                        success: function (data) {
                            var row = document.getElementById("contentRelatedBooks");
                            row.innerHTML += data;
                        },
                        error: function (xhr) {

                        }
                    });
                }
        </script>
        <!-- SCRIPTS -->
        <!-- JQuery -->
        <script src="../../../js/jquery-3.4.1.min.js"></script>
        <!-- Bootstrap tooltips -->
        <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/popper.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/bootstrap.js"></script>
        <!-- MDB core JavaScript -->
        <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/mdb.min.js"></script>
        <!-- MDB Ecommerce JavaScript -->
        <script type="text/javascript" src="https://mdbootstrap.com/previews/ecommerce-demo/js/mdb.ecommerce.min.js"></script>
        <script>
                $(document).ready(function () {
                    // MDB Lightbox Init
                    $(function () {
                        $("#mdb-lightbox-ui").load("../../../mdb-addons/mdb-lightbox-ui.html");
                    });
                });
        </script>
    </body>
</html>
