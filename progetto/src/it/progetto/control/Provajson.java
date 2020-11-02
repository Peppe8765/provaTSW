package it.progetto.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.progetto.model.Cart;
import it.progetto.model.TicketBean;
import it.progetto.model.TicketModelDM;






@WebServlet("/Provajson")
public class Provajson extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public Provajson() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	response.setContentType("text/plain");

		@SuppressWarnings("unchecked")
		Cart<TicketBean> cart = (Cart<TicketBean>)request.getSession().getAttribute("carrello");
		if(cart == null) {
			cart = new Cart<TicketBean>();
			request.getSession().setAttribute("carrello", cart);
		}
		
    	
    	String param = (String)request.getParameter("param");
    	if(param != null) {
    		try {
    			TicketModelDM mo = new TicketModelDM();
    			TicketBean tk = mo.doRetrieveByKey(param);
    			if(tk != null && !tk.isEmpty())
    				cart.addItem(tk);
    		}catch (SQLException e) {
				e.printStackTrace();
			}
    	}
    	
    	
    	System.out.print(param);
    	PrintWriter out = response.getWriter();
    	out.print("aggiunto il coso" + param);
    	
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
