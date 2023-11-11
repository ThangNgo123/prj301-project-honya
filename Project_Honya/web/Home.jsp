

<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
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
        <!------ Include the above in your HEAD tag ---------->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <jsp:useBean id="b" class="dao.DAO" scope="request"></jsp:useBean>
        </head>
        <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <div class="container">
                <div class="row">

                    <div class="col-sm-3" style="margin-top: 100px;">
                        <div class="card bg-light mb-3">

                            <div class="list-group">
                                <a href="#" class="list-group-item bg-danger text-white list-group-item-action" aria-current="true">
                                    Product Categories
                                </a>
                            <c:forEach items="${listC}" var="o">
                                <a href="category?cid=${o.cid}" class="list-group-item list-group-item-action ${tag == o.cid ? "bg-secondary text-white":""}">${o.cname}</a>
                            </c:forEach>
                            <a href="shop" class="list-group-item list-group-item-action">All Products</a>
                        </div>

                    </div>
                </div>

                <div class="col-sm-9" style="margin-top: 46px;">
                    <section class="jumbotron">
                        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                            <div class="carousel-inner ">
                                <div class="carousel-item active">
                                    <img class="img-fluid " src="https://vnjpbook.com/wp-content/uploads/2020/09/shinN2.png" alt="one">
                                    <!--                                <div>
                                                                        <h5>Cung cấp giáo trình tiếng Nhật chất lượng đảm bảo từ cơ bản đến nâng cao</h5>
                                                                        <p>Sách đảm bảo chất lượng, hình ảnh thật, cam kết sản phẩm như hình</p>
                                                                    </div>-->
                                </div>
                                <div class="carousel-item ">
                                    <img class="img-fluid " src="https://edutrip.edu.vn/wp-content/uploads/2021/05/Giao-Trinh-Soumatome-N2-Doc-Hieu-Nghe-Hieu-Han-Tu-Tu-Vung-Ngu-Phap.jpg" alt="two">
                                    <!--                                <div>
                                                                        <h5>Cung cấp giáo trình tiếng Nhật chất lượng đảm bảo từ cơ bản đến nâng cao</h5>
                                                                        <p>Sách đảm bảo chất lượng, hình ảnh thật, cam kết sản phẩm như hình</p>
                                                                    </div>-->
                                </div>
                                <div class="carousel-item">
                                    <img class="img-fluid " src="https://edutrip.edu.vn/wp-content/uploads/2021/05/MUA-GIAO-TRINH-MINNA-NO-NIHONGO-O-DAU-TOT-GIA-RE.jpg" alt="three">
                                    <!--                                <div>
                                                                        <h5>Cung cấp giáo trình tiếng Nhật chất lượng đảm bảo từ cơ bản đến nâng cao</h5>
                                                                        <p>Sách đảm bảo chất lượng, hình ảnh thật, cam kết sản phẩm như hình</p>
                                                                    </div>-->
                                </div>
                            </div>
                            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>

                    </section>
                </div>
            </div>
        </div>
        <div class="container">

            <!-- NEW BOOK -->
            <div class="row" style="margin-top:25px">

                <div class="alert alert-danger" role="alert">
                    <h2 class="text-capitalize" style="text-align:center; width:100%" id="moiNhat">New Books</h2>
                </div>

                <div class="col-sm-12">
                    <div id="contentNewBook" class="row">
                        <c:forEach items="${listN}" var="n">
                            <div class=" col-12 col-md-6 col-lg-3 product">
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
                        <button onclick="loadMoreNewBook()" class="btn btn-outline-danger">Load More</button>
                    </div>
                </div>

            </div>
            <!-- NEW BOOK -->


            <!-- BEST SELLER -->
            <div class="row" style="margin-top:25px">

                <div class="alert alert-danger" role="alert">
                    <h2 class="text-capitalize" style="text-align:center; width:100%" id="moiNhat">Best Seller</h2>
                </div>

                <div class="col-sm-12">
                    <div id="contentBestSeller" class="row">
                        <c:forEach items="${listBestSeller}" var="b">
                            <div class=" col-12 col-md-6 col-lg-3 productBestSeller">
                                <div class="card">
                                    <div class="view zoom z-depth-2 rounded">
                                        <img class="img-fluid w-100" src="${b.image}" alt="Card image cap">

                                    </div>
                                    <div class="card-body">
                                        <h4 class="card-title show_txt"><a class="link-dark" href="detail?pid=${b.id}" title="View Product">${b.name}</a></h4>
                                        <p class="card-text show_txt">${b.title}</p>
                                        <div class="row">
                                            <div class="col">
                                                <p class="btn btn-success btn-block">${b.price} $</p>
                                            </div> 
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <div style="margin-top: 20px" class="d-grid mx-auto col-4">
                        <button onclick="loadMoreBestSeller()" class="btn btn-outline-danger">Load More</button>
                    </div>
                </div>

            </div>
            <!-- BEST SELLER -->

            <!-- COMBO BOOKS -->
            <div class="row" style="margin-top:25px">   

                <div class="alert alert-danger" role="alert">
                    <h2 class="text-capitalize" style="text-align:center; width:100%" id="moiNhat">Combo Books</h2>
                </div>

                <div class="col-sm-12">
                    <div id="contentComboBooks" class="row">
                        <c:forEach items="${listComboBooks}" var="b">
                            <div class=" col-12 col-md-6 col-lg-3 productComboBooks">
                                <div class="card">
                                    <div class="view zoom z-depth-2 rounded">
                                        <img class="img-fluid w-100" src="${b.image}" alt="Card image cap">

                                    </div>
                                    <div class="card-body">
                                        <h4 class="card-title show_txt"><a class="link-dark" href="detail?pid=${b.id}" title="View Product">${b.name}</a></h4>
                                        <p class="card-text show_txt">${b.title}</p>
                                        <div class="row">
                                            <div class="col">
                                                <p class="btn btn-success btn-block">${b.price} $</p>
                                            </div> 
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <div style="margin-top: 20px" class="d-grid mx-auto col-4">
                        <button onclick="loadMoreComboBooks()" class="btn btn-outline-danger">Load More</button>
                    </div>
                </div>

            </div>
            <!-- COMBO BOOKS -->

        </div>

        <jsp:include page="Footer.jsp"></jsp:include>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <script>
                            function loadMoreNewBook() {
                                var amount = document.getElementsByClassName("product").length;
                                $.ajax({
                                    url: "/Project_Honya/loadMoreNewBook",
                                    type: "get", //send it through get method

                                    data: {
                                        exits: amount
                                    },
                                    success: function (data) {
                                        var row = document.getElementById("contentNewBook");
                                        row.innerHTML += data;
                                    },
                                    error: function (xhr) {

                                    }
                                });
                            }

                            function loadMoreBestSeller() {
                                var amount = document.getElementsByClassName("productBestSeller").length;
                                $.ajax({
                                    url: "/Project_Honya/loadMoreBestSeller",
                                    type: "get", //send it through get method

                                    data: {
                                        exits: amount
                                    },
                                    success: function (data) {
                                        var row = document.getElementById("contentBestSeller");
                                        row.innerHTML += data;
                                    },
                                    error: function (xhr) {

                                    }
                                });
                            }

                            function loadMoreComboBooks() {
                                var amount = document.getElementsByClassName("productComboBooks").length;
                                $.ajax({
                                    url: "/Project_Honya/loadMoreComboBooks",
                                    type: "get", //send it through get method

                                    data: {
                                        exits: amount
                                    },
                                    success: function (data) {
                                        var row = document.getElementById("contentComboBooks");
                                        row.innerHTML += data;
                                    },
                                    error: function (xhr) {

                                    }
                                });
                            }
        </script>
    </body>
</html>

