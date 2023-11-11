

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Edit</title>
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
            <div id="editEmployeeModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <form action="update" method="post">
                            <div class="modal-header">						
                                <h4 class="modal-title">Edit Product</h4>
                                <button type="button" class="close" herf="home" data-dismiss="modal"><a href="manageproduct">&times;</a></button>
                            </div>
                            <div class="modal-body">					
                                <div class="form-group">
                                    <label>ID</label> 
                                    <input value="${aEdit.id}" name="idEdit" type="text" class="form-control" readonly required>
                                </div> 
                                <div class="form-group">
                                    <label>Name</label>
                                    <input value="${aEdit.name}" name="nameEdit" type="text" class="form-control" required>
                                </div>
                                <div class="form-group">
                                    <label>Image</label>
                                    <input value="${aEdit.image}" name="imageEdit" type="text" class="form-control" >
                                </div>
                                <div class="form-group">
                                    <label>Price</label>
                                    <input value="${aEdit.price}" name="priceEdit" type="text" class="form-control" >
                                </div>
                                <div class="form-group">
                                    <label>Title</label>
                                    <input value="${aEdit.title}" name="titleEdit" type="text" class="form-control" >
                                </div>
                                <div class="form-group">
                                    <label>Description</label>
                                    <textarea name="descriptionEdit"  class="form-control" >${aEdit.description}</textarea>　
                                </div>

                                <div class="form-group">
                                    <label>Category</label>
                                    <select name="categoryEdit" class="form-select" aria-label="Default select example">
                                        <c:forEach items="${listC}" var="o">
                                            <option value="${o.cid}">${o.cname}</option>
                                        </c:forEach>
                                    </select>
                                </div>

                            </div>
                            <div class="modal-footer">
                                <input style="padding:5px;" type="button" value="Cancel" onclick="window.location = 'manageproduct'"/>
                                <input type="submit" class="btn btn-primary" value="Edit">
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>


        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>