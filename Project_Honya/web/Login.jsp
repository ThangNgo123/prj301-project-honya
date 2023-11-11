<%-- 
    Document   : Login2
    Created on : Oct 6, 2023, 12:33:26 AM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Bootstrap Login Form with Avatar Image</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <style>
            body {
                color: #fff;
                background: #d47677;
            }
            .form-control {
                min-height: 41px;
                background: #fff;
                box-shadow: none !important;
                border-color: #e3e3e3;
            }
            .form-control:focus {
                border-color: #69C3A3;
            }
            .form-control, .btn {
                border-radius: 2px;
            }
            .login-form {
                width: 350px;
                margin: 0 auto;
                padding: 100px 0 30px;
            }
            .login-form form {
                color: #7a7a7a;
                border-radius: 2px;
                margin-bottom: 15px;
                font-size: 13px;
                background: #ececec;
                box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
                padding: 30px;
                position: relative;
            }
            .login-form h2 {
                font-size: 22px;
                margin: 35px 0 25px;
            }
            .login-form .avatar {
                position: absolute;
                margin: 0 auto;
                left: 0;
                right: 0;
                top: -50px;
                width: 95px;
                height: 95px;
                border-radius: 50%;
                z-index: 9;
                background: #69C3A3;
                padding: 15px;
                box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.1);
            }
            .login-form .avatar img {
                width: 100%;
            }
            .login-form input[type="checkbox"] {
                position: relative;
                top: 1px;
            }
            .login-form .btn, .login-form .btn:active {
                font-size: 16px;
                font-weight: bold;
                background: #70c5c0 !important;
                border: none;
                margin-bottom: 20px;
            }
            .login-form .btn:hover, .login-form .btn:focus {
                background: #50b8b3 !important;
            }
            .login-form a {
                color: #fff;
                text-decoration: underline;
            }
            .login-form a:hover {
                text-decoration: none;
            }
            .login-form form a {
                color: #7a7a7a;
                text-decoration: none;
            }
            .login-form form a:hover {
                text-decoration: underline;
            }
            .login-form .bottom-action {
                font-size: 14px;
            }
            .login-form .close {
                position: absolute;
                top: 2px;
                right: 10px;
            }
        </style>
    </head>
    <body>
        <div class="login-form">
            <form action="login" method="post">
                <div class="avatar">
                    <img src="https://cdn-icons-png.flaticon.com/512/3607/3607444.png" alt="Avatar">
                </div>
                <button type="button" class="close" herf="home" data-dismiss="modal"><a href="home">&times;</a></button>
                <h2 class="text-center">Member Login</h2>   
                <p class="text-danger">${mess}</p>
                <div class="form-group">
                    <input type="text" class="form-control" name="username" placeholder="Username" required="required">
                </div>
                <div class="form-group">
                    <input type="password" class="form-control" name="password" placeholder="Password" required="required">
                </div>        
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-lg btn-block">Sign in</button>
                </div>
                <div class="bottom-action clearfix">
                    <p class="text-center small">Don't have an account? <a href="SignUp.jsp">Sign up here!</a></p>
                </div>
            </form>

        </div>
    </body>
</html>