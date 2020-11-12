package it.progetto.control;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.jdi.event.Event;

import it.progetto.model.AcquistaBean;
import it.progetto.model.AcquistaModelDM;
import it.progetto.model.ComuneBean;
import it.progetto.model.ComuneModelDM;
import it.progetto.model.ConcertoBean;
import it.progetto.model.ConcertoModelDM;
import it.progetto.model.EventoBean;
import it.progetto.model.EventoModelDM;
import it.progetto.model.EventoSportivoBean;
import it.progetto.model.EventoSportivoModelDM;
import it.progetto.model.Societ‡Bean;
import it.progetto.model.Societ‡ModelDM;
import it.progetto.model.StadioBean;
import it.progetto.model.StadioModelDM;
import it.progetto.model.TicketBean;
import it.progetto.model.TicketModelDM;
import it.progetto.model.UtenteBean;
import it.progetto.model.UtenteModelDM;




@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	static UtenteModelDM uModel = new UtenteModelDM();
	static StadioModelDM sModel = new StadioModelDM();
	static ComuneModelDM cModel = new ComuneModelDM();
	static Societ‡ModelDM socModel = new Societ‡ModelDM();
	static TicketModelDM tkModel = new TicketModelDM();
	static EventoModelDM evModel = new EventoModelDM();
	static EventoSportivoModelDM evSModel = new EventoSportivoModelDM();
	static ConcertoModelDM conModel = new ConcertoModelDM();
	static AcquistaModelDM aModel = new AcquistaModelDM();
	
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
	
	String action = request.getParameter("action");
	
	if(action != null) {
		if(action.equals("addStadio")) {
			String nomeStadio = request.getParameter("NomeStadio");
			String nazione = request.getParameter("Nazione");
			String citt‡ = request.getParameter("Citt‡");
			String indirizzo = request.getParameter("Indirizzo");
			String capienza = request.getParameter("Capienza");
			String descrizione = request.getParameter("Descrizione");
			
			String comune = request.getParameter("Comune");
			ComuneBean c = new ComuneBean();
			Societ‡Bean societ‡S = new Societ‡Bean();
			
			if(comune != null ) {
				Collection<ComuneBean> cColl = new LinkedList<ComuneBean>();
				
				
				try {
					cColl = cModel.doRetrieveAll("CCodiceID");
				}catch (SQLException e) {
					
				}
				
				Iterator<?> itC = cColl.iterator();
				Boolean iH = false;
				while(itC.hasNext()) {
					ComuneBean com = (ComuneBean)itC.next();
					if(comune.equals(com.getCitt‡()))
						iH = true;
				}
				if(!iH) {
					
					c.setCitt‡(comune);
					try {
						cModel.doSave(c);
						
					}catch (SQLException e) {
						e.printStackTrace();
					}
				}
				try {
					c = cModel.doRetrieveByName(comune);
				}catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
			String societ‡ = request.getParameter("Societ‡");
			String annoFondazione = request.getParameter("AnnoFondazione");
			
			if(societ‡ != null) {
				Collection<Societ‡Bean> sColl = new LinkedList<Societ‡Bean>();
				
				try {
					sColl = socModel.doRetrieveAll("SCodiceID");
				}catch (SQLException e) {
					e.printStackTrace();
				}
				
				Iterator<?> itS = sColl.iterator();
				Boolean iH = false;
				while(itS.hasNext()) {
					Societ‡Bean soc = (Societ‡Bean)itS.next();
					if(societ‡.equals(soc.getNome())) 
						iH = true;
				}
				if(!iH) {
					
					societ‡S.setNome(societ‡);
					societ‡S.setAnnoFondazione(Integer.parseInt(annoFondazione));
					try {
						socModel.doSave(societ‡S);
					}catch (SQLException e) {
						e.printStackTrace();
					}
				}
				
				try {
					societ‡S = socModel.doRetrieveByName(societ‡);
				}catch (SQLException e) {
					e.printStackTrace();
				}
				
			}
			
			
			Collection<StadioBean> sColl = new LinkedList<StadioBean>() ;
			
			try {
			 sColl = sModel.doRetrieveAll("Nome"); 
			}catch (SQLException e) {
				e.printStackTrace();
			}
			
			Iterator<?> it = sColl.iterator();
			Boolean isHere = false;
			while(it.hasNext()) {
				StadioBean st = (StadioBean)it.next();
				if(nomeStadio.equals(st.getNome()))
					isHere = true;
			}
			if(!isHere) {
				StadioBean stadio = new StadioBean();
				stadio.setNome(nomeStadio);
				stadio.setNazione(nazione);
				stadio.setCitt‡(citt‡);
				stadio.setIndirizzo(indirizzo);
				stadio.setCapienza(Integer.parseInt(capienza));
				stadio.setDescrizione(descrizione);
				stadio.setComune_CCodiceID(c.getCCodiceID());
				stadio.setSociet‡_SCodiceID(societ‡S.getSCodiceId());
				try {
					sModel.doSave(stadio);
				}catch (SQLException e) {
					e.printStackTrace();
				}
			}
			
		}
		else if(action.equals("removeStadio")) {
			
		}
		
		else if(action.equals("addEvent")) {
			String titolo = request.getParameter("Titolo");
			String dataEvento = request.getParameter("DataEvento");
			String stadioEvento = request.getParameter("StadioEvento");
			
			String artistaband = request.getParameter("Artista");
			
			String tipo = request.getParameter("Tipo");
			String squadra1 = request.getParameter("Squadra1");
			String squadra2 = request.getParameter("Squadra2");
			
			if(titolo != null && dataEvento != null && stadioEvento != null) {
				Collection<EventoBean> evColl = new LinkedList<EventoBean>();
				try {
					evColl = evModel.doRetrieveAll("ECodiceID");
				}catch (SQLException e) {
					e.printStackTrace();
				}

				
			}
			
		}
		
		else if(action.equals("removeEvent")) {
			String codiceEvento = request.getParameter("CodiceEvento");
			
			if(codiceEvento != null) {
				Collection<EventoBean> evColl = new LinkedList<EventoBean>();
				
				try {
					evColl = evModel.doRetrieveAll("ECodiceID");
				}catch (SQLException e) {
					e.printStackTrace();
				}
				
				Iterator<?> it = evColl.iterator();
				EventoBean ev = new EventoBean();
				Boolean isHere = false;
				
				while(it.hasNext()) {
					ev = (EventoBean)it.next();
					if(Integer.parseInt(codiceEvento) == ev.geteCodiceID())
						isHere = true;
				}
				
				if(isHere) {
					Collection<TicketBean> tkColl = new LinkedList<TicketBean>();
					Collection<AcquistaBean> aqColl = new LinkedList<AcquistaBean>();
					
					try {
						aqColl = aModel.doRetrieveAll("Biglietto_Codice_Biglietto");
						tkColl = tkModel.doRetrieveAllByEvent(codiceEvento);						
					}catch (SQLException e) {
						e.printStackTrace();
					}
					
					Iterator<?> itTk = tkColl.iterator();
					Iterator<?> itAq = aqColl.iterator();
					while(itTk.hasNext()) {
						TicketBean ticket = (TicketBean)itTk.next();
						
						while(itAq.hasNext()) {
							AcquistaBean aq = (AcquistaBean)itAq.next();
							if(aq.getBiglietto_Codice_Biglietto() == ticket.getCodiceBiglietto()) {
								try {
									aModel.doDelete(aq);
								}catch (SQLException e) {
									e.printStackTrace();
								}
							}
						}
						itAq = aqColl.iterator();
						
						try {
							tkModel.doDelete(ticket);
						}catch (SQLException e) {
							e.printStackTrace();
						}
					}
					
					try {
						EventoSportivoBean evS = evSModel.doRetrieveByKey(codiceEvento);
						evSModel.doDelete(evS);
					}catch (SQLException e) {
						e.printStackTrace();
					}
					
					try {
						ConcertoBean concerto = conModel.doRetrieveByKey(codiceEvento);
						conModel.doDelete(concerto);
					}catch (SQLException e) {
						e.printStackTrace();
					}
					
					
					try {
						EventoBean event = evModel.doRetrieveByKey(codiceEvento);
						evModel.doDelete(event);
					}catch (SQLException e) {
						e.printStackTrace();
					}
					request.setAttribute("messageUser", "evento eliminato con successo");
				}
				else if(!isHere) {
					request.setAttribute("messageUser", "impossibile eliminare l'evento selezionato");
				}
			}
		}
		
		else if(action.equals("addTicket")) {
			String settore = request.getParameter("Settore");
			String costo = request.getParameter("Costo");
			String quantit‡ = request.getParameter("Quantit‡");
			String codEvento = request.getParameter("CodiceEventoBiglietto");
			
			
			if(settore != null && costo != null && quantit‡ != null && codEvento != null) {
				Collection<EventoBean> evColl = new LinkedList<EventoBean>();
				
				try {
					evColl = evModel.doRetrieveAll("ECodiceID");
				}catch (SQLException e) {
					e.printStackTrace();
				}
				
				Iterator<?> it = evColl.iterator();
				EventoBean ev = new EventoBean();
				Boolean isHere = false;
				while(it.hasNext()) {
					ev = (EventoBean)it.next();
					if(Integer.parseInt(codEvento) == ev.geteCodiceID()) 
						isHere = true;
				}
				if(isHere) {
					try {
						TicketBean tk = new TicketBean();
						tk.setSettore(settore);
						tk.setCosto(Double.parseDouble(costo));
						tk.setQuantit‡(Integer.parseInt(quantit‡));
						tk.setEventoECodiceId(Integer.parseInt(codEvento));
						tkModel.doSave(tk);
					}catch (SQLException e) {
						e.printStackTrace();
					}
					request.setAttribute("messageUser", "biglietto aggiunto con successo");
				}
				else if (!isHere) {
					request.setAttribute("messageUser", "impossibile aggiungere il biglietto selezionato");
				}
			}
		}
		
		else if(action.equals("removeTicket")) {
			String codiceBiglietto = request.getParameter("CodiceBiglietto");
			
			if(codiceBiglietto != null) {
				Collection<TicketBean> tkColl = new LinkedList<TicketBean>();
				
				try {
					tkColl = tkModel.doRetrieveAll("Codice_Biglietto");
				}catch (SQLException e) {
					e.printStackTrace();
				}
				Iterator<?> it = tkColl.iterator();
				TicketBean tk = new TicketBean();
				Boolean isHere = false;
				while(it.hasNext()) {
					tk = (TicketBean)it.next();
					if(Integer.parseInt(codiceBiglietto) == tk.getCodiceBiglietto()) {
						isHere = true;
					}
					
					if(isHere) {
						try {
							TicketBean ticket = tkModel.doRetrieveByKey(codiceBiglietto);
							tkModel.doDelete(ticket);
						}catch (SQLException e) {
							e.printStackTrace();
						}
						request.setAttribute("messageUser", "biglietto eliminato con successo");
					}
					else if (!isHere) {
						request.setAttribute("messageUser", "impossibile trovare il biglietto selezionato");
					}
				}
			}
		}
		
		else if(action.equals("addAdmin")) {
			String nomeUtente = request.getParameter("NomeUtente");
			String codAdmin = request.getParameter("CodiceAdmin");
			if(nomeUtente != null) {
				Collection<UtenteBean> userColl = new LinkedList<UtenteBean>();
				
				try {
					userColl = uModel.doRetrieveAll("NomeUtente");
				}catch (SQLException e) {
					e.printStackTrace();
				}
				Iterator<?> it = userColl.iterator();
				UtenteBean us = new UtenteBean();
				Boolean isHere = false;
				while(it.hasNext()) {
					us = (UtenteBean)it.next();
					if(nomeUtente.equals(us.getNomeUtente()) && (us.getCodiceAdmin() == -1)) 
						isHere = true;
					
				}
				if(isHere) {
					try {
						UtenteBean utente = uModel.doRetrieveByKey(nomeUtente);
						utente.setCodiceAdmin(Integer.parseInt(codAdmin));
						uModel.doUpdate(utente);
					}catch (SQLException e) {
						e.printStackTrace();
					}
					request.setAttribute("messageUser", "utente promosso con successo");
				}
				else if(!isHere) {
					request.setAttribute("messageUser", "impossibile trovare l'utente selezionato");
				}
				
			}
		}
		
		else if(action.equals("removeAdmin")) {
			String nomeAdmin = request.getParameter("NomeAdmin");
			
			if(nomeAdmin != null) {
				
				Collection<UtenteBean> userColl = new LinkedList<UtenteBean>();
				
				try {
					userColl = uModel.doRetrieveAll("NomeUtente");
				}catch (SQLException e) {
					e.printStackTrace();
				}

				Iterator<?> it = userColl.iterator();
				UtenteBean us = new UtenteBean();
				Boolean isHere = false;
				while(it.hasNext()) {
					us = (UtenteBean)it.next();
					if(nomeAdmin.equals(us.getNomeUtente()) && (us.getCodiceAdmin() > -1)) 
						isHere = true;
					
				}
				if(isHere) {
					try {
						UtenteBean utente = uModel.doRetrieveByKey(nomeAdmin);
						utente.setCodiceAdmin(-1);
						uModel.doUpdate(utente);
					}catch (SQLException e) {
						e.printStackTrace();
					}
					request.setAttribute("messageUser", "admin declassato con successo");
				}
				else if(!isHere) {
					request.setAttribute("messageUser", "impossibile trovare l'admin selezionato");
				}
			}
		}
		else if(action.equals("removeUser")) {
			String nomeUtente = request.getParameter("NomeUtente");
			
			if(nomeUtente != null) {
				
				Collection<UtenteBean> userColl = new LinkedList<UtenteBean>();
				
				try {
					userColl = uModel.doRetrieveAll("NomeUtente");
				}catch (SQLException e) {
					e.printStackTrace();
				}
				
				Iterator<?> it = userColl.iterator();
				UtenteBean us = new UtenteBean();
				Boolean isHere = false;
				while(it.hasNext()) {
					us = (UtenteBean)it.next();
					if(nomeUtente.equals(us.getNomeUtente())) 
						isHere = true;
					
				}
				if(isHere) {
					try {
						UtenteBean utente = uModel.doRetrieveByKey(nomeUtente);
						uModel.doDelete(utente);
					}catch (SQLException e) {
						e.printStackTrace();
					}
					request.setAttribute("messageUser", "utente eliminato con successo");
				}
				else if(!isHere) {
					request.setAttribute("messageUser", "impossibile trovare l'utente selezionato");
				}
			}
		}
	}
	

	
	
	RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher(response.encodeURL("/AdminPage.jsp"));
	dispatcher.forward(request, response);
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
