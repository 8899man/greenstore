package com.oracle.greenstore.control;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.oracle.greenstore.model.Dao.UserDaoImp;
import com.oracle.greenstore.modle.been.User;

/**
 * Servlet implementation class UserServlet
 */
@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	
	UserDaoImp userDaoImp=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        userDaoImp=new UserDaoImp();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String method=request.getParameter("method");
		switch(method) {
		case "zhuce":
			zhuce(request,response);
			break;
		case "denglu":
			denglu(request,response);
			break;
		case "tuichu":
			tuichu(request,response);
			break;
		case "alterUserInfo":
			alterUserInfo(request,response);
			break;
		case "checkUserExists":
			checkUserExists(request,response);
			break;
		default:
			break;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void zhuce(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username= new String(request.getParameter("username").getBytes("ISO-8859-1"),"UTF-8");
		String password= request.getParameter("password");
		int phone= Integer.parseInt(request.getParameter("phone"));
		
		
		userDaoImp.insertUserInfo(username,password,phone);
		System.out.println("已调用dAO");
		response.sendRedirect(response.encodeRedirectURL("resultZhuce.jsp"));

	}
	protected void denglu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1.先去除用户输入的验证码
				String  code=request.getParameter("code");
				System.out.println("您在网页上输入的验证码："+code);
				//2.取出系统生成的验证码值
				String  systemCode=request.getSession().getAttribute("generateCode").toString();
				if(!code.equalsIgnoreCase(systemCode)) {//equlas会比较内容和大小写，   equalsingonrecase
					System.out.println("验证码验证失败了，立马调到前台页面");
					request.setAttribute("loginResultMessage", "codeError");
					request.getRequestDispatcher("denglu.jsp").forward(request, response);
					//在后台servlet中，代码里面如果转发和重定向后面继续写其他业务代码，会报错
						return ;
				}//验证码结束
		
		
		String username=new String(request.getParameter("username").getBytes("ISO-8859-1"),"UTF-8");
		String password=request.getParameter("password");
		System.out.println(username);
		System.out.println(password);

		User resultUser=userDaoImp.selectUserInfo(username, password);
		System.out.println(resultUser);
		if(resultUser!=null){
			System.out.println("成功");		
			request.getSession().setAttribute("resultUser",resultUser); 
			request.getRequestDispatcher("index.jsp").forward(request, response);

		}else{
			System.out.println("shibai");
			response.sendRedirect(response.encodeRedirectURL("denglu.jsp"));
			
		}
	}
	
	
	protected void alterUserInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String filePathName=(String)request.getSession().getAttribute("filePathName");
		if(filePathName==null) {
			filePathName="tou_1.jpg";
		}
		String touxiangUrl="image/"+filePathName;
System.out.println(filePathName);
		String username=new String(request.getParameter("username").getBytes("ISO-8859-1"),"UTF-8");
		String address=new String(request.getParameter("address").getBytes("ISO-8859-1"),"UTF-8");	
		int age= Integer.parseInt(request.getParameter("age"));
		int phone= Integer.parseInt(request.getParameter("phone"));
		
		userDaoImp.alterUserInfo(username,address, age, phone,touxiangUrl);
		System.out.println("修改信息成功");
		
		User user=(User)request.getSession().getAttribute("resultUser");
		User resultUser=userDaoImp.selectUserInfo(username, user.getPassword());
		if(resultUser!=null){
			System.out.println("修改登陆成功");		
			request.getSession().setAttribute("resultUser",resultUser); 
			response.sendRedirect(response.encodeRedirectURL("hyzx.jsp"));
		}else{
			System.out.println("shibai");
			response.sendRedirect(response.encodeRedirectURL("denglu.jsp"));
			
		}
		
		
	}
	protected void tuichu(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().removeAttribute("resultUser");
		
		response.sendRedirect("index.jsp");
	}
	protected void checkUserExists(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("进入到checkUserExists方法");
		String username=request.getParameter("username");
		boolean result = userDaoImp.checkUserExists(username);
		response.setContentType("text/html;charset=UTF-8");//  text/html     ,text/xml    ,text/json
		PrintWriter  out=response.getWriter();//获取响应对象中的输出流
		out.write(result+"");
		System.out.println("result已写出"+result);
		out.flush();
		out.close();
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
