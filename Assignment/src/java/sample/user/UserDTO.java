/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package sample.user;

import java.util.ArrayList;
import sample.product.ProductDTO;

public class UserDTO {

    private String username;
    private String password;
    private String fullName;
    private String phoneNumber;
    private String email;
    private String address;
    private int role;

    public UserDTO() {
    }

    public UserDTO(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public UserDTO(String username, String password, String fullName, String phoneNumber, String email, String address, int role) {
        this.username = username;
        this.password = password;
        this.fullName = fullName;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.address = address;
        this.role = role;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getUsername() {
        return this.username;
    }

    public String getPassword() {
        return this.password;
    }

    public String getFullName() {
        return this.fullName;
    }

    public String getPhoneNumber() {
        return this.phoneNumber;
    }

    public int getRole() {
        return this.role;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setRole(int role) {
        this.role = role;
    }

    
    @Override
    public String toString() {
        return "UserDTO{" + "username=" + username + ", password=" + password + ", fullName=" + fullName + ", phoneNumber=" + phoneNumber + ", role=" + role + '}';
    }

}
