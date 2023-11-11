/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import entity.Account;
import entity.Invoice;
import entity.Status;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author asus
 */
@WebServlet(name = "SearchInvoiceByDate", urlPatterns = {"/searchInvoiceByDate"})
public class SearchInvoiceByDate extends HttpServlet {

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
        String ngayXuat = request.getParameter("ngayXuat");
        DAO dao = new DAO();
        List<Invoice> listInvoiceByDate = dao.searchByNgayXuat(ngayXuat);
        List<Account> listAllAccount = dao.getAllAccount();
        List<Status> listS = dao.getAllStatus();
        PrintWriter out = response.getWriter();
        double tongGia;
        for (Invoice i : listInvoiceByDate) {
            for (Account a : listAllAccount) {
                if (i.getAccountID() == a.getId()) {

                    tongGia = Math.round((i.getTongGia()) * 100.0) / 100.0;
//                    out.println("<tr>\n"
//                            + "                                                <td class=\"col-sm-1\">" + i.getMaHD() + "</td>\n"
//                            + "                                                <td class=\"col-sm-3\">" + i.getName() + "</td>\n"
//                            + "                                                <td class=\"col-sm-2\">" + tongGia + "$</td>\n"
//                            + "                                                <td class=\"col-sm-2\">" + i.getNgayXuat() + "</td>\n"
//                            + "                                                <td class=\"col-sm-2\">\n"
//                            + "                                                    <select name=\"" + dao.getStatusName(i.getStid()) + "\" onchange=\"window.location.href = this.value;\" >\n"
//                            + "                                                            <option ${" + i.getStid() + " == 5 ? \"hidden\":\"\"} value=\"editSatus?mahd=" + i.getMaHD() + "&stid=" + i.getStid() + "\" ${" + dao.getStatusName(i.getStid()) + " eq 'Ordered'? \"selected\" : \"\"}>\n"
//                            + "                                                               Ordered \n"
//                            + "                                                            </option>\n"
//                            + "                                                            <option ${" + i.getStid() + " == 5 ? \"hidden\":\"\"} value=\"editSatus?mahd=" + i.getMaHD() + "&stid=" + i.getStid() + "\" ${" + dao.getStatusName(i.getStid()) + " eq 'In Transit'? \"selected\" : \"\"}>\n"
//                            + "                                                                In Transit \n"
//                            + "                                                            </option>\n" + "                                                            <option ${" + i.getStid() + " == 5 ? \"hidden\":\"\"} value=\"editSatus?mahd=" + i.getMaHD() + "&stid=" + i.getStid() + "\" ${" + dao.getStatusName(i.getStid()) + " eq 'Out for delivery'? \"selected\" : \"\"}>\n"
//                            + "                                                                Out for delivery \n"
//                            + "                                                            </option>\n" + "                                                            <option ${" + i.getStid() + " == 5 ? \"hidden\":\"\"} value=\"editSatus?mahd=" + i.getMaHD() + "&stid=" + i.getStid() + "\" ${" + dao.getStatusName(i.getStid()) + " eq Delivered ? \"selected\" : \"\"}>\n"
//                            + "                                                                Delivered \n"
//                            + "                                                            </option>\n" + "                                                            <option ${" + i.getStid() + " == 5 ? \"hidden\":\"\"} value=\"editSatus?mahd=" + i.getMaHD() + "&stid=" + i.getStid() + "\" ${" + dao.getStatusName(i.getStid()) + " eq 'Cancelled'? \"selected\" : \"\"}>\n"
//                            + "                                                               Cancelled \n"
//                            + "                                                            </option>\n"
//                            + "                                                    </select>\n"
//                            + "                                                </td>\n"
//                            + "                                                <td class=\"col-sm-2\">\n"
//                            + "                                                    <a class=\"btn btn-primary\" href=\"orderDetail?id=" + i.getMaHD() + "&sid=" + i.getSid() + "&location=1\">Detail</a>\n"
//                            + "                                                </td>\n"
//                            + "                                            </tr>");

                    out.print("<tr>\n"
                            + "                                                <td class=\"col-sm-1\">" + i.getMaHD() + "</td>\n"
                            + "                                                <td class=\"col-sm-3\">" + i.getName() + "</td>\n"
                            + "                                                <td class=\"col-sm-2\">" + tongGia + "$</td>\n"
                            + "                                                <td class=\"col-sm-2\">" + i.getNgayXuat() + "</td>\n"
                            + "                                                <td class=\"col-sm-2\">\n"
                            + "                                                    <select name=\"${d.getStatusName(i.stid)}\" onchange=\"window.location.href = this.value;\" >\n");

                    if (i.getStid() == 1) {
                        out.print("                                                            <option value=\"editSatus?mahd=" + i.getMaHD() + "&stid=1\" selected>\n"
                                + "                                                                Ordered \n"
                                + "                                                            </option>\n");
                        out.print("                                                            <option value=\"editSatus?mahd=" + i.getMaHD() + "&stid=2\" >\n"
                                + "                                                                In Transit \n"
                                + "                                                            </option>\n");
                        out.print("                                                            <option value=\"editSatus?mahd=" + i.getMaHD() + "&stid=3\" >\n"
                                + "                                                                Out for delivery \n"
                                + "                                                            </option>\n");
                        out.print("                                                            <option value=\"editSatus?mahd=" + i.getMaHD() + "&stid=4\" >\n"
                                + "                                                                Delivered \n"
                                + "                                                            </option>\n");
                        out.print("                                                            <option value=\"editSatus?mahd=" + i.getMaHD() + "&stid=5\" >\n"
                                + "                                                                Cancelled \n"
                                + "                                                            </option>\n");
                    }
                    
                    if (i.getStid() == 2) {
                        out.print("                                                            <option value=\"editSatus?mahd=" + i.getMaHD() + "&stid=1\" >\n"
                                + "                                                                Ordered \n"
                                + "                                                            </option>\n");
                        out.print("                                                            <option value=\"editSatus?mahd=" + i.getMaHD() + "&stid=2\" selected >\n"
                                + "                                                                In Transit \n"
                                + "                                                            </option>\n");
                        out.print("                                                            <option value=\"editSatus?mahd=" + i.getMaHD() + "&stid=3\" >\n"
                                + "                                                                Out for delivery \n"
                                + "                                                            </option>\n");
                        out.print("                                                            <option value=\"editSatus?mahd=" + i.getMaHD() + "&stid=4\" >\n"
                                + "                                                                Delivered \n"
                                + "                                                            </option>\n");
                        out.print("                                                            <option value=\"editSatus?mahd=" + i.getMaHD() + "&stid=5\" >\n"
                                + "                                                                Cancelled \n"
                                + "                                                            </option>\n");
                    }
                    
                    if (i.getStid() == 3) {
                        out.print("                                                            <option value=\"editSatus?mahd=" + i.getMaHD() + "&stid=1\" >\n"
                                + "                                                                Ordered \n"
                                + "                                                            </option>\n");
                        out.print("                                                            <option value=\"editSatus?mahd=" + i.getMaHD() + "&stid=2\" >\n"
                                + "                                                                In Transit \n"
                                + "                                                            </option>\n");
                        out.print("                                                            <option value=\"editSatus?mahd=" + i.getMaHD() + "&stid=3\" selected>\n"
                                + "                                                                Out for delivery \n"
                                + "                                                            </option>\n");
                        out.print("                                                            <option value=\"editSatus?mahd=" + i.getMaHD() + "&stid=4\" >\n"
                                + "                                                                Delivered \n"
                                + "                                                            </option>\n");
                        out.print("                                                            <option value=\"editSatus?mahd=" + i.getMaHD() + "&stid=5\" >\n"
                                + "                                                                Cancelled \n"
                                + "                                                            </option>\n");
                    }
                    
                    if (i.getStid() == 4) {
                        out.print("                                                            <option value=\"editSatus?mahd=" + i.getMaHD() + "&stid=1\" >\n"
                                + "                                                                Ordered \n"
                                + "                                                            </option>\n");
                        out.print("                                                            <option value=\"editSatus?mahd=" + i.getMaHD() + "&stid=2\" >\n"
                                + "                                                                In Transit \n"
                                + "                                                            </option>\n");
                        out.print("                                                            <option value=\"editSatus?mahd=" + i.getMaHD() + "&stid=3\" >\n"
                                + "                                                                Out for delivery \n"
                                + "                                                            </option>\n");
                        out.print("                                                            <option value=\"editSatus?mahd=" + i.getMaHD() + "&stid=4\" selected>\n"
                                + "                                                                Delivered \n"
                                + "                                                            </option>\n");
                        out.print("                                                            <option value=\"editSatus?mahd=" + i.getMaHD() + "&stid=5\" >\n"
                                + "                                                                Cancelled \n"
                                + "                                                            </option>\n");
                    }
                    
                    if (i.getStid() == 5) {
                        out.print("                                                            <option value=\"editSatus?mahd=" + i.getMaHD() + "&stid=5\" selected>\n"
                                + "                                                                Cancelled \n"
                                + "                                                            </option>\n");
                    }
                    
                    out.print("                                                    </select>\n"
                            + "                                                </td>\n"
                            + "                                                <td class=\"col-sm-2\">\n"
                            + "                                                    <a class=\"btn btn-primary\" href=\"orderDetail?id=${i.maHD}&sid=${i.sid}&location=1\">Detail</a>\n"
                            + "                                                </td>\n"
                            + "                                            </tr>");

                }
            }
        }
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
