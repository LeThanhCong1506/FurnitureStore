/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import sample.product.ProductDTO;
import sample.user.UserDTO;
import sample.utils.DBUtils;

/**
 *
 * @author ASUS
 */
public class CartDAO {

    public ArrayList<CartDTO> getUserCart(UserDTO user) {
        ArrayList<CartDTO> cartDetails = new ArrayList<CartDTO>();
        String sqlQueryCartDetail = "SELECT * FROM dbo.Carts_Detail WHERE username=?";

        try (Connection connection = DBUtils.getConnection(); PreparedStatement statementQueryCartDetail = connection.prepareStatement(sqlQueryCartDetail)) {

            statementQueryCartDetail.setString(1, user.getUsername());
            try (ResultSet rsQueryCartDetail = statementQueryCartDetail.executeQuery()) {
                while (rsQueryCartDetail.next()) {
                    CartDTO cartDetail = new CartDTO();
                    cartDetail.setUsername(rsQueryCartDetail.getString("username"));
                    cartDetail.setProductId(rsQueryCartDetail.getString("product_id"));
                    cartDetail.setProductName(rsQueryCartDetail.getString("product_name"));
                    cartDetail.setProductImage(rsQueryCartDetail.getString("product_image"));
                    cartDetail.setProductPrice(rsQueryCartDetail.getFloat("product_price"));
                    cartDetail.setQuantity(rsQueryCartDetail.getInt("quantity"));
                    cartDetail.setTotalPrice(rsQueryCartDetail.getFloat("total_price"));
                    cartDetails.add(cartDetail);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();  // Replace with proper logging
        }

        return cartDetails;
    }
    public ArrayList<CartDTO> getProductCart(ProductDTO pro) {
        ArrayList<CartDTO> cartDetails = new ArrayList<CartDTO>();
        String sqlQueryCartDetail = "SELECT * FROM dbo.Carts_Detail WHERE product_name LIKE ?";

        try (Connection connection = DBUtils.getConnection(); PreparedStatement statementQueryCartDetail = connection.prepareStatement(sqlQueryCartDetail)) {

            statementQueryCartDetail.setString(1, "%"+pro.getName()+"%");
            try (ResultSet rsQueryCartDetail = statementQueryCartDetail.executeQuery()) {
                while (rsQueryCartDetail.next()) {
                    CartDTO cartDetail = new CartDTO();
                    cartDetail.setUsername(rsQueryCartDetail.getString("username"));
                    cartDetail.setProductId(rsQueryCartDetail.getString("product_id"));
                    cartDetail.setProductName(rsQueryCartDetail.getString("product_name"));
                    cartDetail.setProductImage(rsQueryCartDetail.getString("product_image"));
                    cartDetail.setProductPrice(rsQueryCartDetail.getFloat("product_price"));
                    cartDetail.setQuantity(rsQueryCartDetail.getInt("quantity"));
                    cartDetail.setTotalPrice(rsQueryCartDetail.getFloat("total_price"));
                    cartDetails.add(cartDetail);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();  // Replace with proper logging
        }

        return cartDetails;
    }

    public boolean removeFromCart(UserDTO user, CartDTO cartDetail) {
        try {
            Connection connection = DBUtils.getConnection();
            String sqlDeleteCartDetail = "DELETE FROM dbo.Carts_Detail WHERE username=? AND product_id=?";
            PreparedStatement statementDeleteCartDetail = connection.prepareStatement(sqlDeleteCartDetail);
            statementDeleteCartDetail.setString(1, user.getUsername());
            statementDeleteCartDetail.setString(2, cartDetail.getProductId());
            statementDeleteCartDetail.executeUpdate();
            statementDeleteCartDetail.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public ArrayList<CartDTO> getCartList() {
        ArrayList<CartDTO> cartDetails = new ArrayList<CartDTO>();
        try {
            Connection connection = DBUtils.getConnection();
            String sqlQueryCartDetail = "SELECT * FROM dbo.Carts_Detail";
            PreparedStatement statementQueryCartDetail = connection.prepareStatement(sqlQueryCartDetail);
            ResultSet rsQueryCartDetail = statementQueryCartDetail.executeQuery();
            while (rsQueryCartDetail.next()) {
                CartDTO cartDetail = new CartDTO();
                cartDetail.setUsername(rsQueryCartDetail.getString("username"));
                cartDetail.setProductId(rsQueryCartDetail.getString("product_id"));
                cartDetail.setProductName(rsQueryCartDetail.getString("product_name"));
                cartDetail.setProductImage(rsQueryCartDetail.getString("product_image"));
                cartDetail.setProductPrice(rsQueryCartDetail.getFloat("product_price"));
                cartDetail.setQuantity(rsQueryCartDetail.getInt("quantity"));
                cartDetail.setTotalPrice(rsQueryCartDetail.getFloat("total_price"));
                cartDetails.add(cartDetail);
            }
            rsQueryCartDetail.close();
            statementQueryCartDetail.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return cartDetails;
    }

    public boolean addToCart(UserDTO user, CartDTO cartDetail) {
        try {
            Connection connection = DBUtils.getConnection();
            String sqlInsertCartDetail = "INSERT INTO dbo.Carts_Detail (username, product_id, product_name, product_image,"
                    + " product_price, quantity, total_price) VALUES (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement statementInsertCartDetail = connection.prepareStatement(sqlInsertCartDetail);
            statementInsertCartDetail.setString(1, user.getUsername());
            statementInsertCartDetail.setString(2, cartDetail.getProductId());
            statementInsertCartDetail.setString(3, cartDetail.getProductName());
            statementInsertCartDetail.setString(4, cartDetail.getProductImage());
            statementInsertCartDetail.setFloat(5, cartDetail.getProductPrice());
            statementInsertCartDetail.setInt(6, cartDetail.getQuantity());
            statementInsertCartDetail.setFloat(7, cartDetail.getTotalPrice());
            statementInsertCartDetail.executeUpdate();
            statementInsertCartDetail.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean updateCart(UserDTO user, CartDTO cartDetail) {
        try {
            Connection connection = DBUtils.getConnection();
            String sqlUpdateCartDetail = "UPDATE dbo.Carts_Detail SET quantity=?, total_price=? WHERE username=? AND product_id=?";
            PreparedStatement statementUpdateCartDetail = connection.prepareStatement(sqlUpdateCartDetail);
            statementUpdateCartDetail.setInt(1, cartDetail.getQuantity());
            statementUpdateCartDetail.setFloat(2, cartDetail.getProductPrice() * cartDetail.getQuantity());
            statementUpdateCartDetail.setString(3, user.getUsername());
            statementUpdateCartDetail.setString(4, cartDetail.getProductId());
            statementUpdateCartDetail.executeUpdate();
            statementUpdateCartDetail.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
