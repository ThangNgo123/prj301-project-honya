<%-- 
    Document   : DashBoardAdmin
    Created on : Oct 30, 2023, 9:44:57 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

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

                <!--                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#myAlert" data-toggle="collapse">Alert</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="" data-target="#myModal" data-toggle="modal">About</a>
                    </li>
                </ul>-->

            </div>
        </nav>
        <div class="container-fluid" id="main">
            <div class="row row-offcanvas row-offcanvas-left" style="margin-top: 35px;">

                <jsp:include page="LeftDashBoard.jsp"></jsp:include>

                    <div class="col main pt-5 mt-3" >


                        <div class="con container-lg ">
                            <div class="row my-4">
                                <div class="table-wrapper">
                                    <div class="table-title">
                                        <div class="row">
                                            <div class="col-sm-10"><h2>Manager <b>Accounts</b></h2></div>
                                            <div class="col-sm-2">
                                                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addAccount">
                                                    Add new Account
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Username</th>
                                                <th>Password</th>
                                                <th>Role</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach items="${listA}" var="a">
                                            <tr>
                                                <td>${a.id}</td>
                                                <td>${a.user}</td>
                                                <td>${a.pass}</td>
                                                <td><div>
                                                        <c:if test="${a.isSell == 0 && a.isAdmin == 0}">
                                                            User
                                                        </c:if>
                                                        <c:if test="${a.isSell == 1}">
                                                            Seller
                                                        </c:if>
                                                        <c:if test="${a.isAdmin == 1}">
                                                            Admin
                                                        </c:if>
                                                    </div></td>

                                                <td>
                                                    <a href="editaccount?aid=${a.id}" class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                                                    <a href="deleteaccount?pid=${a.id}" class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
                                                </td>
                                            </tr>

                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div> 


                    <!-- Modal Add Account -->
                    <div id="addAccount" class="modal fade">

                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form action="addacount">
                                    <div class="modal-header">						
                                        <h4 class="modal-title">Add Account</h4>
                                        <button type="button" class="close" herf="home" data-dismiss="modal"><a href="manageraccount">&times;</a></button>
                                    </div>
                                    <div class="modal-body">					
                                        <div class="form-group">
                                            <label>Username</label>
                                            <input name="user" class="form-control" required></input>
                                        </div>
                                        <div class="form-group">
                                            <label for="pass">Password</label>
                                            <input type="text" name="pass" class="form-control" required>
                                        </div>
                                        <div class="form-group">
                                            <label>Role</label>
                                            <select name = "decentralization">
                                                <option value="1"> User</option>
                                                <option value="2"> Seller</option>
                                                <option value="3"> Admin</option>
                                            </select>
                                        </div>

                                    </div>
                                    <div class="modal-footer">
                                        <input style="padding:5px;" type="button" value="Cancel" onclick="window.location = 'manageraccount'"/>
                                        <input type="submit" class="btn btn-info" value="Save">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>


                    <!--/row-->

                </div><!--/row-->

            </div>
            <!--/main col-->
        </div>

    </div>
    <!--/.container-->
    <footer class="container-fluid">
        <p class="text-right small">©2016-2018 Company</p>
    </footer>


    <!-- Modal -->
    <!--        <div class="modal fade" id="myModal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel">Modal</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">×</span>
                                <span class="sr-only">Close</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p>This is a dashboard layout for Bootstrap 4. This is an example of the Modal component which you can use to show content.
                                Any content can be placed inside the modal and it can use the Bootstrap grid classes.</p>
                            <p>
                                <a href="https://www.codeply.com/go/KrUO8QpyXP" target="_ext">Grab the code at Codeply</a>
                            </p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary-outline" data-dismiss="modal">OK</button>
                        </div>
                    </div>
                </div>
            </div>-->
    <script>
        $(document).ready(function () {

            $('[data-toggle=offcanvas]').click(function () {
                $('.row-offcanvas').toggleClass('active');
            });

        });
    </script>
</body>
</html>
