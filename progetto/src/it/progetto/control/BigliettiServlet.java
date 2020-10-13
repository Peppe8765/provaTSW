package it.progetto.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.progetto.model.Cart;
import it.progetto.model.EventoBean;
import it.progetto.model.EventoModelDM;
import it.progetto.model.TicketBean;
import it.progetto.model.TicketModelDM;

@WebServlet("/BigliettiServlet")
public class BigliettiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	static TicketModelDM model = new TicketModelDM();
	static EventoModelDM modelEv = new EventoModelDM();
	
    public BigliettiServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		@SuppressWarnings("unchecked")
		Cart<TicketBean> cart = (Cart<TicketBean>)request.getSession().getAttribute("carrello");
		if(cart == null) {
			cart = new Cart<TicketBean>();
			request.getSession().setAttribute("carrello", cart);
		}
		
		
		@SuppressWarnings("unchecked")
		Collection<TicketBean> tCollection = (Collection<TicketBean>)request.getSession().getAttribute("tickets");
		@SuppressWarnings("unchecked")
		Collection<EventoBean> eCollection = (Collection<EventoBean>)request.getSession().getAttribute("events");
		
		if(tCollection == null && eCollection == null) {
			try {
				tCollection = model.doRetrieveAll("Codice_Biglietto");
				eCollection = modelEv.doRetrieveAll("ECodiceID");
			}catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("tickets", tCollection);
			request.setAttribute("events", eCollection);
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

			}
		}
		catch(SQLException e) {
			System.out.println("Error: " + e);
		}
		
		
		

		//request.setAttribute("carrello", cart);
		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/Biglietti.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
