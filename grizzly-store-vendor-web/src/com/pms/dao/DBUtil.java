package com.pms.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBUtil 
{
	static Connection connection;
	static
	{
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
		}
		catch (ClassNotFoundException e) 
		{
			e.printStackTrace();
		}
	}
	static Connection makeConnection()
	{
		if(connection==null)
		{
			try
			{
				connection=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/grizzly_store","root","root");
			}
			catch (SQLException e)
			{
				e.printStackTrace();
			}
		}
		return connection;
	}
	static void closeConnection()
	{
		try 
		{
			if(connection!=null)
			{
			connection.close();
			}
		} 
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}

}
