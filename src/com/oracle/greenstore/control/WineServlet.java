package com.oracle.greenstore.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.oracle.greenstore.model.Dao.WineDaoImp;
import com.oracle.greenstore.modle.been.Page;
import com.oracle.greenstore.modle.been.Wine;

/**
 * Servlet implementation class WineServlet
 */
@WebServlet("/WineServlet")
public class WineServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	private WineDaoImp wineDaoImp =null;
	private HashMap<String, Wine> buyWine=new HashMap<>();;
	private int wineCount=1;
	
	//搜索表单里的数据
	String  kind=null;
	String winename=null;
	String minprice=null;
	String maxprice=null;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WineServlet() {
        super();
        wineDaoImp=new WineDaoImp();
        // TODO Auto-generated constructor stub
    }

	/**
	 * 通过method的不同值调用不同的方法，达到转流器的作用
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method=request.getParameter("method");
		switch(method) {
		case "index":
			index(request,response);
			break;
		case "tplistPages":
			tplistPages(request,response);
			break;
		case "listCarByAjaxRequest"://ajax分页
			listCarByAjaxRequest(request,response);
			break;
		case "cpxq":
			cpxq(request,response);
			break;
		case "search":
			search(request,response);
			break;
		case "pageSearch":
			pageSearch(request,response);
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
	
	
	/**
	 * 为用户准备的筛选功能，当特色产品不满足用户的需求，可以点击筛选嗲用次方法
	 * 筛选出满足用户需要的产品
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page=Integer.parseInt(request.getParameter("page"));
		int count=Integer.parseInt(request.getParameter("count"));//每页显示的产品个数
	System.out.println("dsds"+request.getParameter("kind"));
		if(!request.getParameter("kind").equals("")||request.getParameter("kind")!=null) {
			kind=new String(request.getParameter("kind").getBytes("ISO-8859-1"),"UTF-8");//品牌
		}else {
			kind="";
		}
		
		if(request.getParameter("winename")!=null)
			winename=new String(request.getParameter("winename").getBytes("ISO-8859-1"),"UTF-8");//品牌
		minprice=request.getParameter("minprice");
		maxprice=request.getParameter("maxprice");
		System.out.println(kind+winename+minprice+maxprice);
		//form信息获取完毕，向dao层索取数据
		ArrayList<Wine> searchwinelist = wineDaoImp.searchCarsByCondition(kind, winename, minprice, maxprice);
		int allCount=searchwinelist.size();//获取搜索产品的数量
		
		ArrayList<Wine> searchwinePagelist = wineDaoImp.searchlistGetWinesByPage(kind, winename, minprice, maxprice,page,count);
		
		Page p=listPages(page,count,allCount);//获取分页信息
		//设置request属性
		request.setAttribute("page", p);
		request.setAttribute("searchwinelist", searchwinePagelist);
		request.getRequestDispatcher("searchlist.jsp").forward(request, response);
	}
	/**
	 * 在搜索的过成中，第一次调用search方法，可以成功；但点击下一步时会在
	 * 129行request.getParameter("kind")处报空指针，因此派生出pageSearch方法
	 * 处理上一步、下一步（只是将获取form信息删掉）
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void pageSearch(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page=Integer.parseInt(request.getParameter("page"));
		int count=Integer.parseInt(request.getParameter("count"));//每页显示的产品个数
	System.out.println("调用了pageSearch方法");	
		System.out.println(kind+winename+minprice+maxprice);
		//form信息获取完毕，向dao层索取数据
		ArrayList<Wine> searchwinelist = wineDaoImp.searchCarsByCondition(kind, winename, minprice, maxprice);
		int allCount=searchwinelist.size();//获取搜索产品的数量
		
		ArrayList<Wine> searchwinePagelist = wineDaoImp.searchlistGetWinesByPage(kind, winename, minprice, maxprice,page,count);
		
		Page p=listPages(page,count,allCount);//获取分页信息
		//设置request属性
		request.setAttribute("page", p);
		request.setAttribute("searchwinelist", searchwinePagelist);
		request.getRequestDispatcher("searchlist.jsp").forward(request, response);
	}
	
	
	/*
	 * 为产品详情准备数据，当点击产品的图片、名称为其获取详细数据并跳转详情页面
	 * */
	protected void cpxq(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//WineDaoImp  wineDaoImp=new WineDaoImp();
		Wine wineinfo=wineDaoImp.getWineInfoBywineid(Integer.parseInt(request.getParameter("wine_id")));
		System.out.println("调用了cpxq方法");
		request.setAttribute("wineinfo", wineinfo);
		request.getRequestDispatcher("cpxq.jsp").forward(request, response);
	}
	
	
	/**
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	protected void tplistPages(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page=Integer.parseInt(request.getParameter("page"));
		int count=Integer.parseInt(request.getParameter("count"));//每页显示的产品个数
		//WineDaoImp wineDaoImp = new WineDaoImp();
		ArrayList<Wine> tpwinelist = wineDaoImp.tplistGetWinesByPage(page, count);
		
		System.out.println("调用了tplistPages方法");
		int allCount=wineDaoImp.getAllCountsByWine();//Wine的个数
		
		Page p=listPages(page,count,allCount);
		//设置request属性
	
		request.setAttribute("page", p);
		request.setAttribute("tpwinelist", tpwinelist);
		request.getRequestDispatcher("tplist.jsp").forward(request, response);
	}
	/**
	 * 定义一个封装分页信息的方法，为需要分页的页面提供分页的信息
	 * @param page 当前页
	 * @param count 每页显示的产品个数
	 * @param allCount Wine的个数
	 * @return
	 */
	protected Page listPages(int page,int count,int allCount) {
		int nowPage=page;//当前页
		int previousPage=nowPage-1;//上一页    
		int nextPage=nowPage+1; //下一页
		int allPages=allCount%count==0?(allCount/count):(allCount/count+1);//页的总数
		/*
		 * 把计算出的数据封装进page
		 * */
		Page p=new Page();
		p.setNowPage(nowPage);
		p.setNextPage(nextPage);
		p.setPreviousPage(previousPage);
		p.setAllCount(allCount);
		p.setAllPages(allPages);
		
		return p;
	}
	
	/*
	 * 这个方法为首页准备数据，
	 * */
	protected void index(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//WineDaoImp wineDaoImp = new WineDaoImp();
		System.out.println("调用了index方法");
		ArrayList<Wine> winelist = wineDaoImp.listRecentWinesByCount(5);
		request.setAttribute("winelist", winelist);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	
	protected void listCarByAjaxRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("进入到listCarByAjaxRequest方法");
		String  page=request.getParameter("page");
		String count=request.getParameter("count");
		ArrayList<Wine>  wines=wineDaoImp.tplistGetWinesByPage(Integer.parseInt(page),Integer.parseInt(count));
		response.setContentType("text/json;charset=utf-8");
		PrintWriter  out=response.getWriter();
		JSONArray  allWines=new JSONArray();
		for(Wine  c:wines) {
			JSONObject  wine=new JSONObject();
			try {
				wine.put("image", c.getImage());
				wine.put("jiage", c.getPrice());
				wine.put("kind", c.getKind());
				wine.put("winename", c.getWine_name());
				wine.put("id", c.getWine_id());
				wine.put("miaoshu", c.getDetail());
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			allWines.put(wine);
		}
		out.write(allWines.toString());
		/**
		 * xml方式返回ajax请求当结构化的数据
		 */
//		out.write("<?xml  version='1.0'  encoding='utf-8'  ?>");
//		out.write("<cars>");
//		for(Car  c:cars) {
//			out.write("<car>");
//				out.write("<carbrand>"+c.getPinpaiming()+"</carbrand>");
//				out.write("<price>"+c.getShoujia()+"</price>");
//				out.write("<xilie>"+c.getXilie()+"</xilie>");
//				out.write("<pailiang>"+c.getPailiang()+"</pailiang>");
//				out.write("<gonglishu>"+c.getGonglishu()+"</gonglishu>");
//			out.write("</car>");
//		}
//		
//		
//		out.write("</cars>");
		out.flush();
		out.close();
	}

}
