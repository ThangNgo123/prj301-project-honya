<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="col-sm-3">
    <div class="card bg-light mb-3">

        <div class="list-group">
            <a href="#" class="list-group-item bg-danger text-white list-group-item-action" aria-current="true">
                Categories
            </a>
            <c:forEach items="${listC}" var="o">
                <a href="category?cid=${o.cid}" class="list-group-item list-group-item-action ${tag == o.cid ? "bg-secondary text-white":""}">${o.cname}</a>
            </c:forEach>
            <a href="shop" class="list-group-item list-group-item-action">All Products</a>

        </div>

    </div>
    <!--    <div class="card bg-light mb-3">
            <div class="card-header bg-success text-white text-uppercase">Last product</div>
            <div class="card-body">
                <img class="img-fluid" src="${newP.image}" />
                <h5 class="card-title">${newP.name}</h5>
                <p class="card-text">${newP.description}</p>
                <p class="bloc_left_price">${newP.price} $</p>
            </div>
        </div>-->
</div>
