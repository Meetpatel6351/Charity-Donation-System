import java.sql.Connection;
import java.sql.DriverManager;

public class DatabaseConnectionTest {
    public static void main(String[] args) {
        String DB_URL = "jdbc:mysql://127.0.0.1:3306/charity_system?useSSL=false&serverTimezone=UTC";
        String DB_USER = "root";
        String DB_PASSWORD = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("Driver loaded successfully");

            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                System.out.println("Database connection successful");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
