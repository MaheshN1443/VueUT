package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.TestCaseMappingDao;

/**
 * Servlet implementation class SaveOverrideParams
 */
@WebServlet("/saveOverrideParams")
public class SaveOverrideParams extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveOverrideParams() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mappingId = request.getParameter("mappingId");
		String jsonData = request.getParameter("jsonData");

		int result = 0;
		Integer mappId = Integer.parseInt(mappingId);
		
		TestCaseMappingDao dao = new TestCaseMappingDao();
		
		try {
			result = dao.saveOverrideParamValues(mappId, jsonData);
			System.out.println(" result : "+result);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		if (result > 0) {
			pw.print("success@Test Cases mapped successfully.");
		} else {
			pw.print("failure@Failed to map Test Cases.");
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
