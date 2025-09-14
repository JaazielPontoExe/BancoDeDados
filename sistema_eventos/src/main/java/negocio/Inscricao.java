package negocio;

import java.sql.Timestamp;

public class Inscricao {
    int id, valor;
    Evento evento;
    Participante participante;
    Timestamp dataHora;
    boolean pago;

    public Inscricao (
        int id,
        Evento evento,
        Participante participante,
        Timestamp dataHora,
        int valor,
        boolean pago
    ) {
        this.setId(id);
        this.setEvento(evento);
        this.setParticipante(participante);
        this.setDataHora(dataHora);
        this.setValor(valor);
        this.setPago(pago);
    }

    public int getId() {
        return id;
    } public Evento getEvento() {
        return evento;
    } public Participante getParticipante() {
        return participante;
    } public Timestamp getDataHora() {
        return dataHora;
    } public int getValor() {
        return valor;
    }

    public void setId(int id) {
        this.id = id;
    } public void setEvento(Evento evento) {
        this.evento = evento;
    } public void setParticipante(Participante participante) {
        this.participante = participante;
    } public void setDataHora(Timestamp dataHora) {
        this.dataHora = dataHora;
    } public void setValor(int valor) {
        this.valor = valor;
    } public void setPago(boolean pago) {
        this.pago = pago;
    }
}
