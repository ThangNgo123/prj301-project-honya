/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package control;

import dao.DAO;
import entity.Product;
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
@WebServlet(name="LoadMoreNewBook", urlPatterns={"/loadMoreNewBook"})
public class LoadMoreNewBook extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        DAO dao = new DAO();
        String amount = request.getParameter("exits");
        int amount2 = Integer.parseInt(amount);
        List<Product> list = dao.getNewBook(amount2);
        PrintWriter out = response.getWriter();
        
        for (Product o : list) {
            out.println("<div class=\" col-12 col-md-6 col-lg-3 product\">\n" +
"                                <div class=\"card\">\n" +
"                                    <div class=\"view zoom z-depth-2 rounded\">\n" +
"                                        <img class=\"img-fluid w-100\" src=\""+o.getImage()+"\" alt=\"Card image cap\">\n" +
"\n" +
"                                    </div>\n" +
"                                    <div class=\"card-body\">\n" +
"                                        <h4 class=\"card-title show_txt\"><a class=\"link-dark\" href=\"detail?pid="+o.getId()+"\" title=\"View Product\">"+o.getName()+"</a></h4>\n" +
"                                        <p class=\"card-text show_txt\">"+o.getTitle()+"</p>\n" +
"                                        <div class=\"row\">\n" +
"                                            <div class=\"col\">\n" +
"                                                <p class=\"btn btn-success btn-block\">"+o.getPrice()+" $</p>\n" +
"                                            </div> \n" +
"                                        </div>\n" +
"                                    </div>\n" +
"                                </div>\n" +
"                            </div>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
