/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

public class TongChiTieuBanHang {
	 private int userID;
	 private double tongChiTieu;
	 private double tongBanHang;
         private String name;
         
        public TongChiTieuBanHang(double tongChiTieu,int userID, String name){
            this.tongChiTieu = tongChiTieu;
            this.userID = userID;
            this.name = name;
        }
         
	public TongChiTieuBanHang(int userID, double tongChiTieu, double tongBanHang) {
		
		this.userID = userID;
		this.tongChiTieu = tongChiTieu;
		this.tongBanHang = tongBanHang;
	}
	public TongChiTieuBanHang() {
		
	}
	@Override
	public String toString() {
		return "TongChiTieuBanHang [userID=" + userID + ", tongChiTieu=" + tongChiTieu + ", tongBanHang=" + tongBanHang
				+ "]";
	}

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
        
        
        
	public int getUserID() {
		return userID;
	}
	public void setUserID(int userID) {
		this.userID = userID;
	}
	public double getTongChiTieu() {
		return tongChiTieu;
	}
	public void setTongChiTieu(double tongChiTieu) {
		this.tongChiTieu = tongChiTieu;
	}
	public double getTongBanHang() {
		return tongBanHang;
	}
	public void setTongBanHang(double tongBanHang) {
		this.tongBanHang = tongBanHang;
	}
	
}
