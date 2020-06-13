package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.TestCaseDao;
import com.dao.TestScenarioDao;

/**
 * Servlet implementation class ExecuteTestCase
 */
@WebServlet("/executeTestCase")
public class ExecuteTestCase extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExecuteTestCase() {
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
		TestCaseDao d = new TestCaseDao();
		
		int status = 0;
		try {
			status = d.executeTestCase(jsonData, userName);
			System.out.println(">>> Execute Test Case status is :"+status+" <<<<");
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

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
