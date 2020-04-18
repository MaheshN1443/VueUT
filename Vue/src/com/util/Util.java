package com.util;

import java.util.List;

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
}
