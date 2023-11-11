<%-- 
    Document   : LeftDashBoard
    Created on : Oct 31, 2023, 12:13:15 AM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<div class="col-md-3 col-lg-2 sidebar-offcanvas bg-light pl-0" id="sidebar" role="navigation">
    <!--    <ul class="nav flex-column sticky-top pl-0 pt-5 mt-3">
            <li class="nav-item"><a class="nav-link" href="dashBoard">Main DashBoard</a></li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="#submenu1" data-toggle="collapse" data-target="#submenu1">Reports▾</a>
                                        <ul class="list-unstyled flex-column pl-3 collapse" id="submenu1" aria-expanded="false">
                                            <li class="nav-item"><a class="nav-link" href="">Report 1</a></li>
                                            <li class="nav-item"><a class="nav-link" href="">Report 2</a></li>
                                        </ul>
                                    </li>
            <li class="nav-item"><a class="nav-link" href="manageraccount">Manager Account</a></li>
            <li class="nav-item"><a class="nav-link" href="manageproduct">Manager Product</a></li>
            <li class="nav-item"><a class="nav-link" href="managerInvoiceDB">Manager Invoice</a></li>
            <li class="nav-item"><a class="nav-link" href="top5">Top 5 BestSeller</a></li>
            <li class="nav-item"><a class="nav-link" href="top5Customers">Top 5 Customers</a></li>
            <li class="nav-item"><a class="nav-link" href="top5Seller">Top 5 Seller</a></li>
    
        </ul>-->

    <div class="list-group list-group-flush bg-light sticky-top pl-0 pt-5 mt-3">
        <c:if test="${sessionScope.ac.isAdmin==1 || sessionScope.ac.isSell==1}">
            <a
                href="dashBoard"
                class="list-group-item bg-light list-group-item-action py-3 ripple "
                aria-current="true"
                >
                <i class="fas fa-tachometer-alt fa-fw me-3"></i
                > <span>Main dashboard</span>
            </a>
        </c:if>


        <c:if test="${sessionScope.ac.isAdmin==1}">
            <a
                href="manageraccount"
                class="list-group-item bg-light list-group-item-action py-3 ripple"
                ><i class="fas fa-user-circle fa-fw me-3"></i><span>Manager Account</span></a
            >
        </c:if>

        <c:if test="${sessionScope.ac.isAdmin==1 || sessionScope.ac.isSell==1}">

            <a
                href="manageproduct"
                class="list-group-item bg-light list-group-item-action py-3 ripple"
                ><i class="fas fa-book fa-fw me-3"></i
                ><span>Manager Product</span></a
            >

        </c:if>

        <c:if test="${sessionScope.ac.isAdmin==1}">
            <a
                href="managerInvoiceDB"
                class="list-group-item bg-light list-group-item-action py-3 ripple"
                >
                <i class="fas fa-file-invoice fa-fw me-3"></i><span>Manager Invoice</span>
            </a>
        </c:if>

    </div>

</div>
