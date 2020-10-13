package it.progetto.model;

public class ConcertoBean extends EventoBean{

	private String artistaBand;
	private int eventoCodiceID; 
	
	public ConcertoBean() {
		super();
		
		artistaBand = "";
		eventoCodiceID = super.geteCodiceID();
	}
	
	
	public String getArtistaBand() {
		return artistaBand;
	}

	public void setArtistaBand(String artistaBand) {
		this.artistaBand = artistaBand;
	}

	public int getEventoCodiceID() {
		return eventoCodiceID;
	}

	public void setEventoCodiceID(int eventoCodiceID) {
		this.eventoCodiceID = eventoCodiceID;
	}
	
	public String toString() {
		return super.toString() +"[nome dell'artista o band: " + artistaBand +" ] ";
	}
}
