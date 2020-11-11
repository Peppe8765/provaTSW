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

import it.progetto.model.StadioBean;
import it.progetto.model.StadioModelDM;


@WebServlet("/StadiServlet")
public class StadiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	static StadioModelDM sModel = new StadioModelDM();
	
	
    public StadiServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		@SuppressWarnings("unchecked")
		Collection<StadioBean> sCollection = (Collection<StadioBean>)request.getSession().getAttribute("stadii");
		
		if(sCollection == null) {
			try {
				sCollection = sModel.doRetrieveAll("Nome");
			}catch (SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("stadii", sCollection);
		}
		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher(response.encodeURL("/Stadi.jsp"));
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
