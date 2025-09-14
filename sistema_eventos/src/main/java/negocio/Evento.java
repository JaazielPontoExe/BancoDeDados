package negocio;

import java.sql.Date;

public class Evento {
    // id SERIAL PRIMARY KEY,
    // nome VARCHAR(200),
    // data_inicio DATE DEFAULT CURRENT_DATE,
    // data_fim DATE DEFAULT CURRENT_DATE,
    // localidade TEXT

    private int id;
    private String nome, localidade;
    private Date dataInicio, dataFim;
    
    public Evento(
        int id,
        String nome,
        Date dataInicio,
        Date dataFim,
        String localidade
    ) {
        this.setId(id);
        this.setNome(nome);
        this.setDataInicio(dataInicio);
        this.setDataFim(dataFim);
        this.setLocalidade(localidade);
    }

    public int getId() {
        return id;
    } public String getNome() {
        return nome;
    } public Date getDataInicio() {
        return dataInicio;
    } public Date getDataFim() {
        return dataFim;
    } public String getLocalidade() {
        return localidade;
    }

    public void setId(int id) {
        this.id = id;
    } public void setNome(String nome) {
        this.nome = nome;
    } public void setDataInicio(Date dataInicio) {
        this.dataInicio = dataInicio;
    } public void setDataFim(Date dataFim) {
        this.dataFim = dataFim;
    } public void setLocalidade(String localidade) {
        this.localidade = localidade;
    }
}
