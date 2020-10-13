package it.progetto.model;

public class EventoSportivoBean extends EventoBean{
	
	private String tipo; // tipo di evento sportivo calcio/regby
	private int eventoCodiceID; // codice id dell'evento 
	private String squadra1;
	private String squadra2;
	
	public EventoSportivoBean() {
		super();
		tipo = "";
		squadra1 = "";
		squadra2 = "";
		
		eventoCodiceID = super.geteCodiceID();
		}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}

	public int getEventoCodiceID() {
		return eventoCodiceID;
	}

	public void setEventoCodiceID(int eventoCodiceID) {
		this.eventoCodiceID = eventoCodiceID;
	}

	public String getSquadra1() {
		return squadra1;
	}

	public void setSquadra1(String squadra1) {
		this.squadra1 = squadra1;
	}

	public String getSquadra2() {
		return squadra2;
	}

	public void setSquadra2(String squadra2) {
		this.squadra2 = squadra2;
	}
	
	public String toString() {
		return super.toString() + " [ tipo: " + tipo + " ] [ EventoCodiceID: " + eventoCodiceID + " ] [ Squadra1: " + squadra1 + " ] [ Squadra: "+ squadra2 + " ] " ;
	}
}
