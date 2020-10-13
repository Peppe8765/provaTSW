package it.progetto.model;

public class Societ‡Bean {
	
	private String nome;
	private int sCodiceId;
	private int annoFondazione;
	
	public Societ‡Bean() {
		nome = "";
		sCodiceId = -1;
		annoFondazione = -1;	
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public int getSCodiceId() {
		return sCodiceId;
	}

	public void setSCodiceId(int sCodiceId) {
		this.sCodiceId = sCodiceId;
	}

	public int getAnnoFondazione() {
		return annoFondazione;
	}

	public void setAnnoFondazione(int annoFondazione) {
		this.annoFondazione = annoFondazione;
	}
	
	public String toString() {
		return getClass().getName() + "[ nome della societ‡: " + nome +"] [ SCodiceID: " + sCodiceId +" ] [ anno di fondazione: " + annoFondazione+"] ";
	}
}
