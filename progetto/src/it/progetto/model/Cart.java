package it.progetto.model;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Cart<T> {
	List<T> items;
	
	public Cart() {
		items = new ArrayList<T>();
	}
	
	public void addItem(T item) {
		items.add(item);
	}
	
	public void deleteItem(T item) {
		items.remove(item);
	}
	
	public List<T> getItems(){
		return items;
	}
	
	public void deleteAllItems() {
		items.clear();
	}
	
	public String toString() {
		Iterator<?> it = items.iterator();
		String s ="";
		
		while(it.hasNext()) {
			s += "" + it.next();
		}
		return   s;
	}
	
}
