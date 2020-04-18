package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.TestCaseParamDao;
import com.dto.TestCaseParam;

/**
 * Servlet implementation class DeleteTestCaseParam
 */
@WebServlet("/deleteTestCaseParam")
public class DeleteTestCaseParam extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteTestCaseParam() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		String testCaseId = request.getParameter("testCaseId");
		String testCaseParamId = request.getParameter("testCaseParamId");
		String paramName = request.getParameter("paramName");
		String paramValue = request.getParameter("paramValue");
		
		paramValue = (paramValue != null) ? paramValue.trim() : paramValue;
		
		String direction = request.getParameter("direction");
		String valType = request.getParameter("valType");
		int paramID = 0;
		int testCaseID =0;
		int result = 0;
		
		testCaseParamId = (testCaseParamId != null && testCaseParamId.trim().equalsIgnoreCase("--")) ? "0" : testCaseParamId;
		
		if (testCaseParamId != null && testCaseParamId !="") {
			paramID= Integer.parseInt(testCaseParamId);
		}
		
		if (testCaseId != null && testCaseId !="") {
			testCaseID= Integer.parseInt(testCaseId);
		}		
		
		TestCaseParam param = new TestCaseParam(paramID,testCaseID,paramName,paramValue,direction,valType,null);
		
		TestCaseParamDao p = new TestCaseParamDao();
		try {
			result = p.deleteTestCaseParameter(param);
			
			System.out.println(" result : "+result);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		if (result > 0) {
			pw.print("success@Parameter deleted successfully.");
		} else {
			pw.print("failure@Failed to delete parameter.");
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
