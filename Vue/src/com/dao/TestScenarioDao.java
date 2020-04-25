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

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;

import com.dto.TestCase;
import com.dto.TestCaseParam;
import com.dto.TestScenario;
import com.dto.TestScenarioMapping;

public class TestScenarioDao {

	public List<TestScenario> getTestScenario(int testScenarId) throws SQLException, ClassNotFoundException {
		List<TestScenario> list = new ArrayList<TestScenario>();

		Connection con=VueConnection.getCon();
        Statement stmt = null;
        ResultSet resObj = null;
        List<Integer> listId = new ArrayList<>();
        ArrayList<TestScenarioMapping> mapping = new ArrayList<>();
        List<TestScenario> testScenario = new ArrayList<>();
        		
        try {
            stmt = con.createStatement();
            resObj = null;
            StringBuffer q = new StringBuffer("");
            
            q.append("SELECT testScenarioID, moduleName, scenarioName, isActive, subModuleName, scenarioCode, "
            		+ "description, isMultipleStepsReq, testCaseMappingID, testCaseID, executionOrder, overrideVal"
            		+ ", overrideParamName, overrideParamVal"
            		+ ", expressionParamList,occuranceGroup FROM MDV_VueTestScenario ");

            if (testScenarId > 0) {
            	q.append(" where testScenarioID="+testScenarId+" ");
            }
            
            q.append(" order by testScenarioID ,occuranceGroup,executionOrder");
            resObj = stmt.executeQuery(q.toString());
            
            
            while (resObj.next()) {

            	//scenario
            	int testScenarioId = resObj.getInt(1);
            	String moduleName = resObj.getString(2);
            	String scenarioName = resObj.getString(3);
            	boolean isActive = resObj.getBoolean(4);
            	String subModuleName = resObj.getString(5);
            	String scenarioCode = resObj.getString(6);
            	String description = resObj.getString(7);
            	boolean isMultipleStepsReq = resObj.getBoolean(8);
            	// mapping
            	int testCaseMappingID = resObj.getInt(9);
            	int testCaseID = resObj.getInt(10);
            	int executionOrder = resObj.getInt(11);
            	String overrideVal = resObj.getString(12);
            	String overrideParamName = resObj.getString(13);
            	String overrideParamVal = resObj.getString(14);
            	String expressionParamList = resObj.getString(15);
            	int occuranceGroup = resObj.getInt(16);
            	
            	Integer id = new Integer(testScenarioId);
            	
            	TestScenarioMapping map = new TestScenarioMapping(testCaseMappingID, testScenarioId, testCaseID, overrideParamName, overrideParamVal, overrideVal,expressionParamList,executionOrder, occuranceGroup);
            	
            	if (listId != null && !listId.contains(id)) {
            		TestScenario ts = new TestScenario();
            		mapping = new ArrayList<>();
            		
            		ts.setActive(isActive);
            		ts.setDescription(description);
            		ts.setMapping(mapping);
            		ts.setModuleName(moduleName);
            		ts.setSubModuleName(subModuleName);
            		ts.setMultipleStepsReq(isMultipleStepsReq);
            		ts.setScenarioCode(scenarioCode);
            		ts.setScenarioName(scenarioName);
            		ts.setTestScenarioID(testScenarioId);
            	
            		testScenario.add(ts);
            		
            		listId.add(id);
            	}
            	
            	mapping.add(map);
            	
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
		return testScenario;
	}	

	public int deleteTestScenario(int scenarioId) throws SQLException, ClassNotFoundException
	{

		boolean status = false;
		Connection con=VueConnection.getCon();
		int statusOutput=0;
		StringWriter s = new StringWriter();
		
		try {
			
            CallableStatement p = con.prepareCall("{call pICd_TestScenario(?,?)}");
            // create or replace stored procedure
            p.setInt(1, scenarioId);
            
            p.registerOutParameter(2, Types.INTEGER);
            p.executeUpdate();
            statusOutput = p.getInt(2);
            
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return statusOutput;
	}	
	
	
	public int executeTestScenario(String scenarioIDs,String userName) throws SQLException, ClassNotFoundException
	{

		boolean status = false;
		Connection con=VueConnection.getCon();
		int statusOutput=0;
		StringWriter s = new StringWriter();
		
		try {
			
            CallableStatement p = con.prepareCall("{call USP_UT_CreateExecScenarioJob(?,?,?)}");
            // create or replace stored procedure
            p.setString(1, scenarioIDs);
            p.setString(2, userName);
            
            p.registerOutParameter(3, Types.INTEGER);
            p.executeUpdate();
            statusOutput = p.getInt(3);
            
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return statusOutput;
	}		
	
	
	public int saveTestScenario(TestScenario ts) throws SQLException, ClassNotFoundException
	{

		boolean status = false;
		Connection con=VueConnection.getCon();
		int testScenarioID=0;
		StringWriter s = new StringWriter();
		
		try {
			
			JAXBContext jaxbcontext = JAXBContext.newInstance(TestScenario.class);
			Marshaller jaxbMarshaller = jaxbcontext.createMarshaller();
			jaxbMarshaller.marshal(ts, s);
	
            Statement stmt = con.createStatement();
            
            CallableStatement p = con.prepareCall("{call pICs_VueTestScenario(?,?)}");
           // create or replace stored procedure

            p.setString(1, s.toString());
            //Registering the type of the OUT parameters
            p.registerOutParameter(2, Types.INTEGER);
            p.executeUpdate();
            
            testScenarioID = p.getInt(2);
            
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return testScenarioID;
	}	
	
	
	
}
