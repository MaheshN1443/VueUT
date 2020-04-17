package com.dto;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class TestCaseParam {
	
	private int testCaseParamID;
	private int testCaseID;
	private String paramName;
	private String paramValue;
	private String paramType;
	private String valueType;
	
	public TestCaseParam() {
		
	}
	public TestCaseParam(int testCaseParamID, int testCaseID, String paramName, String paramValue, String paramType,
			String valueType) {
		super();
		this.testCaseParamID = testCaseParamID;
		this.testCaseID = testCaseID;
		this.paramName = paramName;
		this.paramValue = paramValue;
		this.paramType = paramType;
		this.valueType = valueType;
	}
	
	@XmlElement
	public int getTestCaseParamID() {
		return testCaseParamID;
	}

	public void setTestCaseParamID(int testCaseParamID) {
		this.testCaseParamID = testCaseParamID;
	}
	@XmlElement
	public int getTestCaseID() {
		return testCaseID;
	}

	public void setTestCaseID(int testCaseID) {
		this.testCaseID = testCaseID;
	}
	@XmlElement
	public String getParamName() {
		return paramName;
	}

	public void setParamName(String paramName) {
		this.paramName = paramName;
	}
	@XmlElement
	public String getParamValue() {
		return paramValue;
	}

	public void setParamValue(String paramValue) {
		this.paramValue = paramValue;
	}
	@XmlElement
	public String getParamType() {
		return paramType;
	}

	public void setParamType(String paramType) {
		this.paramType = paramType;
	}
	@XmlElement
	public String getValueType() {
		return valueType;
	}

	public void setValueType(String valueType) {
		this.valueType = valueType;
	}

	@Override
	public String toString() {
		return "TestCaseParam [testCaseParamID=" + testCaseParamID + ", testCaseID=" + testCaseID + ", paramName="
				+ paramName + ", paramValue=" + paramValue + ", paramType=" + paramType + ", valueType=" + valueType
				+ "]";
	}
	
}
