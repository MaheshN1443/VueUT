package com.dto;

import java.util.ArrayList;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class TestCase {
	private int testCaseID;
	private String moduleName;
	private String testCaseName;
	private String procName;
	private boolean isActive;
	private int entityTypeID;
	private ArrayList<TestCaseParam>params;
	
	public TestCase() {
	}
	
	public TestCase(int testCaseID, String moduleName, String testCaseName, String procName,
			boolean isActive,int entityTypeID,ArrayList<TestCaseParam> params) {
		super();
		this.testCaseID = testCaseID;
		this.moduleName = moduleName;
		this.testCaseName = testCaseName;
		this.procName = procName;
		this.isActive = isActive;
		this.entityTypeID = entityTypeID;
		this.params = params;
	}
	@XmlElement
	public int getTestCaseID() {
		return testCaseID;
	}

	public void setTestCaseID(int testCaseID) {
		this.testCaseID = testCaseID;
	}
	@XmlElement
	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}
	@XmlElement
	public String getTestCaseName() {
		return testCaseName;
	}

	public void setTestCaseName(String testCaseName) {
		this.testCaseName = testCaseName;
	}
	@XmlElement
	public String getProcName() {
		return procName;
	}

	public void setProcName(String procName) {
		this.procName = procName;
	}
	@XmlElement
	public boolean isActive() {
		return isActive;
	}

	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}
	@XmlElement
	public int getEntityTypeID() {
		return entityTypeID;
	}

	public void setEntityTypeID(int entityTypeID) {
		this.entityTypeID = entityTypeID;
	}
	
	@XmlElement	
	public ArrayList<TestCaseParam> getParams() {
		return params;
	}
	public void setParams(ArrayList<TestCaseParam> params) {
		this.params = params;
	}

	@Override
	public String toString() {
		return "TestCase [testCaseID=" + testCaseID + ", moduleName=" + moduleName + ", testCaseName=" + testCaseName
				+ ", procName=" + procName + ", isActive=" + isActive + ", entityTypeID=" + entityTypeID + ", params="
				+ params + "]";
	}
	
}
