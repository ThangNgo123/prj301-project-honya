<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Bootstrap Table with Add and Delete Row Feature</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <style>
            body {
                color: #404E67;
                background: #F5F7FA;
                font-family: 'Open Sans', sans-serif;
            }
            .table-wrapper {
                width: 700px;
                margin: 30px auto;
                background: #fff;
                padding: 20px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-title {
                padding-bottom: 10px;
                margin: 0 0 10px;
            }
            .table-title h2 {
                margin: 6px 0 0;
                font-size: 22px;
            }
            .table-title .add-new {
                float: right;
                height: 30px;
                font-weight: bold;
                font-size: 12px;
                text-shadow: none;
                min-width: 100px;
                border-radius: 50px;
                line-height: 13px;
            }
            .table-title .add-new i {
                margin-right: 4px;
            }
            table.table {
                table-layout: fixed;
            }
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
            }
            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }
            table.table th:last-child {
                width: 100px;
            }
            table.table td a {
                cursor: pointer;
                display: inline-block;
                margin: 0 5px;
                min-width: 24px;
            }
            table.table td a.add {
                color: #27C46B;
            }
            table.table td a.edit {
                color: #FFC107;
            }
            table.table td a.delete {
                color: #E34724;
            }
            table.table td i {
                font-size: 19px;
            }
            table.table td a.add i {
                font-size: 24px;
                margin-right: -1px;
                position: relative;
                top: 3px;
            }
            table.table .form-control {
                height: 32px;
                line-height: 32px;
                box-shadow: none;
                border-radius: 2px;
            }
            table.table .form-control.error {
                border-color: #f50000;
            }
            table.table td .add {
                display: none;
            }
            .con{
                margin-top: 100px;
            }
        </style>

    </head>
    <body>
        <jsp:include page="Menu.jsp"></jsp:include>
            <div class="con container-lg">
                <div class="table-responsive">
                    <div class="table-wrapper">
                        <div class="table-title">
                            <div class="row">
                                <div class="col-sm-8"><h2>Manager <b>Accounts</b></h2></div>
                                <div class="col-sm-4">
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

    </body>
</html>