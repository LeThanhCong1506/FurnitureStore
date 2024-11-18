/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.invoice;

import java.sql.Timestamp;
import java.util.ArrayList;

/**
 *
 * @author ASUS
 */
public class InvoiceDTO {

    private String id;
    private String username;
    private String invoiceDate;
    private float totalPrice;

    public InvoiceDTO() {
    }

    public InvoiceDTO(String id) {
        this.id = id;
    }

    public InvoiceDTO(String id, String username, String invoiceDate, float totalPrice) {
        this.id = id;
        this.username = username;
        this.invoiceDate = invoiceDate;
        this.totalPrice = totalPrice;
    }

    

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getInvoiceDate() {
        return invoiceDate;
    }

    public void setInvoiceDate(String invoiceDate) {
        this.invoiceDate = invoiceDate;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

}
