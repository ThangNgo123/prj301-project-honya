/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import entity.Account;
import entity.Cart;
import entity.Product;
import entity.Shipping;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;

/**
 *
 * @author asus
 */
@WebServlet(name = "ManagerCartControl", urlPatterns = {"/managercart"})
public class ManagerCartControl extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("ac");
        if (a == null) {
            response.sendRedirect("login");
            return;
        }
        int accountID = a.getId();
        DAO dao = new DAO();
        List<Cart> listC = dao.getCartByAccountID(accountID);
        List<Product> listP = dao.getAllProduct();
        List<Shipping> listS = dao.getAllShipping();
        request.setAttribute("listCart", listC);
        request.setAttribute("listProduct", listP);
        request.getRequestDispatcher("Cart.jsp").forward(request, response);
        String priceShipping = request.getParameter("sid");
//        int ps = Integer.parseInt(priceShipping);
//        Shipping ship = dao.getShippingBySID(ps);
//        double totalMoney = 0;
//        for (Cart o : listC) {
//            for (Product p : listP) {
//                if (o.getProductID() == p.getId()) {
//                    totalMoney = totalMoney + (p.getPrice() * o.getAmount());
//                }
//            }
//        }
//
//        double totalMoneyVAT = totalMoney + totalMoney * 0.1;
//
//        PrintWriter out = response.getWriter();
//        out.println("<div class=\"summary-item\"><span class=\"text\">Subtotal</span><span class=\"price\">" + totalMoney + "</span></div>\n"
//                + "                                    <div class=\"summary-item\"><span class=\"text\">VAT</span><span class=\"price\">10%</span></div>\n"
//                + "                                    <div class=\"summary-item\"><span class=\"text\">"
//                + "<select id=\"select\" class=\"form-select\" aria-label=\"Default select example\">\n");
//        for (Shipping s : listS) {
//            out.println("  <option value=" + s.getsID() + ">" + s.getName() + " - " + s.getPrice() + "$</option>\n");
//
//        }
//        out.println("</select></div>\n"
//                + "                                    <div class=\"summary-item\"><span class=\"text\">Total</span><span class=\"price\">" + totalMoneyVAT + " " + priceShipping + "</span></div>");
//
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
