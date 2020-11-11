<%@page import="it.progetto.model.AcquistaBean"%>
<%@page import="it.progetto.model.AcquistaModelDM"%>
<%@page import="it.progetto.model.EventoBean"%>
<%@page import="it.progetto.model.ConcertoModelDM"%>
<%@page import="it.progetto.model.ConcertoBean"%>
<%@page import="it.progetto.model.TicketBean"%>
<%@page import="it.progetto.model.TicketModelDM"%>
<%@page import="it.progetto.model.EventoModelDM"%>
<%@page import="it.progetto.model.EventoSportivoModelDM"%>
<%@page import="it.progetto.model.EventoSportivoBean"%>
<%@page import="it.progetto.model.UtenteModelDM"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, it.progetto.model.UtenteBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Test Page</title>
</head>
<body>
	<h1>Test Page</h1>
	<p>pagina di test per la connesione al database e i bean</p>
	

<%
	AcquistaModelDM aq = new AcquistaModelDM();
	AcquistaBean a = new AcquistaBean();
	a.setBiglietto_Codice_Biglietto(15);
	a.setUtente_NomeUtente("Giuliana");
	aq.doSave(a);


%>
<%= aq.doRetrieveAllByUserName("Giuliana")%>
<% aq.doDelete(a);%>
<%= aq.doRetrieveAllByUserName("Giuliana")%>
</body>
</html>