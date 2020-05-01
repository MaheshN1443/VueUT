package com.controller;
import java.io.File;
import java.io.IOException;
import java.io.StringWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;

import com.dao.TestCaseDao;
import com.dao.TestScenarioDao;
import com.dto.TestCase;
import com.dto.TestScenario;
import com.google.gson.Gson;
import com.util.ReadExcel;
import com.util.Util;
@WebServlet("/UploadServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)   // 50MB
public class UploadServlet extends HttpServlet {
    /**
     * Name of the directory where uploaded files will be saved, relative to
     * the web application directory.
     */
    private static final String SAVE_DIR = "uploadFiles";
     
    /**
     * handles file upload
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	HttpSession session = request.getSession();
		String guestName = (String) session.getAttribute("guestName");
		
		int status = 0;
		
		if (guestName == null || guestName.trim().equals("")) {
			Util.callSessionExpiredPage(request, response);
		}

    	// gets absolute path of the web application
        String appPath = request.getServletContext().getRealPath("");
        // constructs path of the directory to save uploaded file
        String savePath = appPath + File.separator + SAVE_DIR;
         
        // creates the save directory if it does not exists
        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }
        
        String filePath = "";
        String tempFileName = "";
        
        for (Part part : request.getParts()) {
            String fileName = extractFileName(part);
            tempFileName = fileName;
            // refines the fileName in case it is an absolute path
            fileName = new File(fileName).getName();
            filePath = savePath + File.separator + fileName;
            part.write(savePath + File.separator + fileName);
        }

        if (tempFileName != null && !tempFileName.trim().equals("")) {
        	String[] str = tempFileName.split("\\.");
        	String ext = str[1];
        	if (ext != null && ext.trim().equalsIgnoreCase("xlsx")) {

        		TestScenarioDao scenarioDao = new TestScenarioDao();
                TestCaseDao testCaseDao = new TestCaseDao();
                List<TestCase> testCases = testCaseDao.getTestCaseList();
                List<TestScenario> testScenarios = scenarioDao.getScenarioList();
                
                Object[] obj = ReadExcel.readTestScenariosData(filePath, testCases, testScenarios);
                List<TestScenario> scenarios = (List<TestScenario>) obj[0];
                String errorMessage = (String) obj[1];
                
                Gson gson = new Gson();
                String responseStr = gson.toJson(scenarios);
                
                TestScenarioDao dao = new TestScenarioDao();
                
                File file = new File(filePath);
                file.delete();
                
                if (errorMessage != null && !errorMessage.trim().equals("")) {
                	request.setAttribute("errorMessage", errorMessage);
                } else {

                    try {
    					status = dao.loadBulkScenarioData(responseStr, guestName);
    					
    				} catch (Exception e) {
    					// TODO Auto-generated catch block
    					e.printStackTrace();
    				}
                    if (status > 0) {
                    	request.setAttribute("successMessage", "Data Loaded successfully !!!");
                    } else {
                    	request.setAttribute("errorMessage", "Failure to load data into database.");
                    }
                }
                
                getServletContext().getRequestDispatcher("/upload.jsp").forward(request, response);
                
        	} else {
        		request.setAttribute("errorMessage", "Only .xlsx files are allowed.");
        		getServletContext().getRequestDispatcher("/upload.jsp").forward(request, response);
        	}
        }
        
    }
    /**
     * Extracts file name from HTTP header content-disposition
     */
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length()-1);
            }
        }
        return "";
    }
}