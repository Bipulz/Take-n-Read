package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class connectionDAO {
    public static Connection getconn() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/essential_db?useSSL=false",
                "root",
                ""
            );
        } catch (ClassNotFoundException e) {
            throw new SQLException("MySQL Driver not found", e);
        }
    }
}