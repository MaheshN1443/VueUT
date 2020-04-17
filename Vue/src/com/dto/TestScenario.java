package com.dto;

import java.util.ArrayList;

public class TestScenario {

	private int testScenarioID;
	private String moduleName;
	private String subModuleName;
	private String scenarioName;
	private String scenarioCode;
	private String description;
	private boolean isActive;
	private boolean isMultipleStepsReq;
	
	private ArrayList<TestScenarioMapping>mapping;

	public TestScenario() {
		
	}
	
	public TestScenario(int testScenarioID, String moduleName, String subModuleName, String scenarioName,
			String scenarioCode, String description, boolean isActive, boolean isMultipleStepsReq,
			ArrayList<TestScenarioMapping> mapping) {
		super();
		this.testScenarioID = testScenarioID;
		this.moduleName = moduleName;
		this.subModuleName = subModuleName;
		this.scenarioName = scenarioName;
		this.scenarioCode = scenarioCode;
		this.description = description;
		this.isActive = isActive;
		this.isMultipleStepsReq = isMultipleStepsReq;
		this.mapping = mapping;
	}

	public int getTestScenarioID() {
		return testScenarioID;
	}

	public void setTestScenarioID(int testScenarioID) {
		this.testScenarioID = testScenarioID;
	}

	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

	public String getSubModuleName() {
		return subModuleName;
	}

	public void setSubModuleName(String subModuleName) {
		this.subModuleName = subModuleName;
	}

	public String getScenarioName() {
		return scenarioName;
	}

	public void setScenarioName(String scenarioName) {
		this.scenarioName = scenarioName;
	}

	public String getScenarioCode() {
		return scenarioCode;
	}

	public void setScenarioCode(String scenarioCode) {
		this.scenarioCode = scenarioCode;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean isActive() {
		return isActive;
	}

	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}

	public ArrayList<TestScenarioMapping> getMapping() {
		return mapping;
	}

	public void setMapping(ArrayList<TestScenarioMapping> mapping) {
		this.mapping = mapping;
	}

	public boolean isMultipleStepsReq() {
		return isMultipleStepsReq;
	}	
	
	public void setMultipleStepsReq(boolean isMultipleStepsReq) {
		// TODO Auto-generated method stub
		this.isMultipleStepsReq = isMultipleStepsReq;
	}

	
	
	
}
