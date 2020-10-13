package it.progetto.control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.progetto.model.UtenteBean;
import it.progetto.model.UtenteModelDM;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String email = request.getParameter("email");
		String user = request.getParameter("uname");
		String pass1 = request.getParameter("pass");
		String pass2 = request.getParameter("pass2");
		
		UtenteModelDM utenteDM = new UtenteModelDM();
		UtenteBean utente = new UtenteBean();
		
		if(pass1 != pass2) {
			response.sendRedirect("Login.html");
		}
		
			if(email != null && user != null && pass1 != null && pass2 != null) {
				utente.setEmail(email);
				utente.setNomeUtente(user);
				utente.setPassword(pass1);
				
				try{
					utenteDM.doSave(utente);
				}
				catch (SQLException e) {
					e.printStackTrace();
				}
				
				
			}
		
			response.sendRedirect("Login.html");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
