/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.invoice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import sample.cart.CartDAO;
import sample.cart.CartDTO;
import sample.product.ProductDAO;
import sample.product.ProductDTO;
import sample.user.UserDAO;
import sample.user.UserDTO;
import sample.utils.DBUtils;

/**
 *
 * @author ASUS
 */
public class InvoiceDAO {

    public InvoiceDAO() {

    }

    public ArrayList<InvoiceDTO> getAll() {
        ArrayList<InvoiceDTO> billList = new ArrayList<InvoiceDTO>();
        try {
            Connection connection = DBUtils.getConnection();
            String sqlQueryBills = "SELECT * FROM dbo.Invoice";
            PreparedStatement statementQueryBills = connection.prepareStatement(sqlQueryBills);
            ResultSet rsQueryBills = statementQueryBills.executeQuery();
            while (rsQueryBills.next()) {
                InvoiceDTO bill = new InvoiceDTO();
                bill.setId(rsQueryBills.getString("id"));
                bill.setUsername(rsQueryBills.getString("username"));
                bill.setInvoiceDate(rsQueryBills.getString("invoice_date"));
                bill.setTotalPrice(rsQueryBills.getFloat("total_price"));
                billList.add(bill);
            }
            rsQueryBills.close();
            statementQueryBills.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return billList;
    }

    public ArrayList<InvoiceDTO> getBillOfUser(InvoiceDTO user) {
        ArrayList<InvoiceDTO> bills = new ArrayList<InvoiceDTO>();
        try {
            Connection connection = DBUtils.getConnection();
            String sqlQueryBills = "SELECT * FROM dbo.Invoice WHERE username=?";
            PreparedStatement statementQueryBills = connection.prepareStatement(sqlQueryBills);
            statementQueryBills.setString(1, user.getUsername());
            ResultSet rsQueryBills = statementQueryBills.executeQuery();
            while (rsQueryBills.next()) {
                InvoiceDTO bill = new InvoiceDTO();
                bill.setId(rsQueryBills.getString("id"));
                bill.setUsername(rsQueryBills.getString("username"));
                bill.setInvoiceDate(rsQueryBills.getString("invoice_date"));
                bill.setTotalPrice(rsQueryBills.getFloat("total_price"));
                bills.add(bill);
            }
            rsQueryBills.close();
            statementQueryBills.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bills;
    }

    public ArrayList<InvoicedetailDTO> getInvoiceDetailList(InvoiceDTO iv) {
        ArrayList<InvoicedetailDTO> bills = new ArrayList<InvoicedetailDTO>();
        try {
            Connection connection = DBUtils.getConnection();
            String sqlQueryBills = "SELECT * FROM dbo.Invoice_Detail WHERE bill_id=?";
            PreparedStatement statementQueryBills = connection.prepareStatement(sqlQueryBills);
            statementQueryBills.setString(1, iv.getId());
            ResultSet rsQueryBillDetail = statementQueryBills.executeQuery();
            while (rsQueryBillDetail.next()) {
                InvoicedetailDTO billDetail = new InvoicedetailDTO();
                billDetail.setInvoiceId(rsQueryBillDetail.getString("bill_id"));
                billDetail.setProductId(rsQueryBillDetail.getString("product_id"));
                billDetail.setProductName(rsQueryBillDetail.getString("product_name"));
                billDetail.setProductImage(rsQueryBillDetail.getString("product_image"));
                billDetail.setProductPrice(rsQueryBillDetail.getFloat("product_price"));
                billDetail.setQuantity(rsQueryBillDetail.getInt("quantity"));
                billDetail.setTotalPrice(rsQueryBillDetail.getFloat("total_price"));
                bills.add(billDetail);
            }
            rsQueryBillDetail.close();
            statementQueryBills.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bills;
    }

    public InvoiceDTO read(InvoiceDTO bill) {
        InvoiceDTO existedBill = null;
        try {
            String sqlQueryBill = "SELECT * FROM dbo.Invoice WHERE id=?";
            Connection connection = DBUtils.getConnection();
            PreparedStatement statementQueryBill = connection.prepareStatement(sqlQueryBill);
            statementQueryBill.setString(1, bill.getId());
            ResultSet rsQueryBill = statementQueryBill.executeQuery();
            if (rsQueryBill.next()) {
                existedBill = new InvoiceDTO();
                existedBill.setId(rsQueryBill.getString("id"));
                existedBill.setUsername(rsQueryBill.getString("username"));
                existedBill.setInvoiceDate(rsQueryBill.getString("invoice_date"));
                existedBill.setTotalPrice(rsQueryBill.getFloat("total_price"));
            }
            rsQueryBill.close();
            statementQueryBill.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return existedBill;
    }

//    public InvoiceDTO readBillDetail(InvoiceDTO existedBill) {
//        try {
//            Connection connection = DBUtils.getConnection();
//            String sqlQueryBillDetail = "SELECT * FROM dbo.Invoice_Detail WHERE bill_id=?";
//            PreparedStatement statementQueryBillDetail = connection.prepareStatement(sqlQueryBillDetail);
//            statementQueryBillDetail.setString(1, existedBill.getId());
//            ResultSet rsQueryBillDetail = statementQueryBillDetail.executeQuery();
//            while (rsQueryBillDetail.next()) {
//                InvoicedetailDTO billDetail = new InvoicedetailDTO();
//                billDetail.setProductId(rsQueryBillDetail.getString("product_id"));
//                billDetail.setProductName(rsQueryBillDetail.getString("product_name"));
//                billDetail.setProductImage(rsQueryBillDetail.getString("product_image"));
//                billDetail.setProductPrice(rsQueryBillDetail.getInt("product_price"));
//                billDetail.setQuantity(rsQueryBillDetail.getInt("quantity"));
//                billDetail.setTotalPrice(rsQueryBillDetail.getDouble("total_price"));
//                existedBill.getInvoiceDetails().add(billDetail);
//            }
//            rsQueryBillDetail.close();
//            statementQueryBillDetail.close();
//            connection.close();
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return existedBill;
//    }
    public boolean create(InvoiceDTO bill, UserDTO currentUser) {
        try {
            Connection connection = DBUtils.getConnection();

            // Táº¡o Bill
            String sqlInsertBill = "INSERT INTO dbo.Invoice(id, username, invoice_date, total_price) VALUES (?, ?, ?, ?)";
            PreparedStatement statementInsertBill = connection.prepareStatement(sqlInsertBill);
            statementInsertBill.setString(1, bill.getId());
            statementInsertBill.setString(2, bill.getUsername().equals("") ? null : bill.getUsername());
            statementInsertBill.setString(3, bill.getInvoiceDate());
            statementInsertBill.setDouble(4, bill.getTotalPrice());
            statementInsertBill.executeUpdate();
            statementInsertBill.close();

//            // Táº¡o Bills_Detail cá»§a Bill
//            ArrayList<ProductDTO> productList = new ProductDAO().getAll();
//            for (InvoicedetailDTO billDetail : bill.getInvoiceDetails()) {
//                String sqlInsertBillDetail = "INSERT INTO dbo.Invoice_Detail(bill_id, product_id, product_name, product_image, product_price, quantity, total_price) VALUES (?, ?, ?, ?, ?, ?, ?)";
//                PreparedStatement statementInsertBillDetail = connection.prepareStatement(sqlInsertBillDetail);
//                statementInsertBillDetail.setString(1, bill.getId());
//                statementInsertBillDetail.setString(2, billDetail.getProductId());
//                statementInsertBillDetail.setString(3, billDetail.getProductName());
//                statementInsertBillDetail.setString(4, billDetail.getProductImage());
//                statementInsertBillDetail.setInt(5, billDetail.getProductPrice());
//                statementInsertBillDetail.setInt(6, billDetail.getQuantity());
//                statementInsertBillDetail.setDouble(7, billDetail.getTotalPrice());
//                statementInsertBillDetail.executeUpdate();
//                statementInsertBillDetail.close();
//
//                if (currentUser != null) {
//                    CartDTO cartDetail = new CartDTO();
//                    cartDetail.setProductId(billDetail.getProductId());
//                    new CartDAO().removeFromCart(currentUser, cartDetail);
//                }
//
//                ProductDTO product = productList.stream().filter((p) -> p.getId().equals(billDetail.getProductId())).findFirst().get();
//                product.setQuantity(product.getQuantity() - billDetail.getQuantity());
//                new ProductDAO().update(product);
//            }
            connection.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean create2(InvoicedetailDTO bill, UserDTO currentUser) {
        try {
            Connection connection = DBUtils.getConnection();

            String sqlInsertBillDetail = "INSERT INTO dbo.Invoice_Detail(bill_id, product_id, product_name, product_image, product_price, quantity, total_price) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statementInsertBillDetail = connection.prepareStatement(sqlInsertBillDetail);
            statementInsertBillDetail.setString(1, bill.getInvoiceId());
            statementInsertBillDetail.setString(2, bill.getProductId());
            statementInsertBillDetail.setString(3, bill.getProductName());
            statementInsertBillDetail.setString(4, bill.getProductImage());
            statementInsertBillDetail.setFloat(5, bill.getProductPrice());
            statementInsertBillDetail.setInt(6, bill.getQuantity());
            statementInsertBillDetail.setFloat(7, bill.getTotalPrice());
            statementInsertBillDetail.executeUpdate();
            statementInsertBillDetail.close();

            connection.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean delete(InvoiceDTO bill) {
        try {
            Connection connection = DBUtils.getConnection();

            // XÃ³a Bills_Detail cá»§a Bill
            String sqlDeleteCart = "DELETE FROM dbo.Invoice_Detail WHERE bill_id=?";
            PreparedStatement statementDeleteCart = connection.prepareStatement(sqlDeleteCart);
            statementDeleteCart.setString(1, bill.getId());
            statementDeleteCart.executeUpdate();
            statementDeleteCart.close();

            // XÃ³a Bill
            String sqlDeleteBill = "DELETE FROM dbo.Invoice WHERE id=?";
            PreparedStatement statementDeleteBill = connection.prepareStatement(sqlDeleteBill);
            statementDeleteBill.setString(1, bill.getId());
            statementDeleteBill.executeUpdate();
            statementDeleteBill.close();

            connection.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
