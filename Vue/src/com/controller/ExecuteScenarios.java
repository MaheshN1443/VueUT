package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.TestScenarioDao;

/**
 * Servlet implementation class ExecuteScenarios
 */
@WebServlet("/executeScenarios")
public class ExecuteScenarios extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExecuteScenarios() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String jsonData = request.getParameter("jsonData");
		HttpSession session = request.getSession(); 
		
		String userName = (String) session.getAttribute("guestName");
		TestScenarioDao d = new TestScenarioDao();
		
		int status = 0;
		try {
			status = d.executeTestScenario(jsonData, userName);
			System.out.println(">>> Execute Scenario status is :"+status+" <<<<");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Error is :"+e.getMessage());
		} 
		
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		if (status > 0) {
			pw.print("success@Job submitted successfully !!!");
			pw.flush();
			pw.close();
		} else {
			pw.print("failure@Failed to submitted Job.");
			pw.flush();
			pw.close();
		}
		//RequestDispatcher rd = request.getRequestDispatcher("scenario.jsp");
		//rd.forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
