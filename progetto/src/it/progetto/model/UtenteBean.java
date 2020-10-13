package it.progetto.model;

import java.sql.Blob;

public class UtenteBean {
	

	private String nomeUtente;
	private String password;
	private String email;
	private int codiceAdmin; // codice per riconoscere se chi fa il login sia un admin o un utente normale 
	private Blob fotoProfilo;
	
	public UtenteBean() {
		nomeUtente = "";
		password = "";
		email = "";
		codiceAdmin = -1;
		fotoProfilo = null;
	}

	public String getNomeUtente() {
		return this.nomeUtente;
	}
	
	public void setNomeUtente(String nomeUtente) {
		this.nomeUtente = nomeUtente;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getCodiceAdmin() {
		return codiceAdmin;
	}

	public void setCodiceAdmin(int codiceAdmin) {
		this.codiceAdmin = codiceAdmin;
	}

	public Blob getFotoProfilo() {
		return fotoProfilo;
	}

	public void setFotoProfilo(Blob fotoProfilo) {
		this.fotoProfilo = fotoProfilo;
	}
	
	public boolean equals(Object object) {
		UtenteBean ut = (UtenteBean) object;
		return nomeUtente.equals(ut.nomeUtente);
	}
	
	
	public String toString() {
		String blob ;
		if(this.getFotoProfilo() != null)
			blob = "la foto è presente";
		else
			blob = "la foto non è presente"; 
		
		String Cadmin;
		if(this.codiceAdmin <= 0)
			Cadmin = "";
		else
			Cadmin = " ] [ codice admin: " + codiceAdmin;
		
		return "" + getClass().getName() + " [ nome utente: " + nomeUtente + "] [ Password = " + password + Cadmin +" ] [ Email = " + email + " ] [ Foto profilo = " + blob + " ]";
	}
}
