/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package entity;

/**
 *
 * @author asus
 */
public class Shipping {
    private int sID;
    private String name;
    private double price;
    private int day;

    public Shipping() {
    }

    public Shipping(int sID, String name, double price, int day) {
        this.sID = sID;
        this.name = name;
        this.price = price;
        this.day = day;
    }

    public int getsID() {
        return sID;
    }

    public void setsID(int sID) {
        this.sID = sID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getDay() {
        return day;
    }

    public void setDay(int day) {
        this.day = day;
    }

    @Override
    public String toString() {
        return "Shipping{" + "sID=" + sID + ", name=" + name + ", price=" + price + ", day=" + day + '}';
    }
    
    
}
