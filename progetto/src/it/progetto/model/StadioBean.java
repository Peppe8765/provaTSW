package it.progetto.model;

public class StadioBean {

	private String nome;
	private String nazione;
	private String citt�;
	private String indirizzo;
	private int capienza;
	private String descrizione;
	private int comune_CCodiceID; // codice del comune che gestisce lo stadio
	private int societ�_SCodiceID; // codice della societ� che gestisce lo stadio
	
	public StadioBean() {
		
		nome = "";
		nazione = "";
		citt� = "";
		indirizzo = "";
		capienza = -1;
		descrizione = "";
		comune_CCodiceID = -1; 
		societ�_SCodiceID = -1;
		
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

	public String getCitt�() {
		return citt�;
	}

	public void setCitt�(String citt�) {
		this.citt� = citt�;
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

	public int getSociet�_SCodiceID() {
		return societ�_SCodiceID;
	}

	public void setSociet�_SCodiceID(int societ�_SCodiceID) {
		this.societ�_SCodiceID = societ�_SCodiceID;
	}
	
	public String toString() {
		String codice ;
		if(comune_CCodiceID >0)
			codice = " [CCodiceID: " + comune_CCodiceID + " ] ";
		else
			codice = " [SCodiceID: " + societ�_SCodiceID + " ] ";
		
		return getClass().getName() + " [ nome: " + nome + " ] [ nazione: " + nazione + " ] [ citt�: " + citt� + " ] [ indirizzo: " + indirizzo + " ] [ capienza: " + capienza + " ] [ descrizione: " + descrizione + " ]" + codice;
	}
}
