package com.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.TestCaseDao;
import com.dao.TestCaseMappingDao;
import com.dto.TestCase;
import com.util.Util;

/**
 * Servlet implementation class ChangeOrder
 */
@WebServlet("/changeOrder")
public class ChangeOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangeOrder() {
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
		
		String testScenarioID = request.getParameter("testScenarioId");
		String groupId = request.getParameter("groupId");
		
		Integer group = Integer.parseInt(groupId);
		Integer id = Integer.parseInt(testScenarioID);
		
		TestCaseMappingDao ts = new TestCaseMappingDao();
		
		List<TestCase> testCases = new ArrayList<>();
		
		try {
			testCases =ts.getMappedTestCase(id, group);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("groupIdParam", groupId);
		request.setAttribute("testCases", testCases);
		RequestDispatcher dispatcher = request.getRequestDispatcher("changeOrderModal.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
