package com.servlets;

import java.io.IOException;

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


@WebServlet("/delete_notes")
public class DeleteNotes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		Session session = FactoryProvider.getFactory().openSession();
		Transaction tx = session.beginTransaction();
		Note note = (Note) session.get(Note.class, id);
		session.remove(note);
		tx.commit();
		session.close();
		HttpSession sess = request.getSession();
		if(note == null)
			sess.setAttribute("errorMsg", "Something wrong on server");
		else 
			sess.setAttribute("succMsg","Note Deleted Successfully");
		
		response.sendRedirect("show_notes.jsp");
		
	}

}
