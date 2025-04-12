package model;

import java.sql.Connection;
import java.sql.DriverManager;

public class connectionDAO {

    private static Connection conn;

    public static Connection getconn() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/essential_db",
                "root",
                ""
            );
        } catch (Exception e) {
            
        }
        return conn;
    }
}
