package it.progetto.model;

public class OspiteBean {
	
	private String cF; // codice fiscale max 11 caratteri
	private String nome;
	private String concertoArtistaBand;
	private int concertoEventoECodiceID;
	
	public OspiteBean() {
		
		cF = "";
		nome = "";
		concertoArtistaBand = "";
		concertoEventoECodiceID = -1;
	}

	public String getcF() {
		return cF;
	}

	public void setcF(String cF) {
		this.cF = cF;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getConcertoArtistaBand() {
		return concertoArtistaBand;
	}

	public void setConcertoArtistaBand(String concertoArtistaBand) {
		this.concertoArtistaBand = concertoArtistaBand;
	}

	public int getConcertoEventoECodiceID() {
		return concertoEventoECodiceID;
	}

	public void setConcertoEventoECodiceID(int concertoEventoECodiceID) {
		this.concertoEventoECodiceID = concertoEventoECodiceID;
	}
	
	public String toString() {
		return getClass().getName() + "[ codice fiscale: " + cF+"] [ nome ospite: " + nome +" ] [ artista o band del concerto: " + concertoArtistaBand +" ] [ codice evento concerto: " + concertoEventoECodiceID + "] ";
	}
	
	
	
	
	
	
	
	
	
}
