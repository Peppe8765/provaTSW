package it.progetto.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.progetto.model.UtenteBean;
import it.progetto.model.UtenteModelDM;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	static UtenteModelDM utenteDM = new UtenteModelDM();
	
    public LoginServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String userName = request.getParameter("uname");
		String password = request.getParameter("pass");
		PrintWriter out = response.getWriter();
		
		System.out.println(userName);
		
		UtenteModelDM utenteDM = new UtenteModelDM();
		UtenteBean utente = new UtenteBean();
		String contenuto;
		try {
			utente = utenteDM.doRetrieveByKey(userName);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		System.out.println(utente);
		
		if(utente.getNomeUtente().equals(userName) && utente.getPassword().equals(password)) {
			contenuto = "utente connesso = " + userName;
			
			HttpSession oldSession = request.getSession(false);
			if(oldSession != null) {
				oldSession.invalidate();
			}
			
			HttpSession currentSession = request.getSession();
			currentSession.setAttribute("user", userName);
			currentSession.setMaxInactiveInterval(60*60); // 60  minuti di sessione 
			
			response.sendRedirect("Success.jsp");
		}
		else {
			contenuto = "utente errato";
		}
		
		out.println("<html>"
				+ "<body>"
				+ "<h1>"+ contenuto +"</h1>"
				+ "<br>"
				+ "</body>"
				+ "</html>");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}