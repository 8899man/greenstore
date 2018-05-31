package com.oracle.greenstore.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oracle.greenstore.model.Dao.WineDaoImp;
import com.oracle.greenstore.modle.been.Wine;

/**
 * Servlet implementation class ShopingWingServlet
 */
@WebServlet("/ShopingWineServlet")
public class ShopingWineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private WineDaoImp wineDaoImp =null;
	private HashMap<String, Wine> buyWine=new HashMap<>();;
	//private int wineCount=1;
	
	String productList=null;//购物车产品id清单
	String[] productId=null;//从购物清单中分割出来的产品id集合
	//ArrayList<String> productId=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopingWineServlet() {
        super();
        wineDaoImp=new WineDaoImp();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method=request.getParameter("method");
		switch(method) {
		case "buy":
			buy(request,response);
			break;
		case "deleteWine":
			deleteWine(request,response);
			break;
		case "getWineFromCookie":
			getWineFromCookie(request,response);
			break;
		default:
			break;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	protected void getWineFromCookie(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("开始获取cookie");
		Cookie[] cookies = request.getCookies();
		//String productList=null;//购物清单
		
		
		String buyWineid=null;//String buyWineCount=null;//用于盛装产品id和购买的数量
		Wine wineInfo=null;
		if(cookies!=null){  
			System.out.println("cookie不为空");
	        for(Cookie cookie:cookies){  //查找购物清单的cookie
	            if(cookie.getName().equals("isProductList")){  
	            	productList=cookie.getValue();  
	                break;  
	            }  
	        }  
	        if(productList==null){//商品列表不存在  
	            System.out.println("无");  
	        }else{  
	            productId=productList.split(","); //将字符串productList以“，”的方式分割；得到的是产品的id集合 
	            for(String s:productId){  //遍历集合，获取id
	            	buyWineid=s;
	            	System.out.println("buyWineid="+buyWineid);
	            	if(buyWineid!=null&&!buyWineid.equals("")&&!buyWineid.equals("null")) {
	            	//此处的判断条件是由productList字符串造成的
	            		//productList=",11,25,36,48,..."
	            		//在分割之后productId[0]="";(个人理解)
	            		//若无此条件报（java.lang.NumberFormatException: For input string: "null"）
	            		
	            		wineInfo=wineDaoImp.getWineInfoBywineid(Integer.parseInt(buyWineid));	
						buyWine.put(buyWineid, wineInfo);
					
	            	}
	            	
	            } 
	            System.out.println("获取完毕");
	        } 
	        //request.getSession().setAttribute("count", buyWineCount);
			request.getSession().setAttribute("buyWine", buyWine);
			response.sendRedirect("ddtj.jsp");
	      
	    }else {
	    	System.out.println("没有获取到cookie");
			//request.getSession().setAttribute("count", buyWineCount);
			request.getSession().setAttribute("buyWine", buyWine);
			response.sendRedirect("ddtj.jsp");
	    }
		
		
	}
	/**
	 * 这是处理删除购物车商品的方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void deleteWine(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String buyWine_key=(String)request.getParameter("buyWine_key");
		String wine_id=(String)request.getParameter("wine_id");
	System.out.println("调用了deleteWine方法,需要删除的键="+buyWine_key);
		Map<String, Wine> buyWine=(HashMap<String, Wine>)request.getSession().getAttribute("buyWine");
		buyWine.remove(buyWine_key);
	System.out.println("删除成功！");
	
	
	System.out.println("删除Cookie！");
	/*
	 * 137-147的思路呢，是将productList进行重写
	 * 从productId中将id依次添加到productList
	 * 除了要删除的id
	 */
	Cookie[] cookies = request.getCookies();
	if(cookies!=null) {
		for(Cookie cookie:cookies){  //查找购物清单的cookie
            if(cookie.getName().equals("isProductList")){  
            	productList=cookie.getValue(); 
            	productId=productList.split(",");
                break;  
            }  
        } 	
	}//在删除的过程中要获取最新的购物清单
	
	String productList=null;//购物车产品id清单
	for(String s:productId){  //遍历集合，获取id
    	System.out.println(s);
    } 
	for(String s:productId){  //遍历集合，获取id
    	if(s.equals(wine_id)||s.equals("null")) {
    		System.out.println("找到了id="+wine_id);
    	}else {
    		
    		productList=productList+","+s;
    		addCookie(response,"isProductList",productList);//将购物清单存入Cookie
    	}
    	
    } 
	
	
	
    System.out.println("删除cookie成功！");
		response.sendRedirect("ddtj.jsp");
	}
	/**
	 * 此方法处理购物车功能，从详情（cpxp）页面获取产品信息，将数据设置到seccion
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void buy(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Wine wineInfo=wineDaoImp.getWineInfoBywineid(Integer.parseInt(request.getParameter("wine_id")));
		String wine_id=Integer.toString(wineInfo.getWine_id());
	
		buyWine.put(wine_id, wineInfo);
		
		//System.out.println(wineCount);
		System.out.println("调用了buy方法");
		String count=request.getParameter("count");
		System.out.println(count);
		request.getSession().setAttribute("count", count);
		request.getSession().setAttribute("buyWine", buyWine);
		
		//将收藏的产品添加到cookie
		String buyWineid=Integer.toString(wineInfo.getWine_id());
		

		productList=productList+","+buyWineid;//购买一个产品，就将产品id追加到productList
		addCookie(response,"isProductList",productList);//将购物清单存入Cookie
		System.out.println(productList);
		System.out.println("已经存入cookie");
		//添加到cookie结束
		
		response.sendRedirect("ddtj.jsp");
		//request.getRequestDispatcher("ddtj.jsp").forward(request, response);
	}
	/**
	 * 对添加cookie进行封装
	 * @param response
	 * @param name
	 * @param value
	 */
	public void addCookie(HttpServletResponse response,String name,String value){  
        Cookie cookie = new Cookie(name.trim(), value.trim());  
        cookie.setMaxAge(1000*60*60*24*3);// 设置为30min  
       // cookie.setPath("/");  
        System.out.println("已添加===============");  
        response.addCookie(cookie);  
    }  
	
}
