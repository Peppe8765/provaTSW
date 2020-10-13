package it.progetto.model;

public class ComuneBean {
	
	private String città;
	private int cCodiceID;
	
	public ComuneBean() {
		this.città = "";
		this.cCodiceID = -1;
	}

	public String getCittà() {
		return città;
	}

	public void setCittà(String città) {
		this.città = città;
	}

	public int getCCodiceID() {
		return cCodiceID;
	}

	public void setCCodiceID(int cCodiceID) {
		this.cCodiceID = cCodiceID;
	}
	
	public String toString() {
		return getClass().getName() + "[ città: " + città +" ] [codice ID " + cCodiceID+"] ";
	}
	
}
