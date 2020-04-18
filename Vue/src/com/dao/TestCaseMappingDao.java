package com.dao;

import java.io.StringWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import com.dto.TestCase;
import com.dto.TestCaseParam;

public class TestCaseMappingDao {
	
	
	public int saveTestCaseMapping(int testScenarioId ,String testCaseIDs, int groupID) throws SQLException, ClassNotFoundException
	{

		boolean status = false;
		int statusOutput = 0;
		Connection con=VueConnection.getCon();
		int testCaseParamID=0;
		StringWriter s = new StringWriter();
		
		try {
			
            CallableStatement p = con.prepareCall("{call pICs_MapTestCases(?,?,?,?)}");
            
            
            p.setInt(1, testScenarioId);
            p.setString(2, testCaseIDs);
            p.setInt(3, groupID);
            
            //Registering the type of the OUT parameters
            p.registerOutParameter(4, Types.INTEGER);
            
            int count = p.executeUpdate();            
            statusOutput = p.getInt(4);
            
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return statusOutput;
	}	

	public int deleteTestCaseMapping(int mappingId) throws SQLException, ClassNotFoundException
	{

		boolean status = false;
		Connection con=VueConnection.getCon();
		int statusOutput=0;
		StringWriter s = new StringWriter();
		
		try {
			
            CallableStatement p = con.prepareCall("{call pICd_TestCaseMapping(?)}");
            // create or replace stored procedure
            p.setInt(1, mappingId);

            
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return statusOutput;
	}	

	public List<TestCase> getMappedTestCase(int testScenarioId,int groupId) throws SQLException, ClassNotFoundException {

		Connection con=VueConnection.getCon();
        Statement stmt = null;
        ResultSet resObj = null;
        List<Integer> listId = new ArrayList<>();
        List<TestCase> testCases = new ArrayList<>();
        
        
        try {
            stmt = con.createStatement();
            resObj = null;
            StringBuffer q = new StringBuffer("");
            q.append("SELECT testCaseMappingID,testCaseName "
            		+ "FROM MDV_VueTestScenario "
            		+ "WHERE ");
            if (testScenarioId > 0) {
            	q.append(" testScenarioID="+testScenarioId+" "+ " AND occuranceGroup ="+groupId+" ");
            }
            
            q.append(" order by executionOrder");
            resObj = stmt.executeQuery(q.toString());
            while (resObj.next()) {

            	TestCase ts = new TestCase();
            	
            	int testId = resObj.getInt(1);
            	String testCaseName = resObj.getString(2);            

        		ts.setTestCaseID(testId);
        		ts.setTestCaseName(testCaseName);
            	
        		testCases.add(ts);
        	
            }
        		
        } catch (Exception e) {
            e.printStackTrace();
        }
		return testCases;
        
	}	

	public List<TestCaseParam> getParamListByMapp(int mappingId) throws SQLException, ClassNotFoundException {

		Connection con=VueConnection.getCon();
		
        ResultSet resObj = null;
        List<Integer> listId = new ArrayList<>();
        List<TestCaseParam> testCaseParams = new ArrayList<>();
        int status =0;
        
		try {
			
            CallableStatement p = con.prepareCall("{call pICg_GetParamListByMapp(?)}");
            p.setInt(1, mappingId);
            
            resObj = p.executeQuery();
            while (resObj.next()) {

            	TestCaseParam ts = new TestCaseParam();
            	
            	int testCaseId = resObj.getInt(1);
            	String testCaseName = resObj.getString(2);            
            	int testCaseParamId = resObj.getInt(3);
            	String ParamName = resObj.getString(4);            
            	String ParamVal = resObj.getString(5);    
            	String overrideParamVal = resObj.getString(6);    

            	
        		ts.setTestCaseID(testCaseId);
        		ts.setParamName(ParamName);
        		ts.setParamValue(ParamVal);
        		ts.setTestCaseParamID(testCaseParamId);
            	ts.setOverrideValue(overrideParamVal);
        		
        		testCaseParams.add(ts);
        	
            }
        		
        } catch (Exception e) {
            e.printStackTrace();
        }
		return testCaseParams;
	}	
	
	
	
	
	public int saveMappingOrder(int testScenarioId ,String testCaseIDs, int groupID) throws SQLException, ClassNotFoundException {

		Connection con=VueConnection.getCon();
        Statement stmt = null;
        ResultSet resObj = null;
        List<Integer> listId = new ArrayList<>();
        List<TestCase> testCases = new ArrayList<>();
        int statusOutput=0;
        
		try {
			
            CallableStatement p = con.prepareCall("{call pICs_ChangeExecutionOrder(?,?,?,?)}");
            
            
            p.setInt(1, testScenarioId);
            p.setString(2, testCaseIDs);
            p.setInt(3, groupID);
            
            //Registering the type of the OUT parameters
            p.registerOutParameter(4, Types.INTEGER);
            
            int count = p.executeUpdate();            
            statusOutput = p.getInt(4);
            
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return statusOutput;
        
	}	

	public int saveOverrideParamValues(int mappingId ,String jsonData) throws SQLException, ClassNotFoundException {

		Connection con=VueConnection.getCon();
        Statement stmt = null;

        int statusOutput=0;
        
		try {
			
            CallableStatement p = con.prepareCall("{call pICs_OverrideParamValues(?,?,?)}");
            
            
            p.setInt(1, mappingId);
            p.setString(2, jsonData);
            
            //Registering the type of the OUT parameters
            p.registerOutParameter(3, Types.INTEGER);
            
            int count = p.executeUpdate();            
            statusOutput = p.getInt(3);
            
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return statusOutput;
        
	}	
	
	
	
}
