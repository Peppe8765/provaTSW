package it.progetto.model;



public class TicketBean {
	
	private int codiceBiglietto;
	private String settore;
	private double costo;
	private int quantità;
	private int eventoECodiceId;
	
	public TicketBean() {
		
		codiceBiglietto = -1;
		settore = "";
		costo = -1.0;
		quantità = -1;
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
	
	public int getQuantità() {
		return this.quantità;
	}
	
	public void setQuantità(int quantita) {
		this.quantità = quantita;
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
		return getClass().getName() + "[ codice biglietto: " + codiceBiglietto + " ] [ settore: " + settore + " ] [ costo: " + costo + " ] [ quantità: " + quantità +"] [ codice ID evento: "+ eventoECodiceId +" ] ";
	}
}
