/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author hd
 */
public class DBUtils {
    public static final Connection getConnection() {
        Connection conn= null;
        try{
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url= "jdbc:sqlserver://localhost:1433;databaseName=ASM";
        conn= DriverManager.getConnection(url, "sa", "12345");
        }catch(SQLException | ClassNotFoundException e){
            e.printStackTrace();
        }
        return conn;
    }
}
