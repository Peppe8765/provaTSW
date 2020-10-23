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

import it.progetto.model.TicketModelDM;
import it.progetto.model.Cart;
import it.progetto.model.EventoBean;
import it.progetto.model.EventoModelDM;
import it.progetto.model.TicketBean;

@WebServlet("/EventoServlet")
public class EventoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	static TicketModelDM tModel = new TicketModelDM();
	static EventoModelDM eModel = new EventoModelDM();
	
    public EventoServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		@SuppressWarnings("unchecked")
		Collection<TicketBean> tC = (Collection<TicketBean>)request.getSession().getAttribute("ticketEventoC");
		

		
		
		String idEvent = request.getParameter("idEvent");
		System.out.println(idEvent);
		
		EventoBean eventoS = (EventoBean)request.getSession().getAttribute("eventoS");

		if(eventoS == null) {
			try {
				eventoS = eModel.doRetrieveByKey(idEvent);
				System.out.println();
			}catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("eventoS", eventoS);
		}
		
		if(tC == null) {
			try {
				tC = tModel.doRetrieveAllByEvent(idEvent);
			}catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("ticketEventoC", tC);
		}
		
		
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
					System.out.println(id);
					TicketBean ticket = tModel.doRetrieveByKey(id);
					if(ticket != null && !ticket.isEmpty()) {
						cart.addItem(ticket);
						request.setAttribute("messageEv", "Ticket " + ticket.getCodiceBiglietto() + " added to cart");
						request.setAttribute("carrello", cart);
					}
				}
			}
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/Evento.jsp");
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
