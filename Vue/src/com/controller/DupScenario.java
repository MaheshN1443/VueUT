package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.TestScenarioDao;

/**
 * Servlet implementation class DupScenario
 */
@WebServlet("/dupScenario")
public class DupScenario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DupScenario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String modalScenarioId = request.getParameter("modalScenarioId");
		String scenarioName = request.getParameter("scenarioName");
		String scenarioCode = request.getParameter("scenarioCode");
		String description = request.getParameter("description");
		HttpSession session = request.getSession();
		
		Integer scenarioId = Integer.parseInt(modalScenarioId);
		
		System.out.println("modalScenarioId :"+modalScenarioId+"\n"
						+ "scenarioName :"+scenarioName+"\n"
						+ "description :"+description);
		
		String userName = (String) session.getAttribute("guestName");
		TestScenarioDao d = new TestScenarioDao();
		
		int status = 0;
		try {
			status = d.dupScenario(scenarioCode,scenarioName, description, scenarioId, userName);

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error is :"+e.getMessage());
		} 
		
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		if (status == 1) {
			pw.print("success@Scenario duplicated successfully!!!");
			pw.flush();
			pw.close();
		} else if (status == 2) {
			pw.print("failure@Scenario already exists with the scenario code/name.");
			pw.flush();
			pw.close();			
		}
		else {
			pw.print("failure@Failed to duplicate scenario.");
			pw.flush();
			pw.close();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
