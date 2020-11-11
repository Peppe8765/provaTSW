package it.progetto.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Base64;

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
		String mess = "";
		UtenteModelDM utenteDM = new UtenteModelDM();
		UtenteBean utente = new UtenteBean();
		
		if(pass1.equals(pass2)) {
			if(email != null && user != null && pass1 != null && pass2 != null) {
				utente.setEmail(email);
				utente.setNomeUtente(user);
				
				String encodedString = Base64.getEncoder().encodeToString(pass1.getBytes());
				
				utente.setPassword(encodedString);
				
				try{
					utenteDM.doSave(utente);
				}
				catch (SQLException e) {
					e.printStackTrace();
				}
				mess = "registrazione effettuata";
				
			}
		}else {
			mess ="registrazione fallita";
		}
		 	request.setAttribute("regMess", mess);
			response.sendRedirect(response.encodeRedirectURL("Login.html"));
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
