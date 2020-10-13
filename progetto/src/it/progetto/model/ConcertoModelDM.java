package it.progetto.model;

import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ConcertoModelDM implements ObjectModel<ConcertoBean>{

	@Override
	public ConcertoBean doRetrieveByKey(String code) throws SQLException {
		EventoModelDM eventoDM = new  EventoModelDM();
		EventoBean evento = new EventoBean();
		ConcertoBean concerto = new ConcertoBean();
		evento = eventoDM.doRetrieveByKey(code);
		
		concerto.seteCodiceID(evento.geteCodiceID());
		concerto.setTitolo(evento.getTitolo());
		concerto.setDataEvento(evento.getDataEvento());
		concerto.setStadioNome(evento.getStadioNome());
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String selectSQL = "SELECT * FROM Concerto WHERE Evento_ECodiceID = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setInt(1, Integer.parseInt(code));
			
			System.out.println("doRetrieveByKey:" + preparedStatement.toString());
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				
				concerto.setArtistaBand(rs.getString("ArtistaBand"));
			}
			
		}finally {
			try {
				if(preparedStatement != null)
					preparedStatement.close();
			}finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		return concerto;
	}

	@Override
	public Collection<ConcertoBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		Collection<ConcertoBean> concertoC = new LinkedList<ConcertoBean>();
		String selectSQL = "SELECT * FROM Evento, Concerto WHERE ECodiceID = Evento_ECodiceID  "; 
		
		if(order != null) {
			selectSQL += "ORDER BY " + order;
		}
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(selectSQL);
			
			System.out.println("doReatrieveAll: " + preparedstatement.toString());
			ResultSet rs = preparedstatement.executeQuery();
			
			while(rs.next()) {
				ConcertoBean concerto = new ConcertoBean();
				
				concerto.seteCodiceID(rs.getInt("ECodiceID"));
				concerto.setTitolo(rs.getString("Titolo"));
				concerto.setDataEvento(rs.getString("Data_Evento"));
				concerto.setStadioNome(rs.getString("Stadio_Nome"));
				concerto.setArtistaBand(rs.getString("ArtistaBand"));
				concerto.setEventoCodiceID(rs.getInt("Evento_ECodiceID"));
				
				concertoC.add(concerto);
			}
			
		}finally {
			try {
				if(preparedstatement != null)
					preparedstatement.close();
			}finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		return concertoC;
	}

	
	
	public int maxCodice() throws SQLException {
		int codice = 0;
		
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		String selectSQL = "select max(ECodiceID) from Evento";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(selectSQL);
			
			ResultSet rs = preparedstatement.executeQuery();
			
			while(rs.next()) {
				codice = rs.getInt("max(ECodiceID)");
			}
		}finally {
			try {
				if(preparedstatement != null)
					preparedstatement.close();
			}finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		return codice;
	}
	
	
	@Override
	public void doSave(ConcertoBean object) throws SQLException {

		
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		PreparedStatement preparedstatement2 = null;
		
		
		String insertSQL = "INSERT INTO Evento "
				+ " (Titolo, Data_Evento, Stadio_Nome) VALUES (?, ?, ?)";
		
	

		String insertSQL2 ="INSERT INTO Concerto"
				+ " (ArtistaBand, Evento_ECodiceID) VALUES(?, ?)";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(insertSQL);
			
			preparedstatement2 = connection.prepareStatement(insertSQL2);
			
			
			
			preparedstatement.setString(1, object.getTitolo());
			preparedstatement.setString(2, object.getDataEvento());
			preparedstatement.setString(3, object.getStadioNome());
			
			System.out.println("doSave (parte1):" + preparedstatement.toString());
			preparedstatement.executeUpdate();
			

			object.setEventoCodiceID(maxCodice());

			
			preparedstatement2.setString(1, object.getArtistaBand());	
			preparedstatement2.setInt(2, object.getEventoCodiceID() +1);
			
			System.out.println("doSave (parte2):" + preparedstatement2.toString());
			preparedstatement2.executeUpdate();
			
			connection.commit();
			
		}finally {
			try {
				if(preparedstatement != null && preparedstatement2 != null ) {
					preparedstatement.close();
					preparedstatement2.close();
					
				}
			}finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
	
	}

	@Override
	public void doUpdate(ConcertoBean object) throws SQLException {
		EventoModelDM eventoDM = new EventoModelDM();
		EventoBean evento = new EventoBean();
		evento = (EventoBean) object;
		eventoDM.doUpdate(evento);
		
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		String updateSQL = "UPDATE Concerto SET"
				+ " ArtistaBand = ? WHERE Evento_ECodiceID = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(updateSQL);
			
			preparedstatement.setString(1, object.getArtistaBand());
			
			preparedstatement.setInt(2, object.geteCodiceID());
			
			System.out.println("doUpdate:" + preparedstatement.toString());
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
	public void doDelete(ConcertoBean object) throws SQLException {
		EventoModelDM eventoDM = new EventoModelDM();
		EventoBean evento = new EventoBean();
		evento = (EventoBean) object;
		
		
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		String deleteSQL = "DELETE FROM Concerto WHERE Evento_ECodiceID = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(deleteSQL);
			preparedstatement.setInt(1, object.geteCodiceID());
			
			
			System.out.println("doDelete:" + preparedstatement.toString());
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
		eventoDM.doDelete(evento);	
	}

}
