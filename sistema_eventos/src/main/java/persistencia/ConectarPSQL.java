package persistencia;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConectarPSQL {
    private String host;
    private String dbname;
    private String port;
    private String username;
    private String password;
    private String url;

    public ConectarPSQL() {
        host = "localhost";
        dbname = "bloco_notas";
        port = "5432";
        username = "postgres";
        password = "postgres";
        url = "jdbc:postgresql://" + host + ":" + port + "/" + dbname;
    } public Connection getConexao() {
        try {
            return DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
