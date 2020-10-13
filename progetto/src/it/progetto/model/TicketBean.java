package it.progetto.model;



public class TicketBean {
	
	private int codiceBiglietto;
	private String settore;
	private double costo;
	private int quantit�;
	private int eventoECodiceId;
	
	public TicketBean() {
		
		codiceBiglietto = -1;
		settore = "";
		costo = -1.0;
		quantit� = -1;
		eventoECodiceId = -1;
	}

	public int getCodiceBiglietto() {
		return codiceBiglietto;
	}

	public void setCodiceBiglietto(int codiceBiglietto) {
		this.codiceBiglietto = codiceBiglietto;
	}

	public String getSettore() {
		return settore;
	}

	public void setSettore(String settore) {
		this.settore = settore;
	}

	public double getCosto() {
		return costo;
	}

	public void setCosto(double costo) {
		this.costo = costo;
	}
	
	public int getQuantit�() {
		return this.quantit�;
	}
	
	public void setQuantit�(int quantita) {
		this.quantit� = quantita;
	}

	public int getEventoECodiceId() {
		return eventoECodiceId;
	}

	public void setEventoECodiceId(int eventoECodiceId) {
		this.eventoECodiceId = eventoECodiceId;
	}
	
	public boolean isEmpty() {
		return codiceBiglietto == -1;
	}
	
	public boolean equals(Object object) {
		TicketBean tk = (TicketBean)object;
		return (this.codiceBiglietto == tk.codiceBiglietto);
	}
	
	
	public String toString() {
		return getClass().getName() + "[ codice biglietto: " + codiceBiglietto + " ] [ settore: " + settore + " ] [ costo: " + costo + " ] [ quantit�: " + quantit� +"] [ codice ID evento: "+ eventoECodiceId +" ] ";
	}
}
