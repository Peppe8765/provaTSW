package it.progetto.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;


public class OspiteModelDM implements ObjectModel<OspiteBean>{

	@Override
	public OspiteBean doRetrieveByKey(String code) throws SQLException {
		Connection connection = null;
		PreparedStatement  preparedStatement = null;
		
		OspiteBean ospite = new OspiteBean();
		String selectSQL = " SELECT * FROM Ospite WHERE CF = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, Integer.parseInt(code));
			
			System.out.println("doRetrieveByKey: "+ preparedStatement.toString());
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				ospite.setcF(rs.getString("CF"));
				ospite.setNome(rs.getString("Nome"));
				ospite.setConcertoArtistaBand(rs.getString("Concerto_ArtistaBand"));
				ospite.setConcertoEventoECodiceID(rs.getInt("Concerto_Evento_ECodiceID"));
			}
			System.out.println(ospite);
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
		return ospite;
		
	}

	@Override
	public Collection<OspiteBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		Collection<OspiteBean> ospiti = new LinkedList<OspiteBean>();
		String selectSQL = " SELECT * FROM Ospite";
		
		if(order != null) {
			selectSQL += " ORFER BY" + order;
		}
		
		try {
			
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(selectSQL);
			
			System.out.println("doRetrieveAll: " + preparedstatement.toString());
			ResultSet rs = preparedstatement.executeQuery();
			
			while(rs.next()) {
				OspiteBean ospite = new OspiteBean();
				
				ospite.setcF(rs.getString("CF"));
				ospite.setNome(rs.getString("Nome"));
				ospite.setConcertoArtistaBand(rs.getString("Concerto_ArtistaBand"));
				ospite.setConcertoEventoECodiceID(rs.getInt("Concerto_Evento_ECodiceID"));
				
				ospiti.add(ospite);
			}
			
		}finally {
			try {
				if(preparedstatement != null)
					preparedstatement.close();
			}finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		
		return ospiti;
	}

	@Override
	public void doSave(OspiteBean object) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		String inserSQL = "INSERT INTO Ospite"
				+ " (CF, Nome, Concerto_ArtistaBand, Concerto_Evento_ECodiceID) VALUES (?, ?, ?, ?)";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(inserSQL);
			
			preparedstatement.setString(1, object.getcF());
			preparedstatement.setString(2, object.getNome());
			preparedstatement.setString(3, object.getConcertoArtistaBand());
			preparedstatement.setInt(4, object.getConcertoEventoECodiceID());
			
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
	public void doUpdate(OspiteBean object) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		String updateSQL =" UPDATE Ospite SET"
				+ "Nome = ?, Concerto_ArtistaBand = ?, Concerto_Evento_ECodiceID = ? WHERE CF = ?";
		try {
			
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(updateSQL);
			
			preparedstatement.setString(1, object.getNome());
			preparedstatement.setString(2, object.getConcertoArtistaBand());
			preparedstatement.setInt(3, object.getConcertoEventoECodiceID());
			
			preparedstatement.setString(4, object.getcF());
			
			System.out.println("doUpdate: " +preparedstatement.toString());
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
	public void doDelete(OspiteBean object) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		String deleteSQL = "DELETE FROM Ospite WHERE CF = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(deleteSQL);
			preparedstatement.setString(1, object.getcF());
			
			System.out.println("doDelete: " +preparedstatement.toString());
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
