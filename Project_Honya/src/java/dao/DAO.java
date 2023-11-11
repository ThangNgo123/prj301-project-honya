/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContext;
import entity.Account;
import entity.Cart;
import entity.Category;
import entity.DetailProduct;
import entity.Invoice;
import entity.Product;
import entity.Review;
import entity.Shipping;
import entity.SoLuongDaBan;
import entity.Status;
import entity.TongChiTieuBanHang;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import static org.apache.tomcat.util.http.FastHttpDateFormat.getCurrentDate;

/**
 *
 * @author asus
 */
public class DAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Product> getAllProduct() {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM Honya.dbo.product";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getTop6() {
        List<Product> list = new ArrayList<>();
        String query = "SELECT TOP 6 *\n"
                + "  FROM [Honya].[dbo].[product]";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getNext6(int amount) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT\n"
                + "   *\n"
                + "FROM\n"
                + "    Honya.dbo.product\n"
                + "ORDER BY\n"
                + "    id\n"
                + "OFFSET ? ROWS \n"
                + "FETCH NEXT 6 ROWS ONLY;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, amount);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Category> getAllCategory() {
        List<Category> list = new ArrayList<>();
        String query = "SELECT * FROM Honya.dbo.Category";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Product getNewProduct() {
        String query = "SELECT TOP 1 * FROM Honya.dbo.product\n"
                + "ORDER BY id desc";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(9));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Product> getAllProductByCateId(String cateId) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM Honya.dbo.product\n"
                + "WHERE cateID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, cateId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getTop4RelatedBooks(int cateId) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT TOP 4 * FROM Honya.dbo.product\n"
                + "WHERE cateID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, cateId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getRelatedBooks(int cateId, int amount) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * from Honya.dbo.product\n"
                + "WHERE cateID = ?\n"
                + "ORDER by id ASC\n"
                + "OFFSET ? ROWS FETCH NEXT 4 ROWS ONLY";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, cateId);
            ps.setInt(2, amount);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Product getProductById(String id) {
        String query = "SELECT * FROM Honya.dbo.product\n"
                + "WHERE id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7),
                        rs.getInt(9));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Product getProductByIdInteger(int id) {
        String query = "SELECT * FROM Honya.dbo.product\n"
                + "WHERE id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(9));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Product> getAllProductByName(String txt) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM Honya.dbo.product\n"
                + "WHERE [name] LIKE ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, "%" + txt + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Account login(String user, String pass) {
        String query = "SELECT * FROM Honya.dbo.Account\n"
                + "WHERE [user] = ? " + "AND pass = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Account checkAccountExist(String user) {
        String query = "SELECT * FROM Honya.dbo.Account\n"
                + "WHERE [user] = ? ";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void signUp(String user, String pass) {
        String query = "INSERT INTO Honya.dbo.Account\n"
                + "VALUES(?,?,0,0)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Product> getAllProductBySellID(int sellId) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM Honya.dbo.product\n"
                + "WHERE sell_ID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, sellId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void deleteProduct(String pid) {
        String query = "DELETE FROM Honya.dbo.product\n"
                + "WHERE id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, pid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertProduct(String name, String image, String price, String title, String des, String cate, int id) {
        String query = "INSERT [Honya].[dbo].[product] ( [name], [image], [price], [title], [description], [cateID], [sell_ID]) \n"
                + "VALUES(?,?,?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, price);
            ps.setString(4, title);
            ps.setString(5, des);
            ps.setString(6, cate);
            ps.setInt(7, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateProduct(String name, String image, String price, String title, String des, String cate, int id) {
        String query = "UPDATE Honya.dbo.product\n"
                + "SET name = ?,\n"
                + "image = ?,\n"
                + "price = ?,\n"
                + "title = ?,\n"
                + "description = ?,\n"
                + "cateID = ?\n"
                + "WHERE id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, image);
            ps.setString(3, price);
            ps.setString(4, title);
            ps.setString(5, des);
            ps.setString(6, cate);
            ps.setInt(7, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Account> getAllAccount() {
        List<Account> list = new ArrayList<>();
        String query = "SELECT * FROM Honya.dbo.Account";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void insertAccount(String user, String pass, int isSell, int isAdmin) {
        String query = "INSERT [Honya].[dbo].[Account] ( [user], [pass], [isSell], [isAdmin])\n"
                + "                VALUES(?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setInt(3, isSell);
            ps.setInt(4, isAdmin);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        DAO dao = new DAO();
        List<Account> list = dao.getAllAccount();
        for (Account a : list) {
            System.out.println(a);
        }
    }

    public void deleteAccount(String pid) {
        String query = "DELETE FROM Honya.dbo.Account\n"
                + "                WHERE uID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, pid);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void updateAccount(String user, String pass, int isSell, int isAdmin, int id) {
        String query = "UPDATE Honya.dbo.Account \n"
                + "SET [user] = ?,\n"
                + "pass = ?,\n"
                + "isSell = ?,\n"
                + "isAdmin = ?\n"
                + "WHERE uID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, pass);
            ps.setInt(3, isSell);
            ps.setInt(4, isAdmin);
            ps.setInt(5, id);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public Account getAccountById(String id) {
        String query = "SELECT * FROM Account \n"
                + "WHERE uID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Cart checkCartExist(int accountID, int productID) {

        String query = "SELECT * FROM Honya.dbo.Cart\n"
                + "where [accountID] = ? and [productID] = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, accountID);
            ps.setInt(2, productID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Cart(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void editAmountAndSizeCart(int accountID, int productID, int amount) {
        String query = "update Honya.dbo.Cart \n"
                + "SET [amount] = ?\n"
                + "where [accountID]=? and [productID]=?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, amount);
            ps.setInt(2, accountID);
            ps.setInt(3, productID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void insertCart(int accountID, int productID, int amount) {
        String query = "insert Honya.dbo.Cart(accountID, productID, amount)\n"
                + "        	values(?,?,?)";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, accountID);
            ps.setInt(2, productID);
            ps.setInt(3, amount);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public List<Cart> getCartByAccountID(int accountID) {
        List<Cart> list = new ArrayList<>();
        String query = "select * from Honya.dbo.Cart where accountID = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, accountID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Cart(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void editAmountCart(int accountID, int productID, int amount) {
        String query = "update Honya.dbo.Cart set [amount]=?\r\n"
                + "where [accountID]=? and [productID]=?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, amount);
            ps.setInt(2, accountID);
            ps.setInt(3, productID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void editStatus(String mahd, int stid) {
        String query = "UPDATE Honya.dbo.Invoice\n"
                + "SET statusID = ?\n"
                + "WHERE maHD = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, stid);
            ps.setString(2, mahd);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteCart(int productID) {
        String query = "delete from Honya.dbo.Cart where productID = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, productID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void deleteCartByAccountID(int accountID) {
        String query = "delete from Honya.dbo.Cart \r\n"
                + "where [accountID]=?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, accountID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public int getSellIDByProductID(int productID) {
        String query = "select sell_ID\r\n"
                + "from Honya.dbo.product\r\n"
                + "where [id]=?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, productID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public TongChiTieuBanHang checkTongChiTieuBanHangExist(int userID) {

        String query = "select * from Honya.dbo.TongChiTieuBanHang where [userID]=?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, userID);

            rs = ps.executeQuery();
            while (rs.next()) {
                return new TongChiTieuBanHang(rs.getInt(1),
                        rs.getDouble(2),
                        rs.getDouble(3)
                );
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void insertTongChiTieuBanHang(int userID, double tongChiTieu, double tongBanHang) {
        String query = "insert Honya.dbo.TongChiTieuBanHang(userID,TongChiTieu,TongBanHang)\r\n"
                + "values(?,?,?)";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, userID);
            ps.setDouble(2, tongChiTieu);
            ps.setDouble(3, tongBanHang);

            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void editTongBanHang(int sell_ID, double tongTienBanHangThem) {
        String query = "EXEC Honya.dbo.proc_CapNhatTongBanHang ?,?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, sell_ID);
            ps.setDouble(2, tongTienBanHangThem);

            ps.executeUpdate();

        } catch (Exception e) {

        }
    }

    public void reduceTongBanHang(int sell_ID, double tongTienBanHangThem) {
        String query = "EXEC Honya.dbo.proc_GiamTienTongBanHang ?,?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, sell_ID);
            ps.setDouble(2, tongTienBanHangThem);

            ps.executeUpdate();

        } catch (Exception e) {

        }
    }

    public SoLuongDaBan checkSoLuongDaBanExist(int productID) {

        String query = "select * from Honya.dbo.SoLuongDaBan where productID = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, productID);

            rs = ps.executeQuery();
            while (rs.next()) {
                return new SoLuongDaBan(rs.getInt(1),
                        rs.getInt(2)
                );
            }
        } catch (Exception e) {
        }
        return null;
    }

    public void insertSoLuongDaBan(int productID, int soLuongDaBan) {
        String query = "insert Honya.dbo.SoLuongDaBan(productID,soLuongDaBan)\r\n"
                + "values(?,?)";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, productID);
            ps.setInt(2, soLuongDaBan);

            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public void editSoLuongDaBan(int productID, int soLuongBanThem) {
        String query = "exec Honya.dbo.proc_CapNhatSoLuongDaBan ?,?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, productID);
            ps.setInt(2, soLuongBanThem);

            ps.executeUpdate();

        } catch (Exception e) {

        }
    }

    public void reduceSoLuongDaBan(int productID, int soLuongBanThem) {
        String query = "EXEC Honya.dbo.proc_GiamSoLuongBanHang ?,?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, productID);
            ps.setInt(2, soLuongBanThem);

            ps.executeUpdate();

        } catch (Exception e) {

        }
    }

    public void insertInvoice(int accountID, double tongGia, int sid) {
        String query = "insert Honya.dbo.Invoice(accountID,tongGia,ngayXuat,shippingID,statusID)\n"
                + "             values(?,?,?,?,?)";

        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, accountID);
            ps.setDouble(2, tongGia);
            ps.setDate(3, getCurrentDate());
            ps.setInt(4, sid);
            ps.setInt(5, 1);
            ps.executeUpdate();

        } catch (Exception e) {

        }
    }

    public void insertDetailProduct(int maHD, int accountID, int productID, int amount) {
        String query = "INSERT Honya.dbo.DetailProduct(maHD,accountID,productID,amount)\n"
                + "VALUES(?,?,?,?)";

        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, maHD);
            ps.setInt(2, accountID);
            ps.setInt(3, productID);
            ps.setInt(4, amount);
            ps.executeUpdate();

        } catch (Exception e) {

        }
    }

    public void editTongChiTieu(int accountID, double totalMoneyVAT) {
        String query = "exec Honya.dbo.proc_CapNhatTongChiTieu ?,?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, accountID);
            ps.setDouble(2, totalMoneyVAT);

            ps.executeUpdate();

        } catch (Exception e) {

        }
    }

    public void reduceTongChiTieu(int accountID, double totalMoneyVAT) {
        String query = "exec Honya.dbo.proc_GiamTienTongChiTieu ?,?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, accountID);
            ps.setDouble(2, totalMoneyVAT);

            ps.executeUpdate();

        } catch (Exception e) {

        }
    }

    public void editInvoice(String email, String name, String phone, String address, int accountID) {
        String query = "UPDATE Honya.dbo.Invoice\n"
                + "SET  email = ?, name = ?, phone = ?, deliveryAddress = ?\n"
                + "WHERE accountID = ? AND maHD = (SELECT MAX(maHD)  FROM Honya.dbo.Invoice WHERE accountID = ?)";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, name);
            ps.setString(3, phone);
            ps.setString(4, address);
            ps.setInt(5, accountID);
            ps.setInt(6, accountID);
            ps.executeUpdate();

        } catch (Exception e) {

        }
    }

    public void editQuantityProduct(int quantity, int id) {
        String query = "UPDATE Honya.dbo.product\n"
                + "SET quantity = ?\n"
                + "WHERE id = ?;";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, quantity);
            ps.setInt(2, id);

            ps.executeUpdate();

        } catch (Exception e) {

        }
    }

    public List<SoLuongDaBan> getSoLuongDaBan() {
        List<SoLuongDaBan> list = new ArrayList<>();
        String query = "SELECT * FROM Honya.dbo.SoLuongDaBan";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new SoLuongDaBan(rs.getInt(1),
                        rs.getInt(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Status> getAllStatus() {
        List<Status> list = new ArrayList<>();
        String query = "SELECT * FROM Honya.dbo.Status";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Status(rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public SoLuongDaBan getSoLuongDaBanById(int id) {
        String query = "SELECT * FROM Honya.dbo.SoLuongDaBan\n"
                + "WHERE productID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new SoLuongDaBan(rs.getInt(1),
                        rs.getInt(2));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Invoice getInvoiceByAccountID(int accountID) {

        String query = "SELECT * FROM Honya.dbo.Invoice\n"
                + "WHERE accountID = ? AND maHD = (SELECT MAX(maHD)  FROM Honya.dbo.Invoice WHERE accountID = ?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, accountID);
            ps.setInt(2, accountID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Invoice(rs.getInt(1),
                        rs.getInt(2),
                        rs.getDouble(3),
                        rs.getDate(4),
                        rs.getInt(9));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Invoice getInvoiceByMaHD(String maHD) {

        String query = "SELECT * FROM Honya.dbo.Invoice\n"
                + "WHERE maHD = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, maHD);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Invoice(rs.getInt(1),
                        rs.getInt(2),
                        rs.getDouble(3),
                        rs.getDate(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getInt(10));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public String getStatusName(int stID) {
        String query = "SELECT status FROM Honya.dbo.Status\n"
                + "WHERE stID = ?";
        String string = "";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, stID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return string = rs.getString(1);
            }
        } catch (Exception e) {
        }
        return string;
    }

    public String getCategoryName(int stID) {
        String query = "SELECT cname FROM Honya.dbo.Category\n"
                + "WHERE cid = ?";
        String string = "";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, stID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return string = rs.getString(1);
            }
        } catch (Exception e) {
        }
        return string;
    }

    public List<Invoice> getListInvoiceByAccountID(int accountID) {
        List<Invoice> list = new ArrayList<>();
        String query = "SELECT * FROM Honya.dbo.Invoice\n"
                + "WHERE accountID = ? ";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, accountID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Invoice(rs.getInt(1),
                        rs.getInt(2),
                        rs.getDouble(3),
                        rs.getDate(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getInt(10)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Invoice> getAllListInvoice() {
        List<Invoice> list = new ArrayList<>();
        String query = "SELECT * FROM Honya.dbo.Invoice";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Invoice(rs.getInt(1),
                        rs.getInt(2),
                        rs.getDouble(3),
                        rs.getDate(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getInt(10)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Invoice> searchByNgayXuat(String ngayXuat) {
        List<Invoice> list = new ArrayList<>();
        String query = "SELECT * FROM Honya.dbo.Invoice\n"
                + "WHERE ngayXuat = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, ngayXuat);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Invoice(rs.getInt(1),
                        rs.getInt(2),
                        rs.getDouble(3),
                        rs.getDate(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9),
                        rs.getInt(10)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<DetailProduct> getDetailProductByMaHD(String maHD, int accountID) {
        List<DetailProduct> list = new ArrayList<>();
        String query = "SELECT * FROM Honya.dbo.DetailProduct\n"
                + "WHERE maHD = ? AND accountID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, maHD);
            ps.setInt(2, accountID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new DetailProduct(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Shipping> getAllShipping() {
        List<Shipping> list = new ArrayList<>();
        String query = "SELECT * FROM Honya.dbo.Shipping";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Shipping(rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getInt(4)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Shipping getShippingBySID(int id) {
        String query = "SELECT * FROM Honya.dbo.Shipping\n"
                + "WHERE sID = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Shipping(rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getInt(4));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public Shipping getShippingByPrice(String price) {
        String query = "SELECT * FROM Honya.dbo.Shipping\n"
                + "             WHERE price = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, price);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Shipping(rs.getInt(1),
                        rs.getString(2),
                        rs.getDouble(3),
                        rs.getInt(4));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public int getNumberPage() {
        String query = "SELECT COUNT(*) FROM Honya.dbo.product\n";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int total = rs.getInt(1);
                int countPage = 0;
                countPage = total / 6;
                if (total % 6 != 0) {
                    countPage++;
                }
                return countPage;
            }
        } catch (Exception e) {

        }
        return 0;
    }

    public List<Product> getPage(int index) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM Honya.dbo.product\n"
                + "ORDER BY id\n"
                + "OFFSET ? ROWS \n"
                + "FETCH FIRST 6 ROWS ONLY";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, (index - 1) * 6);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getNewBook(int amount) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * from Honya.dbo.product\n"
                + "WHERE cateID IN (1,2,3,4)\n"
                + "ORDER by id DESC\n"
                + "OFFSET ? ROWS FETCH NEXT 4 ROWS ONLY";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, amount);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public Product getProductByID(int id) {
        String query = "SELECT * FROM Honya.dbo.product\n"
                + "WHERE id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(9));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Product> getTop4() {
        List<Product> list = new ArrayList<>();
        String query = "SELECT TOP 4 * from Honya.dbo.product\n"
                + "WHERE cateID IN (1,2,3,4)\n"
                + "order by id DESC";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getTop4BestSeller() {
        List<Product> list = new ArrayList<>();
        String query = "SELECT TOP 4 * FROM Honya.dbo.SoLuongDaBan\n"
                + "JOIN product ON product.id = SoLuongDaBan.productID\n"
                + "order by soLuongDaBan DESC";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDouble(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(11)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getTop5BestSeller() {
        List<Product> list = new ArrayList<>();
        String query = "SELECT TOP 5 * FROM Honya.dbo.SoLuongDaBan\n"
                + "JOIN Honya.dbo.product ON product.id = SoLuongDaBan.productID\n"
                + "order by soLuongDaBan DESC";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDouble(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getBestSeller(int amount) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM Honya.dbo.SoLuongDaBan\n"
                + "JOIN product ON product.id = SoLuongDaBan.productID\n"
                + "order by soLuongDaBan DESC\n"
                + "OFFSET ? ROWS FETCH NEXT 4 ROWS ONLY";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, amount);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getDouble(6),
                        rs.getString(7),
                        rs.getString(8),
                        rs.getInt(11)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getTop4Combo() {
        List<Product> list = new ArrayList<>();
        String query = "SELECT TOP 4 * FROM\n"
                + "Honya.dbo.product\n"
                + "WHERE cateID = '5'";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Product> getComboBooks(int amount) {
        List<Product> list = new ArrayList<>();
        String query = "SELECT * FROM\n"
                + "Honya.dbo.product\n"
                + "WHERE cateID = '5'\n"
                + "order by id ASC \n"
                + "OFFSET ? ROWS FETCH NEXT 4 ROWS ONLY";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, amount);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getDouble(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getInt(9)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    private static java.sql.Date getCurrentDate() {
        java.util.Date today = new java.util.Date();
        return new java.sql.Date(today.getTime());
    }

    public void insertReview(int accountID, int productID, String contentReview) {
        String query = "insert Honya.dbo.Review(accountID, productID, contentReview, dateReview)\r\n"
                + "values(?,?,?,?)";

        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, accountID);
            ps.setInt(2, productID);
            ps.setString(3, contentReview);
            ps.setDate(4, getCurrentDate());
            ps.executeUpdate();

        } catch (Exception e) {
        }
    }

    public Review getNewReview(int accountID, int productID) {
        String query = "select top 1 * from Honya.dbo.Review\r\n"
                + "where accountID = ? and productID = ?\r\n"
                + "order by maReview desc";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, accountID);
            ps.setInt(2, productID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Review(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getDate(4));
            }
        } catch (Exception e) {
        }
        return null;
    }

    public List<Review> getAllReviewByProductID(String productId) {
        List<Review> list = new ArrayList<>();
        String query = "select * from Honya.dbo.Review\r\n"
                + "where [productID] =?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, productId);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Review(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getDate(4)
                ));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<Account> getAllAcc() {
        List<Account> list = new ArrayList<>();
        String query = "select * FROM Honya.dbo.Account";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Account(rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public void cancelOrder(String maHD, int accountID) {
        String query = "UPDATE Honya.dbo.Invoice\n"
                + "SET statusID = 5\n"
                + "WHERE maHD = ? AND accountID = ?";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, maHD);
            ps.setInt(2, accountID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    public int countAccount() {
        String query = "SELECT COUNT(uID)\n"
                + "FROM Honya.dbo.Account;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int total = rs.getInt(1);
                return total;
            }
        } catch (Exception e) {

        }
        return 0;
    }

    public int countProduct() {
        String query = "SELECT COUNT(id)\n"
                + "FROM Honya.dbo.product;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int total = rs.getInt(1);
                return total;
            }
        } catch (Exception e) {

        }
        return 0;
    }

    public int countReview() {
        String query = "SELECT COUNT(maReview)\n"
                + "FROM Honya.dbo.Review;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                int total = rs.getInt(1);
                return total;
            }
        } catch (Exception e) {

        }
        return 0;
    }

    public float totalSeller() {
        String query = "SELECT SUM(TongBanHang)\n"
                + "FROM Honya.dbo.TongChiTieuBanHang;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                float total = rs.getFloat(1);
                return total;
            }
        } catch (Exception e) {

        }
        return 0;
    }

    public double totalMoneyMonth(int month) {
        String query = "select SUM(tongGia) from Honya.dbo.Invoice\r\n"
                + "where MONTH(ngayXuat)=?\r\n"
                + "Group by MONTH(ngayXuat)";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, month);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public double totalMoneyDay(int day) {
        String query = "select \r\n"
                + "	SUM(tongGia) \r\n"
                + "from Honya.dbo.Invoice\r\n"
                + "where DATEPART(dw,[ngayXuat]) = ?\r\n"
                + "Group by ngayXuat ";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, day);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getDouble(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

    public List<TongChiTieuBanHang> getTop5Customers() {
        List<TongChiTieuBanHang> list = new ArrayList<>();
        String query = "SELECT TOP 5 * FROM Honya.dbo.TongChiTieuBanHang\n"
                + "JOIN Honya.dbo.Account ON Account.uID = TongChiTieuBanHang.userID\n"
                + "ORDER BY TongChiTieu DESC";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new TongChiTieuBanHang(rs.getDouble(2),
                        rs.getInt(4),
                        rs.getString(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }

    public List<TongChiTieuBanHang> getTop5Seller() {
        List<TongChiTieuBanHang> list = new ArrayList<>();
        String query = "SELECT TOP 5 * FROM Honya.dbo.TongChiTieuBanHang\n"
                + "JOIN Honya.dbo.Account ON Account.uID = TongChiTieuBanHang.userID\n"
                + "ORDER BY TongBanHang DESC";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new TongChiTieuBanHang(rs.getDouble(3),
                        rs.getInt(4),
                        rs.getString(5)));
            }
        } catch (Exception e) {
        }
        return list;
    }
}
