package com.controller;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.TestCaseDao;
import com.dto.TestCase;
import com.dto.TestCaseParam;

/**
 * Servlet implementation class GetTestCase
 */
@WebServlet("/testCase")
public class GetTestCase extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetTestCase() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		TestCaseDao testCase = new TestCaseDao();
		
		HttpSession session = request.getSession();
		
		try {
			List<TestCase> testCaseList  = testCase.getTestCase(0);
			session.setAttribute("testCaseList", testCaseList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		RequestDispatcher rd = request.getRequestDispatcher("testCase.jsp");
		rd.forward(request, response);
		
		
		/*		
		response.getWriter().append("Served at: ").append(request.getContextPath());

		List<TestCase> list = new ArrayList<TestCase>();		
		VueConnection d = new VueConnection();
		
		String testCaseName = request.getParameter("testCaseName");
		String moduleName = request.getParameter("moduleName");
		String procName = request.getParameter("procName");
		boolean isActive = request.getParameter("isActive") != null;
		String entityTypeID = request.getParameter("entityTypeID");
		int typeID = 0;
		
		if(entityTypeID != null && !entityTypeID.trim().equals("")){
			Integer id = Integer.parseInt(entityTypeID);
			typeID = id.intValue();
			
		}
		
		if (testCaseName!=null && moduleName !=null )
		{
			TestCase e  = new TestCase(0, testCaseName,moduleName,procName,isActive,typeID);
			boolean status = d.saveTestCase(e);
			if (!status) {
				request.setAttribute("errorMessage", "Employee record not saved.");
			} else {
				request.setAttribute("errorMessage", "Employee records added successfully.");
			}
		}
		try {
			request.setAttribute("list", d.getTestCase());
		} catch (Exception ee) {
			ee.printStackTrace();
		}
		RequestDispatcher rd = request.getRequestDispatcher("Sample.jsp");
		rd.forward(request, response);
		
*/		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	

}
