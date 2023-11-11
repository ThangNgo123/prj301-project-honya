
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <link herf="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link herf="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js">
        <link herf="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js">
        <link herf="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <jsp:useBean id="b" class="dao.DAO" scope="request"></jsp:useBean>
        </head>
        <style>
            body{
                background: #ddd;
                min-height: 100vh;
                vertical-align: middle;
                display: flex;
                font-family: sans-serif;
                font-size: 0.8rem;
                font-weight: bold;
            }
            .title{
                margin-bottom: 5vh;
            }
            .card{
                margin: auto;
                max-width: 950px;
                width: 90%;
                box-shadow: 0 6px 20px 0 rgba(0, 0, 0, 0.19);
                border-radius: 1rem;
                border: transparent;
            }
            @media(max-width:767px){
                .card{
                    margin: 3vh auto;
                }
            }
            .cart{
                background-color: #fff;
                padding: 4vh 5vh;
                border-bottom-left-radius: 1rem;
                border-top-left-radius: 1rem;
            }
            @media(max-width:767px){
                .cart{
                    padding: 4vh;
                    border-bottom-left-radius: unset;
                    border-top-right-radius: 1rem;
                }
            }
            .summary{
                background-color: #ddd;
                border-top-right-radius: 1rem;
                border-bottom-right-radius: 1rem;
                padding: 4vh;
                color: rgb(65, 65, 65);
            }
            @media(max-width:767px){
                .summary{
                    border-top-right-radius: unset;
                    border-bottom-left-radius: 1rem;
                }
            }
            .summary .col-2{
                padding: 0;
            }
            .summary .col-10
            {
                padding: 0;
            }
            .row{
                margin: 0;
            }
            .title b{
                font-size: 1.5rem;
            }
            .main{
                margin: 0;
                padding: 2vh 0;
                width: 100%;
            }
            .col-2, .col{
                padding: 0 1vh;
            }
            a{
                padding: 0 1vh;
            }
            .close{
                margin-left: auto;
                font-size: 0.7rem;
            }
            img{
                width: 3.5rem;
            }
            .back-to-shop{
                margin-top: 4.5rem;
            }
            h5{
                margin-top: 4vh;
            }
            hr{
                margin-top: 1.25rem;
            }
            form{
                padding: 2vh 0;
            }
            select{
                border: 1px solid rgba(0, 0, 0, 0.137);
                padding: 1.5vh 1vh;
                margin-bottom: 4vh;
                outline: none;
                width: 100%;
                background-color: rgb(247, 247, 247);
            }
            input{
                border: 1px solid rgba(0, 0, 0, 0.137);
                padding: 1vh;
                margin-bottom: 4vh;
                outline: none;
                width: 100%;
                background-color: rgb(247, 247, 247);
            }
            input:focus::-webkit-input-placeholder
            {
                color:transparent;
            }
            .btn{
                background-color: #000;
                border-color: #000;
                color: white;
                width: 100%;
                font-size: 0.7rem;
                margin-top: 4vh;
                padding: 1vh;
                border-radius: 0;
            }
            .btn:focus{
                box-shadow: none;
                outline: none;
                box-shadow: none;
                color: white;
                -webkit-box-shadow: none;
                -webkit-user-select: none;
                transition: none;
            }
            .btn:hover{
                color: white;
            }
            a{
                color: black;
            }
            a:hover{
                color: black;
                text-decoration: none;
            }
            #code{
                background-image: linear-gradient(to left, rgba(255, 255, 255, 0.253) , rgba(255, 255, 255, 0.185)), url("https://img.icons8.com/small/16/000000/long-arrow-right.png");
                background-repeat: no-repeat;
                background-position-x: 95%;
                background-position-y: center;
            }
        </style>

        <body onload="loadTotalMoney()">

        <%--<jsp:include page="Menu.jsp"></jsp:include>--%>
        <div class="card">
            <div class="row">
                <div class="col-md-8 cart">
                    <div class="title">
                        <div class="row">
                            <div class="col"><h4><b>Shopping Cart</b></h4></div>
                            <!--<div class="col align-self-center text-right text-muted">3 items</div>-->
                        </div>
                    </div>    
                    <c:forEach items="${listCart}" var="o">
                        <c:forEach items="${listProduct}" var="p">
                            <c:if test="${o.productID == p.id}">
                                <div class="row">
                                    <div class="row main align-items-center">
                                        <div class="col-2"><img class="img-fluid" src="${p.image}"></div>
                                        <div class="col">
                                            <div class="row">${p.title}</div>
                                        </div>
                                        <div class="col">
                
                                            <a href="subAmountCart?productID=${o.productID}&amount=${o.amount}"><button class="btnSub">-</button></a>                             
                                            
                                            <strong>${o.amount}</strong>
      
                                            <a href="addAmountCart?productID=${o.productID}&amount=${o.amount}"><button class="btnAdd">+</button></a>
                                        
                                        </div>
                                        <div class="col"><strong>${p.price}$</strong><a href="deleteCart?productID=${o.productID }" class="text-dark"><button class="close">&#10005;</button></a></div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </c:forEach>
                    <!--<div  class="back-to-shop"><a herf="home">&leftarrow;</a><span class="text-muted">Back to shop</span></div>-->
                    <a href="shop" class="text-dark"><- Back to shop</a>
                </div>
                <div class="col-md-4 summary" id="contentTotalMoney">
                    <!--                    <form action="order">
                                            <div><h5><b>Summary</b></h5></div>
                                            <hr>
                                            <div class="row">
                                                <div class="col" style="padding-left:0;">SUBTOTAL</div>
                                                <div class="col text-right">&euro; 132.00</div>
                                            </div>
                                            <p>SHIPPING</p>
                                            <select onchange="myFunction(this.value)" name="priceShipping" class="form-select" aria-label="Default select example">
                                                <option disabled selected hidden>Choose Shipping</option>
                                                <option value="1">One</option>
                                            </select>
                    
                                            <div class="col">VAT : 10%</div>
                    
                                            <div class="row" style="border-top: 1px solid rgba(0,0,0,.1); padding: 2vh 0;">
                                                <div class="col">TOTAL PRICE</div>
                                                <li id="total" class="col text-right">&euro; 137.00</div>
                                            <input type="submit" class="btn btn-dark rounded-pill py-2 btn-block text-white" value="Check Out">
                                            </div>
                                            <button class="btn">CHECKOUT</button>
                                        </form>-->
                </div>
            </div>

        </div>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

        <script>
            function loadTotalMoney() {
                $.ajax({
                    //                var val = document.getElementById("select").value;
                    //                alert("The input value has changed. The new value is: " + val);
                    url: "/Project_Honya/totalMoneyCart",
                    type: "get", //send it through get method
                    data: {
                        //                    sid: val
                    },
                    success: function (responseData) {
                        document.getElementById("contentTotalMoney").innerHTML = responseData;
                    }
                });
            }

            function myFunction(val) {
                var intVal = parseFloat(val);
                var totalVal = document.getElementById("total").value;
                var intTotal = parseFloat(totalVal);
//            alert("The input value has changed. The new value is: " + intTotal + intVal);
                document.getElementById("total").innerHTML = intTotal + intVal + "$";
            }
            window.addEventListener("load", function loadAmountCart() {
                $.ajax({
                    url: "/Project_Honya/loadAmountCart",
                    type: "get", //send it through get method
                    data: {

                    },
                    success: function (responseData) {
                        document.getElementById("amountCart").innerHTML = responseData;
                    }
                });
            });
        </script>
    </body>
</html>