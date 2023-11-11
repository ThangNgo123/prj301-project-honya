<%-- 
    Document   : DashBoardAdmin
    Created on : Oct 30, 2023, 9:44:57 PM
    Author     : asus
--%>
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
        <link rel="stylesheet" type="text/css" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css"><link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&amp;display=swap"><link rel="stylesheet" type="text/css" href="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/css/mdb5/3.8.1/compiled.min.css">
        <link rel="stylesheet" type="text/css" href="https://mdbootstrap.com/wp-content/themes/mdbootstrap4/css/mdb-plugins-gathered.min.css">
        <jsp:useBean id="b" class="dao.DAO" scope="request"></jsp:useBean>

        </head>
        <style>
            body, html {
                height:100%;
            }

            /*
             * Off Canvas sidebar at medium breakpoint
             * --------------------------------------------------
             */
            @media screen and (max-width: 992px) {

                .row-offcanvas {
                    position: relative;
                    -webkit-transition: all 0.25s ease-out;
                    -moz-transition: all 0.25s ease-out;
                    transition: all 0.25s ease-out;
                }

                .row-offcanvas-left
                .sidebar-offcanvas {
                    left: -33%;
                }

                .row-offcanvas-left.active {
                    left: 33%;
                    margin-left: -6px;
                }

                .sidebar-offcanvas {
                    position: absolute;
                    top: 0;
                    width: 33%;
                    height: 100%;
                }
            }

            /*
             * Off Canvas wider at sm breakpoint
             * --------------------------------------------------
             */
            @media screen and (max-width: 34em) {
                .row-offcanvas-left
                .sidebar-offcanvas {
                    left: -45%;
                }

                .row-offcanvas-left.active {
                    left: 45%;
                    margin-left: -6px;
                }

                .sidebar-offcanvas {
                    width: 45%;
                }
            }

            .card {
                overflow:hidden;
            }

            .card-body .rotate {
                z-index: 8;
                float: right;
                height: 100%;
            }

            .card-body .rotate i {
                color: rgba(20, 20, 20, 0.15);
                position: absolute;
                left: 0;
                left: auto;
                right: -10px;
                bottom: 0;
                display: block;
                -webkit-transform: rotate(-44deg);
                -moz-transform: rotate(-44deg);
                -o-transform: rotate(-44deg);
                -ms-transform: rotate(-44deg);
                transform: rotate(-44deg);
            }



            /* Sidebar */
            .sidebar {
                position: fixed;
                top: 0;
                bottom: 0;
                left: 0;
                padding: 58px 0 0; /* Height of navbar */
                box-shadow: 0 2px 5px 0 rgb(0 0 0 / 5%), 0 2px 10px 0 rgb(0 0 0 / 5%);
                width: 240px;
                z-index: 600;
            }

            @media (max-width: 991.98px) {
                .sidebar {
                    width: 100%;
                }
            }
            .sidebar .active {
                border-radius: 5px;
                box-shadow: 0 2px 5px 0 rgb(0 0 0 / 16%), 0 2px 10px 0 rgb(0 0 0 / 12%);
            }

            .sidebar-sticky {
                position: relative;
                top: 0;
                height: calc(100vh - 48px);
                padding-top: 0.5rem;
                overflow-x: hidden;
                overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
            }


            .graphBox{

                position: relative;
                min-height: 200px;
            }
            .graphBox .box{
                position: relative;
                background: white;
                padding: 20px;
                width: 100%;
                box-shadow: 0 7px 25px rgba(0,0,0,0.08);
                border-radius: 20px;
            }


            
            
        </style>

        <body>
            <nav class="navbar fixed-top navbar-expand-md navbar-dark bg-danger mb-3">
                <div class="flex-row d-flex">
                    <button type="button" class="navbar-toggler mr-2 " data-toggle="offcanvas" title="Toggle responsive left sidebar">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <a class="navbar-brand" href="#" title="Free Bootstrap 4 Admin Template">Honya Admin</a>
                </div>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsingNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="navbar-collapse collapse" id="collapsingNavbar">
                    <ul class="navbar-nav">
                        <li class="nav-item active">
                            <a class="nav-link" href="home">Home <span class="sr-only">Home</span></a>
                        </li>
                    </ul>

                </div>
            </nav>
            <div class="container-fluid" id="main">
                <div class="row row-offcanvas row-offcanvas-left" style="margin-top: 35px;">

                <jsp:include page="LeftDashBoard.jsp"></jsp:include>


                    <div class="col main pt-5 mt-3" >

                        <div class="row mb-3">
                            <div class="col-xl-3 col-sm-6 py-2">
                                <div class="card bg-success text-white h-100">
                                    <div class="card-body bg-success">
                                        <div class="rotate">
                                            <i class="fa fa-user fa-4x"></i>
                                        </div>
                                        <h6 class="text-uppercase">Users</h6>
                                        <h1 class="display-4">${totalUser}</h1>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-sm-6 py-2">
                            <div class="card text-white bg-danger h-100">
                                <div class="card-body bg-danger">
                                    <div class="rotate">
                                        <i class="fa fa-book fa-4x"></i>
                                    </div>
                                    <h6 class="text-uppercase">Books</h6>
                                    <h1 class="display-4">${totalProduct}</h1>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-sm-6 py-2">
                            <div class="card text-white bg-info h-100">
                                <div class="card-body bg-info">
                                    <div class="rotate">
                                        <i class="fa fa-comments fa-4x"></i>
                                    </div>
                                    <h6 class="text-uppercase">Comments</h6>
                                    <h1 class="display-4">${totalReview}</h1>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-3 col-sm-6 py-2">
                            <div class="card text-white bg-warning h-100">
                                <div class="card-body">
                                    <div class="rotate">
                                        <i class="fas fa-coins fa-4x"></i>
                                    </div>
                                    <h6 class="text-uppercase">Total Sales</h6>
                                    <h1 class="display-4">${totalSeller}$</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--/row-->



                    <a id="features"></a>
                    <hr>

                    <div class="row my-4">

                        <div class="row mb-3 ">

                            <div class="col-lg-8 border">
                                <canvas id="myChart"></canvas>
                            </div>

                            <div class="col-lg-4 border">
                                <canvas id="myChart2"></canvas>

                            </div>

                        </div>

                    </div>
                    <!--/row-->

                    <div class="row my-4">
                        <div class="card card-default card-body">
                            <ul id="tabsJustified" class="nav nav-tabs nav-justified">
                                <li class="nav-item">
                                    <a class="nav-link link-dark active" href="" data-target="#tab1" data-toggle="tab">Top 5 BestSeller</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link link-dark " href="" data-target="#tab2" data-toggle="tab">Top 5 Customers</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link link-dark" href="" data-target="#tab3" data-toggle="tab">Top 5 Seller</a>
                                </li>
                            </ul>
                            <!--/tabs-->
                            <br>
                            <div id="tabsJustifiedContent" class="tab-content">
                                <div class="tab-pane active" id="tab1">

                                    <div class="table-responsive">
                                        <table class="table table-wrapper">
                                            <thead class="thead-inverse">
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Name</th>
                                                    <th>Price</th>
                                                    <th>Category</th>
                                                    <th>Quantity Sold</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${ListTop5}" var="p">
                                                    <tr>
                                                        <td>${p.id}</td>
                                                        <td>${p.name}</td>
                                                        <td>${p.price}$</td>
                                                        <td>${b.getCategoryName(p.cateID)}</td>
                                                        <td>${p.quantitySold}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                                <div class="tab-pane " id="tab2">
                                    <div class="table-responsive">
                                        <table class="table table-wrapper">
                                            <thead class="thead-inverse">
                                                <tr>
                                                    <th>UserID</th>
                                                    <th>Name</th>
                                                    <th>Total purchase price</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${ListTop5Customers}" var="p">
                                                    <tr>
                                                        <td>${p.userID}</td>
                                                        <td>${p.name}</td>
                                                        <td>${p.tongChiTieu}$</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tab3">

                                    <div class="table-responsive  ">
                                        <table class="table table-wrapper">

                                            <thead class="thead-inverse">
                                                <tr>
                                                    <th>UserID</th>
                                                    <th>Name</th>
                                                    <th>Total sales amount</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${ListTop5Seller}" var="p">
                                                    <tr>
                                                        <td>${p.userID}</td>
                                                        <td>${p.name}</td>
                                                        <td>${p.tongChiTieu}$</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>

                                </div>
                            </div>
                        </div>


                    </div><!--/row-->

                </div>
                <!--/main col-->
            </div>

        </div>
        <!--/.container-->
        <footer class="container-fluid">
            <p class="text-right small">©2016-2018 Company</p>
        </footer>

        <script>
            $(document).ready(function () {

                $('[data-toggle=offcanvas]').click(function () {
                    $('.row-offcanvas').toggleClass('active');
                });
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>

        <script>
            var ctx = document.getElementById('myChart').getContext('2d');
            var myChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    "labels": ["Tháng 12", "Tháng 11", "Tháng 10", "Tháng 9", "Tháng 8", "Tháng 7", "Tháng 6", "Tháng 5", "Tháng 4", "Tháng 3", "Tháng 2", "Tháng 1"],
                    datasets: [{
                            label: 'Doanh Thu',
                            "data": [${totalMoneyMonth12}, ${totalMoneyMonth11}, ${totalMoneyMonth10}, ${totalMoneyMonth9}, ${totalMoneyMonth8}, ${totalMoneyMonth7}, ${totalMoneyMonth6}, ${totalMoneyMonth5}, ${totalMoneyMonth4}, ${totalMoneyMonth3}, ${totalMoneyMonth2}, ${totalMoneyMonth1}],
                            backgroundColor: ["rgba(255, 99, 132, 0.2)", "rgba(255, 159, 64, 0.2)",
                                "rgba(255, 205, 86, 0.2)", "rgba(75, 192, 192, 0.2)", "rgba(54, 162, 235, 0.2)",
                                "rgba(153, 102, 255, 0.2)", "rgba(201, 203, 207, 0.2)", "#99FF99", "#FFFF99", "#FFC1C1", "#FFB5C5", "#DDC488"
                            ],
                            borderColor: ["rgb(255, 99, 132)", "rgb(255, 159, 64)", "rgb(255, 205, 86)",
                                "rgb(75, 192, 192)", "rgb(54, 162, 235)", "rgb(153, 102, 255)", "rgb(201, 203, 207)", "	#66FF99", "#FFFF66", "#EEB4B4", "#EEA9B8", "#ECAB53"
                            ],
                            borderWidth: 1
                        }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        </script>

        <script>
            var ctx = document.getElementById('myChart2').getContext('2d');
            var myChart = new Chart(ctx, {
                type: 'polarArea',
                data: {
                    labels: ["Sunday", "Saturday", "Friday", "Thursday", "Wednesday", "Tuesday", "Monday"],
                    datasets: [{
                            label: 'Doanh Thu',
                            data: [${totalMoney1}, ${totalMoney7}, ${totalMoney6}, ${totalMoney5}, ${totalMoney4}, ${totalMoney3}, ${totalMoney2}],
                            backgroundColor: ["#F7464A", "#46BFBD", "#FDB45C", "#949FB1", "#4D5360", "#1874CD", "#CDB5CD"],
                            hoverBackgroundColor: ["#FF5A5E", "#5AD3D1", "#FFC870", "#A8B3C5", "#616774", "#1E90FF", "#FFE1FF"]

                        }]
                },
                options: {
                    scales: {
                        responsive: true
                    }
                }
            });
        </script>

    </body>
</html>
