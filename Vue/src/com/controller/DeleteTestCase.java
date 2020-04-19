package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.TestCaseDao;
import com.dao.TestScenarioDao;

/**
 * Servlet implementation class DeleteTestCase
 */
@WebServlet("/deleteTestCase")
public class DeleteTestCase extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteTestCase() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String testCaseId = request.getParameter("testCaseId");
		Integer id = Integer.parseInt(testCaseId);
		int result= 0;
		TestCaseDao dao = new TestCaseDao();
		
		try {
			result =dao.deleteTestCase(id);
			System.out.println("Test Case Id >>"+testCaseId);
			System.out.println("Delete Test Case Result >>"+result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 

		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		if (result > 0) {
			pw.print("success@Test Case deleted successfully.");
		} else {
			pw.print("failure@Failed to delete Test Case.");
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
