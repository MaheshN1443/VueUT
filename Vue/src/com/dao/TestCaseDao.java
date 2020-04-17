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


public class TestCaseDao {

	public List<TestCase> getTestCase(int testCaseId) throws SQLException, ClassNotFoundException {
		List<TestCase> list = new ArrayList<TestCase>();

		Connection con=VueConnection.getCon();
        Statement stmt = null;
        ResultSet resObj = null;
        List<Integer> listId = new ArrayList<>();
        ArrayList<TestCaseParam> params = new ArrayList<>();
        List<TestCase> testCases = new ArrayList<>();
        		
        try {
            stmt = con.createStatement();
            resObj = null;
            StringBuffer q = new StringBuffer("");
            q.append("SELECT testCaseID, moduleName, testCaseName, procName, isAcTive, "
            		                 + "entityTypeID, testCaseParamID, paramType, paramName, paramValue, "
            		                 + "valueType FROM MDV_VueTestCase ");
            if (testCaseId > 0) {
            	q.append(" where testCaseID="+testCaseId+" ");
            }
            
            q.append(" order by testCaseID");
            resObj = stmt.executeQuery(q.toString());
            while (resObj.next()) {

            	int testId = resObj.getInt(1);
            	String moduleName = resObj.getString(2);
            	String testCaseName = resObj.getString(3);
            	String procName = resObj.getString(4);
            	boolean isActive = resObj.getBoolean(5);
            	int entityId = resObj.getInt(6);
            	int testCaseParamId = resObj.getInt(7);
            	String paramType = resObj.getString(8);
            	String paramName = resObj.getString(9);
            	String paramValue = resObj.getString(10);
            	String valueType = resObj.getString(11);
            	Integer id = new Integer(testId);
            	
            	TestCaseParam caseParam = new TestCaseParam(testCaseParamId, testId, paramName, paramValue, paramType, valueType);
            	
            	if (listId != null && !listId.contains(id)) {
            		TestCase tCase = new TestCase();
            		params = new ArrayList<>();
            		
            		tCase.setTestCaseID(testId);
            		tCase.setTestCaseName(testCaseName);
            		tCase.setProcName(procName);
            		tCase.setModuleName(moduleName);
            		tCase.setEntityTypeID(entityId);
            		tCase.setActive(isActive);
            		tCase.setParams(params);
            		
            		testCases.add(tCase);
            		
            		listId.add(id);
            	}
            	
            	params.add(caseParam);
            	
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
		return testCases;
	}	
	
	public int callSpTestCase(TestCase tc) throws SQLException, ClassNotFoundException
	{

		boolean status = false;
		Connection con=VueConnection.getCon();
		int testCaseID=0;
		StringWriter s = new StringWriter();
		
		try {
			
			JAXBContext jaxbcontext = JAXBContext.newInstance(TestCase.class);
			Marshaller jaxbMarshaller = jaxbcontext.createMarshaller();
			jaxbMarshaller.marshal(tc, s);
	
            Statement stmt = con.createStatement();
            
            CallableStatement p = con.prepareCall("{call pICs_VueTestCase(?,?)}");
           // create or replace stored procedure

            p.setString(1, s.toString());
            //Registering the type of the OUT parameters
            p.registerOutParameter(2, Types.INTEGER);
            p.executeUpdate();
            
            testCaseID = p.getInt(2);
            
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return testCaseID;
	}	
	
	
}