package it.progetto.model;

public class AcquistaBean {

	private String utente_NomeUtente;
	private int Biglietto_Codice_Biglietto;
	
	public AcquistaBean() {
		utente_NomeUtente = "";
		Biglietto_Codice_Biglietto = -1;
	}

	public String getUtente_NomeUtente() {
		return utente_NomeUtente;
	}

	public void setUtente_NomeUtente(String utente_NomeUtente) {
		this.utente_NomeUtente = utente_NomeUtente;
	}

	public int getBiglietto_Codice_Biglietto() {
		return Biglietto_Codice_Biglietto;
	}

	public void setBiglietto_Codice_Biglietto(int biglietto_Codice_Biglietto) {
		Biglietto_Codice_Biglietto = biglietto_Codice_Biglietto;
	}
	
	public boolean equals(Object object) {
		AcquistaBean a = (AcquistaBean)object;
		return this.utente_NomeUtente.equals(a.utente_NomeUtente) && this.Biglietto_Codice_Biglietto == a.Biglietto_Codice_Biglietto;
	}
	
	public String toString() {
		return getClass().getName() + "[ Nome utente: " + utente_NomeUtente + " ] [ Codice biglietto: " + Biglietto_Codice_Biglietto + " ] ";
	}
}
