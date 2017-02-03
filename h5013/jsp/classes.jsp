<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="/WEB-INF/tld/page.tld" prefix="page"%>
<%@ page import="com.yuyue.util.StringUtils" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.yuyue.util.PageUtils" %>
<%@ page import="com.yuyue.web.jo.MenuJo" %>
<%@ page import="com.yuyue.web.bo.WebLayout" %>
<%@ page import="com.yuyue.web.bo.WebPage" %>
<%@ page import="com.yuyue.web.bo.MenuLevel1" %>
<%@ page import="com.yuyue.web.bo.MenuLevel2" %>
<%@ page import="com.yuyue.web.bo.MenuLevel3" %>
<%@ page import="com.yuyue.web.bo.Element" %>
<%@ page import="com.yuyue.web.bo.Content" %>
<%@ page import="com.yuyue.web.bo.StsContent" %>
<%@ page import="com.yuyue.web.bo.DynContent" %>
<%@ page import="com.yuyue.web.bo.DynElement" %>
<%@ page import="com.yuyue.web.bo.WebApplication" %>

<%
	String contextPath = StringUtils.getContextPath(request.getContextPath());
	request.setAttribute("contextPath",contextPath);
	long appId = Long.parseLong(request.getParameter("id"));
	long menuId = (Long)request.getAttribute("mid");
	
	WebLayout webLayout = WebApplication.getInstance().getAppMap().get(appId);
	List<MenuLevel1> menuList = webLayout.getMenuList(); menuList = PageUtils.filterLangForMenu(menuList, request);
%>
<!DOCTYPE html>
<html xmlns:easy>
<head><%=PageUtils.outEasyhtml5Header(request, response, appId)%>

<meta charset="utf-8">    
<meta name="viewport" content="width=device-width, initial-scale=1.0">


<meta name="description" content="Your description">
<meta name="keywords" content="Your keywords">
<meta name="author" content="Your name">
<!--CSS-->
<link rel="stylesheet" href="${contextPath}/template/h5013/code/css/bootstrap.css" >
<link rel="stylesheet" href="${contextPath}/template/h5013/code/css/style.css">
<link rel="stylesheet" href="${contextPath}/template/h5013/code/css/animate.css">
<link rel="stylesheet" href="${contextPath}/template/h5013/code/css/font-awesome.css">
<!--JS-->
<script src="${contextPath}/template/h5013/code/js/jquery.js"></script>
<script src="${contextPath}/template/h5013/code/js/jquery-migrate-1.2.1.min.js"></script>
<script src="${contextPath}/template/h5013/code/js/jquery.easing.1.3.js"></script>
<script src="${contextPath}/template/h5013/code/js/jquery.mobilemenu.js"></script>
<script src="${contextPath}/template/h5013/code/js/jquery.equalheights.js"></script> 
<script src="${contextPath}/template/h5013/code/js/jquery.ui.totop.js"></script>
<script>
	var $contextPath = "${contextPath}";
</script>
<!--[if (gt IE 9)|!(IE)]><!-->
<script src="${contextPath}/template/h5013/code/js/wow.js"></script>
<script src="${contextPath}/template/h5013/code/js/device.min.js"></script>
<script>
    $(document).ready(function () {       
      if ($('html').hasClass('desktop')) {
        new WOW().init();
      }   
    });
</script>
<!--<![endif]-->
<!--[if lt IE 9]>
    <script src="${contextPath}/template/h5013/code/js/html5shiv.js"></script>
    <script src="${contextPath}/template/h5013/code/js/respond.min.js"></script>

  <![endif]-->
<%=PageUtils.outEasyhtml5Middle(request, response, appId)%></head>
<body>
<!--header-->
<header class="clearfix">
    <div class="container">
        <h1 class="navbar-brand navbar-brand_ wow fadeIn" data-wow-delay="0.2s"><a href="#"><img <%=PageUtils.getLayoutImage(request, 1, "logo.png")%> alt="logo"></a></h1>
       <nav class="navbar navbar-default navbar-static-top tm_navbar clearfix" role="navigation">
			<%
			if(menuList != null && menuList.size() > 0){
			%>
			<ul class="nav sf-menu clearfix">
				<%
					for(MenuLevel1 menuLevel1 : menuList){
				%>
				<li class="<%=menuId==menuLevel1.getId()?"active":""%> <%=menuLevel1.getSubMenuList()!=null?"sub-menu":"" %>">
					<a href="${contextPath}/i<%=appId %>-m<%=menuLevel1.getId()%>.html5"><%=menuLevel1.getName() %></a><%=menuLevel1.getSubMenuList()!=null?"<span class='fa fa-angle-down'></span>":"" %>
				<%
						List<MenuLevel2> submenuList = menuLevel1.getSubMenuList();
						if(submenuList != null && submenuList.size() > 0){
				%>
					<ul class="submenu">
				<%
						for(MenuLevel2 menuLevel2 : submenuList){
				%>
						<li>
							<a href="${contextPath}/i<%=appId %>-m<%=menuLevel2.getId()%>.html5"><%=menuLevel2.getName() %></a><%=menuLevel2.getSubMenuList()!=null?"<span class='fa fa-angle-right'></span>":"" %>
							<%
									List<MenuLevel3> submenu3List = menuLevel2.getSubMenuList();
									if(submenu3List != null && submenu3List.size() > 0){
							%>
							<ul class="submenu">
							<%
									for(MenuLevel3 menuLevel3 : submenu3List){
							%>
								<li>
									<a href="${contextPath}/i<%=appId %>-m<%=menuLevel3.getId()%>.html5">
										 <%=menuLevel3.getName() %>
									</a>
								</li>
							<%			
									}
							%>
									</ul>
							<%			
									}
							%>
						</li>
			<%			
					}
			%>
					</ul>
			<%			
					}
			%>
				</li>
			<%		
				}
			%>
			</ul>
			<%
				}
			%>
		</nav>
    </div>
</header>
<div class="content indent">
    <!--content-->
    <div class="thumb-box9">
        <div class="container">
            <h2 class="wow fadeInRight"><%=PageUtils.getPage(request, 1) %></h2>
            <h3 class="wow fadeIn"><%=PageUtils.getPage(request, 2) %></h3>
            <p class="wow fadeIn"><%=PageUtils.getPage(request, 3) %></p>
            <div class="row">
                <%
					int index = 1;
					DynElement[] dynElementArray = PageUtils.paginationDynList(request, 4);
					for(DynElement dynElement : dynElementArray){
				%>
                <div class="pid-4 col-lg-4 col-md-4 col-sm-4 wow fadeInLeft" data-wow-delay="0.2s">
                    <h4><%=dynElement.getInput_1() %></h4>
                    <div class="thumb-pad3">
                        <div class="thumbnail">
                            <figure><img src="<%=dynElement.getImage_1()%>" alt=""></figure>
                            <div class="caption">
                                <p><%=dynElement.getText_1() %></p>
                                <%
									if(dynElement.getInput_3() != null && !dynElement.getInput_3().isEmpty()){
								%>
									<a href="#" class="btn-default btn3"><%=dynElement.getInput_3()%></a>
								<%		
									}
								%>
                            </div>  
                        </div>
                    </div>
                </div>
                <%				index++;
					}
				%>
            </div>
        </div>
    </div>
    <div id="h5-bgvideo-section"></div>
    <div class="thumb-box2 indent">
        <div class="container">
            <h2 class="indent wow fadeInRight"><%=PageUtils.getPage(request, 5) %></h2>
            <div class="row">
                <%
					index = 1;
					dynElementArray = PageUtils.paginationDynList(request, 6);
					for(DynElement dynElement : dynElementArray){
				%>
                <div class="pid-6 col-lg-4 col-md-4 wow fadeInLeft" data-wow-delay="0.2s">
                    <h3><a href="#"><%=dynElement.getInput_1() %></a></h3>
                    <p><%=dynElement.getText_1() %></p>
                </div>
                <%				index++;
					}
				%>
                <div class="clearfix"></div>
            </div>
            <a href="#" class="btn-default btn3 wow fadeInRight"><%=PageUtils.getPage(request, 7) %></a>
        </div>
    </div>
</div>
<!--footer-->
<footer>
    <div class="container">
        <p class="wow fadeInUp"><%=PageUtils.getLayout(request, 2) %> | 云服务商：<a href="<%=PageUtils.getSupportLink(request)%>" target="_blank">H5建站云</a></p>
    </div>
</footer>
<script src="${contextPath}/template/h5013/code/js/bootstrap.min.js"></script>
<script src="${contextPath}/template/h5013/code/js/tm-scripts.js"></script>
<%=PageUtils.outEasyhtml5Footer(request, response, appId)%></body>
</html>

