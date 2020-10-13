package it.progetto.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;






public class UtenteModelDM implements ObjectModel<UtenteBean>{
		
	

	@Override
	public UtenteBean doRetrieveByKey(String code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		UtenteBean utente = new UtenteBean();
		String selectSQL = "SELECT * FROM utente WHERE NomeUtente = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, code);
			
			System.out.println("doRetrieveByKey: "+ preparedStatement.toString());
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				utente.setNomeUtente(rs.getString("NomeUtente"));
				utente.setPassword(rs.getString("Password"));
				utente.setEmail(rs.getString("Email"));
				utente.setCodiceAdmin(rs.getInt("CodiceAdmin"));
				utente.setFotoProfilo(rs.getBlob("FotoProfilo"));
			}
			System.out.println(utente);
		}
		
		finally {
			try {
				if(preparedStatement != null)
					preparedStatement.close();
			}
			finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
			
		}
		
		
		return utente;
	}

	@Override
	public Collection<UtenteBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		Collection<UtenteBean> utenti = new LinkedList<UtenteBean>();
		String selectSQL = "SELECT * FROM utente";
		
		if(order != null) {
			selectSQL += " ORDER BY " + order;
		}
		
		try {
			
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			
			System.out.println("doRetrieveAll:" + preparedStatement.toString());
			ResultSet rs = preparedStatement.executeQuery();
		
			while(rs.next()) {
				UtenteBean utente = new UtenteBean();
				
				utente.setNomeUtente(rs.getString("NomeUtente"));
				utente.setPassword(rs.getString("Password"));
				utente.setEmail(rs.getString("Email"));
				utente.setCodiceAdmin(rs.getInt("CodiceAdmin"));
				utente.setFotoProfilo(rs.getBlob("FotoProfilo"));
				
				utenti.add(utente);
			}
		}
		finally {
			try {
				if(preparedStatement != null) 
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
	
		return utenti;
	}

	@Override
	public void doSave(UtenteBean object) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String insertSQL = "INSERT INTO utente" + 
						" (NomeUtente, Password, CodiceAdmin, Email ,FotoProfilo) VALUES (?, ?, ?, ?, ?)";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			
			preparedStatement.setString(1, object.getNomeUtente());
			preparedStatement.setString(2, object.getPassword());
			preparedStatement.setInt(3, object.getCodiceAdmin());
			preparedStatement.setString(4, object.getEmail());
			preparedStatement.setBlob(5, object.getFotoProfilo());
		
			System.out.println("doSave: " + preparedStatement.toString());
			preparedStatement.executeUpdate();
			
			connection.commit();
			
		}finally {
			try {
				if(preparedStatement != null) 
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}		
			
	}
	

	@Override
	public void doUpdate(UtenteBean object) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String updateSQL = " UPDATE utente SET" + 
							" Password = ?, CodiceAdmin = ?, Email = ?, FotoProfilo = ? WHERE NomeUtente = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(updateSQL);
			
			preparedStatement.setString(1, object.getPassword());
			preparedStatement.setInt(2, object.getCodiceAdmin());
			preparedStatement.setString(3, object.getEmail());
			preparedStatement.setBlob(4, object.getFotoProfilo());
			
			preparedStatement.setString(5, object.getNomeUtente());
			
			System.out.println("doUpdate: " + preparedStatement.toString());
			preparedStatement.executeUpdate();
			
			connection.commit();
			
		}finally {
			try {
				if(preparedStatement != null)
					preparedStatement.close();
			}finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
			
		}
		
	}

	@Override
	public void doDelete(UtenteBean object) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStetement = null;
		
		String deleteSQL = "DELETE FROM utente WHERE NomeUtente = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStetement = connection.prepareStatement(deleteSQL);
			preparedStetement.setString(1, object.getNomeUtente());
			
			System.out.println("doDelete: "+preparedStetement.toString());
			preparedStetement.executeUpdate();
			
			connection.commit();
			
		}finally {
			try {
				if(preparedStetement != null)
					preparedStetement.close();
			}finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
	}
	
	public void doUpdateFoto(UtenteBean object, File file) throws SQLException, FileNotFoundException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String updateSQL = " UPDATE utente SET" + 
							" FotoProfilo = ? WHERE NomeUtente = ?";
		
		
		
		try {
			FileInputStream path = new FileInputStream(file);
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(updateSQL);
			
			preparedStatement.setBinaryStream(1, path);
			
			preparedStatement.setString(2, object.getNomeUtente());
			
			System.out.println("doUpdate: " + preparedStatement.toString());
			preparedStatement.executeUpdate();
			
			connection.commit();
			
		}finally {
			try {
				if(preparedStatement != null)
					preparedStatement.close();
			}finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
	}

	}
}
