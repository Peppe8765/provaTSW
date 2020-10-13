package it.progetto.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;




public class EventoSportivoModelDM  implements ObjectModel<EventoSportivoBean>{
	
	public EventoSportivoBean doRetrieveByKey(String code) throws SQLException{
		EventoModelDM eventoDM = new  EventoModelDM();
		EventoBean evento = new EventoBean();
		EventoSportivoBean eventoSportivo = new EventoSportivoBean();
		evento = eventoDM.doRetrieveByKey(code);
			
		eventoSportivo.seteCodiceID(evento.geteCodiceID());
		eventoSportivo.setTitolo(evento.getTitolo());
		eventoSportivo.setDataEvento(evento.getDataEvento());
		eventoSportivo.setStadioNome(evento.getStadioNome());
		
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		String selectSQL = "SELECT * FROM EventoSportivo WHERE Evento_ECodiceID = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(selectSQL);
			preparedstatement.setInt(1, Integer.parseInt(code));
			
			System.out.println("doRetrieveByKey: " + preparedstatement.toString());
			ResultSet rs = preparedstatement.executeQuery();
			
			while(rs.next()) {
				eventoSportivo.setEventoCodiceID(rs.getInt("Evento_ECodiceID"));
				eventoSportivo.setTipo(rs.getString("Tipo"));
				eventoSportivo.setSquadra1(rs.getString("Squadra1"));
				eventoSportivo.setSquadra2(rs.getString("Squadra2"));
			}
			
		}finally {
			try {
				if(preparedstatement != null)
					preparedstatement.close();
			}finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		
		return eventoSportivo;
	}
	


	public Collection<EventoSportivoBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		Collection<EventoSportivoBean> eventoSPC = new LinkedList<EventoSportivoBean>();
		String selectSQL = "SELECT * FROM Evento, eventosportivo WHERE ECodiceID = Evento_ECodiceID ";
		
		if(order != null) {
			selectSQL += " ORDER BY " + order;
		}
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(selectSQL);
			
			System.out.println("doRetrieveALL: " +preparedstatement.toString());
			ResultSet rs = preparedstatement.executeQuery();
			
			while(rs.next()) {
				EventoSportivoBean eventoSP = new EventoSportivoBean();
				
				eventoSP.seteCodiceID(rs.getInt("ECodiceID"));
				eventoSP.setTitolo(rs.getString("Titolo"));
				eventoSP.setDataEvento(rs.getString("Data_Evento"));
				eventoSP.setStadioNome(rs.getString("Stadio_Nome"));
				eventoSP.setTipo(rs.getString("Tipo"));
				eventoSP.setSquadra1(rs.getString("Squadra1"));
				eventoSP.setSquadra2(rs.getString("Squadra2"));
				eventoSP.setEventoCodiceID(rs.getInt("Evento_ECodiceID"));
				
				eventoSPC.add(eventoSP);
				
			}
		}finally {
			try {
				if(preparedstatement != null)
					preparedstatement.close();
			}finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		
		
		
		
		return eventoSPC;
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
	public void doSave(EventoSportivoBean object) throws SQLException {

		
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		PreparedStatement preparedstatement2 = null;
		
		
		String insertSQL = "INSERT INTO Evento "
				+ " (Titolo, Data_Evento, Stadio_Nome) VALUES (?, ?, ?)";
		
	

		String insertSQL2 ="INSERT INTO EventoSportivo"
				+ " (Tipo, Evento_ECodiceID, Squadra1, Squadra2) VALUES(?, ?, ?, ?)";
		
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
			System.out.println(object.getEventoCodiceID());
			
			preparedstatement2.setString(1, object.getTipo());	
			preparedstatement2.setInt(2, object.getEventoCodiceID() +1);
			preparedstatement2.setString(3, object.getSquadra1());
			preparedstatement2.setString(4, object.getSquadra2());
			
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
	public void doUpdate(EventoSportivoBean object) throws SQLException {
		EventoModelDM eventoDM = new EventoModelDM();
		EventoBean evento = new EventoBean();
		evento = (EventoBean) object;
		eventoDM.doUpdate(evento);
		
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		String updateSQL = "UPDATE EventoSportivo SET"
				+ " Tipo = ?, Squadra1 = ?, Squadra2 = ? WHERE Evento_ECodiceID = ?";
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(updateSQL);
			
			preparedstatement.setString(1, object.getTipo());
			preparedstatement.setString(2, object.getSquadra1());
			preparedstatement.setString(3, object.getSquadra2());
			
			preparedstatement.setInt(4, object.getEventoCodiceID());
			
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
	public void doDelete(EventoSportivoBean object) throws SQLException {
		EventoModelDM eventoDM = new EventoModelDM();
		EventoBean evento = new EventoBean();
		evento = (EventoBean) object;
		
		
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		String deleteSQL = "DELETE FROM EventoSportivo WHERE Evento_ECodiceID = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(deleteSQL);
			preparedstatement.setInt(1, object.getEventoCodiceID());
			
			System.out.println(object.getEventoCodiceID());
			
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