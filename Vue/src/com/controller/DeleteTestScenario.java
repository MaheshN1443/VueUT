package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.TestScenarioDao;

/**
 * Servlet implementation class DeleteTestScenario
 */
@WebServlet("/deleteTestScenario")
public class DeleteTestScenario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteTestScenario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String scenarioId = request.getParameter("scenarioId");
		Integer id = Integer.parseInt(scenarioId);
		int result= 0;
		TestScenarioDao dao = new TestScenarioDao();
		
		try {
			result =dao.deleteTestScenario(id);		
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 

		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		if (result > 0) {
			pw.print("success@Scenario deleted successfully.");
		} else {
			pw.print("failure@Failed to delete Scenario.");
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
