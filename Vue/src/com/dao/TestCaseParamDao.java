package com.dao;

import java.io.StringWriter;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Marshaller;

import com.dto.TestCase;
import com.dto.TestCaseParam;

public class TestCaseParamDao {
	public int saveTestCaseParameter(TestCaseParam tc) throws SQLException, ClassNotFoundException
	{

		boolean status = false;
		Connection con=VueConnection.getCon();
		int testCaseParamID=0;
		StringWriter s = new StringWriter();
		
		try {
			
			JAXBContext jaxbcontext = JAXBContext.newInstance(TestCase.class);
			Marshaller jaxbMarshaller = jaxbcontext.createMarshaller();
			jaxbMarshaller.marshal(tc, s);
	            
            CallableStatement p = con.prepareCall("{call pICs_VueTestCaseParam(?,?)}");
            // create or replace stored procedure
            System.out.println("xml " +s.toString());
            p.setString(1, s.toString());
            //Registering the type of the OUT parameters
            p.registerOutParameter(2, Types.INTEGER);
            
            int count = p.executeUpdate();            
            testCaseParamID = p.getInt(2);
            System.out.println("result " +testCaseParamID);
            
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return testCaseParamID;
	}	

	public int deleteTestCaseParameter(TestCaseParam tc) throws SQLException, ClassNotFoundException
	{

		boolean status = false;
		Connection con=VueConnection.getCon();
		int statusOutput=0;
		StringWriter s = new StringWriter();
		
		try {
			
			JAXBContext jaxbcontext = JAXBContext.newInstance(TestCase.class);
			Marshaller jaxbMarshaller = jaxbcontext.createMarshaller();
			jaxbMarshaller.marshal(tc, s);
	            
            CallableStatement p = con.prepareCall("{call pICd_VueTestCaseParam(?,?)}");
            // create or replace stored procedure
            System.out.println("xml " +s.toString());
            p.setString(1, s.toString());
            //Registering the type of the OUT parameters
            p.registerOutParameter(2, Types.INTEGER);
            
            int count = p.executeUpdate();            
            statusOutput = p.getInt(2);
            System.out.println("result " +statusOutput);
            
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
		}
		return statusOutput;
	}	
	
	
}
