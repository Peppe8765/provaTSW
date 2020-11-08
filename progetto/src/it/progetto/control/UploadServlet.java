package it.progetto.control;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.progetto.model.UtenteBean;


@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UploadServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
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
			
			
			
			
			
		}
		
		RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/ProvaUpload.html");
    	dispatcher.forward(request, response);
	}
}


