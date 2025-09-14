package negocio;

import java.sql.Date;

public class Participante {
    private int id;
    private String nome;
    private Date dataNascimento;

    public Participante(
        int id,
        String nome,
        Date dataNascimento
    ) {
        this.setId(id);
        this.setNome(nome);
        this.setDataNascimento(dataNascimento);
    }

    public int getId() {
        return id;
    } public String getNome() {
        return nome;
    } public Date getDataNascimento() {
        return dataNascimento;
    }

    public void setId(int id) {
        this.id = id;
    } public void setNome(String nome) {
        this.nome = nome;
    } public void setDataNascimento(Date dataNascimento) {
        this.dataNascimento = dataNascimento;
    }
}
