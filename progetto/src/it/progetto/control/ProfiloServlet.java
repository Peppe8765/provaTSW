package it.progetto.control;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.jdbc.Blob;

import it.progetto.model.AcquistaBean;
import it.progetto.model.AcquistaModelDM;
import it.progetto.model.EventoBean;
import it.progetto.model.EventoModelDM;
import it.progetto.model.TicketBean;
import it.progetto.model.TicketModelDM;
import it.progetto.model.UtenteBean;
import it.progetto.model.UtenteModelDM;

import javax.servlet.RequestDispatcher;



@WebServlet("/ProfiloServlet")
public class ProfiloServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	static TicketModelDM tkModel = new TicketModelDM();
	static EventoModelDM evModel = new EventoModelDM();
	static AcquistaModelDM aModel = new AcquistaModelDM();
	static UtenteModelDM uModel = new UtenteModelDM();
    
    public ProfiloServlet() {
        super();
       
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	@SuppressWarnings("unchecked")
		Collection<TicketBean> tCollection = (Collection<TicketBean>)request.getSession().getAttribute("ticketsComponent");
		@SuppressWarnings("unchecked")
		Collection<EventoBean> eCollection = (Collection<EventoBean>)request.getSession().getAttribute("eventsComponent");
    	
		Collection<AcquistaBean> aCollection;
		
		Collection<EventoBean> eventsCollection = new LinkedList<EventoBean>();
		Collection<TicketBean> ticketsCollection = new LinkedList<TicketBean>();
		
		
		
		HttpSession currentSession = request.getSession();
		
		String nomeUtente = (String)currentSession.getAttribute("user");
		AcquistaBean aq = new AcquistaBean();
		TicketBean tk = new TicketBean();
		UtenteBean utente = new UtenteBean();
		
		try {
			utente = uModel.doRetrieveByKey(nomeUtente);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("utente", utente);
		request.setAttribute("email", utente.getEmail());
		request.setAttribute("nomeUtente", nomeUtente);
		
		
		if(tCollection == null && eCollection == null) {
			try {
				aCollection = aModel.doRetrieveAllByUserName(nomeUtente);
				
				Iterator<?> it = aCollection.iterator();
				
				while(it.hasNext()) {
					aq = (AcquistaBean)it.next();
					tk = tkModel.doRetrieveByKey(""+aq.getBiglietto_Codice_Biglietto());
					ticketsCollection.add(tk);
					
					eventsCollection.add(evModel.doRetrieveByKey(""+tk.getEventoECodiceId()));
				}		
			}catch(SQLException e){
				e.printStackTrace();
			}
			
			request.setAttribute("ticketsComponent", ticketsCollection);
			request.setAttribute("eventsComponent", eventsCollection);
		}
		
    	
    	RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/Profilo.jsp");
    	dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UtenteBean utente = new UtenteBean();
		String nomeUtente = (String)request.getSession().getAttribute("user");
		
		try {
			utente = uModel.doRetrieveByKey(nomeUtente);
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		String contentType = request.getContentType();
		
		if((contentType != null) && (contentType.indexOf("multipart/form-data")) >= 0) {
			DataInputStream in = new DataInputStream(request.getInputStream());
			
			int formDataLength = request.getContentLength();
			byte dataBytes[] = new byte[formDataLength];
			int byteRead = 0;
			int totalBytesRead = 0;
			
			while(totalBytesRead < formDataLength) {
				byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
				totalBytesRead +=byteRead;
			}
			
			
			String file = new String(dataBytes);
	
			
			String nomeFile = file.substring(file.indexOf("filename=\"") + 10);
			nomeFile = nomeFile.substring(0, nomeFile.indexOf("\n"));
			nomeFile = nomeFile.substring(nomeFile.lastIndexOf("\\") + 1,nomeFile.indexOf("\""));
			int lastIndex = contentType.lastIndexOf("=");
			String boundary = contentType.substring(lastIndex + 1,contentType.length());
			int pos;
			
			pos = file.indexOf("filename=\"");
			pos = file.indexOf("\n", pos) + 1;
			pos = file.indexOf("\n", pos) + 1;
			pos = file.indexOf("\n", pos) + 1;
			int boundaryLocation = file.indexOf(boundary, pos) -4;
			int posizioneIniziale = ((file.substring(0, pos)).getBytes()).length;
			int posizioneFinale = ((file.substring(0, boundaryLocation)).getBytes()).length;
			
			FileOutputStream fileOut = new FileOutputStream(nomeFile);
			fileOut.write(dataBytes, posizioneIniziale, (posizioneFinale - posizioneIniziale));
			fileOut.flush();
			fileOut.close();
			
			File fotoP = new File(nomeFile);
			
			
			try {
				uModel.doUpdateFoto(utente, fotoP);
			}catch (SQLException e) {
				e.printStackTrace();
			}
			
			
		}
		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/Profilo.jsp");
    	dispatcher.forward(request, response);
	}

}
