package it.progetto.model;

public class EventoBean {
	
	private int eCodiceID;
	private String titolo;
	private String dataEvento;
	private String stadioNome;
	
	public EventoBean() {
		
		eCodiceID = -1;
		titolo = "";
		dataEvento = "1000-01-01";
		stadioNome = "San Siro";
		
	}

	public int geteCodiceID() {
		return eCodiceID;
	}

	public void seteCodiceID(int eCodiceID) {
		this.eCodiceID = eCodiceID;
	}

	public String getTitolo() {
		return titolo;
	}

	public void setTitolo(String titolo) {
		this.titolo = titolo;
	}

	public String getDataEvento() {
		return dataEvento;
	}

	public void setDataEvento(String dataEvento) {
		this.dataEvento = dataEvento;
	}


	public String getStadioNome() {
		return stadioNome;
	}

	public void setStadioNome(String stadioNome) {
		this.stadioNome = stadioNome;
	}
	
	public String toString() {
		return getClass().getName() + "[ codiceID evento: " + eCodiceID +"] [ titolo: " +titolo+ "] [ data evento: "+dataEvento+ "] [ nome dello stadio: " +stadioNome+" ]";
	}
}
