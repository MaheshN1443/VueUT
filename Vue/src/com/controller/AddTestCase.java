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

import com.dao.TestCaseDao;
import com.dto.TestCase;
import com.util.Util;

/**
 * Servlet implementation class AddTestCase
 */
@WebServlet("/addTestCase")
public class AddTestCase extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTestCase() {
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
		
		String testCaseName = request.getParameter("testCaseName");
		String moduleName = request.getParameter("moduleName");
		String procName = request.getParameter("procName");
		String isActive = request.getParameter("isActive");
		
		boolean isActiveval = (isActive == null) ? false : true;
		
		TestCase tc = new TestCase(0,moduleName,testCaseName,procName,isActiveval,0,null);	
		
		TestCaseDao dao = new TestCaseDao();
		
		int testCaseId = 0;
		
		try {
			testCaseId = dao.callSpTestCase(tc);
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		if (testCaseId > 0) {
			List<TestCase> testCaseList  =  (List<TestCase>) session.getAttribute("testCaseList");
			session.removeAttribute("testCaseList");
			try {
				List<TestCase> tempTestCaseList  = dao.getTestCase(testCaseId);
				if (tempTestCaseList != null && !tempTestCaseList.isEmpty()) {
					testCaseList.addAll(tempTestCaseList);
				}				
				session.setAttribute("testCaseList", testCaseList);
			} catch (Exception e) {
				e.printStackTrace();
			}
			RequestDispatcher rd = request.getRequestDispatcher("./editTestCase?testCaseID="+testCaseId);
			rd.forward(request, response);
		} else {
			request.setAttribute("addStatus", "failure");
			RequestDispatcher rd = request.getRequestDispatcher("addTestCase.jsp");
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
