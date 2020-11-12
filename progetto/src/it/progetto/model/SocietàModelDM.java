package it.progetto.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

public class Societ‡ModelDM implements ObjectModel<Societ‡Bean>{

	public Societ‡Bean doRetrieveByName(String name) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		Societ‡Bean societ‡ = new Societ‡Bean();
		String  selectSQL = "SELECT * FROM Societ‡ WHERE Nome = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, name);
			
			System.out.println("doRetriveByKey: " +preparedStatement.toString());
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				societ‡.setNome(rs.getString("Nome"));
				societ‡.setAnnoFondazione(rs.getInt("AnnoFondazione"));
				societ‡.setSCodiceId(rs.getInt("SCodiceId"));
			}
			
			System.out.println(societ‡);
			
		}finally {
			try {
				if(preparedStatement != null)
					preparedStatement.close();
			}finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		
		
		return societ‡;
	}
	
	@Override
	public Societ‡Bean doRetrieveByKey(String code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		Societ‡Bean societ‡ = new Societ‡Bean();
		String  selectSQL = "SELECT * FROM Societ‡ WHERE SCodiceID = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, Integer.parseInt(code));
			
			System.out.println("doRetriveByKey: " +preparedStatement.toString());
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				societ‡.setNome(rs.getString("Nome"));
				societ‡.setAnnoFondazione(rs.getInt("AnnoFondazione"));
				societ‡.setSCodiceId(rs.getInt("SCodiceId"));
			}
			
			System.out.println(societ‡);
			
		}finally {
			try {
				if(preparedStatement != null)
					preparedStatement.close();
			}finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		
		
		return societ‡;
	}

	@Override
	public Collection<Societ‡Bean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		Collection<Societ‡Bean> societ‡C = new LinkedList<Societ‡Bean>();
		String selectSQL ="SELECT * FROM  Societ‡";
		
		if(order != null) {
			selectSQL += " ORDER BY " + order;
		}
		
		try {
			
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(selectSQL);
			
			System.out.println("doRetrieveAll: " + preparedstatement.toString());
			ResultSet rs = preparedstatement.executeQuery();
			
			while(rs.next()) {
				Societ‡Bean societ‡ = new Societ‡Bean();
				
				societ‡.setNome(rs.getString("Nome"));
				societ‡.setAnnoFondazione(rs.getInt("AnnoFondazione"));
				societ‡.setSCodiceId(rs.getInt("SCodiceID"));
				
				societ‡C.add(societ‡);
			}
			
		}finally {
			try {
				if(preparedstatement != null)
					preparedstatement.close();
			}finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		
		return societ‡C;
	}

	@Override
	public void doSave(Societ‡Bean object) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		String insertSQL = "INSERT INTO Societ‡" +
					" (Nome, AnnoFondazione) VALUES ( ?, ?)";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(insertSQL);
			
			preparedstatement.setString(1, object.getNome());
			preparedstatement.setInt(2, object.getAnnoFondazione());
			
			System.out.println("doSave: " + preparedstatement.toString());
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
	public void doUpdate(Societ‡Bean object) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		String updateSQL = " UPDATE Societ‡ SET"
				+ " Nome = ? , AnnoFondazione = ? WHERE SCodiceID = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(updateSQL);
			
			preparedstatement.setString(1, object.getNome());
			preparedstatement.setInt(2, object.getAnnoFondazione());
			
			preparedstatement.setInt(3, object.getSCodiceId());
			
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
	public void doDelete(Societ‡Bean object) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		String deleteSQl = "DELETE FROM Societ‡ WHERE SCodiceID = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(deleteSQl);
			preparedstatement.setInt(1, object.getSCodiceId());
			
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
