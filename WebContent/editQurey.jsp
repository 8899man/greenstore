<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="com.oracle.greenstore.modle.been.Wine"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.oracle.greenstore.model.Dao.WineDaoImp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%
	
	String text=new String(request.getParameter("key").getBytes("ISO-8859-1"),"UTF-8");
	WineDaoImp wineDaoImp=new WineDaoImp();
	ArrayList<Wine> wineList=null;
	Pattern p = Pattern.compile("[\u4e00-\u9fa5]");
	Matcher m = p.matcher(text);
	if(m.matches()){
		wineList=wineDaoImp.getSelectWineByQurey(text,"CN");
	}else{
		wineList=wineDaoImp.getSelectWineByQurey(text,"US");
	}
//out.println(text);
	//text.contains("");
	
	request.setAttribute("winelist", wineList);
	request.getRequestDispatcher("qureylist.jsp").forward(request, response);
%>