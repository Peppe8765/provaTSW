package it.progetto.model;

import java.sql.SQLException;
import java.util.Collection;

public interface ObjectModel<T>{
	
public T doRetrieveByKey(String code) throws SQLException;
	
	public Collection<T> doRetrieveAll(String order) throws SQLException;
	
	public void doSave(T object) throws SQLException;
	
	public void doUpdate(T object) throws SQLException;
	
	public void doDelete(T object) throws SQLException;

}
