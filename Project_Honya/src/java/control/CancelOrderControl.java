/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import entity.Account;
import entity.DetailProduct;
import entity.Product;
import entity.Shipping;
import entity.SoLuongDaBan;
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
@WebServlet(name = "CancelOrderControl", urlPatterns = {"/cancelOrder"})
public class CancelOrderControl extends HttpServlet {

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
        String mahd = request.getParameter("id");
        String sid = request.getParameter("sid");
        int sidInt = Integer.parseInt(sid);
        Shipping shipping = dao.getShippingBySID(sidInt);
        List<DetailProduct> listD = dao.getDetailProductByMaHD(mahd, accountID);

        List<Product> list2 = dao.getAllProduct();
        double totalMoney = 0;
        for (DetailProduct c : listD) {
            for (Product p : list2) {
                if (c.getProductID() == p.getId()) {
                    totalMoney = totalMoney + (p.getPrice() * c.getAmount());
                }
            }
        }
        double totalMoneyVATT = totalMoney + totalMoney * 0.1 + shipping.getPrice();
        double totalMoneyVAT = (double) Math.round(totalMoneyVATT * 10) / 10;

        double tongTienBanHangThemm = 0;
        int sell_ID;
        for (DetailProduct c : listD) {
            for (Product p : list2) {
                if (c.getProductID() == p.getId()) {
                    tongTienBanHangThemm = 0;
                    sell_ID = dao.getSellIDByProductID(p.getId());
                    tongTienBanHangThemm = tongTienBanHangThemm + (p.getPrice() * c.getAmount());
                    double tongTienBanHangThem = (double) Math.round(tongTienBanHangThemm * 10) / 10;
                    TongChiTieuBanHang t2 = dao.checkTongChiTieuBanHangExist(sell_ID);
                    if (t2 != null) {
                        dao.reduceTongBanHang(sell_ID, tongTienBanHangThem);
                    }
                }
            }
        }

        for (DetailProduct c : listD) {
            for (Product p : list2) {
                if (c.getProductID() == p.getId()) {
                    SoLuongDaBan s = dao.checkSoLuongDaBanExist(p.getId());
                    if (s != null) {
                        dao.reduceSoLuongDaBan(p.getId(), c.getAmount());
                    } 
                }
            }
        }

        for (DetailProduct c : listD) {
            Product p = dao.getProductByIdInteger(c.getProductID());
            dao.editQuantityProduct(p.getQuantity() + c.getAmount(), p.getId());
        }
        
        TongChiTieuBanHang t = dao.checkTongChiTieuBanHangExist(accountID);
        if (t != null) {
            dao.reduceTongChiTieu(accountID, totalMoneyVAT);
        }
        
        
        dao.cancelOrder(mahd, accountID);
        request.setAttribute("mess", "Cancel order successfully");
        request.getRequestDispatcher("myOrder").forward(request, response);
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
