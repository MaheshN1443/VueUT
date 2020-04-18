package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.TestScenarioDao;
import com.dto.TestScenario;

/**
 * Servlet implementation class AddTestScenario
 */
@WebServlet("/addTestScenario")
public class AddTestScenario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTestScenario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		HttpSession session = request.getSession();
		
		String moduleName = request.getParameter("moduleName");
		String subModuleName = request.getParameter("subModule");
		String scenarioName = request.getParameter("scenarioName");
		String scenarioCode = request.getParameter("scenarioCode");
		String isActive = request.getParameter("isActive");
		String desc = request.getParameter("description");
		
		boolean isActiveval = (isActive == null) ? false : true;
		
		TestScenario tc = new TestScenario(0,moduleName,subModuleName,scenarioName,scenarioCode,desc,isActiveval,false,null);	
		
		TestScenarioDao dao = new TestScenarioDao();
		
		int testScenarioId = 0;
		
		try {
			testScenarioId = dao.saveTestScenario(tc);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		if (testScenarioId > 0) {
			System.out.println("Entered >>"+testScenarioId);
			List<TestScenario> testScenarioList  =  (List<TestScenario>) session.getAttribute("testScenarioList");
			session.removeAttribute("testScenarioList");
			try {
				List<TestScenario> tempTestScenarioList  = dao.getTestScenario(testScenarioId);
				if (tempTestScenarioList != null && !tempTestScenarioList.isEmpty()) {
					testScenarioList.addAll(tempTestScenarioList);
				}				
				session.setAttribute("testScenarioList", testScenarioList);
			} catch (Exception e) {
				e.printStackTrace();
			}
			RequestDispatcher rd = request.getRequestDispatcher("./editScenario?testScenarioID="+testScenarioId);
			rd.forward(request, response);
		} else {
			request.setAttribute("addStatus", "failure");
			RequestDispatcher rd = request.getRequestDispatcher("addScenario.jsp");
			rd.forward(request, response);			
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
