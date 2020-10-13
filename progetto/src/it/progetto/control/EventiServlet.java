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

import it.progetto.model.EventoBean;
import it.progetto.model.EventoModelDM;


@WebServlet("/EventiServlet")
public class EventiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	static EventoModelDM eModel = new EventoModelDM();
	
	
    public EventiServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		@SuppressWarnings("unchecked")
		Collection<EventoBean> eCollection = (Collection<EventoBean>)request.getSession().getAttribute("events");
		
		if(eCollection == null) {
			try {
			eCollection = eModel.doRetrieveAll("ECodiceID");
			}catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("events", eCollection);
		}
		
		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/Eventi.jsp");
		dispatcher.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
