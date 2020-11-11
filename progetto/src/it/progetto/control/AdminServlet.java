package it.progetto.control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.progetto.model.UtenteBean;
import it.progetto.model.UtenteModelDM;

import java.util.Base64;


@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	UtenteModelDM uModel = new UtenteModelDM();
	
    public AdminServlet() {
        super();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String username =(String)request.getSession().getAttribute("user");
	System.out.println(username);
	UtenteBean admin = null;
	
	
	if(username != null) {
		try {
			admin = uModel.doRetrieveByKey(username);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("Admin", admin);
	}
	
	String daCriptare = "cose a caso";
	String encodedString = Base64.getEncoder().encodeToString(daCriptare.getBytes());
	System.out.println(encodedString);
	
	byte[] decodedBytes = Base64.getDecoder().decode(encodedString);
	String decodedString = new String(decodedBytes);
	System.out.println(decodedString);
	
	
	
	RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher(response.encodeURL("/AdminPage.jsp"));
	dispatcher.forward(request, response);
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
