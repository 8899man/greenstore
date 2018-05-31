package com.oracle.greenstore.model.Dao;

import java.util.ArrayList;

import com.oracle.greenstore.modle.been.Wine;

public interface WineDao extends BaseDao{
	/*
	 * 定义一个可以根据用户传入的参数从数据库中查询出对应的数量对象
	 * */
	public ArrayList<Wine>  listRecentWinesByCount(int count);
	
	/**
	 * 定义一个查询需要推广显示到滚动区域二手车信息的方法
	 */
	public  ArrayList<Wine>  getAllWineByTuiguang();
	/*
	 * 根据一个id查询出酒的信息
	 * */
	public Wine getWineInfoBywineid(int id);
	/*
	 * 定义一个根据用户输入的字符串查询酒的信息
	 * */
	public ArrayList<Wine> getSelectWineByQurey(String text,String isCn);
	/**
	 * 定义一个根据酒的多个属性，向数据库查询与之匹配的产品
	 * @param kind 酒的种类
	 * @param winename 旧的品牌
	 * @param minprice 最低价
	 * @param maxprice 最高价
	 * @return 集合，装符合条件的产品
	 */
	public ArrayList<Wine> searchCarsByCondition(String kind,String winename,String minprice,String maxprice);
	
	/**
	 * 定义一个查询分页数据的方法,获取的是一个页面的Wine集合
	 * 
	 * @return
	 */
	public ArrayList<Wine> getWinesByPage(String sql);
	
	/**
	 * 向tplist（特色产品）页面输送分页数据，要使用getWinesByPage（）方法
	 * @param page//要查询的页数
	 * @param count//每页查看的Wine个数
	 * @param sql 查询数据的sql语句
	 * @return
	 */
	public ArrayList<Wine> tplistGetWinesByPage(int page,int count);
	/**
	 * 向searchlist（搜索产品）页面输送分页数据，要使用getWinesByPage（）方法
	 * @param page
	 * @param count
	 * @return
	 */
	public ArrayList<Wine> searchlistGetWinesByPage(String kind, String winename, String minprice, String maxprice,int page,int count);
	
	
	
	/**
	 * 定义一个可以查询所有Car数量的方法
	 * @return
	 */
	public int getAllCountsByWine();
	
	
}
