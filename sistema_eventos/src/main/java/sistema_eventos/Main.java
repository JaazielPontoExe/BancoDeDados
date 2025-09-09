package sistema_eventos;

import io.javalin.Javalin;
import io.javalin.http.staticfiles.Location;
import io.javalin.rendering.template.JavalinMustache;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Main {
    public static void main(String[] args) {
        String host = "localhost";
        String dbname = "sistema_eventos";
        String port = "5432";
        String username = "postgres";
        String password = "postgres";
        String url = "jdbc:postgresql://" + host + ":" + port + "/" + dbname;

        try {
            var app = Javalin.create(
                config -> {
                    config.fileRenderer(new JavalinMustache());
                    config.staticFiles.add("/static", Location.CLASSPATH);
                }
            ).start(7070);

            app.get(
                "/", ctx -> {
                    Connection conexao = DriverManager.getConnection(url, username, password);
                    String sql = "SELECT id, nome FROM participante ORDER BY id";
                    ResultSet rs = conexao.prepareStatement(sql).executeQuery();
                    Map<String, Object> model = new HashMap<>();
                    List<Participante> vetParticipante = new ArrayList<>();
                    while (rs.next()) {
                        vetParticipante.add(new Participante(rs.getInt("id"), rs.getString("nome")));
                    }
                    model.put("vetParticipante", vetParticipante);
                    model.put("mensagem_boas_vindas", "E ai meu!, blzura?");
                    rs.close();
                    conexao.close();
                    ctx.render("/templates/index.html", model);
                }
            );
        } catch (Exception e) {
            System.out.println("Deu xabum!");
        }
    }
}