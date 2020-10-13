package it.progetto.model;

import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

public class EventoModelDM implements ObjectModel<EventoBean>{

	@Override
	public EventoBean doRetrieveByKey(String code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		EventoBean evento = new EventoBean();
		String selectSQL = "SELECT * FROM Evento WHERE ECodiceID = ?";
		
		try{
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(selectSQL);
			preparedstatement.setInt(1, Integer.parseInt(code));
			
			System.out.println("doRetrieveByKey: " +preparedstatement.toString());
			ResultSet rs = preparedstatement.executeQuery();
			
			while(rs.next()) {
				evento.seteCodiceID(rs.getInt("ECodiceID"));
				evento.setTitolo(rs.getString("Titolo"));
				evento.setDataEvento(rs.getString("Data_Evento"));
				evento.setStadioNome(rs.getString("Stadio_Nome"));
			}
		}finally {
			try {
				if(preparedstatement != null)
					preparedstatement.close();
			}finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
			
		}
		
		return evento;
	}

	@Override
	public Collection<EventoBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		Collection<EventoBean> eventi = new LinkedList<EventoBean>();
		String selectSQL = "SELECT * FROM Evento ";
		
		if(order != null) {
			selectSQL += " ORDER BY " + order;
		}
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(selectSQL);
			
			System.out.println("doRetriveAll: " +preparedstatement.toString());
			ResultSet rs = preparedstatement.executeQuery();
			
			while(rs.next()) {
				EventoBean evento = new EventoBean();
				
				evento.seteCodiceID(rs.getInt("ECodiceID"));
				evento.setTitolo(rs.getString("Titolo"));
				evento.setDataEvento(rs.getString("Data_Evento"));
				evento.setStadioNome(rs.getString("Stadio_Nome"));
				
				eventi.add(evento);
				
			}
			
		}finally {
			try {
				if(preparedstatement != null)
					preparedstatement.close();
			}finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		
		return eventi;
	}

	@Override
	public void doSave(EventoBean object) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		String insertSQL = "INSERT INTO Evento"
				+ " (Titolo, Data_Evento, Stadio_Nome) VALUES (?, ?, ?)";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(insertSQL);
			
			preparedstatement.setString(1, object.getTitolo());
			preparedstatement.setString(2, object.getDataEvento());
			preparedstatement.setString(3, object.getStadioNome());
			
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
	public void doUpdate(EventoBean object) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		String updateSQL =" UPDATE Evento SET"
				+ " Titolo = ?, Data_Evento = ?, Stadio_Nome = ? WHERE ECodiceID = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(updateSQL);
			
			preparedstatement.setString(1, object.getTitolo());
			preparedstatement.setString(2, object.getDataEvento());
			preparedstatement.setString(3, object.getStadioNome());
			
			preparedstatement.setInt(4, object.geteCodiceID());
			
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
	public void doDelete(EventoBean object) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		String deleteSQL ="DELETE FROM Evento WHERE ECodiceID = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(deleteSQL);
			preparedstatement.setInt(1, object.geteCodiceID());
			
			System.out.println("doDelete: "+ preparedstatement.toString());
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
	
	public Collection<EventoBean> doRetrieveAllByStadioName(String stadio) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		Collection<EventoBean> eventi = new LinkedList<EventoBean>();
		String selectSQL = "SELECT * FROM Evento WHERE Stadio_Nome = ?";
		
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(selectSQL);
			preparedstatement.setString(1, stadio);
			
			System.out.println("doRetriveAll: " +preparedstatement.toString());
			ResultSet rs = preparedstatement.executeQuery();
			
			while(rs.next()) {
				EventoBean evento = new EventoBean();
				
				
				evento.seteCodiceID(rs.getInt("ECodiceID"));
				evento.setTitolo(rs.getString("Titolo"));
				evento.setDataEvento(rs.getString("Data_Evento"));
				evento.setStadioNome(rs.getString("Stadio_Nome"));
				
				eventi.add(evento);
				
			}
			
		}finally {
			try {
				if(preparedstatement != null)
					preparedstatement.close();
			}finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		
		return eventi;
	}
}
