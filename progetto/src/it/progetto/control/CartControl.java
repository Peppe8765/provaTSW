package it.progetto.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Iterator;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.progetto.model.TicketBean;
import it.progetto.model.TicketModelDM;
import it.progetto.model.Cart;

/**
 * Servlet implementation class CartControl
 */
@WebServlet("/CartControl")
public class CartControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	static TicketModelDM model = new TicketModelDM();
       
    public CartControl() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String Indirizzo = request.getParameter("Indirizzo");
		String Destinatario = request.getParameter("Destinatario");
		String Telefono= request.getParameter("Telefono");
		
		
		@SuppressWarnings("unchecked")
		Cart<TicketBean> cart = (Cart<TicketBean>)request.getSession().getAttribute("carrello");
		
		if(cart == null) {
			cart = new Cart<TicketBean>();
			request.getSession().setAttribute("carrello", cart);
		}
				
		String action = request.getParameter("action");
		
		try {
			if(action != null) {
				if(action.equals("addCart")) {
					String id = request.getParameter("id");
					TicketBean ticket = model.doRetrieveByKey(id);
					if(ticket != null && !ticket.isEmpty()) {
						cart.addItem(ticket);
						request.setAttribute("message", "Ticket " + ticket.getCodiceBiglietto() + " added to cart");
						
						System.out.println("questo è il carrello " +cart);
						
						request.setAttribute("carrello", cart);
							
					}
				}
				else if(action.equals("deleteCart")) {
					String id = request.getParameter("id");
					TicketBean tk = model.doRetrieveByKey(id);
					if(tk != null && !tk.isEmpty()) {
						cart.deleteItem(tk);
						request.setAttribute("messageCart", "il biglietto con codice " +tk.getCodiceBiglietto()+ " è stato eliminato dal carrello");
					}
				}
				else if(action.equals("clearCart")) {
					cart.deleteAllItems();
					request.setAttribute("messageCart", "Carrello svuotato");
				}
				else if(action.equals("payment")) {		

					
						cart.deleteAllItems();
						request.setAttribute("messageP", "Pagamento avvenuto con successo! Ordine inviato a " + Destinatario + " all'indirizzo " + Indirizzo + " con telefono " + Telefono);
					
				}
				
			}
			
		}
		catch(SQLException e) {
			System.out.println("Error: " + e);
		}
		
		request.setAttribute("carrello", cart);
		
				
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/Carrello.jsp");
		dispatcher.forward(request, response);
	

		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}
}
