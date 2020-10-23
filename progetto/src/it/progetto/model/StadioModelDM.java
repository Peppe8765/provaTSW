package it.progetto.model;

import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;
import java.sql.ResultSet;

public class StadioModelDM implements ObjectModel<StadioBean>{

	@Override
	public StadioBean doRetrieveByKey(String code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		StadioBean stadio = new StadioBean();
		String selectSQL = "SELECT * FROM  Stadio WHERE Nome = ?";
		
		try{
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(selectSQL);
			preparedstatement.setString(1, code);
			
			System.out.println("doRetrieveByKey: " + preparedstatement.toString());
			ResultSet rs = preparedstatement.executeQuery();
			
			while(rs.next()) {
				stadio.setNome(rs.getString("Nome"));
				stadio.setNazione(rs.getString("Nazione"));
				stadio.setCitt�(rs.getString("Citt�"));
				stadio.setIndirizzo(rs.getString("Indirizzo"));
				stadio.setCapienza(rs.getInt("Capienza"));
				stadio.setDescrizione(rs.getString("Descrizione"));
				stadio.setComune_CCodiceID(rs.getInt("Comune_CCodiceID"));
				stadio.setSociet�_SCodiceID(rs.getInt("Societ�_SCodiceID"));
				
			}
			
		}finally {
			try {
				if(preparedstatement != null)
					preparedstatement.close();
			}finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		
		return stadio;
	}

	@Override
	public Collection<StadioBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		Collection<StadioBean> stadi = new LinkedList<StadioBean>();
		String selectSQL = "SELECT * FROM Stadio";
		
		if(order != null) {
			selectSQL += " ORDER BY " + order;
		}
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(selectSQL);
			
			System.out.println("doRetrieveAll: " + preparedstatement.toString());
			ResultSet rs = preparedstatement.executeQuery();
			
			while(rs.next()) {
				StadioBean stadio = new StadioBean();
				
				stadio.setNome(rs.getString("Nome"));
				stadio.setNazione(rs.getString("Nazione"));
				stadio.setCitt�(rs.getString("Citt�"));
				stadio.setIndirizzo(rs.getString("Indirizzo"));
				stadio.setCapienza(rs.getInt("Capienza"));
				stadio.setDescrizione(rs.getString("Descrizione"));
				stadio.setComune_CCodiceID(rs.getInt("Comune_CCodiceID"));
				stadio.setSociet�_SCodiceID(rs.getInt("Societ�_SCodiceID"));
				
				stadi.add(stadio);
			}
			
			
		}finally {
			try {
				if(preparedstatement != null)
					preparedstatement.close();
			}finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		return stadi;
	}

	@Override
	public void doSave(StadioBean object) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedstatement  = null;
		
		String insertSQL = " INSERT INTO Stadio"
				+ "(Nome , Nazione, Citt�, Indirizzo, Capienza, Descrizione, Comune_CodiceID, Societ�_SCodiceID ) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(insertSQL);
			
			preparedstatement.setString(1, object.getNome());
			preparedstatement.setString(2, object.getNazione());
			preparedstatement.setString(3, object.getCitt�());
			preparedstatement.setString(4, object.getIndirizzo());
			preparedstatement.setInt(5, object.getCapienza());
			preparedstatement.setString(6, object.getDescrizione());
			preparedstatement.setInt(7, object.getComune_CCodiceID());
			preparedstatement.setInt(8, object.getSociet�_SCodiceID());
			
			System.out.println("doSave: " +preparedstatement.toString());
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
	public void doUpdate(StadioBean object) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		String updateSQL = " UPDATE Stadio SET"
				+ " Nazione = ?, Citt� = ?, Indirizzo = ?, Capienza = ?, Descrizione = ?, Comune_CCodiceID = ?, Societ�_SCodiceID = ? WHERE Nome = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(updateSQL);
			
			
			preparedstatement.setString(1, object.getNazione());
			preparedstatement.setString(2, object.getCitt�());
			preparedstatement.setString(3, object.getIndirizzo());
			preparedstatement.setInt(4, object.getCapienza());
			preparedstatement.setString(5, object.getDescrizione());
			preparedstatement.setInt(6, object.getComune_CCodiceID());
			preparedstatement.setInt(7, object.getSociet�_SCodiceID());
			
			preparedstatement.setString(8, object.getNome());
			
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
	public void doDelete(StadioBean object) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		String deleteSQL = "DELETE FROM Stadio WHERE Nome = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(deleteSQL);
			preparedstatement.setString(1, object.getNome());
			
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
