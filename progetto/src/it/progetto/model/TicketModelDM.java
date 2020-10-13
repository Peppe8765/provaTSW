package it.progetto.model;

import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

public class TicketModelDM implements ObjectModel<TicketBean>{
	

	@Override
	public TicketBean doRetrieveByKey(String code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		TicketBean ticket = new TicketBean();
		String selectSQL = "SELECT * FROM Biglietto WHERE Codice_Biglietto = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(selectSQL);
			preparedstatement.setInt(1, Integer.parseInt(code));
			
			System.out.println("doRetrieveByKey: " + preparedstatement.toString());
			ResultSet rs = preparedstatement.executeQuery();
			
			while(rs.next()) {
				ticket.setCodiceBiglietto(rs.getInt("Codice_Biglietto"));
				ticket.setSettore(rs.getString("Settore"));
				ticket.setCosto(rs.getDouble("Costo"));
				ticket.setQuantità(rs.getInt("Quantità"));
				ticket.setEventoECodiceId(rs.getInt("Evento_ECodiceID"));
			}
			System.out.println(ticket);
			
		}finally {
			try {
				if(preparedstatement != null)
					preparedstatement.close();
			}finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return ticket;
	}

	@Override
	public Collection<TicketBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		Collection<TicketBean> tickets = new LinkedList<TicketBean>();
		String selectSQL = "SELECT * FROM Biglietto";
		
		if(order != null) {
			selectSQL += " ORDER BY " +order;
		}
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(selectSQL);
			
			System.out.println("doRetrieveAll: " +preparedstatement.toString());
			ResultSet rs = preparedstatement.executeQuery();
			
			while(rs.next()) {
				TicketBean ticket = new TicketBean();
				
				ticket.setCodiceBiglietto(rs.getInt("Codice_Biglietto"));
				ticket.setSettore(rs.getString("Settore"));
				ticket.setCosto(rs.getDouble("Costo"));
				ticket.setQuantità(rs.getInt("Quantità"));
				ticket.setEventoECodiceId(rs.getInt("Evento_ECodiceID"));
				
				tickets.add(ticket);
			}
			
			
		}finally {
			try {
				if(preparedstatement != null)
					preparedstatement.close();
			}finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		return tickets;
	}

	@Override
	public void doSave(TicketBean object) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		String insertSQL = "INSERT INTO Biglietto"
				+ "(Codice_Biglietto, Settore, Costo, Quantità, Evento_ECodiceID) VALUES (?, ?, ?, ?, ?)";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(insertSQL);
			
			preparedstatement.setInt(1, object.getCodiceBiglietto());
			preparedstatement.setString(2, object.getSettore());
			preparedstatement.setDouble(3, object.getCosto());
			preparedstatement.setInt(4, object.getQuantità());
			preparedstatement.setInt(5, object.getEventoECodiceId());
			
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
	public void doUpdate(TicketBean object) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		String updateSQL = "UPDATE Biglietto SET"
				+ " Settore = ?, Costo = ?, Quantità = ? ,Evento_ECodiceID = ? WHERE Codice_Biglietto = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(updateSQL);
			
			preparedstatement.setString(1, object.getSettore());
			preparedstatement.setDouble(2, object.getCosto());
			preparedstatement.setInt(3, object.getQuantità());
			preparedstatement.setInt(4, object.getEventoECodiceId());
			
			preparedstatement.setInt(5, object.getCodiceBiglietto());
			
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
	public void doDelete(TicketBean object) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		String deleteSQL = "DELETE FROM Biglietto WHERE Codice_Biglietto = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(deleteSQL);
			preparedstatement.setInt(1, object.getCodiceBiglietto());
			
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
	
	
	public Collection<TicketBean> doRetrieveAllByEvent(String eventID) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		Collection<TicketBean> tickets = new LinkedList<TicketBean>();
		int Id = Integer.parseInt(eventID);
		String selectSQL = "SELECT * FROM Biglietto WHERE Evento_ECodiceID = " + Id;
		
		
	
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(selectSQL);
			
			System.out.println("doRetrieveAll: " +preparedstatement.toString());
			ResultSet rs = preparedstatement.executeQuery();
			
			while(rs.next()) {
				TicketBean ticket = new TicketBean();
				
				ticket.setCodiceBiglietto(rs.getInt("Codice_Biglietto"));
				ticket.setSettore(rs.getString("Settore"));
				ticket.setCosto(rs.getDouble("Costo"));
				ticket.setQuantità(rs.getInt("Quantità"));
				ticket.setEventoECodiceId(rs.getInt("Evento_ECodiceID"));
				
				tickets.add(ticket);
			}
			
			
		}finally {
			try {
				if(preparedstatement != null)
					preparedstatement.close();
			}finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		return tickets;

	}

}
