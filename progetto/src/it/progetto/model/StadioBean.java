package it.progetto.model;

public class StadioBean {

	private String nome;
	private String nazione;
	private String città;
	private String indirizzo;
	private int capienza;
	private String descrizione;
	private int comune_CCodiceID; // codice del comune che gestisce lo stadio
	private int società_SCodiceID; // codice della società che gestisce lo stadio
	
	public StadioBean() {
		
		nome = "";
		nazione = "";
		città = "";
		indirizzo = "";
		capienza = -1;
		descrizione = "";
		comune_CCodiceID = -1; 
		società_SCodiceID = -1;
		
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getNazione() {
		return nazione;
	}

	public void setNazione(String nazione) {
		this.nazione = nazione;
	}

	public String getCittà() {
		return città;
	}

	public void setCittà(String città) {
		this.città = città;
	}

	public String getIndirizzo() {
		return indirizzo;
	}

	public void setIndirizzo(String indirizzo) {
		this.indirizzo = indirizzo;
	}

	public int getCapienza() {
		return capienza;
	}

	public void setCapienza(int capienza) {
		this.capienza = capienza;
	}
	
	public String getDescrizione() {
		return descrizione;
	}
	
	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public int getComune_CCodiceID() {
		return comune_CCodiceID;
	}

	public void setComune_CCodiceID(int comune_CCodiceID) {
		this.comune_CCodiceID = comune_CCodiceID;
	}

	public int getSocietà_SCodiceID() {
		return società_SCodiceID;
	}

	public void setSocietà_SCodiceID(int società_SCodiceID) {
		this.società_SCodiceID = società_SCodiceID;
	}
	
	public String toString() {
		String codice ;
		if(comune_CCodiceID >0)
			codice = " [CCodiceID: " + comune_CCodiceID + " ] ";
		else
			codice = " [SCodiceID: " + società_SCodiceID + " ] ";
		
		return getClass().getName() + " [ nome: " + nome + " ] [ nazione: " + nazione + " ] [ città: " + città + " ] [ indirizzo: " + indirizzo + " ] [ capienza: " + capienza + " ] [ descrizione: " + descrizione + " ]" + codice;
	}
}
