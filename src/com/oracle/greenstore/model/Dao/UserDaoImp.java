package com.oracle.greenstore.model.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.oracle.greenstore.modle.been.User;

public class UserDaoImp extends BaseDaoImp implements UserDao {

	@Override
	public void insertUserInfo(String username, String password,int phone) {
		try {
			int tel=1212;
			getSta().executeUpdate("insert into Users(user_name,password,phone）values ('"+username+"','"+password+"',"+tel+"）");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public User selectUserInfo(String username, String password) {
		ResultSet rs = null;
		User user=null;
		try {
			user=new User();
			rs=getSta().executeQuery("select * from users where user_name='"+username+"' and password='"+password+"'");
			if(rs.next()) {
				user.setUser_name(rs.getString("user_name"));
				user.setPassword(rs.getString("password"));
				user.setPhone(rs.getInt("phone"));
				user.setAddress(rs.getString("address"));
				user.setAge(rs.getInt("age"));
				user.setTouxiang(rs.getString("touxiang"));
				return user;
			}else {
				return user;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public void alterUserInfo(String username,String address, int age, int phone,String touxiang) {
		try {
			int tel=1212;
			getSta().executeUpdate("update users set address='"+address+"',age="+age+",phone="+phone+" ,touxiang='"+touxiang+"'where user_name='"+username+"'");
			//getSta().executeUpdate("insert into Users(address,phone,age）values ('"+address+"','"+tel+"',"+age+"）");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean checkUserExists(String username){
		boolean result=false;
		try {
			ResultSet  rs=getSta().executeQuery("select count(user_id) from users where user_name='"+username+"'");
			rs.next();
			result=(rs.getInt(1)>0)?true:false;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

}
