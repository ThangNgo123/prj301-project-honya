<%-- 
    Document   : Edit
    Created on : Oct 3, 2023, 3:01:37 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="css/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 120px;
            }
        </style>
    <body>
        <div class="container">

            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="updateaccount">
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit Account</h4>
                            <button type="button" class="close" herf="home" data-dismiss="modal"><a href="manageraccount">&times;</a></button>
                        </div>
                        <div class="modal-body">	
                            <div class="form-group">
                                <label>ID</label>
                                <input type="text" value="${aEdit.id}" name="idEdit" class="form-control" required readonly>
                            </div>
                            <div class="form-group">
                                <label>Username</label>
                                <input type="text" value="${aEdit.user}" name="userEdit" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input type="text" value="${aEdit.pass}" name="passEdit" class="form-control" required>
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


        <script src="js/manager.js" type="text/javascript"></script>

    </body>
</html>
