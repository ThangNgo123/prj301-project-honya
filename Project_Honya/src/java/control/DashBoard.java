/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import entity.Account;
import entity.Product;
import entity.TongChiTieuBanHang;
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
@WebServlet(name = "DashBoard", urlPatterns = {"/dashBoard"})
public class DashBoard extends HttpServlet {

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
        DAO dao = new DAO();
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("ac");
        if (a == null) {
            response.sendRedirect("login");
            return;
        }
        int accountID = a.getId();
        int totalUser = dao.countAccount();
        int totalProduct = dao.countProduct();
        int totalReview = dao.countReview();
        float totalSeller = dao.totalSeller();
        List<Account> listA = dao.getAllAccount();

        double totalMoneyMonth1 = dao.totalMoneyMonth(1);
        double totalMoneyMonth2 = dao.totalMoneyMonth(2);
        double totalMoneyMonth3 = dao.totalMoneyMonth(3);
        double totalMoneyMonth4 = dao.totalMoneyMonth(4);
        double totalMoneyMonth5 = dao.totalMoneyMonth(5);
        double totalMoneyMonth6 = dao.totalMoneyMonth(6);
        double totalMoneyMonth7 = dao.totalMoneyMonth(7);
        double totalMoneyMonth8 = dao.totalMoneyMonth(8);
        double totalMoneyMonth9 = dao.totalMoneyMonth(9);
        double totalMoneyMonth10 = dao.totalMoneyMonth(10);
        double totalMoneyMonth11 = dao.totalMoneyMonth(11);
        double totalMoneyMonth12 = dao.totalMoneyMonth(12);

        request.setAttribute("totalMoneyMonth1", totalMoneyMonth1);
        request.setAttribute("totalMoneyMonth2", totalMoneyMonth2);
        request.setAttribute("totalMoneyMonth3", totalMoneyMonth3);
        request.setAttribute("totalMoneyMonth4", totalMoneyMonth4);
        request.setAttribute("totalMoneyMonth5", totalMoneyMonth5);
        request.setAttribute("totalMoneyMonth6", totalMoneyMonth6);
        request.setAttribute("totalMoneyMonth7", totalMoneyMonth7);
        request.setAttribute("totalMoneyMonth8", totalMoneyMonth8);
        request.setAttribute("totalMoneyMonth9", totalMoneyMonth9);
        request.setAttribute("totalMoneyMonth10", totalMoneyMonth10);
        request.setAttribute("totalMoneyMonth11", totalMoneyMonth11);
        request.setAttribute("totalMoneyMonth12", totalMoneyMonth12);

        double totalMoney1 = dao.totalMoneyDay(1);
        double totalMoney2 = dao.totalMoneyDay(2);
        double totalMoney3 = dao.totalMoneyDay(3);
        double totalMoney4 = dao.totalMoneyDay(4);
        double totalMoney5 = dao.totalMoneyDay(5);
        double totalMoney6 = dao.totalMoneyDay(6);
        double totalMoney7 = dao.totalMoneyDay(7);

        request.setAttribute("totalMoney1", totalMoney1);
        request.setAttribute("totalMoney2", totalMoney2);
        request.setAttribute("totalMoney3", totalMoney3);
        request.setAttribute("totalMoney4", totalMoney4);
        request.setAttribute("totalMoney5", totalMoney5);
        request.setAttribute("totalMoney6", totalMoney6);
        request.setAttribute("totalMoney7", totalMoney7);

        List<Product> listBestSeller = dao.getTop5BestSeller();
        request.setAttribute("ListTop5", listBestSeller);

        List<TongChiTieuBanHang> listChiTieu = dao.getTop5Customers();
        request.setAttribute("ListTop5Customers", listChiTieu);

        List<TongChiTieuBanHang> listSeller = dao.getTop5Seller();
        request.setAttribute("ListTop5Seller", listSeller);

        request.setAttribute("listA", listA);
        request.setAttribute("totalUser", totalUser);
        request.setAttribute("totalProduct", totalProduct);
        request.setAttribute("totalReview", totalReview);
        request.setAttribute("totalSeller", totalSeller);
        request.getRequestDispatcher("DashBoardAdmin.jsp").forward(request, response);

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
