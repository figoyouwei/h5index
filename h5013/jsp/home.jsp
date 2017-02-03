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
<link rel="stylesheet" href="${contextPath}/template/h5013/code/css/camera.css">
<link rel="stylesheet" href="${contextPath}/template/h5013/code/css/contact-form.css">
<link rel="stylesheet" href="${contextPath}/template/h5013/code/css/touchTouch.css">
<link rel="stylesheet" href="${contextPath}/template/h5013/code/css/font-awesome.css">
<!--JS-->
<script src="${contextPath}/template/h5013/code/js/jquery.js"></script>
<script src="${contextPath}/template/h5013/code/js/jquery-migrate-1.2.1.min.js"></script>
<script src="${contextPath}/template/h5013/code/js/jquery.easing.1.3.js"></script>
<script src="${contextPath}/template/h5013/code/js/jquery.mobilemenu.js"></script>
<script src="${contextPath}/template/h5013/code/js/jquery.equalheights.js"></script> 
<script src="${contextPath}/template/h5013/code/js/camera.js"></script>
<!--[if (gt IE 9)|!(IE)]><!-->
<script src="${contextPath}/template/h5013/code/js/jquery.mobile.customized.min.js"></script>
<!--<![endif]-->
<script src="${contextPath}/template/h5013/code/js/TMForm.js"></script>
<script src="${contextPath}/template/h5013/code/js/modal.js"></script>  
<script src="${contextPath}/template/h5013/code/js/bootstrap-filestyle.js"></script>
<script src="${contextPath}/template/h5013/code/js/jquery.carouFredSel-6.1.0-packed.js"></script> 
<script src="${contextPath}/template/h5013/code/js/jquery.touchSwipe.min.js"></script> 
<script src='${contextPath}/template/h5013/code/js/js'></script>
<script src="${contextPath}/template/h5013/code/js/touchTouch.jquery.js"></script>
<script>
    $(document).ready(function(){
        jQuery('.camera_wrap').camera();
    });
</script>
<script>
   $(window).load(function() {
     // Initialize the gallery
    $('.carousel1 figure a').touchTouch();
  });
</script>
<script>
    $(window).load(function() {
        $(function() {
            $('#foo1').carouFredSel({
				auto: false,
				responsive: true,
				width: '100%',
				scroll: 1,
                prev: '#prev1',
				next: '#next1',
				items: {
					height: 'auto',
					width:320,
					visible: {
						min: 1,
						max: 3
					}
				},
				mousewheel: true,
				swipe: {
					onMouse: true,
					onTouch: true
				}
			});
		});  	 				
      });
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
<script>
	var $contextPath = "${contextPath}";
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
<div class="slider">  
    <div class="camera_wrap" id="pid-1">
        <%
        	List<String> sliders = PageUtils.getPageMultiImage(request, 1, "data-src");
        	if(sliders != null){
        		if(sliders.size()==1){
        %>
        <div <%=sliders.get(0) %>></div>
        <div <%=sliders.get(0) %>></div>
        <%
        		}else{
        			for(String slider : sliders){
        %>
            <div <%=slider%>></div>
        <% 			
        			}
        		}
        	}
        %>
    </div>
</div>
<!--content-->
<div class="content"> 
    <div class="thumb-box1">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 wow fadeInLeft" data-wow-delay="0.2s">
                    <p class="title"><%=PageUtils.getPage(request, 2) %></p>
                </div>
                <%
					int index = 1;
					DynElement[] dynElementArray = PageUtils.paginationDynList(request, 3);
					for(DynElement dynElement : dynElementArray){
				%>
                <div class="pid-3 col-lg-4 wow fadeInLeft" data-wow-delay="0.1s">
                    <strong><%=StringUtils.stringLess(dynElement.getInput_1(), 4)%></strong>
                    <div class="extra-wrap">
                        <p><%=dynElement.getInput_2() %></p>
                    </div>
                </div>
                <%				index++;
					}
				%>
            </div>
        </div>
    </div>
    <div class="thumb-box2">
        <div class="container">
            <h2 class="indent wow fadeInRight"><%=PageUtils.getPage(request, 4) %></h2>
            <div class="row">
                <%
					index = 1;
					dynElementArray = PageUtils.paginationDynList(request, 5);
					for(DynElement dynElement : dynElementArray){
				%>
                <div class="pid-5 col-lg-4 col-md-4 wow fadeInLeft" data-wow-delay="0.2s">
                    <h3><a href="#"><%=dynElement.getInput_1() %></a></h3>
                    <p><%=dynElement.getText_1() %></p>
                </div>
                <%				index++;
					}
				%>
                <div class="clearfix"></div>
            </div>
            <a href="#" class="btn-default btn3 wow fadeInRight"><%=PageUtils.getPage(request, 6) %></a>
        </div>
    </div>
    <div class="thumb-box3">
        <div class="container">
            <h2 class="indent wow fadeInRight"><%=PageUtils.getPage(request, 7) %></h2>
            <div class="row">
                <%
					index = 1;
					dynElementArray = PageUtils.paginationDynList(request, 8);
					for(DynElement dynElement : dynElementArray){
				%>
                <div class="pid-8 col-lg-3 col-md-3 col-sm-6 col-xs-6 wow fadeInLeft" data-wow-delay="0.<%=4-index %>s">
                    <div class="thumb-pad1">
                        <div class="thumbnail">
                            <figure><img src="<%=dynElement.getImage_1()%>" alt=""></figure>
                            <div class="caption">
                                <h3><%=dynElement.getInput_1() %></h3>
                                <p><%=dynElement.getInput_2() %></p>
                                <%
									if(dynElement.getInput_3() != null && !dynElement.getInput_3().isEmpty()){
								%>
									<a href="#" class="btn-default btn1"><%=dynElement.getInput_3()%></a>
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
    <div class="thumb-box4">
        <div class="container">
            <h2 class="indent wow fadeInRight"><%=PageUtils.getPage(request, 9) %></h2>
            <div class="list_carousel1 responsive clearfix wow fadeInUp" id="pid-10">
                <div class="list_btn1">
                    <a id="prev1" class="prev" href="#"></a>
                    <a id="next1" class="next" href="#"></a>
                </div>
                <ul id="foo1" class="carousel1">
                    <%
						index = 1;
						dynElementArray = PageUtils.paginationDynList(request, 10);
						for(DynElement dynElement : dynElementArray){
							String image1 = dynElement.getImage_1();
					%>
                    <li>
                        <figure><a href="<%=image1%>"><i></i><img src="<%=image1%>" alt=""></a></figure>
                    </li>
                    <%				index++;
						}
					%>
                </ul>
                
            </div>
        </div>
    </div>
    <div class="thumb-box6 wow fadeIn">
        <div class="container">
            <figure><i class="<%=PageUtils.getPage(request, 11)%>"></i></figure>
            <p><%=PageUtils.getPage(request, 12)%></p>
        </div>
    </div>
    <div class="thumb-box7">
        <div class="container">
            <h2 class="indent wow fadeInRight"><%=PageUtils.getPage(request, 13) %></h2>
            <div class="row">
                <%
					index = 1;
					dynElementArray = PageUtils.paginationDynList(request, 14);
					for(DynElement dynElement : dynElementArray){
				%>
                <div class="pid-14 col-lg-4 col-md-4 col-sm-4 wow fadeInLeft" data-wow-delay="0.<%=3-index %>s">
                    <div class="thumb-pad2">
                        <div class="thumbnail">
                            <figure><img src="<%=dynElement.getImage_1()%>" alt=""></figure>
                            <div class="caption">
                                <hr>
                                <time datetime="2014-01-01"><%=dynElement.getDate_1() %></time>
                                <div class="box maxheight">
                                    <a href="#"><%=dynElement.getInput_1() %></a>
                                    <p><%=dynElement.getInput_2() %></p>
                                </div>
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
    <div class="thumb-box5">
        <div class="container">
            <h2 class="indent wow fadeInRight"><%=PageUtils.getPage(request, 15) %></h2>
            <div class="contactForm2">
                <form id="contact-form" class="s-form">
                  <input type="hidden" class="s-field" name="appId" value="${param.id}">
                  <div class="contact-form-loader"></div>
                      <fieldset>
                        <label class="name form-div-1">
                          <input class="s-field" required="true" msg="姓名" type="text" name="name" placeholder="* 姓名:" value="" data-constraints="@Required @JustLetters"  />
                        </label>
                        <label class="email form-div-2">
                          <input class="s-field" required="true" msg="邮箱" type="text" name="email" placeholder="* 邮箱:" value="" data-constraints="@Required @Email" />
                        </label>
                        <label class="phone form-div-3">
                          <input class="s-field" numeric="true" msg="电话" type="text" name="phone" placeholder="电话:" value="" data-constraints="@Required @JustNumbers" />
                        </label>
                        <label class="message form-div-4">
                          <textarea class="s-field" required="true" msg="留言内容" name="message" placeholder="* 留言内容:" data-constraints='@Required @Length(min=20,max=999999)'></textarea>
                        </label>
                        <!-- <label class="recaptcha"><span class="empty-message">*This field is required.</span></label> -->
                        <div class="btns">
                            <a href="#" data-type="submit" class="btn-default btn3 s-btn" proxy="ContactProxy" cbalert="提交成功" cbfail="提交失败">提交</a>
                        </div>
                      </fieldset> 
                </form>
            </div>
     </div>
</div>
<section class="content_map">
      <div class="useso-map-api"> 
        <div id="map-canvas" class="gmap">
        	<%=PageUtils.getPage(request, 16) %>
        </div> 
      </div> 
</section>
</div>
<!--footer-->
<footer>
    <div class="container">
        <p class="wow fadeInUp"><%=PageUtils.getLayout(request, 2) %> | 云服务商：<a href="<%=PageUtils.getSupportLink(request)%>" target="_blank">H5建站云</a></p>
    </div>
</footer>
<script src="${contextPath}/template/h5013/code/js/bootstrap.min.js"></script>
<script src="${contextPath}/template/h5013/code/js/tm-scripts.js"></script>
<script type="text/javascript"></script>
<%=PageUtils.outEasyhtml5Footer(request, response, appId)%></body>
</html>

