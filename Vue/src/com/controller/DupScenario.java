package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		String description = request.getParameter("description");
		
		Integer scenarioId = Integer.parseInt(modalScenarioId);
		
		System.out.println("modalScenarioId :"+modalScenarioId+"\n"
						+ "scenarioName :"+scenarioName+"\n"
						+ "description :"+description);
		
		int status = 1;
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		if (status > 0) {
			pw.print("success@Scenario duplicated successfully !!!");
		} else {
			pw.print("failure@Failed to duplicate scenario.");
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
