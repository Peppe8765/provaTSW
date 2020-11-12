package it.progetto.model;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

public class ComuneModelDM implements ObjectModel<ComuneBean>{

	public ComuneBean doRetrieveByName(String name) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		ComuneBean comune = new ComuneBean();
		String selectSQL = "SELECT * FROM Comune WHERE Citt� = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(selectSQL);
			preparedstatement.setString(1, name);
			
			System.out.println("doRetrieveByKey: " +preparedstatement.toString());
			ResultSet rs = preparedstatement.executeQuery();
			
			while(rs.next()) {
				comune.setCCodiceID(rs.getInt("CCodiceID"));
				comune.setCitt�(rs.getString("Citt�"));
			}
			
			System.out.println(comune);
			
		}finally {
			try {
				if(preparedstatement != null)
					preparedstatement.close();
			}finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return comune;
	}
	
	@Override
	public ComuneBean doRetrieveByKey(String code) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		ComuneBean comune = new ComuneBean();
		String selectSQL = "SELECT * FROM Comune WHERE CCodiceID = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(selectSQL);
			preparedstatement.setInt(1, Integer.parseInt(code));
			
			System.out.println("doRetrieveByKey: " +preparedstatement.toString());
			ResultSet rs = preparedstatement.executeQuery();
			
			while(rs.next()) {
				comune.setCCodiceID(rs.getInt("CCodiceID"));
				comune.setCitt�(rs.getString("Citt�"));
			}
			
			System.out.println(comune);
			
		}finally {
			try {
				if(preparedstatement != null)
					preparedstatement.close();
			}finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		return comune;
	}

	@Override
	public Collection<ComuneBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		Collection<ComuneBean> comuni = new LinkedList<ComuneBean>();
		String selectSQL = "SELECT * FROM Comune";
		
		if(order != null) {
			selectSQL += " ORDER BY " + order; 
		}
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(selectSQL);
			
			System.out.println("doRetriveAll: " + preparedstatement.toString());
			ResultSet rs = preparedstatement.executeQuery();
			
			while(rs.next()) {
				ComuneBean comune = new ComuneBean();
				
				comune.setCCodiceID(rs.getInt("CCodiceID"));
				comune.setCitt�(rs.getString("Citt�"));
				
				comuni.add(comune);
			}
			
		}finally {
			try {
				if(preparedstatement != null)
					preparedstatement.close();
			}finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		
		return comuni;
	}

	@Override
	public void doSave(ComuneBean object) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		String insertSQL = "INSERT INTO Comune"
				+ "(Citt�) VALUES (?)";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(insertSQL);
			
			preparedstatement.setString(1, object.getCitt�());
			
			System.out.println("doSave: "+ preparedstatement.toString());
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
	public void doUpdate(ComuneBean object) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		String updateSQL = " UPDATE Comune SET"
				+ "Citt� = ? WHERE CCodiceID = ?";
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(updateSQL);
			
			preparedstatement.setString(1, object.getCitt�());
			
			preparedstatement.setInt(2, object.getCCodiceID());
			
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
	public void doDelete(ComuneBean object) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedstatement = null;
		
		String deleteSQL = "DELETE FROM Comune WHERE CCodiceID = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedstatement = connection.prepareStatement(deleteSQL);
			preparedstatement.setInt(1, object.getCCodiceID());
			
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
