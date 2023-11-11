/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import entity.Account;
import entity.Invoice;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Random;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author asus
 */
@WebServlet(name = "ExportFileExcel", urlPatterns = {"/exportFileExcel"})
public class ExportFileExcel extends HttpServlet {

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
        String ngayXuat = request.getParameter("dateHoaDon");

        DAO dao = new DAO();

        List<Invoice> list = dao.searchByNgayXuat(ngayXuat);
        List<Account> listAllAccount = dao.getAllAccount();

        int maximum = 999999999;
        int minimum = 1;

        Random rn = new Random();
        int range = maximum - minimum + 1;
        int randomNum = rn.nextInt(range) + minimum;

        FileOutputStream file = new FileOutputStream("C:\\ExcelProjectHonya\\" + "Invoice-" + ngayXuat + "-" + Integer.toString(randomNum) + ".xlsx");
        XSSFWorkbook workbook = new XSSFWorkbook();
        XSSFSheet workSheet = workbook.createSheet("Invoice("+ ngayXuat+")");
        XSSFRow row;
        XSSFCell cell0;
        XSSFCell cell1;
        XSSFCell cell2;
        XSSFCell cell3;
        XSSFCell cell4;

        row = workSheet.createRow(0);
        cell0 = row.createCell(0);
        cell0.setCellValue("InvoiceID");
        cell1 = row.createCell(1);
        cell1.setCellValue("Name");
        cell2 = row.createCell(2);
        cell2.setCellValue("Total Price($)");
        cell3 = row.createCell(3);
        cell3.setCellValue("Date");
        cell4 = row.createCell(4);
        cell4.setCellValue("Status");

        double tongGia;
        int i = 0;

        for (Invoice o : list) {
            i = i + 1;
            for (Account a : listAllAccount) {
                if (o.getAccountID() == a.getId()) {
                    tongGia = Math.round((o.getTongGia()) * 100.0) / 100.0;
                    row = workSheet.createRow(i);
                    cell0 = row.createCell(0);
                    cell0.setCellValue(o.getMaHD());
                    cell1 = row.createCell(1);
                    cell1.setCellValue(o.getName());
                    cell2 = row.createCell(2);
                    cell2.setCellValue(tongGia);
                    cell3 = row.createCell(3);
                    cell3.setCellValue(ngayXuat);
                    cell4 = row.createCell(4);
                    cell4.setCellValue(dao.getStatusName(o.getStid()));
                }
            }
        }
        workbook.write(file);
        workbook.close();
        file.close();

        request.setAttribute("mess", "Export file successfully!");
        request.getRequestDispatcher("managerInvoiceDB").forward(request, response);
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
