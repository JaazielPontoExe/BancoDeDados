package negocio;

public class Nota {
    private String titulo, corpo;
    private int id;

    public Nota(int id, String titulo, String corpo) {
        this.setId(id);
        this.setTitulo(titulo);
        this.setCorpo(corpo);
    }
    
    public void setId(int id) {
        this.id = id;
    } public void setCorpo(String corpo) {
        this.corpo = corpo;
    } public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getCorpo() {
        return corpo;
    } public int getId() {
        return id;
    } public String getTitulo() {
        return titulo;
    }
}