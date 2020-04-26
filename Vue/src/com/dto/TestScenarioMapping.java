package com.dto;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class TestScenarioMapping {

	private int testScenarioMappingID;	
	private int testScenarioID;
	private int testCaseID;
	private String overrideParamName;
	private String overrideParamVal;
	private String overrideVal;
	private String expressionParamList;
	private int executionOrder;
	private int occuranceGroup;
	
	public TestScenarioMapping() {
		
	}
	
	public TestScenarioMapping(int testScenarioMappingID, int testScenarioID, int testCaseID, String overrideParamName,
			String overrideParamVal, String overrideVal, String expressionParamList, int executionOrder, int occuranceGroup) {
		super();
		this.testScenarioMappingID = testScenarioMappingID;
		this.testScenarioID = testScenarioID;
		this.testCaseID = testCaseID;
		this.overrideParamName = overrideParamName;
		this.overrideParamVal = overrideParamVal;
		this.overrideVal = overrideVal;
		this.expressionParamList = expressionParamList;
		this.executionOrder = executionOrder;
		this.occuranceGroup = occuranceGroup;
	}
	
	@XmlElement
	public int getTestScenarioMappingID() {
		return testScenarioMappingID;
	}
	public void setTestScenarioMappingID(int testScenarioMappingID) {
		this.testScenarioMappingID = testScenarioMappingID;
	}
	
	@XmlElement
	public int getTestScenarioID() {
		return testScenarioID;
	}
	public void setTestScenarioID(int testScenarioID) {
		this.testScenarioID = testScenarioID;
	}
	
	@XmlElement
	public int getTestCaseID() {
		return testCaseID;
	}
	public void setTestCaseID(int testCaseID) {
		this.testCaseID = testCaseID;
	}
	
	@XmlElement
	public String getOverrideParamName() {
		return overrideParamName;
	}
	public void setOverrideParamName(String overrideParamName) {
		this.overrideParamName = overrideParamName;
	}
	
	@XmlElement
	public String getOverrideParamVal() {
		return overrideParamVal;
	}
	public void setOverrideParamVal(String overrideParamVal) {
		this.overrideParamVal = overrideParamVal;
	}
	
	@XmlElement
	public String getOverrideVal() {
		return overrideVal;
	}
	public void setOverrideVal(String overrideVal) {
		this.overrideVal = overrideVal;
	}
	
	@XmlElement
	public String getExpressionParamList() {
		return expressionParamList;
	}
	public void setExpressionParamList(String expressionParamList) {
		this.expressionParamList = expressionParamList;
	}
	
	@XmlElement
	public int getExecutionOrder() {
		return executionOrder;
	}
	public void setExecutionOrder(int executionOrder) {
		this.executionOrder = executionOrder;
	}
	
	@XmlElement
	public int getOccuranceGroup() {
		return occuranceGroup;
	}
	public void setOccuranceGroup(int occuranceGroup) {
		this.occuranceGroup = occuranceGroup;
	}
	
	@Override
	public String toString() {
		return "TestScenarioMapping [testScenarioMappingID=" + testScenarioMappingID + ", testScenarioID="
				+ testScenarioID + ", testCaseID=" + testCaseID + ", overrideParamName=" + overrideParamName
				+ ", overrideParamVal=" + overrideParamVal + ", overrideVal=" + overrideVal + ", expressionParamList="
				+ expressionParamList + ", executionOrder=" + executionOrder + ", occuranceGroup=" + occuranceGroup
				+ "]";
	}
	
}
