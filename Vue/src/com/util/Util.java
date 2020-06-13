package com.util;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dto.TestCase;

public class Util {

	/**
	 * Method getTCObjByMatchId()
	 */
	public static TestCase getTCObjByMatchId(List<TestCase> tcList, int tcId) {
		return (tcList != null && !tcList.isEmpty()) ? (TestCase) tcList.stream()
															 			.filter(p -> p.getTestCaseID() == tcId)
															 			.findFirst()
															 			.orElse(null)
													 : null;
	}
	
	public static String convertXMLData(String data) {
		if (data != null && data.contains("<Root>")) {
			return "<xmp>"+data+"</xmp>";
		}
		return data;
	}
	
	public static String getReportUrl(String urlQueryParams, String reportName, String format) {
		String url = PropertiesUtil.reportsServerUrl+"?/"+PropertiesUtil.reportsFolderPath+"/"+reportName+""
					+ "&rs:ClearSession=true&rs:Command=Render&rs:Format="+format;
		if (urlQueryParams != null && !urlQueryParams.trim().equals("")) {
			url = url+"&"+urlQueryParams;
		}
		return url;
	}
	
	public static void callSessionExpiredPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rs = request.getRequestDispatcher("sessionExpired.jsp");
		rs.forward(request, response);
	}
	
	public static int convertStrToInt(String data) {
		Integer temp = 0;
		try {
			temp = Integer.parseInt(data);
		} catch (Exception e) {
			temp = 0;
		}
		return temp.intValue();
	}
}
