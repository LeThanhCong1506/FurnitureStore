/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.wishlist;

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
public class WishlistDAO {

    public ArrayList<WishlistDTO> getUserWish(UserDTO user) {
        ArrayList<WishlistDTO> cartDetails = new ArrayList<WishlistDTO>();
        String sqlQueryCartDetail = "SELECT * FROM dbo.WishList WHERE username=?";

        try (Connection connection = DBUtils.getConnection(); PreparedStatement statementQueryWish = connection.prepareStatement(sqlQueryCartDetail)) {

            statementQueryWish.setString(1, user.getUsername());
            try (ResultSet rsQueryCartDetail = statementQueryWish.executeQuery()) {
                while (rsQueryCartDetail.next()) {
                    WishlistDTO wishDetail = new WishlistDTO();
                    wishDetail.setUsername(rsQueryCartDetail.getString("username"));
                    wishDetail.setProductId(rsQueryCartDetail.getString("product_id"));
                    wishDetail.setProductName(rsQueryCartDetail.getString("product_name"));
                    wishDetail.setProductImage(rsQueryCartDetail.getString("product_image"));
                    wishDetail.setProductPrice(rsQueryCartDetail.getFloat("product_price"));
                    cartDetails.add(wishDetail);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();  // Replace with proper logging
        }
        return cartDetails;
    }

    public boolean addToWish(UserDTO user, ProductDTO wishDetail) {
        try {
            Connection connection = DBUtils.getConnection();
            String sqlInsertCartDetail = "INSERT INTO dbo.WishList (username, product_id, product_name, product_image,product_price) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement statementInsertCartDetail = connection.prepareStatement(sqlInsertCartDetail);
            statementInsertCartDetail.setString(1, user.getUsername());
            statementInsertCartDetail.setString(2, wishDetail.getId());
            statementInsertCartDetail.setString(3, wishDetail.getName());
            statementInsertCartDetail.setString(4, wishDetail.getImage());
            statementInsertCartDetail.setFloat(5, wishDetail.getPrice());
            statementInsertCartDetail.executeUpdate();
            statementInsertCartDetail.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean removeFromCart(UserDTO user, ProductDTO wishDetail) {
        try {
            Connection connection = DBUtils.getConnection();
            String sqlDeleteCartDetail = "DELETE FROM dbo.WishList WHERE username=? AND product_id=?";
            PreparedStatement statementDeleteCartDetail = connection.prepareStatement(sqlDeleteCartDetail);
            statementDeleteCartDetail.setString(1, user.getUsername());
            statementDeleteCartDetail.setString(2, wishDetail.getId());
            statementDeleteCartDetail.executeUpdate();
            statementDeleteCartDetail.close();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
