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
import com.dao.TestScenarioDao;
import com.dto.TestCase;
import com.dto.TestScenario;

/**
 * Servlet implementation class EditScenario
 */
@WebServlet("/editScenario")
public class EditScenario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditScenario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String id = request.getParameter("testScenarioID");
		Integer testScenarioID = Integer.parseInt(id);

		TestScenarioDao caseDao = new TestScenarioDao();
		try {
			List<TestScenario> testScenarioList = caseDao.getTestScenario(testScenarioID.intValue());
			TestScenario testScenario = testScenarioList.stream().filter(p -> p.getTestScenarioID() == testScenarioID.intValue()).findFirst().orElse(null);
			request.setAttribute("testScenario", testScenario);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("editScenario.jsp");
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
