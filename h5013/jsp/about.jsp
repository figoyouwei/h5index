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
<meta name = "format-detection" content = "telephone=no" />
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
                <div class="who-box">
                    <div class="container">
                    <div class="row">
                        <div class="col-lg-4 col-md-6 col-sm-6 wow fadeInLeft" data-wow-delay="0.2s">
                            <h2><%=PageUtils.getPage(request, 1) %></h2>
                            <div class="thumb-pad4">
                                <div class="thumbnail">
                                    <figure><img <%=PageUtils.getPage(request, 2) %> alt=""></figure>
                                    <div class="caption">
                                        <h3><%=PageUtils.getPage(request, 3) %></h3>
                                        <p><%=PageUtils.getPage(request, 4) %></p>
                                        <a href="#" class="btn-default btn3"><%=PageUtils.getPage(request, 5) %></a>
                                    </div>  
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6 wow fadeInLeft" data-wow-delay="0.1s">
                            <h2><%=PageUtils.getPage(request, 6) %></h2>
                            <ul class="list4">
                                <%
									int index = 1;
									DynElement[] dynElementArray = PageUtils.paginationDynList(request, 7);
									for(DynElement dynElement : dynElementArray){
								%>
                                <li class="pid-7">
                                    <time datetime="<%=dynElement.getDate_1() %>"><a href="#"><%=dynElement.getInput_1() %></a></time>
                                    <p><%=dynElement.getText_1() %></p>
                                </li>
                                <%				index++;
									}
								%>
                            </ul>
                        </div>
                        <div class="col-lg-4 col-md-12 col-sm-12 wow fadeInLeft">
                            <h2><%=PageUtils.getPage(request, 8) %></h2>
                            <p><%=PageUtils.getPage(request, 9) %></p>
                            <ul class="list5" id="pid-10">
                                <%
									index = 1;
									dynElementArray = PageUtils.paginationDynList(request, 10);
									for(DynElement dynElement : dynElementArray){
								%>
                                <li><a href="#"><%=dynElement.getInput_1() %></a></li>
                                <%				index++;
									}
								%>
                            </ul>
                        </div>
                    </div>
                    </div>
                </div>
                <div id="h5-bgvideo-section"></div>
                <div class="thumb-box3 indent">
                    <div class="container">
                        <h2 class="indent wow fadeInRight"><%=PageUtils.getPage(request, 11) %></h2>
                        <div class="row">
                            <%
								index = 1;
								dynElementArray = PageUtils.paginationDynList(request, 12);
								for(DynElement dynElement : dynElementArray){
							%>
                            <div class="pid-12 col-lg-3 col-md-3 col-sm-6 col-xs-6 wow fadeInLeft" data-wow-delay="0.<%=4-index %>s">
                                <div class="thumb-pad1">
                                    <div class="thumbnail">
                                        <figure><img src="<%=dynElement.getImage_1()%>" alt=""></figure>
                                        <div class="caption">
                                            <h3><a href="#"><%=dynElement.getInput_1() %></a></h3>
                                            <p><%=dynElement.getInput_2() %></p>
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
                <div class="thumb-box8">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-sm-6 wow fadeInUp">
                                <h2><%=PageUtils.getPage(request, 13) %></h2>
                                <ul class="list7">
                                <%
									index = 1;
									dynElementArray = PageUtils.paginationDynList(request, 14);
									for(DynElement dynElement : dynElementArray){
								%>
                                <li class="pid-14">
                                    <strong><span><%=dynElement.getInput_1() %></span></strong>
                                    <p><%=dynElement.getText_1() %></p>
                                </li>
                                <%				index++;
									}
								%>
                            </ul>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-6 wow fadeInUp" data-wow-delay="0.1s">
                                <h2><%=PageUtils.getPage(request, 15) %></h2>
                                <p><%=PageUtils.getPage(request, 16) %></p>
                                <ul class="list5" id="pid-17">
                                    <%
										index = 1;
										dynElementArray = PageUtils.paginationDynList(request, 17);
										for(DynElement dynElement : dynElementArray){
									%>
                                    <li><a href="#"><%=dynElement.getInput_1() %></a></li>
                                    <%				index++;
										}
									%>
                                </ul>
                            </div>
                            <div class="col-lg-4 col-md-12 col-sm-12 wow fadeInUp" data-wow-delay="0.2s">
                                <h2><%=PageUtils.getPage(request, 18) %></h2>
                                <ul class="list2">
                                    <%
										index = 1;
										dynElementArray = PageUtils.paginationDynList(request, 19);
										for(DynElement dynElement : dynElementArray){
									%>
                                    <li class="pid-19">
                                        <figure><img src="${contextPath}/template/h5013/code/images/quote.png" alt=""></figure>
                                        <p><%=dynElement.getText_1() %></p>
                                        <h3><%=dynElement.getInput_1() %></h3>
                                        <a href="#"><%=dynElement.getInput_2() %></a>
                                    </li>
                                    <%				index++;
										}
									%>
                                </ul>
                            </div>
                        </div>
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

