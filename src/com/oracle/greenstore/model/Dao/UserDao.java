package com.oracle.greenstore.model.Dao;

import com.oracle.greenstore.modle.been.User;

public interface UserDao extends BaseDao {
	/*
	 * 定义一个向数据库中插入一个user对象的方法，常用于注册
	 * */
	public void insertUserInfo(String username,String password,int phone);
	/*
	 * 
	 * 定义一个根据用户名和密码向数据库查询是否有此人，返回一个int值，为1或0
	 * */
	public User selectUserInfo(String username,String password);
	/**
	 * 定义一个完善用户信息的方法
	 * @param username
	 * @param address
	 * @param age
	 * @param phone
	 */
	public void alterUserInfo(String username, String address,int age,int phone,String touxiang);
	
	/**
	 * 根据用户名向数据库查询是否存在该用户
	 * @param username
	 * @return
	 */
	public boolean checkUserExists(String username);
}
