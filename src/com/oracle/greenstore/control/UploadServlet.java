package com.oracle.greenstore.control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jspsmart.upload.SmartUpload;
import com.jspsmart.upload.SmartUploadException;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/UploadServlet")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     private ServletConfig config;
     public void init(ServletConfig config) throws ServletException {
    	 super.init(config);
    	 this.config=config;
     }
     final public ServletConfig getServletConfg() {
    	 return config;
     }
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String path ="D:/JSPworkspace/file/upLoad";
		String dir = request.getServletContext().getRealPath("/");
		String saveDir = dir + "image";
		System.out.println(saveDir);
		// 新建一个SmartUpload对象
		SmartUpload su = new SmartUpload();
		// 上传初始化
		su.initialize(this.getServletConfig(),request,response);
		// 设定上传限制
		// 1.限制每个上传文件的最大长度。
		su.setMaxFileSize(1024*1024*10);  
		// 2.限制总上传数据的长度。
		su.setTotalMaxFileSize(1024*1024*20); 
		// 3.设定允许上传的文件（通过扩展名限制）,仅允许doc,txt文件。
		su.setAllowedFilesList("gif,jpg,png,JPG");
		// 4.设定禁止上传的文件（通过扩展名限制）,禁止上传带有exe,bat,
		//jsp,htm,html扩展名的文件和没有扩展名的文件。
		try {
			su.setDeniedFilesList("exe,doc,bat,,");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		try {
			// 上传文件
			su.upload();
			// 将上传文件全部保存到指定目录
			int count = su.save(saveDir);
			System.out.println(count+"个文件上传成功！<br>");
		} catch (SmartUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		// 利用Request对象获取参数之值
		System.out.println("TEST="+su.getRequest().getParameter("TEST")
		+"<BR><BR>");

		// 逐一提取上传文件信息，同时可保存文件。
		for (int i=0;i<su.getFiles().getCount();i++)
		{
			com.jspsmart.upload.File file = su.getFiles().getFile(i);
			
			// 若文件不存在则继续
			if (file.isMissing()) continue;

			// 显示当前文件信息
			System.out.println("<TABLE BORDER=1>");
			System.out.println("<TR><TD>表单项名（FieldName）</TD><TD>"
			+ file.getFieldName() + "</TD></TR>");
			System.out.println("<TR><TD>文件长度（Size）</TD><TD>" + 
			file.getSize() + "</TD></TR>");
			System.out.println("<TR><TD>文件名（FileName）</TD><TD>" 
			+ file.getFileName() + "</TD></TR>");
			System.out.println("<TR><TD>文件扩展名（FileExt）</TD><TD>" 
			+ file.getFileExt() + "</TD></TR>");
			System.out.println("<TR><TD>文件全名（FilePathName）</TD><TD>"
			+ file.getFilePathName() + "</TD></TR>");
			System.out.println("</TABLE><BR>");
			
			request.getSession().setAttribute("filePathName", file.getFilePathName());
			//request.setAttribute("filePathName", file.getFilePathName());
			request.getRequestDispatcher("alterHyzx.jsp").forward(request, response);
			// 将文件另存
			// file.saveAs("/upload/" + myFile.getFileName());
			// 另存到以WEB应用程序的根目录为文件根目录的目录下
			// file.saveAs("/upload/" + myFile.getFileName(), 
			
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
