package com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.TestCaseMappingDao;
import com.dto.TestCase;
import com.dto.TestCaseParam;

/**
 * Servlet implementation class EditOverrideParam
 */
@WebServlet("/editOverrideParam")
public class EditOverrideParam extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditOverrideParam() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mappingId = request.getParameter("mappingId");
	
		Integer id = Integer.parseInt(mappingId);
		
		TestCaseMappingDao ts = new TestCaseMappingDao();
		
		List<TestCaseParam> testCaseParams = new ArrayList<>();
		
		try {
			testCaseParams =ts.getParamListByMapp(id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("mappingId", mappingId);
		request.setAttribute("testCaseParams", testCaseParams);
		RequestDispatcher dispatcher = request.getRequestDispatcher("changeOverrideParams.jsp");
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
