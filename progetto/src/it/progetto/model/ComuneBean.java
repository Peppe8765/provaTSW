package it.progetto.model;

public class ComuneBean {
	
	private String citt�;
	private int cCodiceID;
	
	public ComuneBean() {
		this.citt� = "";
		this.cCodiceID = -1;
	}

	public String getCitt�() {
		return citt�;
	}

	public void setCitt�(String citt�) {
		this.citt� = citt�;
	}

	public int getCCodiceID() {
		return cCodiceID;
	}

	public void setCCodiceID(int cCodiceID) {
		this.cCodiceID = cCodiceID;
	}
	
	public String toString() {
		return getClass().getName() + "[ citt�: " + citt� +" ] [codice ID " + cCodiceID+"] ";
	}
	
}
