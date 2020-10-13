package it.progetto.model;

import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;



import java.sql.ResultSet;


public class AcquistaModelDM implements ObjectModel<AcquistaBean>{

	@Override
	public AcquistaBean doRetrieveByKey(String code) throws SQLException { // in questo caso ritorna l'ultimo biglietto acquista dall'utente
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		AcquistaBean acquista = new AcquistaBean();
		String selectSQl = "SELECT * FROM acquista WHERE utente_NomeUtente = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(selectSQl);
			preparedstatement.setString(1, code);
			
			System.out.println("doRetrieveByKey:" + preparedstatement.toString());
			ResultSet rs = preparedstatement.executeQuery();
			
			while(rs.next()) {
				acquista.setBiglietto_Codice_Biglietto(rs.getInt("Biglietto_Codice_Biglietto"));
				acquista.setUtente_NomeUtente(rs.getString("utente_NomeUtente"));
			}
			System.out.println(acquista);
		}finally {
			try {
				if(preparedstatement != null)
					preparedstatement.close();
			}finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		return acquista;
	}

	@Override
	public Collection<AcquistaBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		Collection<AcquistaBean> acquisti = new LinkedList<AcquistaBean>();
		String selectSQL = "SELECT * FROM acquista";
		
		if(order != null) {
			selectSQL += " ORDER BY " + order; 
		}
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(selectSQL);
			
			System.out.println("doRetrieveAll: " +preparedstatement.toString());
			ResultSet rs = preparedstatement.executeQuery();
			
			while(rs.next()) {
				AcquistaBean aq = new AcquistaBean();
				
				aq.setBiglietto_Codice_Biglietto(rs.getInt("Biglietto_Codice_Biglietto"));
				aq.setUtente_NomeUtente(rs.getString("utente_NomeUtente"));
				
				acquisti.add(aq);
			}
			
		}finally {
			try {
				if(preparedstatement != null)
					preparedstatement.close();
			}finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		return acquisti;
	}
	
	
	public Collection<AcquistaBean> doRetrieveAllByUserName(String nomeUtente) throws SQLException { // restituisce tutta la lista dei biglietti acquistati da un utente
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		Collection<AcquistaBean> acquisti = new LinkedList<AcquistaBean>();
		String selectSQL = "SELECT * FROM acquista WHERE utente_NomeUtente = ?";
		
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(selectSQL);
			preparedstatement.setString(1, nomeUtente);
			
			System.out.println("doRetrieveAll: " +preparedstatement.toString());
			ResultSet rs = preparedstatement.executeQuery();
			
			while(rs.next()) {
				AcquistaBean aq = new AcquistaBean();
				
				aq.setBiglietto_Codice_Biglietto(rs.getInt("Biglietto_Codice_Biglietto"));
				aq.setUtente_NomeUtente(rs.getString("utente_NomeUtente"));
				
				acquisti.add(aq);
			}
			
		}finally {
			try {
				if(preparedstatement != null)
					preparedstatement.close();
			}finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		return acquisti;
	}
	

	@Override
	public void doSave(AcquistaBean object) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		String insertSQL ="	INSERT INTO acquista"
				+ "(utente_NomeUtente, Biglietto_Codice_Biglietto) VALUES(?, ?)";
		
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(insertSQL);
			
			preparedstatement.setString(1, object.getUtente_NomeUtente());
			preparedstatement.setInt(2, object.getBiglietto_Codice_Biglietto());		
			
			System.out.println("doSav: " + preparedstatement.toString());
			preparedstatement.executeUpdate();
			
			connection.commit();
			
		}finally {
			try {
				if(preparedstatement != null)
					preparedstatement.close();
			}finally {
				DriverManagerConnectionPool.releaseConnection(connection);
				
			}
		}
	}

	@Override
	public void doUpdate(AcquistaBean object) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		String updateSQL = "UPDATE acquista SET"
				+ " Biglietto_Codice_Biglietto = ? 	WHERE utente_NomeUtente = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(updateSQL);
			
			preparedstatement.setInt(1, object.getBiglietto_Codice_Biglietto());
			
			preparedstatement.setString(2, object.getUtente_NomeUtente());
			
			System.out.println("doUpdate: " + preparedstatement.toString());
			preparedstatement.executeUpdate();
			
			connection.commit();
			
			
		}finally {
			try {
				if(preparedstatement != null)
					preparedstatement.close();
			}finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
	}

	@Override
	public void doDelete(AcquistaBean object) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		String deleteSQL = "DELETE FROM acquista WHERE utente_NomeUtente = ? && Biglietto_Codice_Biglietto = ? ";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(deleteSQL);
			preparedstatement.setString(1, object.getUtente_NomeUtente());
			preparedstatement.setInt(2, object.getBiglietto_Codice_Biglietto());
			
			System.out.println("doDelete: " + preparedstatement.toString());
			preparedstatement.executeUpdate();
			
			connection.commit();
		}finally {
			try {
				if(preparedstatement != null)
					preparedstatement.close();
			}finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
	}

}
