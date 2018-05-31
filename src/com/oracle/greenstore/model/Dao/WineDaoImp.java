package com.oracle.greenstore.model.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.oracle.greenstore.modle.been.Wine;

public class WineDaoImp extends BaseDaoImp implements WineDao{

	@Override
	public boolean add(Object o) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(Object id) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean update(Object o) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public Object list() {
		// TODO Auto-generated method stub
		return null;
	}
	
	/*
	 * 根据用户传入的参数从数据库中查询出对应的数量对象
	 * */
	@Override
	public ArrayList<Wine> listRecentWinesByCount(int count) {
		Wine wine=null;
		ArrayList<Wine> winelist=null;
		ResultSet rs = null;
		try {
			winelist = new ArrayList<Wine>();
			String sql="select *  from  wine where rownum<="+count;
			rs = getSta().executeQuery(sql);
			while(rs.next()){
				wine = new Wine();
				wine.setWine_id(rs.getInt("wine_id"));
				wine.setWine_name(rs.getString("wine_name"));
				wine.setKind(rs.getString("kind"));
				wine.setPrice(rs.getFloat("price"));
				wine.setDetail(rs.getString("detail"));
				wine.setImage(rs.getString("image"));
				winelist.add(wine);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		disposeResource(getSta(), rs, getCon());
		return winelist;
	}

	@Override
	public ArrayList<Wine> getAllWineByTuiguang() {
		Wine wine=null;
		ArrayList<Wine> winelist=null;
		ResultSet rs = null;
		try {
			winelist = new ArrayList<Wine>();
			rs = getSta().executeQuery("select *  from  wine   where tuiguang = 0");
			System.out.println(rs);
			while(rs.next()){
				wine = new Wine();
				wine.setWine_id(rs.getInt("wine_id"));
				wine.setWine_name(rs.getString("wine_name"));
				wine.setKind(rs.getString("kind"));
				wine.setPrice(rs.getFloat("price"));
				wine.setDetail(rs.getString("detail"));
				wine.setImage(rs.getString("image"));
				wine.setTuiguangtu(rs.getString("tuiguangtu"));
				winelist.add(wine);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		disposeResource(getSta(), rs, getCon());
		return winelist;
	}

	@Override
	public Wine getWineInfoBywineid(int id) {
		Wine wine=null;
		ResultSet rs = null;
		try {
			rs = getSta().executeQuery("select *  from  wine where wine_id = "+id);
			if(rs.next()){
				wine = new Wine();
				wine.setWine_id(rs.getInt("wine_id"));
				wine.setWine_name(rs.getString("wine_name"));
				wine.setKind(rs.getString("kind"));
				wine.setPrice(rs.getFloat("price"));
				wine.setDetail(rs.getString("detail"));
				wine.setImage(rs.getString("image"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		disposeResource(getSta(), rs, getCon());
		return wine;
	}

	@Override
	public ArrayList<Wine> getSelectWineByQurey(String text,String isCn) {
		Wine wine=null;
		ArrayList<Wine> winelist=null;
		ResultSet rs = null;
		//对text进行处理抽取关键字
		if(isCn.equals("CN")) {
			boolean isYL=text.contains("饮料");
			if(isYL) { 
				text="饮料";
			}
			boolean isBJ=text.contains("白酒");
			if(isBJ) { 
				text="白酒";
			}
			boolean isHJ=text.contains("红酒");
			if(isHJ) { 
				text="红酒";
			}
		}else {
			boolean isYL=text.contains("yinliao")||text.contains("YINLIAO");
			if(isYL) { 
				text="饮料";
			}
			boolean isBJ=text.contains("baijiu");
			if(isBJ) { 
				text="白酒";
			}
			boolean isHJ=text.contains("hongjiu");
			if(isHJ) { 
				text="红酒";
			}
		}
		
		
		try {
			winelist = new ArrayList<Wine>();
			rs = getSta().executeQuery("select *  from  wine where kind = '"+text+"'");
			while(rs.next()){
				wine = new Wine();
				wine.setWine_id(rs.getInt("wine_id"));
				wine.setWine_name(rs.getString("wine_name"));
				wine.setKind(rs.getString("kind"));
				wine.setPrice(rs.getFloat("price"));
				wine.setDetail(rs.getString("detail"));
				wine.setImage(rs.getString("image"));
				winelist.add(wine);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		disposeResource(getSta(), rs, getCon());
		return winelist;
	}
	
	@Override
	public ArrayList<Wine> tplistGetWinesByPage(int page, int count) {
		int startCount=(page-1)*count+1;
		int endCount=startCount+count-1;
		String sq="SELECT * FROM(SELECT W.*,ROWNUM RN FROM (SELECT * FROM wine) W )WHERE RN BETWEEN "+startCount+" AND "+endCount;
		ArrayList<Wine> winelist=getWinesByPage(sq);
		return winelist;
	}
	//
	@Override
	public ArrayList<Wine> searchlistGetWinesByPage(String kind, String winename, String minprice, String maxprice,int page, int count) {
		int startCount=(page-1)*count+1;
		int endCount=startCount+count-1;
		
		String SQL = "select *  from  wine  where  1=1";
		if (kind != null && !kind.equals("")) {
			SQL += "   and  kind='" + kind + "'";
		}
		if (winename != null && !winename.equals("")) {
			SQL += "   and  wine_name='" + winename + "'";
		}
		if (minprice != null && !minprice.equals("")) {
			SQL += "   and  price>=" + minprice;
		}
		if (maxprice != null && !maxprice.equals("")) {
			SQL += "   and  price<=" + maxprice;
		}
		
		String sq="SELECT * FROM(SELECT W.*,ROWNUM RN FROM (SELECT * FROM ("+SQL+")) W )WHERE RN BETWEEN "+startCount+" AND "+endCount;
		//sql语句已经准备好，开始向数据库查询
		ArrayList<Wine> winelist=getWinesByPage(sq);
		return winelist;
	}

	
	@Override
	public ArrayList<Wine> getWinesByPage(String sql) {
		Wine wine=null;
		ArrayList<Wine> winelist=null;
		ResultSet rs = null;
		try {
			winelist = new ArrayList<Wine>();
			String sq=sql;
			rs = getSta().executeQuery(sq);
			while(rs.next()){
				wine = new Wine();
				wine.setWine_id(rs.getInt("wine_id"));
				wine.setWine_name(rs.getString("wine_name"));
				wine.setKind(rs.getString("kind"));
				wine.setPrice(rs.getFloat("price"));
				wine.setDetail(rs.getString("detail"));
				wine.setImage(rs.getString("image"));
				winelist.add(wine);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		disposeResource(getSta(), rs, getCon());
		return winelist;
	}

	@Override
	public int getAllCountsByWine() {
		int n=0;
		ResultSet rs = null;
		try {
			rs=getSta().executeQuery("select count(wine_id)  from  WINE");
			rs.next();
			n=rs.getInt(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return n;
	}

	@Override
	public ArrayList<Wine> searchCarsByCondition(String kind, String winename, String minprice, String maxprice) {
		String SQL = "select *  from  wine  where  1=1";
		if (kind != null && !kind.equals("")) {
			SQL += "   and  kind='" + kind + "'";
		}
		if (winename != null && !winename.equals("")) {
			SQL += "   and  wine_name='" + winename + "'";
		}
		if (minprice != null && !minprice.equals("")) {
			SQL += "   and  price>=" + minprice;
		}
		if (maxprice != null && !maxprice.equals("")) {
			SQL += "   and  price<=" + maxprice;
		}
		//sql语句已经准备好，开始向数据库查询
		ArrayList<Wine> winelist=null;
		Wine wine=null;
		ResultSet rs = null;
		try {
			winelist = new ArrayList<Wine>();
			rs = getSta().executeQuery(SQL);
			while(rs.next()){
				wine = new Wine();
				wine.setWine_id(rs.getInt("wine_id"));
				wine.setWine_name(rs.getString("wine_name"));
				wine.setKind(rs.getString("kind"));
				wine.setPrice(rs.getFloat("price"));
				wine.setDetail(rs.getString("detail"));
				wine.setImage(rs.getString("image"));
				winelist.add(wine);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		disposeResource(getSta(), rs, getCon());
		return winelist;
	}


	
}
