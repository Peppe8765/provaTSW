package it.progetto.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.progetto.model.UtenteBean;
import it.progetto.model.UtenteModelDM;

/**
 * Servlet implementation class AdminLoginServlet
 */
@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public AdminLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String userName = request.getParameter("uname");
		String password = request.getParameter("pass");
		String codiceA = request.getParameter("codiceAdmin");
		int codiceAdmin = Integer.parseInt(codiceA);
		PrintWriter out = response.getWriter();
		
		String redirectedPage="";
		
		System.out.println(userName);
		
		UtenteModelDM utenteDM = new UtenteModelDM();
		UtenteBean utente = new UtenteBean();

		try {
			utente = utenteDM.doRetrieveByKey(userName);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		System.out.println(utente);
		
		if(utente.getNomeUtente().equals(userName) && utente.getPassword().equals(password) && utente.getCodiceAdmin() == codiceAdmin) {
		
			
			HttpSession oldSession = request.getSession(false);
			if(oldSession != null) {
				oldSession.invalidate();
			}
			
			HttpSession currentSession = request.getSession();
			currentSession.setAttribute("user", userName);
			
			if(utente.getCodiceAdmin() != -1) {
				currentSession.setAttribute("adminRole", true);
			}
			else {
				currentSession.setAttribute("adminRole", false);
			}
			
			currentSession.setMaxInactiveInterval(60*60); // 60  minuti di sessione 
			
			redirectedPage = "/Profilo.jsp";
		}
		else {
			redirectedPage = "/Login.html";
		}
		
		response.sendRedirect(request.getContextPath() + redirectedPage);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
