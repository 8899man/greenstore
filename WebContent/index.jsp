<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<%

if(request.getAttribute("winelist")==null){
	request.getRequestDispatcher("WineServlet?method=index").forward(request, response);
}

%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>亲近大自然的绿色生活网</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
</head>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/index.js"></script>
<script src="script/global.js" type="text/javascript"></script>
<script src="script/head.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="css/main.css"/>
<link rel="stylesheet" type="text/css" href="css/basic.css">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" href="style/base.css" />
<link rel="stylesheet" href="style/head.css" />

<body>

<%@ include file="top.jsp"%>
<!--banner开始-->



<div class="mainbanner">
	<div class="mainbanner_window">
		<ul id="slideContainer">
			<li><a href="#"><img src="image/1.jpg" width="1920" height="500"  /></a></li>
			<li><a href="#"><img src="image/2.jpg" width="1920" height="500"  /></a></li>
			<li><a href="#"><img src="image/3.jpg" width="1920" height="500"  /></a></li>
		</ul>
	</div>
	<ul class="mainbanner_list">
		<li><a href="javascript:void(0);">1</a></li>
		<li><a href="javascript:void(0);">2</a></li>
		<li><a href="javascript:void(0);">3</a></li>
	</ul>
</div>

<!--banner结束-->

<!--中部开始-->

<div class="con_sy">

<!--中部1开始-->

<div class="con_sy1">

<!--选项卡切换开始-->

<div class="xxk_sy">

<!--代码开始-->

<script>
<!--
/*第一种形式 第二种形式 更换显示样式*/
function setTab(name,cursel,n){
for(i=1;i<=n;i++){
 var menu=document.getElementById(name+i);
 var con=document.getElementById("con_"+name+"_"+i);
 menu.className=i==cursel?"hover":"";
 con.style.display=i==cursel?"block":"none";
}
}
//-->
</script>
</head>


<div id="Tab1">
<div class="Menubox">
<ul>
 <li id="one1" onmouseover="setTab('one',1,4)" class="hover"> 热卖产品</li>

 <li id="one2" onmouseover="setTab('one',2,4)" >促销专区</li>

 <li id="one3" onmouseover="setTab('one',3,4)">新品上架</li>
 
 <li id="one4" onmouseover="setTab('one',4,4)"> 精品团购</li>

</ul>
</div>


<div class="Contentbox">

 
 
<div id="con_one_1" class="hover">

<%
//WineDaoImp wineDaoImp = new WineDaoImp();
//ArrayList<Wine> winelist = wineDaoImp.listRecentWinesByCount(5);
ArrayList<Wine> winelist=(ArrayList<Wine>)request.getAttribute("winelist");
System.out.println(winelist.isEmpty());
	for(Wine wi:winelist){
%>
	<div class="remai1">
		<div class="remai1_1"><a href="WineServlet?method=cpxq&wine_id=<%=wi.getWine_id() %>"><img src="<%=wi.getImage() %>" width="164" height="181" /></a></div>
		<div class="renai1_2"><a href="#"><%=wi.getKind() %>&nbsp;&nbsp;<%=wi.getWine_name() %></a></div>
		<div class="renai1_3">本亲价：¥<%=wi.getPrice() %></div>
	</div>
<%
	}
%>
</div>






 <div id="con_one_2" style="display:nones">
 	<%
	for(Wine wi:winelist){
%>
	<div class="remai1">
	<div class="remai1_1"><a href="WineServlet?method=cpxq&wine_id=<%=wi.getWine_id() %>"><img src="<%=wi.getImage() %>" width="164" height="181" /></a></div>
	<div class="renai1_2"><a href="#"><%=wi.getKind() %>&nbsp;&nbsp;<%=wi.getWine_name() %></a></div>
	<div class="renai1_3">本亲价：¥<%=wi.getPrice() %></div>
	</div>
<%
	}
%>	

</div>
 
 
 
<div id="con_one_3" style="display:none">
 
	<%
	for(Wine wi:winelist){
%>
	<div class="remai1">
	<div class="remai1_1"><a href="WineServlet?method=cpxq&wine_id=<%=wi.getWine_id() %>"><img src="<%=wi.getImage() %>" width="164" height="181" /></a></div>
	<div class="renai1_2"><a href="#"><%=wi.getKind() %>&nbsp;&nbsp;<%=wi.getWine_name() %></a></div>
	<div class="renai1_3">本亲价：¥<%=wi.getPrice() %></div>
	</div>
<%
	}
%>	
 
 </div>
 
 
 
 
 <div id="con_one_4" style="display:none">
 
	<%
	for(Wine wi:winelist){
%>
	<div class="remai1">
	<div class="remai1_1"><a href="WineServlet?method=cpxq&wine_id=<%=wi.getWine_id() %>"><img src="<%=wi.getImage() %>" width="164" height="181" /></a></div>
	<div class="renai1_2"><a href="#"><%=wi.getKind() %>&nbsp;&nbsp;<%=wi.getWine_name() %></a></div>
	<div class="renai1_3">本亲价：¥<%=wi.getPrice() %></div>
	</div>
<%
	}
%>	

</div> 
 
 
 
 
</div>
</div>




<!--代码结束-->





</div>


<!--选项卡切花结束-->



<!--积分兑换开始-->

<div class="jfdh_sy">
<div class="jfdh_bt">积分兑换</div>

<div class="jfdh1">
<div class="jflp2"><a href="#"><img src="images/jifen_1.jpg" width="66" height="66" /></a></div>
<div class="jflp3">
紫糯米粽<br />
所需积分：300分<br />
<a href="#">查看详情</a>
</div>
</div>


<div class="jfdh1">
<div class="jflp2"><a href="#"><img src="images/jifen_1.jpg" width="66" height="66" /></a></div>
<div class="jflp3">
紫糯米粽<br />
所需积分：300分<br />
<a href="#">查看详情</a>
</div>
</div>



<div class="jfdh1">
<div class="jflp2"><a href="#"><img src="images/jifen_1.jpg" width="66" height="66" /></a></div>
<div class="jflp3">
紫糯米粽<br />
所需积分：300分<br />
<a href="#">查看详情</a>
</div>
</div>





</div>

<!--积分兑换结束-->


</div>


<!--中部1结束-->



<!--中部大米开始-->
<div class="con_dm">

<div class="con_dmbt"><span class="dt2_1"><img src="images/dm1.jpg" width="45" height="29" /></span><span class="dt2_2">白酒</span>
<span class="dt2_3"> <a href="tplist.jsp">更多商品>></a></span>
</div>


<div class="con2_dtk">

<!--左侧1开始-->

<div class="con2_zc">

    
    
    
    <div id="wrap2">

		<ul>
			<li>    	
			<h2 style="display:none"><span class="sz"><img src="images/yi.jpg" width="20" height="22" /></span><span class="szmc">加拿大北极海参2000g/袋</span></h2>
            <a href="http://www.zhuotop.com">
            <div class="movielist" style="display:block">
            <img src="images/dy2.jpg" />  
            <dl>
            <dt>粤海商品金枪鱼粤海商品</dt>	
            <dd><span>价格：</span><span class="jj_y">¥138.0</span></dd>	
            </dl>
            </div>
            </a>
			</li>
            
            
			<li>
				<h2><span class="sz"><img src="images/er.jpg" width="20" height="22" /></span><span class="szmc">加拿大北极海参2000g/袋</span></h2>
            <a href="http://www.zhuotop.com">
            <div class="movielist" >
            <img src="images/dy2.jpg" />  
            <dl>
            <dt>粤海商品金枪鱼粤海商品</dt>	
            <dd><span>价格：</span><span class="jj_y">¥138.0</span></dd>	
            </dl>
            </div>
            </a>
			</li>
            
			<li>
			<h2><span class="sz"><img src="images/san.jpg" width="20" height="22" /></span><span class="szmc">加拿大北极海参2000g/袋</span></h2>
            <a href="http://www.zhuotop.com">
            <div class="movielist" >
            <img src="images/dy2.jpg" />  
            <dl>
            <dt>粤海商品金枪鱼粤海商品</dt>	
            <dd><span>价格：</span><span class="jj_y">¥138.0</span></dd>	
            </dl>
            </div>
            </a>
			</li>
            
            
			<li>
			<h2><span class="sz"><img src="images/si.jpg" width="20" height="22" /></span><span class="szmc">加拿大北极海参2000g/袋</span></h2>
            <a href="http://www.zhuotop.com">
            <div class="movielist" >
            <img src="images/dy2.jpg" />  
            <dl>
            <dt>粤海商品金枪鱼粤海商品</dt>	
            <dd><span>价格：</span><span class="jj_y">¥138.0</span></dd>	
            </dl>
            </div>
            </a>
			</li>
		</ul>
        
        <div class="dmgg"><a href="#"><img src="images/dmgg.jpg" width="230" height="83" /></a></div>
        
        
	</div>


</div>


<!--左侧1结束-->



<!--右侧开始-->

<div class="con2_yc">


<script type="text/javascript" src="js/jq.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $(".hdpic dd a").hover(function() {
        $(this).find(".picshine").stop();
        $(this).find(".picshine").css("background-position", "-235px 0");
        $(this).find(".picshine").animate({
            backgroundPosition: '235px 0'
        },
        500);
        $(this).find(".pictitle").stop().animate({
            left: '0px'
        },
        {
            queue: false,
            duration: 450
        });
    },
    function() {
        $(this).find(".pictitle").stop().animate({
            left: '-1135px'
        },
        {
            queue: false,
            duration: 200
        });
    });
});
</script>



<div class="hdpic">
  <dl> 
  
  
    <dd> <a href="cpxq.jsp" target="_blank"> <img src="image/bai0.jpg" / width="184" height="278">
      <div class="pictitle">
<div class="zz">
      20枚萧亚轩明星美女高清壁枚萧亚美女高清壁枚萧轩明星美女高清壁纸图片纸图片<br />
      <span style="color:#F00; font-size:18px;">本亲价：¥138.0</span>
</div>  
   </div>
      <div class="picshine"></div>
      </a> </dd>
      
      
    
        <dd> <a href="#" target="_blank"> <img src="image/bai1.jpg" / width="184" height="278">
      <div class="pictitle">
<div class="zz">
      20枚萧亚轩明星美女高清壁枚萧亚美女高清壁枚萧轩明星美女高清壁纸图片纸图片<br />
      <span style="color:#F00; font-size:18px;">本亲价：¥138.0</span>
</div>  
   </div>
      <div class="picshine"></div>
      </a> </dd>
      
      
      <dd> <a href="#" target="_blank"> <img src="image/bai2.jpg" / width="184" height="278">
      <div class="pictitle">
<div class="zz">
      20枚萧亚轩明星美女高清壁枚萧亚美女高清壁枚萧轩明星美女高清壁纸图片纸图片<br />
      <span style="color:#F00; font-size:18px;">本亲价：¥138.0</span>
</div>  
   </div>
      <div class="picshine"></div>
      </a> </dd>
    
    
    
    <dd> <a href="#" target="_blank"> <img src="image/bai3.jpg" / width="184" height="278">
      <div class="pictitle">
<div class="zz">
      20枚萧亚轩明星美女高清壁枚萧亚美女高清壁枚萧轩明星美女高清壁纸图片纸图片<br />
      <span style="color:#F00; font-size:18px;">本亲价：¥138.0</span>
</div>  
   </div>
      <div class="picshine"></div>
      </a> </dd>
      
      
    
        <dd> <a href="#" target="_blank"> <img src="image/bai4.jpg" / width="184" height="278">
      <div class="pictitle">
<div class="zz">
      20枚萧亚轩明星美女高清壁枚萧亚美女高清壁枚萧轩明星美女高清壁纸图片纸图片<br />
      <span style="color:#F00; font-size:18px;">本亲价：¥138.0</span>
</div>  
   </div>
      <div class="picshine"></div>
      </a> </dd>
    
    
     
  </dl>
</div>


</div>
<!--右侧结束-->


</div>

</div>
<!--中部大米结束-->

<div class="none" style="height:20px;"></div>


<!--中部肉类开始-->

<div class="con2_rl">

<div class="con_dmbt"><span class="dt2_1"><img src="images/dm2.jpg" width="45" height="29" /></span><span class="dt2_2">红酒专区</span>
<span class="dt2_3"> <a href="#">更多商品>></a></span>
</div>


<div class="con2_rldk">
<div class="roulei_1"><a href="#"><img src="images/rl1.jpg" width="232" height="328" /></a></div>

<div class="roulei_2">
<div class="rou_gg1"><a href="#"><img src="images/rl2.jpg" width="380" height="126" /></a></div>
<div class="rou_gg1" style="padding-left:10px;"><a href="#"><img src="images/rl3.jpg" width="380" height="126" /></a></div>

<div class="tpl_2" style="margin-left:0px;">
<a href="#"><div class="tpl_2bt">深山放养  野味一族</div><div class="shen_jg">本亲价：¥138.0</div><div class="shen_dt"><img src="images/rl4.jpg" width="180" height="114" /></div></a>
</div>


<div class="tpl_2">
<a href="#"><div class="tpl_2bt">深山放养  野味一族</div><div class="shen_jg">本亲价：¥138.0</div><div class="shen_dt"><img src="images/rl4.jpg" width="180" height="114" /></div></a>
</div>

<div class="tpl_2">
<a href="#"><div class="tpl_2bt">深山放养  野味一族</div><div class="shen_jg">本亲价：¥138.0</div><div class="shen_dt"><img src="images/rl4.jpg" width="180" height="114" /></div></a>
</div>


<div class="tpl_2">
<a href="#"><div class="tpl_2bt">深山放养  野味一族</div><div class="shen_jg">本亲价：¥138.0</div><div class="shen_dt"><img src="images/rl4.jpg" width="180" height="114" /></div></a>
</div>



</div>

<div class="roulei_3"><a href="#"><img src="images/rl6.jpg" width="149" height="333" /></a></div>



</div>




</div>



<!--中部肉类结束-->



<!--中部蔬菜开始-->


<div class="con_dm">

<div class="con_dmbt"><span class="dt2_1"><img src="images/dm3.jpg" width="45" height="29" /></span><span class="dt2_2">红酒专区</span>
<span class="dt2_3"> <a href="#">更多商品>></a></span>
</div>


<div class="con2_dtk">

<!--左侧1开始-->

<div class="con2_zc">
	<script type="text/javascript">
	window.onload=function()
	{
		var oWrap=document.getElementById('wrap');
		var aLi=oWrap.getElementsByTagName('li');
		var aH2=oWrap.getElementsByTagName('h2');
		var aBox=oWrap.getElementsByTagName('div');

		var oWrap2=document.getElementById('wrap2');
		var aLi2=oWrap2.getElementsByTagName('li');
		var aH22=oWrap2.getElementsByTagName('h2');
		var aBox2=oWrap2.getElementsByTagName('div');
		
		for(var i=0; i<aLi.length; i++)
		{
			var iNow=0;
			aLi[i].index=i;
			aLi[i].onmouseover=function()
			{
				aH2[iNow].style.display='block';
				aBox[iNow].style.display='none';
				
				aH2[this.index].style.display='none';
				aBox[this.index].style.display='block';
				
				iNow=this.index;
			};
			
		}

		for(var i=0; i<aLi2.length; i++)
		{
			var iNow=0;
			aLi2[i].index=i;
			aLi2[i].onmouseover=function()
			{
				aH22[iNow].style.display='block';
				aBox2[iNow].style.display='none';
				
				aH22[this.index].style.display='none';
				aBox2[this.index].style.display='block';
				
				iNow=this.index;
			};
			
		}
		
	};
	</script>
    
    
    
    <div id="wrap">

		<ul>
			<li>    	
			<h2 style="display:none"><span class="sz"><img src="images/yi.jpg" width="20" height="22" /></span><span class="szmc">加拿大北极海参2000g/袋</span></h2>
            <a href="http://www.zhuotop.com">
            <div class="movielist" style="display:block">
            <img src="images/dy2.jpg" />  
            <dl>
            <dt>粤海商品金枪鱼粤海商品</dt>	
            <dd><span>价格：</span><span class="jj_y">¥138.0</span></dd>	
            </dl>
            </div>
            </a>
			</li>
            
            
			<li>
				<h2><span class="sz"><img src="images/er.jpg" width="20" height="22" /></span><span class="szmc">加拿大北极海参2000g/袋</span></h2>
            <a href="http://www.zhuotop.com">
            <div class="movielist" >
            <img src="images/dy2.jpg" />  
            <dl>
            <dt>粤海商品金枪鱼粤海商品</dt>	
            <dd><span>价格：</span><span class="jj_y">¥138.0</span></dd>	
            </dl>
            </div>
            </a>
			</li>
            
			<li>
			<h2><span class="sz"><img src="images/san.jpg" width="20" height="22" /></span><span class="szmc">加拿大北极海参2000g/袋</span></h2>
            <a href="http://www.zhuotop.com">
            <div class="movielist" >
            <img src="images/dy2.jpg" />  
            <dl>
            <dt>粤海商品金枪鱼粤海商品</dt>	
            <dd><span>价格：</span><span class="jj_y">¥138.0</span></dd>	
            </dl>
            </div>
            </a>
			</li>
            
            
			<li>
			<h2><span class="sz"><img src="images/si.jpg" width="20" height="22" /></span><span class="szmc">加拿大北极海参2000g/袋</span></h2>
            <a href="http://www.zhuotop.com">
            <div class="movielist" >
            <img src="images/dy2.jpg" />  
            <dl>
            <dt>粤海商品金枪鱼粤海商品</dt>	
            <dd><span>价格：</span><span class="jj_y">¥138.0</span></dd>	
            </dl>
            </div>
            </a>
			</li>
		</ul>
        
        <div class="dmgg"><a href="#"><img src="images/dmgg.jpg" width="230" height="83" /></a></div>
        
        
	</div>


</div>

<!--左侧1结束-->



<!--右侧开始-->

<div class="con2_yc">


<script type="text/javascript" src="js/jq.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $(".hdpic dd a").hover(function() {
        $(this).find(".picshine").stop();
        $(this).find(".picshine").css("background-position", "-235px 0");
        $(this).find(".picshine").animate({
            backgroundPosition: '235px 0'
        },
        500);
        $(this).find(".pictitle").stop().animate({
            left: '0px'
        },
        {
            queue: false,
            duration: 450
        });
    },
    function() {
        $(this).find(".pictitle").stop().animate({
            left: '-1135px'
        },
        {
            queue: false,
            duration: 200
        });
    });
});
</script>



<div class="hdpic">
  <dl> 
  
  
    <dd> <a href="#" target="_blank"> <img src="image/hong0.jpg" / width="184" height="278">
      <div class="pictitle">
<div class="zz">
      20枚萧亚轩明星美女高清壁枚萧亚美女高清壁枚萧轩明星美女高清壁纸图片纸图片<br />
      <span style="color:#F00; font-size:18px;">本亲价：¥138.0</span>
</div>  
   </div>
      <div class="picshine"></div>
      </a> </dd>
      
      
    
        <dd> <a href="#" target="_blank"> <img src="image/hong1.jpg" / width="184" height="278">
      <div class="pictitle">
<div class="zz">
      20枚萧亚轩明星美女高清壁枚萧亚美女高清壁枚萧轩明星美女高清壁纸图片纸图片<br />
      <span style="color:#F00; font-size:18px;">本亲价：¥138.0</span>
</div>  
   </div>
      <div class="picshine"></div>
      </a> </dd>
      
      
      <dd> <a href="#" target="_blank"> <img src="image/hong2.jpg" / width="184" height="278">
      <div class="pictitle">
<div class="zz">
      20枚萧亚轩明星美女高清壁枚萧亚美女高清壁枚萧轩明星美女高清壁纸图片纸图片<br />
      <span style="color:#F00; font-size:18px;">本亲价：¥138.0</span>
</div>  
   </div>
      <div class="picshine"></div>
      </a> </dd>
    
    
    
    <dd> <a href="#" target="_blank"> <img src="image/hong3.jpg" / width="184" height="278">
      <div class="pictitle">
<div class="zz">
      20枚萧亚轩明星美女高清壁枚萧亚美女高清壁枚萧轩明星美女高清壁纸图片纸图片<br />
      <span style="color:#F00; font-size:18px;">本亲价：¥138.0</span>
</div>  
   </div>
      <div class="picshine"></div>
      </a> </dd>
      
      
    
        <dd> <a href="#" target="_blank"> <img src="image/hong4.jpg" / width="184" height="278">
      <div class="pictitle">
<div class="zz">
      20枚萧亚轩明星美女高清壁枚萧亚美女高清壁枚萧轩明星美女高清壁纸图片纸图片<br />
      <span style="color:#F00; font-size:18px;">本亲价：¥138.0</span>
</div>  
   </div>
      <div class="picshine"></div>
      </a> </dd>
    
    
     
  </dl>
</div>


</div>
<!--右侧结束-->


</div>

</div>


<!--中部蔬菜结束-->

<div class="none" style="height:20px;"></div>

<!--中部水果开始-->

<div class="con2_rl">

<div class="con_dmbt"><span class="dt2_1"><img src="images/dm4.jpg" width="45" height="29" /></span><span class="dt2_2">水果专区</span>
<span class="dt2_3"> <a href="#">更多商品>></a></span>
</div>


<div class="con2_rldk">
<div class="roulei_1"><a href="#"><img src="images/rl1.jpg" width="232" height="328" /></a></div>

<div class="roulei_2">
<div class="rou_gg1"><a href="#"><img src="images/rl2.jpg" width="380" height="126" /></a></div>
<div class="rou_gg1" style="padding-left:10px;"><a href="#"><img src="images/rl3.jpg" width="380" height="126" /></a></div>

<div class="tpl_2" style="margin-left:0px;">
<a href="#"><div class="tpl_2bt">深山放养  野味一族</div><div class="shen_jg">本亲价：¥138.0</div><div class="shen_dt"><img src="images/rl4.jpg" width="180" height="114" /></div></a>
</div>


<div class="tpl_2">
<a href="#"><div class="tpl_2bt">深山放养  野味一族</div><div class="shen_jg">本亲价：¥138.0</div><div class="shen_dt"><img src="images/rl4.jpg" width="180" height="114" /></div></a>
</div>

<div class="tpl_2">
<a href="#"><div class="tpl_2bt">深山放养  野味一族</div><div class="shen_jg">本亲价：¥138.0</div><div class="shen_dt"><img src="images/rl4.jpg" width="180" height="114" /></div></a>
</div>


<div class="tpl_2">
<a href="#"><div class="tpl_2bt">深山放养  野味一族</div><div class="shen_jg">本亲价：¥138.0</div><div class="shen_dt"><img src="images/rl4.jpg" width="180" height="114" /></div></a>
</div>



</div>

<div class="roulei_3"><a href="#"><img src="images/rl6.jpg" width="149" height="333" /></a></div>



</div>




</div>


<!--中部水果结束-->



<!--公司简介、动态开始-->

<div class="con_d">

<!--简介开始-->

<div class="con_jj">
<div class="con_jjbt"><span style="float:left;"><img src="images/gsjj1.jpg" width="107" height="35" /></span><span style="float:right; line-height:35px; color:#669933;"><a href="#"> >> 查看详情</a></span></div>
<div class="con_jjtp"><img src="images/gsjj2.jpg" width="349" height="111" /></div>
<div class="con_jjnr">郑州卓普科技有限公司是一家专业互联网信息技术服务公司，注册资本1000万元，现有专业技术人员20余人。主要从事网站策划、网页设计、网站建设（包括微网站制作、企业展示型网站建设、电子商务型网站建设、行业门户型网站建设、行业门户型网站建设等）、互联网营销等一系列互联网服务，服务站建设等）、互联网营销等一系列互联网服务，服务客户达200多家，涉及教育、物流、医院、餐饮等多第一品牌！</div>

</div>

<!--简介结束-->

<div class="ggbj2"><img src="images/gsjj3.jpg" width="421" height="292" /></div>


<!--公司动态开始-->


<div class="con_jj">
<div class="con_jjbt"><img src="images/gsdt.jpg" width="120" height="35" /></div>
<div class="con_jjtp"><img src="images/dtt.jpg" width="348" height="111" /></div>
<div class="con_jjnr">

<ul>
<li><a href="#" title="郑州卓普科技有限公司是一家专业互联网信息技术服务公司">郑州卓普科技有限公司是一家专业互联网信息技术服务公司</a></li>
<li><a href="#" title="郑州卓普科技有限公司是一家专业互联网信息技术服务公司">郑州卓普科技有限公司是一家专业互联网信息技术服务公司</a></li>
<li><a href="#" title="郑州卓普科技有限公司是一家专业互联网信息技术服务公司">郑州卓普科技有限公司是一家专业互联网信息技术服务公司</a></li>
<li><a href="#" title="郑州卓普科技有限公司是一家专业互联网信息技术服务公司">郑州卓普科技有限公司是一家专业互联网信息技术服务公司</a></li>
<li><a href="#" title="郑州卓普科技有限公司是一家专业互联网信息技术服务公司">郑州卓普科技有限公司是一家专业互联网信息技术服务公司</a></li>
</ul>


</div>

</div>

<!--公司动态结束-->



</div>


<!--公司简介、动态开始结束-->


</div>


<!--中部结束-->

<!--底部开始-->

<div class="footer_ys">
<div class="footer_ys1"></div>
</div>



<!--软文开始-->

<div class="ruanwen">

<ul>
<li class="da">关于本亲</li>
<li><a href="#">公司简介</a></li>
<li><a href="#">联系我们</a></li>
<li><a href="#">友情连接</a></li>
</ul>



<ul>
<li class="da">新手指南</li>
<li><a href="#">账户注册</a></li>
<li><a href="#">购物流程</a></li>
<li><a href="#">注册须知</a></li>
</ul>



<ul>
<li class="da">配送范围及须知</li>
<li><a href="#">配送范围</a></li>
<li><a href="#">配送须知</a></li>
<li><a href="#">配送时间</a></li>
</ul>



<ul>
<li class="da">支付方式</li>
<li><a href="#">货到付款</a></li>
<li><a href="#">在线支付</a></li>
<li><a href="#">其他方式支付</a></li>
</ul>


<ul>
<li class="da">售后服务</li>
<li><a href="#">退换货政策</a></li>
<li><a href="#">退换货办理流程</a></li>
<li><a href="#">退款说明</a></li>
</ul>


<ul>
<li class="da">帮助说明</li>
<li><a href="#">找回密码</a></li>
<li><a href="#">帮助中心</a></li>
<li><a href="#">隐私声明</a></li>
</ul>



</div>


<!--软文结束-->


<!--友情连接开始-->


<div class="links">
<div class="links_main">友情连接：&nbsp;<a href="#">郑州卓普科技</a> &nbsp; | &nbsp; 本亲生活网  &nbsp;|  &nbsp;郑州卓普科技 &nbsp; | &nbsp; 本亲生活网 &nbsp; | &nbsp; 郑州卓普科技 &nbsp; | &nbsp; 本亲生活网 &nbsp; | &nbsp; 郑州卓普科技 &nbsp; |  &nbsp;本亲生活网 &nbsp; |  &nbsp;郑州卓普科技 &nbsp; | &nbsp; 本亲生活网&nbsp;  |&nbsp;  郑州卓普科技  </div>
</div>


<div class="banquan">Copyright © 2014-2019 All Right Reserved 版权所有：本亲生活网 备案号： 豫ICP 450051256-1号<br />

公司地址：郑州市东风路汇宝花园13号楼2单元202室 联系人：高经理 联系电话：13692548036 更多模板：<a href="http://www.mycodes.net/" target="_blank">源码之家</a>

<div class="banquan2"><img src="images/xinr.jpg" width="589" height="51" /></div>

</div>


<!--友情链接结束-->

<!--底部结束-->



</body>
</html>
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  <SCRIPT Language=VBScript><!--

//--></SCRIPT>