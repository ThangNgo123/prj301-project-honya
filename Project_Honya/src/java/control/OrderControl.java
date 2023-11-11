/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package control;

import dao.DAO;
import entity.Account;
import entity.Cart;
import entity.Email;
import entity.EmailUtils;
import entity.Invoice;
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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 *
 * @author asus
 */
@WebServlet(name = "OrderControl", urlPatterns = {"/order"})
public class OrderControl extends HttpServlet {

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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrderControl</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderControl at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("ac");
        if (a == null) {
            response.sendRedirect("login");
            return;
        }
        String priceShipping = request.getParameter("priceShipping");

        int accountID = a.getId();
        DAO dao = new DAO();
        Shipping shipping = dao.getShippingByPrice(priceShipping);
        List<Cart> list = dao.getCartByAccountID(accountID);
        List<Product> list2 = dao.getAllProduct();
        double totalMoney = 0;
        for (Cart c : list) {
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
        for (Cart c : list) {
            for (Product p : list2) {
                if (c.getProductID() == p.getId()) {
                    tongTienBanHangThemm = 0;
                    sell_ID = dao.getSellIDByProductID(p.getId());
                    tongTienBanHangThemm = tongTienBanHangThemm + (p.getPrice() * c.getAmount());
                    double tongTienBanHangThem = (double) Math.round(tongTienBanHangThemm * 10) / 10;
                    TongChiTieuBanHang t2 = dao.checkTongChiTieuBanHangExist(sell_ID);
                    if (t2 == null) {
                        dao.insertTongChiTieuBanHang(sell_ID, 0, tongTienBanHangThem);
                    } else {
                        dao.editTongBanHang(sell_ID, tongTienBanHangThem);
                    }
                }
            }
        }

        for (Cart c : list) {
            for (Product p : list2) {
                if (c.getProductID() == p.getId()) {
                    SoLuongDaBan s = dao.checkSoLuongDaBanExist(p.getId());
                    if (s == null) {
                        dao.insertSoLuongDaBan(p.getId(), c.getAmount());
                    } else {
                        dao.editSoLuongDaBan(p.getId(), c.getAmount());
                    }
                }
            }
        }

        dao.insertInvoice(accountID, totalMoneyVAT, shipping.getsID());
        for (Cart c : list) {
            Product p = dao.getProductByIdInteger(c.getProductID());
            dao.editQuantityProduct(p.getQuantity() - c.getAmount(), p.getId());
        }
        Invoice invoice = dao.getInvoiceByAccountID(accountID);
        for (Cart c : list) {
            dao.insertDetailProduct(invoice.getMaHD(), c.getAccountID(), c.getProductID(), c.getAmount());
        }
        TongChiTieuBanHang t = dao.checkTongChiTieuBanHangExist(accountID);
        if (t == null) {
            dao.insertTongChiTieuBanHang(accountID, totalMoneyVAT, 0);
        } else {
            dao.editTongChiTieu(accountID, totalMoneyVAT);
        }

        request.getRequestDispatcher("Order.jsp").forward(request, response);
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
        try {
            String emailAddress = request.getParameter("email");
            String name = request.getParameter("name");
            String phoneNumber = request.getParameter("phoneNumber");
            String deliveryAddress = request.getParameter("deliveryAddress");
//            String priceShipping = request.getParameter("priceShipping");

            HttpSession session = request.getSession();
            Account a = (Account) session.getAttribute("ac");
            if (a == null) {
                response.sendRedirect("login");
                return;
            }
            int accountID = a.getId();
            DAO dao = new DAO();
//            Shipping shipping = dao.getShippingByPrice(priceShipping);
            dao.editInvoice(emailAddress, name, phoneNumber, deliveryAddress, accountID);
            List<Cart> list = dao.getCartByAccountID(accountID);
            List<Product> list2 = dao.getAllProduct();
            Invoice invoice = dao.getInvoiceByAccountID(accountID);
            Shipping shipping = dao.getShippingBySID(invoice.getSid());
            double totalMoney = 0;
            for (Cart c : list) {
                for (Product p : list2) {
                    if (c.getProductID() == p.getId()) {
                        totalMoney = totalMoney + (p.getPrice() * c.getAmount());
                    }
                }
            }
            double totalMoneyVAT = totalMoney + totalMoney * 0.1 + shipping.getPrice();

            SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
            Calendar c1 = Calendar.getInstance();
            c1.setTime(invoice.getNgayXuat());
            c1.roll(Calendar.DATE, shipping.getDay());
//dateFormat.format(c1.getTime());
            //old code
            Email email = new Email();
            email.setFrom("ngosythang123456@gmail.com"); //chinh lai email quan tri tai day [chu y dung email con hoat dong]
            email.setFromPassword("uilosbivibszqtsm"); //mat khau email tren
            email.setTo(emailAddress);
            email.setSubject("Ban da dat hang thanh cong tu nha sach truc tuyen Honya!");
            StringBuilder sb = new StringBuilder();
            sb.append("Anh/Chị ").append(name).append(" thân mến,<br>");
            sb.append("Cảm ơn bạn đã tin dùng và sử dụng sách tại HonYa. Nhà sách trực tuyến uy tín cung cấp giáo trình Tiếng Nhật chất lượng, đảm bảo từ cơ bản đến nâng cao. <br> ");
            sb.append("Hóa đơn của bạn: <br>");
            for (Cart c : list) {
                for (Product p : list2) {
                    if (c.getProductID() == p.getId()) {
                        sb.append(p.getName()).append(" | ").append("Price:").append(p.getPrice()).append("$").append(" | ").append("Amount:").append(c.getAmount()).append(" | ").append("<br>");
                    }
                }
            }
            sb.append("VAT(Thuế giá trị gia tăng): 10%<br>");
            sb.append("Phí Ship: ").append(shipping.getName()).append(" - ").append(shipping.getPrice()).append("$ <br>");
            sb.append("Tổng tiền: ").append(String.format("%.02f", totalMoneyVAT)).append("$").append("<br>");
            sb.append("Địa chỉ nhận hàng: <b>").append(deliveryAddress).append(" </b> <br>");
            sb.append("Số điện thoại bạn đăng kí mua hàng: <b>").append(phoneNumber).append(" </b> <br>");
            sb.append("Thời gian dự kiến giao hàng: <b>").append(dateFormat.format(c1.getTime())).append(" </b> <br>");
            sb.append("Nếu cần hỗ trợ thêm thông tin, vui lòng reply lại email này hoặc liên hệ đến số hotline: 0393270113<br>");
            sb.append("Cảm ơn bạn đã đặt hàng từ Honya.");

            email.setContent(sb.toString());
            EmailUtils.send(email);
            request.setAttribute("mess", "Order Success!");

            dao.deleteCartByAccountID(accountID);

            //new code
//				request.setAttribute("email", emailAddress);
//				request.getRequestDispatcher("ThongTinDatHang.jsp").forward(request, response);
        } catch (Exception e) {
            request.setAttribute("error", "Order failed!");
            e.printStackTrace();
        }

        request.getRequestDispatcher("Order.jsp").forward(request, response);
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

    public static void main(String[] args) throws ParseException {
        LocalDate myObj = LocalDate.now(); // Create a date object
        System.out.println(myObj); // Display the current date	
    }
}
