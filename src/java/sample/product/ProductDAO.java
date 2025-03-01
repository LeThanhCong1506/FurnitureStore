/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import sample.utils.DBUtils;

public class ProductDAO {

    public ProductDAO() {

    }

    public ArrayList<ProductDTO> getAll() {
        ArrayList<ProductDTO> productList = new ArrayList<ProductDTO>();
        try {
            Connection connection = DBUtils.getConnection();
            String sqlQueryProducts = "SELECT * FROM dbo.Products";
            PreparedStatement statementQueryProducts = connection.prepareStatement(sqlQueryProducts);
            ResultSet rsQueryProducts = statementQueryProducts.executeQuery();
            while (rsQueryProducts.next()) {
                ProductDTO product = new ProductDTO();
                product.setId(rsQueryProducts.getString("id"));
                product.setName(rsQueryProducts.getString("name"));
                product.setType(rsQueryProducts.getString("type"));
                product.setImage(rsQueryProducts.getString("image"));
                product.setDescription(rsQueryProducts.getString("description"));
                product.setPrice(rsQueryProducts.getFloat("price"));
                product.setSale(rsQueryProducts.getInt("sale"));
                product.setQuantity(rsQueryProducts.getInt("quantity"));
                productList.add(product);
            }
            rsQueryProducts.close();
            statementQueryProducts.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return productList;
    }

    public ProductDTO read(ProductDTO product) {
        ProductDTO existedProduct = null;
        try {
            Connection connection = DBUtils.getConnection();
            String sqlQueryProduct = "SELECT * FROM dbo.Products WHERE id=?";
            PreparedStatement statementQueryProduct = connection.prepareStatement(sqlQueryProduct);
            statementQueryProduct.setString(1, product.getId());
            ResultSet rsQueryProduct = statementQueryProduct.executeQuery();
            if (rsQueryProduct.next()) {
                existedProduct = new ProductDTO();
                existedProduct.setId(rsQueryProduct.getString("id"));
                existedProduct.setName(rsQueryProduct.getString("name"));
                existedProduct.setType(rsQueryProduct.getString("type"));
                existedProduct.setImage(rsQueryProduct.getString("image"));
                existedProduct.setDescription(rsQueryProduct.getString("description"));
                existedProduct.setPrice(rsQueryProduct.getFloat("price"));
                existedProduct.setSale(rsQueryProduct.getInt("sale"));
                existedProduct.setQuantity(rsQueryProduct.getInt("quantity"));
            }
            rsQueryProduct.close();
            statementQueryProduct.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return existedProduct;
    }

    public ArrayList<ProductDTO> search(ProductDTO product) {
        ArrayList<ProductDTO> searchProduct = new ArrayList<ProductDTO>();
        ProductDTO existedProduct = null;
        try {
            Connection connection = DBUtils.getConnection();
            String sqlQueryProduct = "SELECT * FROM dbo.Products WHERE name LIKE ?";
            PreparedStatement statementQueryProduct = connection.prepareStatement(sqlQueryProduct);
            statementQueryProduct.setString(1, "%"+product.getName()+"%");
            ResultSet rsQueryProduct = statementQueryProduct.executeQuery();
            while (rsQueryProduct.next()) {
                existedProduct = new ProductDTO();
                existedProduct.setId(rsQueryProduct.getString("id"));
                existedProduct.setName(rsQueryProduct.getString("name"));
                existedProduct.setType(rsQueryProduct.getString("type"));
                existedProduct.setImage(rsQueryProduct.getString("image"));
                existedProduct.setDescription(rsQueryProduct.getString("description"));
                existedProduct.setPrice(rsQueryProduct.getFloat("price"));
                existedProduct.setSale(rsQueryProduct.getInt("sale"));
                existedProduct.setQuantity(rsQueryProduct.getInt("quantity"));
                searchProduct.add(existedProduct);
            }
            rsQueryProduct.close();
            statementQueryProduct.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return searchProduct;
    }
    
    public ArrayList<ProductDTO> search2(ProductDTO product) {
        ArrayList<ProductDTO> searchProduct = new ArrayList<ProductDTO>();
        ProductDTO existedProduct = null;
        try {
            Connection connection = DBUtils.getConnection();
            String sqlQueryProduct = "SELECT * FROM dbo.Products WHERE type=?";
            PreparedStatement statementQueryProduct = connection.prepareStatement(sqlQueryProduct);
            statementQueryProduct.setString(1,product.getType());
            ResultSet rsQueryProduct = statementQueryProduct.executeQuery();
            while (rsQueryProduct.next()) {
                existedProduct = new ProductDTO();
                existedProduct.setId(rsQueryProduct.getString("id"));
                existedProduct.setName(rsQueryProduct.getString("name"));
                existedProduct.setType(rsQueryProduct.getString("type"));
                existedProduct.setImage(rsQueryProduct.getString("image"));
                existedProduct.setDescription(rsQueryProduct.getString("description"));
                existedProduct.setPrice(rsQueryProduct.getFloat("price"));
                existedProduct.setSale(rsQueryProduct.getInt("sale"));
                existedProduct.setQuantity(rsQueryProduct.getInt("quantity"));
                searchProduct.add(existedProduct);
            }
            rsQueryProduct.close();
            statementQueryProduct.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return searchProduct;
    }
//	
	public boolean create(ProductDTO product) {
        try {
            Connection connection = DBUtils.getConnection();
            String sqlInsertProduct = "INSERT INTO dbo.Products(id, name, type, image, description, price,sale,quantity) VALUES (?, ?, ?, ?,?, ?, ?, ?)";
            PreparedStatement statementInsertProduct = connection.prepareStatement(sqlInsertProduct);
            statementInsertProduct.setString(1, product.getId());
            statementInsertProduct.setString(2, product.getName());
            statementInsertProduct.setString(3, product.getType());
            statementInsertProduct.setString(4, product.getImage());
            statementInsertProduct.setString(5, product.getDescription());
            statementInsertProduct.setFloat(6, product.getPrice());
            statementInsertProduct.setInt(7, product.getSale());
            statementInsertProduct.setInt(8, product.getQuantity());
            statementInsertProduct.executeUpdate();
            statementInsertProduct.close();
            connection.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
//	
	public boolean update(ProductDTO product) {
		try {
			Connection connection = DBUtils.getConnection();
			
			// Cáº­p nháº­t Product trong Products
			String sqlUpdateProduct = "UPDATE dbo.Products SET name=?, type=?, image=?, description=?, price=?, sale=?, quantity=? WHERE id=?";
			PreparedStatement statementUpdateProduct = connection.prepareStatement(sqlUpdateProduct);
			statementUpdateProduct.setString(1, product.getName());
			statementUpdateProduct.setString(2, product.getType());
			statementUpdateProduct.setString(3, product.getImage());
			statementUpdateProduct.setString(4, product.getDescription());
			statementUpdateProduct.setFloat(5, product.getPrice());
                        statementUpdateProduct.setFloat(6, product.getSale());
			statementUpdateProduct.setInt(7, product.getQuantity());
			statementUpdateProduct.setString(8, product.getId());
			statementUpdateProduct.executeUpdate();
			statementUpdateProduct.close();
			
			// Cáº­p nháº­t Product trong Carts_Detail
			String sqlQueryProductInCartDetail = "SELECT * FROM dbo.Carts_Detail WHERE product_id=?";
			PreparedStatement statementQueryProductInCartDetail = connection.prepareStatement(sqlQueryProductInCartDetail);
			statementQueryProductInCartDetail.setString(1, product.getId());
			ResultSet rsQueryProductInCartDetail = statementQueryProductInCartDetail.executeQuery();
			while(rsQueryProductInCartDetail.next()) {
				int quantity = rsQueryProductInCartDetail.getInt("quantity");
				String sqlUpdateProductInCartDetail = "UPDATE Carts_Detail SET product_name=?, product_image=?, product_price=?, total_price=? WHERE product_id=?";
				PreparedStatement statementUpdateProductInCartDetail = connection.prepareStatement(sqlUpdateProductInCartDetail);
				statementUpdateProductInCartDetail.setString(1, product.getName());
				statementUpdateProductInCartDetail.setString(2, product.getImage());
				statementUpdateProductInCartDetail.setFloat(3, product.getPrice());
				statementUpdateProductInCartDetail.setDouble(4, product.getPrice() * quantity);
				statementUpdateProductInCartDetail.setString(5, product.getId());
				statementUpdateProductInCartDetail.executeUpdate();
				statementUpdateProductInCartDetail.close();
			}
			rsQueryProductInCartDetail.close();
			statementQueryProductInCartDetail.close();
			
			// Cáº­p nháº­t Product trong Bills_Detail (khÃ´ng nÃªn lÃ m Ä‘iá»�u nÃ y!)
			// Coding ...
			
			connection.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean delete(ProductDTO product) {
		try {
			Connection connection = DBUtils.getConnection();
			
			// XÃ³a Product khá»�i Carts_Detail
			String sqlDeleteCart = "DELETE FROM dbo.Carts_Detail WHERE product_id=?";
			PreparedStatement statementDeleteCart = connection.prepareStatement(sqlDeleteCart);
			statementDeleteCart.setString(1, product.getId());
			statementDeleteCart.executeUpdate();
			statementDeleteCart.close();
			
			// XÃ³a Product khá»�i Bills_Detail (khÃ´ng nÃªn lÃ m Ä‘iá»�u nÃ y!)
			// Coding ...
			
			// XÃ³a Product khá»�i Products
			String sqlDeleteProduct = "DELETE FROM dbo.Products WHERE id=?";
			PreparedStatement statementDeleteProduct = connection.prepareStatement(sqlDeleteProduct);
			statementDeleteProduct.setString(1, product.getId());
			statementDeleteProduct.executeUpdate();
			statementDeleteProduct.close();
			
			connection.close();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

}
