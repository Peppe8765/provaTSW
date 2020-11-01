package it.progetto.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.progetto.model.TicketBean;
import it.progetto.model.TicketModelDM;
import it.progetto.model.Cart;
import it.progetto.model.EventoBean;
import it.progetto.model.EventoModelDM;


@WebServlet("/CartControl")
public class CartControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	static TicketModelDM model = new TicketModelDM();
       
	static EventoModelDM eModel = new EventoModelDM();
	
	
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
		
		@SuppressWarnings("unchecked")
		Collection<EventoBean> eC = (Collection<EventoBean>)request.getSession().getAttribute("events");
		
		if(eC == null) {
			try {
				eC = eModel.doRetrieveAll("ECodiceID");
			}catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("eC", eC);
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
						request.setAttribute("messageCart", "il biglietto con codice" +tk.getCodiceBiglietto()+ " è stato eliminato dal carrello");
					}
				}
				else if(action.equals("clearCart")) {
					cart.deleteAllItems();
					request.setAttribute("messageCart", "Carrello svuotato");
				}
				else if(action.equals("payment")) {		

					
						cart.deleteAllItems();
						request.setAttribute("messageP", "Pagamento avvenuto con successo  Ordine inviato a " + Destinatario + " all'indirizzo " + Indirizzo + " e telefono " + Telefono);
					
				}
				
			}
			
		}
		catch(SQLException e) {
			System.out.println("Error: " + e);
		}
		
		request.setAttribute("carrello", cart);
		
		int codiceBiglietto;
		Double costo ;
		Double totale = 0.0;
		
		List<TicketBean> ticketCart = cart.getItems();
		
		if(ticketCart.size() > 0){
			
			for(TicketBean tk : ticketCart){	
				
				codiceBiglietto = tk.getCodiceBiglietto();
				costo = tk.getCosto();
				totale += costo;
		
			}
		}
		request.setAttribute("totale", totale);
		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/Carrello.jsp");
		dispatcher.forward(request, response);
	

		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}
}
