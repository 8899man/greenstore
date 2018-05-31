package com.oracle.greenstore.model.Dao;

import java.util.ArrayList;

import com.oracle.greenstore.modle.been.Wine;

public class test {

	public static void main(String[] args) {
		UserDaoImp user=new UserDaoImp();
		WineDaoImp wine=new WineDaoImp();
		//int m=wine.getAllCountsByWine();
		
		//user.insertUserInfo("大飞", "123456", 123456);
			System.out.println(user.selectUserInfo("大飞", "123456"));
	}

}
