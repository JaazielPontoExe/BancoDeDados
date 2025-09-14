package bloco_notas;

import java.util.HashMap;
import java.util.Map;

import io.javalin.Javalin;
import io.javalin.http.staticfiles.Location;
import io.javalin.rendering.template.JavalinMustache;

public class Main {
    public static void main(String[] args) {
        var app = Javalin.create(
            config -> {
                config.fileRenderer(new JavalinMustache());
                config.staticFiles.add("/static", Location.CLASSPATH);
            }
        ).start(7070);

        app.get("/", ctx -> ctx.result("Hello World!"));

        app.get(
            "/teste", ctx -> {
                Map<String, Object> model = new HashMap<>();
                model.put("x","oi");
                ctx.render("/templates/index.html", model);
            }
        );
    }
}