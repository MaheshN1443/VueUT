package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.TestCaseMappingDao;
import com.util.Util;

/**
 * Servlet implementation class DeleteMapping
 */
@WebServlet("/deleteMapping")
public class DeleteMapping extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMapping() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String guestName = (String) session.getAttribute("guestName");
		
		if (guestName == null || guestName.trim().equals("")) {
			Util.callSessionExpiredPage(request, response);
		}
		
		String mappingid = request.getParameter("mappingId");
		
		Integer mapid = Integer.parseInt(mappingid);
		int result= 0;
		TestCaseMappingDao dao = new TestCaseMappingDao();
		
		try {
			result =dao.deleteTestCaseMapping(mapid);		
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 

		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		if (result > 0) {
			pw.print("success@Parameter deleted successfully.");
		} else {
			pw.print("failure@Failed to delete parameter.");
		}
		pw.flush();
		pw.close();
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
