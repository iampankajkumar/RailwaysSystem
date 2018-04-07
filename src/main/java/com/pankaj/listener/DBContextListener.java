package com.pankaj.listener;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class DBContextListener implements ServletContextListener {
	Connection con;

	public void contextDestroyed(ServletContextEvent arg0) {
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void contextInitialized(ServletContextEvent arg0) {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/train", "root", "root");
			ServletContext application = arg0.getServletContext();
			application.setAttribute("connection", con);
			System.out.println("::::::::::::::::::::::"+con);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}