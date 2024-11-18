/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.user;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import sample.utils.DBUtils;
import sample.user.UserDTO;

/**
 *
 * @author ASUS
 */
public class UserDAO {

    public UserDAO() {
    }

    public ArrayList<UserDTO> getAll() {
        ArrayList<UserDTO> userList = new ArrayList<UserDTO>();
        try {
            Connection connection = DBUtils.getConnection();
            String sql = "SELECT * FROM dbo.Users";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                UserDTO user = new UserDTO();
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setFullName(rs.getString("full_name"));
                user.setPhoneNumber(rs.getString("phone_number"));
                user.setEmail(rs.getString("email"));
                user.setAddress(rs.getString("address"));
                user.setRole(rs.getInt("role"));
                userList.add(user);
            }
            rs.close();
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    public ArrayList<UserDTO> getOnlyUser() {
        ArrayList<UserDTO> userList = new ArrayList<UserDTO>();
        try {
            Connection connection = DBUtils.getConnection();
            String sql = "SELECT * FROM dbo.Users WHERE role=2";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                UserDTO user = new UserDTO();
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setFullName(rs.getString("full_name"));
                user.setPhoneNumber(rs.getString("phone_number"));
                user.setEmail(rs.getString("email"));
                user.setAddress(rs.getString("address"));
                user.setRole(rs.getInt("role"));
                userList.add(user);
            }

            rs.close();
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    public UserDTO read(UserDTO user) {
        UserDTO existedUser = null;
        try {
            Connection connection = DBUtils.getConnection();
            String sql = "SELECT * FROM dbo.Users WHERE username=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, user.getUsername());
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                existedUser = new UserDTO();
                existedUser.setUsername(rs.getString("username"));
                existedUser.setPassword(rs.getString("password"));
                existedUser.setFullName(rs.getString("full_name"));
                existedUser.setPhoneNumber(rs.getString("phone_number"));
                existedUser.setEmail(rs.getString("email"));
                existedUser.setAddress(rs.getString("address"));
                existedUser.setRole(rs.getInt("role"));
            }

            rs.close();
            statement.close();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return existedUser;
    }

    public ArrayList<UserDTO> search(UserDTO user) {
        ArrayList<UserDTO> userList = new ArrayList<UserDTO>();
        String sql = "SELECT * FROM dbo.Users WHERE full_name LIKE ?";
        try (Connection connection = DBUtils.getConnection(); PreparedStatement statement = connection.prepareStatement(sql)) {

            // Thêm % vào giá trị của tham số
            statement.setString(1, "%" + user.getUsername() + "%");

            try (ResultSet rs = statement.executeQuery()) {
                while (rs.next()) {
                    UserDTO existedUser = new UserDTO();
                    existedUser.setUsername(rs.getString("username"));
                    existedUser.setPassword(rs.getString("password"));
                    existedUser.setFullName(rs.getString("full_name"));
                    existedUser.setPhoneNumber(rs.getString("phone_number"));
                    existedUser.setEmail(rs.getString("email"));
                    existedUser.setAddress(rs.getString("address"));
                    existedUser.setRole(rs.getInt("role"));
                    userList.add(existedUser);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return userList;
    }

    public boolean create(UserDTO user) {
        UserDTO existedUser = this.read(user);
        if (existedUser == null) {
            try {
                Connection connection = DBUtils.getConnection();
                String sql = "INSERT INTO dbo.Users VALUES (?, ?, ?, ?, ?,?,?)";
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setString(1, user.getUsername());
                statement.setString(2, user.getPassword());
                statement.setString(3, user.getFullName());
                statement.setString(4, user.getPhoneNumber());
                statement.setInt(5, user.getRole());
                statement.setString(6, user.getEmail());
                statement.setString(7, user.getAddress());
                statement.executeUpdate();

                statement.close();
                connection.close();
                return true;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public boolean update(UserDTO user) {
        UserDTO existedUser = this.read(user);
        if (existedUser != null) {
            try {
                Connection connection = DBUtils.getConnection();
                String sql = "UPDATE dbo.Users SET password=?, full_name=?, phone_number=?, role=?, email=?, address=? WHERE username=?";
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setString(1, user.getPassword());
                statement.setString(2, user.getFullName());
                statement.setString(3, user.getPhoneNumber());
                statement.setInt(4, user.getRole());
                statement.setString(5, user.getEmail());
                statement.setString(6, user.getAddress());
                statement.setString(7, user.getUsername());

                statement.executeUpdate();
                statement.close();
                connection.close();
                return true;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public boolean updateComplex(UserDTO user, String findUsername) {
        UserDTO existedUser = this.read(user);
        if (existedUser == null) {
            try {
                Connection connection = DBUtils.getConnection();
                String sql = "UPDATE dbo.Users SET password=?, full_name=?, phone_number=?, role=?, email=?, address=?,username=?  WHERE username=?";
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setString(1, user.getPassword());
                statement.setString(2, user.getFullName());
                statement.setString(3, user.getPhoneNumber());
                statement.setInt(4, user.getRole());
                statement.setString(5, user.getEmail());
                statement.setString(6, user.getAddress());
                statement.setString(7, user.getUsername());
                statement.setString(8, findUsername);

                statement.executeUpdate();
                statement.close();
                connection.close();
                return true;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public boolean delete(UserDTO user) {// nhớ xóa lun cả bill và cart của user đó

        UserDTO existedUser = this.read(user);
        if (existedUser != null) {
            try {
                Connection connection = DBUtils.getConnection();
                String sqlDeleteCart = "DELETE FROM Carts_Detail WHERE username=?";
                PreparedStatement statementDeleteCart = connection.prepareStatement(sqlDeleteCart);
                statementDeleteCart.setString(1, user.getUsername());
                statementDeleteCart.executeUpdate();
                statementDeleteCart.close();

                String sql = "DELETE FROM dbo.Users WHERE username=?";
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setString(1, user.getUsername());
                statement.executeUpdate();
                statement.close();
                
                connection.close();
                return true;
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return false;
    }
}
