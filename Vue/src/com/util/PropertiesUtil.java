package com.util;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class PropertiesUtil {
	
	private static Properties prop;

	public static String dbUrl;
	public static String dbUsername;
	public static String dbPassword;
	public static String mssqlDriver;
	
	static {
		try {
			if (prop == null) {
				prop = new PropertiesUtil().readPropertiesFile("ApplicationResources.properties");
			}
			dbUrl = prop.getProperty("db.connection.url");
			dbUsername = prop.getProperty("db.username");
			dbPassword = prop.getProperty("db.password");
			mssqlDriver = prop.getProperty("mssql.driver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Properties readPropertiesFile(String fileName) throws IOException {
		Properties prop = new Properties();
		InputStream inputStream = getClass().getClassLoader().getResourceAsStream(fileName);
		if (inputStream != null) {
			prop.load(inputStream);
		} else {
			throw new FileNotFoundException(fileName+" is not found.");
		}
	      return prop;
	   }
}
