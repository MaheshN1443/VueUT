package com.controller;

import java.io.IOException;
import java.util.Collections;
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
import com.util.Util;

/**
 * Servlet implementation class GetScenario
 */
@WebServlet("/testScenario")
public class GetScenario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetScenario() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		TestScenarioDao testScenario = new TestScenarioDao();
		
		HttpSession session = request.getSession();
		String guestName = (String) session.getAttribute("guestName");
		
		if (guestName == null || guestName.trim().equals("")) {
			Util.callSessionExpiredPage(request, response);
		}
		
		try {
			List<TestScenario> testScenarioList  = testScenario.getTestScenario(0);
			session.setAttribute("testScenarioList", testScenarioList);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		RequestDispatcher rd = request.getRequestDispatcher("scenario.jsp");
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
