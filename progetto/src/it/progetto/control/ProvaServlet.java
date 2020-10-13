package it.progetto.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/ProvaServlet")
public class ProvaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ProvaServlet() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		PrintWriter out = response.getWriter();
		out.println("<html>"
				+ "<body>"
				+ "<h1>"+fname+" "+lname+"</h1>"
				+ "<br>"
				+ "</body>"
				+ "</html>");
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
