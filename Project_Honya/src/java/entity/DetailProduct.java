/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author asus
 */
public class DetailProduct {
    private int detailID;
    private int maHD;
    private int accountID;
    private int productID;
    private int amount;

    public DetailProduct() {
    }

    public DetailProduct(int detailID, int maHD, int accountID, int productID, int amount) {
        this.detailID = detailID;
        this.maHD = maHD;
        this.accountID = accountID;
        this.productID = productID;
        this.amount = amount;
    }

    public int getDetailID() {
        return detailID;
    }

    public void setDetailID(int detailID) {
        this.detailID = detailID;
    }

    public int getMaHD() {
        return maHD;
    }

    public void setMaHD(int maHD) {
        this.maHD = maHD;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    @Override
    public String toString() {
        return "DetailProduct{" + "detailID=" + detailID + ", maHD=" + maHD + ", accountID=" + accountID + ", productID=" + productID + ", amount=" + amount + '}';
    }
    
    
}
