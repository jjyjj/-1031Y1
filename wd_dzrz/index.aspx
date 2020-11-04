<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="MarketInfo.wd_dzrz.index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>
        <%=System.Configuration.ConfigurationManager.ConnectionStrings["TitleString"].ConnectionString%>
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="lib/assets/css/bootstrap.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="lib/assets/css/font-awesome.min.css" />
    <link rel="stylesheet" href="lib/assets/css/ace.min.css" />
    <link href="assets/css/ace.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="lib/assets/css/ace-rtl.min.css" />
    <link rel="stylesheet" href="lib/assets/css/ace-skins.min.css" />
    <link rel="stylesheet" href="lib/css/style.css" />
    <script type="text/javascript" src="lib/assets/js/ace-extra.min.js"></script>
    <script type="text/javascript" src="lib/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript">
        if ("ontouchend" in document) document.write("<script src='lib/assets/js/jquery.mobile.custom.min.js'>" + "<" + "script>");
    </script>
    <script src="lib/assets/js/bootstrap.min.js"></script>
    <script src="lib/assets/js/typeahead-bs2.min.js"></script>
    <script src="lib/assets/js/ace-elements.min.js"></script>
    <script src="lib/assets/js/ace.min.js"></script>
    <script src="lib/assets/layer/layer.js" type="text/javascript"></script>
    <script src="lib/assets/laydate/laydate.js" type="text/javascript"></script>
    <script src="lib/js/jquery.nicescroll.js" type="text/javascript"></script>
    <script type="text/javascript">	
        $(function () {
            var cid = $('#nav_list> li>.submenu');
            cid.each(function (i) {
                $(this).attr('id', "Sort_link_" + i);

            })
        })
        jQuery(document).ready(function () {
            $.each($(".submenu"), function () {
                var $aobjs = $(this).children("li");
                var rowCount = $aobjs.size();
                var divHeigth = $(this).height();
                $aobjs.height(divHeigth / rowCount);
            });
            //初始化宽度、高度

            $("#main-container").height($(window).height() - 76);
            $("#iframe").height($(window).height() - 140);

            $(".sidebar").height($(window).height() - 99);
            var thisHeight = $("#nav_list").height($(window).outerHeight() - 173);
            $(".submenu").height();
            $("#nav_list").children(".submenu").css("height", thisHeight);

            //当文档窗口发生改变时 触发  
            $(window).resize(function () {
                $("#main-container").height($(window).height() - 76);
                $("#iframe").height($(window).height() - 140);
                $(".sidebar").height($(window).height() - 99);

                var thisHeight = $("#nav_list").height($(window).outerHeight() - 173);
                $(".submenu").height();
                $("#nav_list").children(".submenu").css("height", thisHeight);
            });
            $(document).on('click', '.iframeurl', function () {
                var cid = $(this).attr("name");
                var cname = $(this).attr("title");
                $("#iframe").attr("src", cid).ready();
                $("#Bcrumbs").attr("href", cid).ready();
                $(".Current_page a").attr('href', cid).ready();
                $(".Current_page").attr('name', cid);
                $(".Current_page").html(cname).css({ "color": "#333333", "cursor": "default" }).ready();
                $("#parentIframe").html('<span class="parentIframe iframeurl"> </span>').css("display", "none").ready();
                $("#parentIfour").html('').css("display", "none").ready();
            });



        });
        /******/
        $(document).on('click', '.link_cz > li', function () {
            $('.link_cz > li').removeClass('active');
            $(this).addClass('active');
        });

        /*********************点击事件*********************/
        $(document).ready(function () {
            $('#nav_list,.link_cz').find('li.home').on('click', function () {
                $('#nav_list,.link_cz').find('li.home').removeClass('active');
                $(this).addClass('active');
            });
            //时间设置
            function currentTime() {
                var d = new Date(), str = '';
                str += d.getFullYear() + '年';
                str += d.getMonth() + 1 + '月';
                str += d.getDate() + '日';
                str += d.getHours() + '时';
                str += d.getMinutes() + '分';
                str += d.getSeconds() + '秒';
                return str;
            }

            setInterval(function () { $('#time').html(currentTime) }, 1000);
            //修改密码
            $('.change_Password').on('click', function () {
                layer.open({
                    type: 1,
                    title: '修改密码',
                    area: ['300px', '300px'],
                    shadeClose: true,
                    content: $('#change_Pass'),
                    btn: ['确认修改'],
                    yes: function (index, layero) {
                        if ($("#password").val() == "") {
                            layer.alert('原密码不能为空!', {
                                title: '提示框',
                                icon: 0,

                            });
                            return false;
                        }
                        if ($("#Nes_pas").val() == "") {
                            layer.alert('新密码不能为空!', {
                                title: '提示框',
                                icon: 0,

                            });
                            return false;
                        }

                        if ($("#c_mew_pas").val() == "") {
                            layer.alert('确认新密码不能为空!', {
                                title: '提示框',
                                icon: 0,

                            });
                            return false;
                        }
                        if (!$("#c_mew_pas").val || $("#c_mew_pas").val() != $("#Nes_pas").val()) {
                            layer.alert('密码不一致!', {
                                title: '提示框',
                                icon: 0,

                            });
                            return false;
                        }
                        else {
                            layer.alert('修改成功！', {
                                title: '提示框',
                                icon: 1,
                            });
                            layer.close(index);
                        }
                    }
                });
            });
            $('#Exit_system').on('click', function () {
                layer.confirm('是否确定退出系统？', {
                    btn: ['是', '否'],//按钮
                    icon: 2,
                },
                    function () {
                        location.href = "wd_LoginOut.aspx";

                    });
            });
        });
        function link_operating(name, title) {
            var cid = $(this).name;
            var cname = $(this).title;
            $("#iframe").attr("src", cid).ready();
            $("#Bcrumbs").attr("href", cid).ready();
            $(".Current_page a").attr('href', cid).ready();
            $(".Current_page").attr('name', cid);
            $(".Current_page").html(cname).css({ "color": "#333333", "cursor": "default" }).ready();
            $("#parentIframe").html('<span class="parentIframe iframeurl"> </span>').css("display", "none").ready();
            $("#parentIfour").html('').css("display", "none").ready();


        }
    </script>
</head>
<body>
    <form id="Form1" runat="server">
        <div class="navbar navbar-default" id="navbar">
            <script type="text/javascript">
                try { ace.settings.check('navbar', 'fixed') } catch (e) { }
            </script>
            <div class="navbar-container" id="navbar-container">
                <div class="navbar-header pull-left">
                    <a href="#" class="navbar-brand">
                        <small>
                            <i class="fa fa-leaf"></i>
                            &nbsp;&nbsp;&nbsp;
                            电子日志系统
                        </small>
                    </a>
                </div>
                <!-- /.navbar-header -->

                <div class="navbar-header pull-right" role="navigation">
                    <ul class="nav ace-nav">
                        <li class="purple dropdown-modal">
                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                <i class="ace-icon fa fa-bell icon-animated-bell"></i>
                                <span class="badge badge-important">8</span>
                            </a>

                            <ul class="dropdown-menu-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
                                <li class="dropdown-header">
                                    <i class="ace-icon fa fa-exclamation-triangle"></i>
                                    2 待审批
                                </li>

                                <li class="dropdown-content">
                                    <ul class="dropdown-menu dropdown-navbar navbar-pink">
                                        <li>
                                            <a href="#">
                                                <div class="clearfix">
                                                    <span class="pull-left">
                                                        <i class="btn btn-xs no-hover btn-pink fa fa-comment"></i>
                                                        未读
                                                    </span>
                                                    <span class="pull-right badge badge-info">+12</span>
                                                </div>
                                            </a>
                                        </li>



                                        <li>
                                            <a href="#">
                                                <div class="clearfix">
                                                    <span class="pull-left">
                                                        <i class="btn btn-xs btn-primary fa fa-user"></i>
                                                        休假人数
                                                    </span>
                                                    <span class="pull-right badge badge-success">+8</span>
                                                </div>
                                            </a>
                                        </li>

                                    </ul>
                                </li>


                            </ul>
                        </li>

                        <%--					<li class="green dropdown-modal">
							<a data-toggle="dropdown" class="dropdown-toggle" href="#">
								<i class="ace-icon fa fa-envelope icon-animated-vertical"></i>
								<span class="badge badge-success">5</span>
							</a>

							<ul class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">
								<li class="dropdown-header">
									<i class="ace-icon fa fa-envelope-o"></i>
									5 信息
								</li>

								<li class="dropdown-content">
									<ul class="dropdown-menu dropdown-navbar">
										<li>
											<a href="#" class="clearfix">
												
												<span class="msg-body">
													<span class="msg-title">
														<span class="blue">Alex:</span>
														Ciao sociis natoque penatibus et auctor ...
													</span>

													<span class="msg-time">
														<i class="ace-icon fa fa-clock-o"></i>
														<span>a moment ago</span>
													</span>
												</span>
											</a>
										</li>
										<li>
											<a href="#" class="clearfix">
												
												<span class="msg-body">
													<span class="msg-title">
														<span class="blue">Susan:</span>
														Vestibulum id ligula porta felis euismod ...
													</span>

													<span class="msg-time">
														<i class="ace-icon fa fa-clock-o"></i>
														<span>20 minutes ago</span>
													</span>
												</span>
											</a>
										</li>

									</ul>
								</li>
							</ul>
						</li>--%>

                        <li class="light-blue"><a data-toggle="dropdown" href="#" class="dropdown-toggle">
                            <%--<span class="time"><em id="time"></em></span>--%><span class="user-info"><small>欢迎光临,</small><asp:Label
                                ID="m_curuser" runat="server" Text=""></asp:Label></span> <i class="icon-caret-down"></i></a>
                            <ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                                <li><a href="javascript:void(0)" name="../wd_user/wd_upinfo.aspx" title="个人信息" class="iframeurl">
                                    <i class="icon-user"></i>个人资料</a></li>
                                <li class="divider"></li>

                                <li><a href="javascript:ovid(0)" id="Exit_system"><i class="icon-off"></i>退出</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="main-container" id="main-container">
            <script type="text/javascript">
                try { ace.settings.check('main-container', 'fixed') } catch (e) { }
            </script>
            <div class="main-container-inner">
                <a class="menu-toggler" id="menu-toggler" href="#"><span class="menu-text"></span>
                </a>
                <div class="sidebar" id="sidebar">
                    <script type="text/javascript">
                        try { ace.settings.check('sidebar', 'fixed') } catch (e) { }
                    </script>
                    <div class="sidebar-shortcuts" id="sidebar-shortcuts">
                        <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
                            <a class="btn btn-success">
                                <i class="icon-signal"></i>
                            </a>

                            <a class="btn btn-info">
                                <i class="icon-pencil"></i>
                            </a>

                            <a class="btn btn-warning">
                                <i class="icon-group"></i>
                            </a>

                            <a class="btn btn-danger">
                                <i class="icon-cogs"></i>
                            </a>
                        </div>

                        <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
                            <span class="btn btn-success"></span>

                            <span class="btn btn-info"></span>

                            <span class="btn btn-warning"></span>

                            <span class="btn btn-danger"></span>
                        </div>
                    </div>
                    <!-- #sidebar-shortcuts -->
                    <div id="menu_style" class="menu_style">
                        <ul class="nav nav-list" id="nav_list">
                            <li class="home"><a href="javascript:void(0)" name="index.aspx" class="iframeurl"
                                title=""><i class="icon-home"></i><span class="menu-text">系统首页 </span></a></li>
                            <li><a href="#" class="dropdown-toggle"><i class="icon-desktop"></i><span class="menu-text">业务申报 </span><b class="arrow icon-angle-down"></b></a>
                                <ul class="submenu">
                                    <li class="home"><a href="javascript:void(0)" name="wd_ywsb.aspx" title="业务申报"
                                        class="iframeurl"><i class="icon-double-angle-right"></i>业务申报</a></li>
                                </ul>
                            </li>
                            <li><a href="#" class="dropdown-toggle"><i class="icon-comments-alt"></i><span class="menu-text">业务审批 </span><b class="arrow icon-angle-down"></b></a>
                                <ul class="submenu">
                                    <li class="home"><a href="javascript:void(0)" name="wd_xiujia.aspx"
                                        title="休假统计" class="iframeurl"><i class="icon-double-angle-right"></i>休假统计</a></li>
                                    <li class="home"><a href="javascript:void(0)" name="wd_xiujia.aspx" title="公出统计"
                                        class="iframeurl"><i class="icon-double-angle-right"></i>公出统计</a></li>
                                    <li class="home"><a href="javascript:void(0)" name="wd_xiujia.aspx" title="在岗统计" class="iframeurl">
                                        <i class="icon-double-angle-right"></i>在岗统计</a></li>
                                </ul>
                            </li>

                            <li><a href="#" class="dropdown-toggle"><i class="icon-list"></i><span class="menu-text">系统设置 </span><b class="arrow icon-angle-down"></b></a>
                                <ul class="submenu">
                                    <li class="home"><a href="javascript:void(0)" name="zyqlist.aspx" title="用户管理"
                                        class="iframeurl"><i class="icon-double-angle-right"></i>单位管理</a></li>
                                    <li class="home"><a href="javascript:void(0)" name="userslist.aspx" title="修改密码"
                                        class="iframeurl"><i class="icon-double-angle-right"></i>用户管理</a></li>

                                    <li class="home"><a href="javascript:void(0)" name="../wd_user/wd_upinfo.aspx" title="修改密码"
                                        class="iframeurl"><i class="icon-double-angle-right"></i>修改密码</a></li>
                                </ul>
                            </li>

                        </ul>
                    </div>
                    <script type="text/javascript">
                        $("#menu_style").niceScroll({
                            cursorcolor: "#888888",
                            cursoropacitymax: 1,
                            touchbehavior: false,
                            cursorwidth: "5px",
                            cursorborder: "0",
                            cursorborderradius: "5px"
                        });
                    </script>
                    <div class="sidebar-collapse" id="sidebar-collapse">
                        <i class="icon-double-angle-left" data-icon1="icon-double-angle-left" data-icon2="icon-double-angle-right"></i>
                    </div>
                    <script type="text/javascript">
                        try { ace.settings.check('sidebar', 'collapsed') } catch (e) { }
                    </script>
                </div>
                <div class="main-content">
                    <script type="text/javascript">
                        try { ace.settings.check('breadcrumbs', 'fixed') } catch (e) { }
                    </script>
                    <div class="breadcrumbs" id="breadcrumbs">
                        <ul class="breadcrumb" style="position: absolute; top: 8px; left: 5px">
                            <li><i class="icon-home home-icon"></i><a href="#">首页</a> </li>
                            <li class="active"><span class="Current_page iframeurl"></span></li>
                            <li class="active" id="parentIframe"><span class="parentIframe iframeurl"></span>
                            </li>
                            <li class="active" id="parentIfour"><span class="parentIfour iframeurl"></span></li>
                        </ul>
                    </div>
                    <iframe id="iframe" style="border: 0; width: 100%; background-color: #FFF;" name="iframe"
                        frameborder="0" src="wd_ywsb.aspx"></iframe>
                    <!-- /.page-content -->
                </div>
                <!-- /.main-content -->
            </div>
            <!-- /.main-container-inner -->
        </div>
        <!--底部样式-->
        <div class="footer_style" id="footerstyle">
            <script type="text/javascript">    try { ace.settings.check('footerstyle', 'fixed') } catch (e) { }</script>
            <p class="l_f">
                版权所有：中石油管道有限责任公司西气东输分公司
            </p>
            <p class="r_f">
                技术支持：景观地理空间信息研究院 服务电话：037165358139
            </p>
        </div>
    </form>
</body>
</html>
