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


@WebServlet("/EventStadioServlet")
public class EventStadioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	static EventoModelDM eModel = new EventoModelDM();
	
    public EventStadioServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		@SuppressWarnings("unchecked")
		Collection<EventoBean> eventCollection = (Collection<EventoBean>)request.getSession().getAttribute("eventStadio");
		String stadioName = request.getParameter("stadioName");
		
		if(eventCollection == null) {
			
			try {
				eventCollection = eModel.doRetrieveAllByStadioName(stadioName);
			}catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("eventStadio", eventCollection);
			request.setAttribute("stadioName", stadioName);
		}

		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/Stadio.jsp");
		dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
