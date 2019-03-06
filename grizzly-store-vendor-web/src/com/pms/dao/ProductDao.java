package com.pms.dao;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.pms.java.ApplicationException;
import com.pms.pojo.ProductPojo;

public class ProductDao {
	
	public static ArrayList<ProductPojo> fetchProductDetails() throws ApplicationException {
		Connection connection = DBUtil.makeConnection();
		Statement statement = null;
		ArrayList<ProductPojo> productDetails = new ArrayList<ProductPojo>();
		
		try {
			statement = connection.createStatement();

			ResultSet resultSet = statement
					.executeQuery("select p.product_id,p.product_name,p.product_brand,p.product_description,p.product_category,p.product_rating,p.product_price,i.inventory_buffer,i.inventory_stock from product_management p,inventory_management i where p.product_id=i.product_id");

			while (resultSet.next())
			{
				ProductPojo pojo = new ProductPojo();
				pojo.setProductId(resultSet.getString(1));
				pojo.setProductName(resultSet.getString(2));
				pojo.setProductBrand(resultSet.getString(3));
				pojo.setProductDescription(resultSet.getString(4));
				pojo.setProductCategory(resultSet.getString(5));
				pojo.setProductRating(resultSet.getString(6));
				pojo.setProductPrice(resultSet.getString(7));
				pojo.setProductBuffer(resultSet.getString(8));
				pojo.setProductStock(resultSet.getString(9));
				productDetails.add(pojo);
			}

			resultSet.close();
			statement.close();
			
		} catch (SQLException e) {
			ApplicationException ae = new ApplicationException(e.getErrorCode(),e.getMessage());
			throw ae;
		}
		
		return productDetails;
	}
	
	
	public static int addProductDetails(ProductPojo pojo) throws ApplicationException {
		int rowAffected = 0,rowAffectedProduct=0;
		Connection connection=null;int key=0;
		try {
			connection = DBUtil.makeConnection();
			Statement statement = connection.createStatement();
            
			
			rowAffectedProduct = statement.executeUpdate("insert into product_management (product_name,product_category,product_brand,product_description,product_rating,product_price) values('" + pojo.getProductName() + "','" + pojo.getProductCategory() + "','" + pojo.getProductBrand() + "','" + pojo.getProductDescription() + "'," + pojo.getProductRating() + "," + pojo.getProductPrice() +")",statement.RETURN_GENERATED_KEYS);
            ResultSet resultSet = statement.getGeneratedKeys();
            if(resultSet.next()) {
               key = resultSet.getInt(1);
            }
			rowAffected = statement.executeUpdate("insert into inventory_management (inventory_buffer,inventory_stock,product_id) values("+ pojo.getProductBuffer() + ",0," +  key +")");
			          
			statement.close();

		} catch (SQLException e) {
			ApplicationException ae = new ApplicationException(e.getErrorCode(),e.getMessage());
			throw ae;
			
			}
			
		return rowAffected;
	}
	
	
	public static int removeProduct(int id) throws ApplicationException {
		int rowAffected = 0, rowAffectedProduct=0;
		try {
			Connection connection = DBUtil.makeConnection();
			Statement statement = connection.createStatement();

			rowAffectedProduct = statement.executeUpdate("delete from product_management where product_id=" + id);
			rowAffected = statement.executeUpdate("delete from inventory_management where product_id=" + id);

			statement.close();

		} catch (SQLException e) {
			ApplicationException ae = new ApplicationException(e.getErrorCode(),e.getMessage());
			throw ae;
			
		}
		return rowAffected;
	}


	public static int updateStock(ProductPojo pojo) throws ApplicationException {
		int rowAffected=0;
		try {
			Connection connection = DBUtil.makeConnection();
			Statement statement = connection.createStatement();
			
			rowAffected = statement.executeUpdate("update inventory_management set inventory_stock = " +pojo.getProductStock()+ " where product_id=" + pojo.getProductId());

			statement.close();

		} catch (SQLException e) {
			ApplicationException ae = new ApplicationException(e.getErrorCode(),e.getMessage());
			throw ae;
		}
		return rowAffected;
	}

}
