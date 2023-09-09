package com.servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;



@WebServlet("/save_notes")
public class SaveNotes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Note note = new Note(title,content,new Date());
		// now lets save this object in the hibernate;
		// We have to first open session;
		Session session = FactoryProvider.getFactory().openSession();
		Transaction tx = session.beginTransaction();
		session.persist(note);
		tx.commit();
		session.close();
		HttpSession session1 = request.getSession();
		session1.setAttribute("succMsg","Note Added Successfully");
		response.sendRedirect("add_notes.jsp");
	}

}
