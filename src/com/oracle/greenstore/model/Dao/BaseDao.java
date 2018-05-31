package com.oracle.greenstore.model.Dao;

public interface BaseDao {
	public String  dirverClass="oracle.jdbc.driver.OracleDriver";
	public String  url="jdbc:oracle:thin:@localhost:1521:xe";
	public String username="root";
	public String password="admin";
	
	//添加
	public boolean add(Object o);
	
	public boolean  delete(Object id);
	
	public boolean update(Object  o);
	
	public Object    list();
}
