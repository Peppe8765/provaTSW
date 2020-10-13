package it.progetto.control;

import java.awt.Image;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.imageio.ImageWriter;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.jdbc.Blob;

import it.progetto.model.UtenteBean;
import it.progetto.model.UtenteModelDM;


@WebServlet("/MostraFotoServlet")
public class MostraFotoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MostraFotoServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = (String)request.getSession().getAttribute("user");
		UtenteModelDM uModel = new UtenteModelDM();
		UtenteBean utente = new UtenteBean();
		
		try {	
			utente = uModel.doRetrieveByKey(userName);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		Blob foto = (Blob)utente.getFotoProfilo();
		InputStream is = null ;
		try {
			is = foto.getBinaryStream();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		int len = 0;
		try {
			len = (int)foto.length();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.setContentType("image/jpg");
		response.setContentLength(len);
		
		OutputStream out = response.getOutputStream();
		int b;
		while((b = is.read()) != -1) {
			out.write(b);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
