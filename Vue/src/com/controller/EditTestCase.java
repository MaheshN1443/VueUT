package com.controller;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.TestCaseDao;
import com.dto.TestCase;

/**
 * Servlet implementation class EditTestCase
 */
@WebServlet("/editTestCase")
public class EditTestCase extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditTestCase() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String id = request.getParameter("testCaseID");
		Integer testCaseID = Integer.parseInt(id);

		TestCaseDao caseDao = new TestCaseDao();
		try {
			List<TestCase> testCaseList = caseDao.getTestCase(testCaseID.intValue());
			TestCase testCase = testCaseList.stream().filter(p -> p.getTestCaseID() == testCaseID.intValue()).findFirst().orElse(null);
			request.setAttribute("testCase", testCase);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("editTestCase.jsp");
		rd.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
