package com.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.util.PropertiesUtil;

public class VueConnection {

	public static Connection con;
	public static Connection getCon() throws SQLException {
		if (con == null || con.isClosed()) {
			String driver = PropertiesUtil.mssqlDriver;
			try {
				Class.forName(driver).newInstance();
				con = DriverManager.getConnection(PropertiesUtil.dbUrl,PropertiesUtil.dbUsername,PropertiesUtil.dbPassword);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (InstantiationException e) {
				e.printStackTrace();
			} catch (IllegalAccessException e) {
				e.printStackTrace();
			}
		}
		return con;
	}
	
}
