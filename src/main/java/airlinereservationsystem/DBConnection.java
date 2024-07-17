package airlinereservationsystem;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    public static Connection getConnection() throws SQLException {
        Connection conn = null;
        try {
        	 Class.forName("oracle.jdbc.driver.OracleDriver");
             conn = DriverManager.getConnection(
                     "jdbc:oracle:thin:TECH4/Nalsoft123@//10.1.2.111:1523/pdb1.nalsoft.net", "tech4", "Nalsoft123");
             System.out.println("connected!.....user booking final check");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            throw new SQLException("Failed to connect to the database.");
        }
        return conn;
    }
}

