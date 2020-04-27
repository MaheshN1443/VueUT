package com.util;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

import com.dto.TestCase;
import com.dto.TestScenario;
import com.dto.TestScenarioMapping;

public class ReadExcel {
	
	/**
	 * Method readTestScenariosData
	 * @param fileName
	 * @param testCases
	 * @return Object[]
	 */
	public static Object[] readTestScenariosData(String fileName, List<TestCase> testCases, 
												 List<TestScenario> testScenarios) {
		
		Workbook workbook = null;
		Sheet sheet = null;
		DataFormatter dataFormatter = null;
		Object[] obj = null;
		
		List<TestScenario> scenarios = null;
		ArrayList<TestScenarioMapping> scenarioMappings = null;
		TestScenario testScenario = null;
		String errorMessage = "";
		
		try {
			
			obj = new Object[2];
			
			scenarios = new ArrayList<>();
			scenarioMappings = new ArrayList<>();
			testScenario = new TestScenario();
			
			obj[0] = scenarios;
			workbook = WorkbookFactory.create(new File(fileName));
			sheet = workbook.getSheetAt(0);
			dataFormatter = new DataFormatter();
			
			int count = 0;
			
			for (Row row: sheet) {
				count++;
				
				if (count < 2) {
					continue;
				}
				
				try {
					
					List<String> name = new ArrayList<String>();
					for (int i = 0; i < 11; ++i) {
						Cell cell = row.getCell(i, Row.MissingCellPolicy.CREATE_NULL_AS_BLANK);
						String cellValue = "";
						if (cell == null || cell.getCellTypeEnum() == CellType.BLANK) {
		                        
		                } else {
		                	cellValue = dataFormatter.formatCellValue(cell);
			                cellValue = (cellValue == null) ? "" : cellValue;
		                }
		                name.add(cellValue);
					}
					
		            /*for (Cell cell: row) {
		                String cellValue = dataFormatter.formatCellValue(cell);
		                cellValue = (cellValue == null) ? "" : cellValue;
		                name.add(cellValue);
		            }*/
		            
		            String module = name.get(0);	
					String subModule = name.get(1);
					
					String scenarioName	= name.get(2);
					String scenarioCode	= name.get(3);
					String description = name.get(4);
					String isActive	= name.get(5);
					String testCaseName	= name.get(6);
					String executionOrder = name.get(7);
					String occuranceCycle = name.get(8);
					String overrideParams = name.get(9);	
					String overrideParamValues = name.get(10);
					
					int order = Util.convertStrToInt(executionOrder);
					int group = Util.convertStrToInt(occuranceCycle);
					int activeOrNot = Util.convertStrToInt(isActive);
					
					if (order == 0 || group == 0 || !(activeOrNot == 0 || activeOrNot == 1)) {
						errorMessage = "One of the Execution Order / Occurance Cycle / Is Active is invalid.";
						break;
					}
					
					TestCase testCase = null;
					if (testCases != null && !testCases.isEmpty() && 
						testCaseName != null && !testCaseName.trim().equals("")) {
						testCase = testCases.stream()
											.filter(tc -> (tc.getTestCaseName() != null && 
														   tc.getTestCaseName().trim().equalsIgnoreCase(testCaseName.trim())))
											.findFirst()
											.orElse(null);
					}
					
					int testCaseId = 0;
					if (testCase != null) {
						testCaseId = testCase.getTestCaseID();
					} else {
						errorMessage = "One of the Test Case Name is invalid.";
						break;
					}
					
					TestScenarioMapping mapping = new TestScenarioMapping();
					mapping.setTestCaseID(testCaseId);
					mapping.setExecutionOrder(order);
					mapping.setOccuranceGroup(group);
					mapping.setOverrideParamName(overrideParams);
					mapping.setOverrideParamVal(overrideParamValues);
					
					if (testScenarios != null && !testScenarios.isEmpty() &&
						scenarioCode != null && !scenarioCode.trim().equals("")) {
						boolean status = testScenarios.stream()
					  			  					   .anyMatch(s -> s.getScenarioCode().trim().equalsIgnoreCase(scenarioCode.trim()));
						if (status) {
							errorMessage = "One of the Scenario already existed in the database.";
							break;	
						} else {
							if (scenarios != null && !scenarios.isEmpty()) {
								status = scenarios.stream()
										          .anyMatch(s -> s.getScenarioCode().trim().equalsIgnoreCase(scenarioCode.trim()));
								if (status) {
									errorMessage = "Duplicate Scenario entry existed in file.";
									break;
								}
							}
						}
					}
					
					if (scenarioCode != null && !scenarioCode.trim().equals("")) {
						
						testScenario = new TestScenario();
						scenarioMappings = new ArrayList<>();
						
						testScenario.setActive((activeOrNot == 1) ? true : false);
						testScenario.setModuleName(module);
						testScenario.setSubModuleName(subModule);
						testScenario.setScenarioName(scenarioName);
						testScenario.setScenarioCode(scenarioCode);
						testScenario.setDescription(description);
						testScenario.setMapping(scenarioMappings);
						
						scenarios.add(testScenario);
						
					}

					scenarioMappings.add(mapping);
				
					
					if (scenarios == null || scenarios.isEmpty()) {
						errorMessage = "First record having invalid data.";
						break;
					}
					
				} catch (Exception e) {
					System.out.println(e.getMessage());
					e.printStackTrace();
				}
				
	        }
			
			workbook.close();
			obj[1] = errorMessage;
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
			if (errorMessage != null && !errorMessage.trim().equals("")) {
				obj[1] = errorMessage;
			} else {
				obj[1] = "Failed to validate the file.";
			}

		}
		return obj;
	}
	
}
