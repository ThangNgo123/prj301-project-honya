/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author asus
 */
public class Status {
    private int stID;
    private String status;

    public Status() {
    }

    public Status(int stID, String status) {
        this.stID = stID;
        this.status = status;
    }

    public int getStID() {
        return stID;
    }

    public void setStID(int stID) {
        this.stID = stID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Status{" + "stID=" + stID + ", status=" + status + '}';
    }
    
    
}
