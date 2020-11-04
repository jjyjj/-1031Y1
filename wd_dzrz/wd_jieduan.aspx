<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wd_jieduan.aspx.cs" Inherits="MarketInfo.wd_dzrz.wd_jieduan" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<title>管理处</title>
		<meta name="description" content="frequently asked questions using tabs and accordions" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
		<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
		<link rel="stylesheet" href="assets/font-awesome/4.5.0/css/font-awesome.min.css" />
		<link rel="stylesheet" href="assets/css/fonts.googleapis.com.css" />

		<!-- ace styles -->
		<link rel="stylesheet" href="assets/css/ace.min.css" class="ace-main-stylesheet" id="main-ace-style" />

		<!--[if lte IE 9]>
			<link rel="stylesheet" href="assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->
		<link rel="stylesheet" href="assets/css/ace-skins.min.css" />
		<link rel="stylesheet" href="assets/css/ace-rtl.min.css" />


    <link href="css/jquery.mobile-1.4.5.min.css" rel="stylesheet" type="text/css" />
    <link href="css/mui.min.css" rel="stylesheet" type="text/css" />
		
		<script src="assets/js/ace-extra.min.js"></script>

		<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

		<!--[if lte IE 8]>
		<script src="assets/js/html5shiv.min.js"></script>
		<script src="assets/js/respond.min.js"></script>
		<![endif]-->
<style type="text/css">
.div_f{float:left; width:90px; font-size:13px; margin: 3px 0;}
.fa-chanzi{ background:url(../css/icon_chanzi.jpg) center -20px no-repeat; background-size:53%; display:block; height:50px;}
.fa-wajueji{ background:url(../css/icon_wjj.jpg) center -7px no-repeat; background-size:contain; display:block; height:50px;}
</style>
	</head> 
	<body class="no-skin">
    <form id="Form1" runat="server">
		<div class="main-container ace-save-state" id="main-container">
			<script type="text/javascript">
			    try { ace.settings.loadState('main-container') } catch (e) { }
			</script>
			<div class="main-content">
				<div class="main-content-inner">
					<div class="page-content">						
						<div class="page-header">
							<h4>
								业务申报
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									阶段性工作
								</small>
							</h4>
						</div><!-- /.page-header -->
						<div class="row">
                             <h3 class="header smaller lighter blue">
                                        <a class="btn btn-info" href="wd_ywsb.aspx"><i class="ace-icon fa fa-reply icon-only">
                                        </i>&nbsp;返回</a>
                                    </h3>
							<div class="col-xs-12">
                              
								<!-- PAGE CONTENT BEGINS -->
								<div class="tabbable">
									<div class="tab-content no-border padding-24">
								
										
										<div id="faq-tab-3"  class="tab-pane fade in active">
											
											
											<div id="faq-list-3" class="panel-group accordion-style1 accordion-style2">
											
                                            	<div class="center" style=" overflow:inherit;">                                              
                                               <div class="div_f">
												<a class="btn btn-app btn-sm btn-warning no-hover" href="szff.aspx" style=" height:60px; ">		
                                                <i class="ace-icon fa  fa-book bigger-230"></i>																							
												</a>
                                                <span class="line-height-1 smaller-90">三桩费发放 </span>
                                                </div>
                                                <div class="div_f">
												<a class="btn btn-app btn-sm btn-success no-hover" href="wd_guandao_fc.aspx" style=" height:60px; ">		
                                                <i class="ace-icon fa  fa-download bigger-230"></i>																							
												</a>
                                                <span class="line-height-1 smaller-90">管道光缆复测 </span>
                                                </div>
                                                 <div class="div_f">
												<a class="btn btn-app btn-sm btn-light no-hover" href="wd_fangxungl.aspx" style=" height:60px; ">		
                                                <i class="ace-icon glyphicon glyphicon-signal bigger-230"></i>																							
												</a>
                                                <span class="line-height-1 smaller-90">防汛管理 </span>
                                                </div>
											</div>                                                
										</div>
									</div>                                      
									</div>
								</div>

								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->
					</div><!-- /.page-content -->
				</div>
               
			</div><!-- /.main-content -->

			<div class="footer">
				<div class="footer-inner">
					<div class="footer-content">
						<span class="bigger-120">
							<span class="blue bolder">中石油管道有限责任公司西气东输分公司</span>
							版权所有 &copy; 2020

                            <span class="blue bolder">郑州景观地理空间信息研究院</span>设计开发
						</span>
					</div>
				</div>
			</div>

			<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
				<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
			</a>
		</div><!-- /.main-container -->

		<!-- basic scripts -->
</body>
    </form>
		<!--[if !IE]> -->
		<script src="assets/js/jquery-2.1.4.min.js"></script>

		<!-- <![endif]-->

		<!--[if IE]>
<script src="assets/js/jquery-1.11.3.min.js"></script>
<![endif]-->
		<script type="text/javascript">
		    if ('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
		</script>
		<script src="assets/js/bootstrap.min.js"></script>

		<!-- page specific plugin scripts -->

		<!-- ace scripts -->
		<script src="assets/js/ace-elements.min.js"></script>
		<script src="assets/js/ace.min.js"></script>

		<!-- inline scripts related to this page -->

        <script src="laydate/laydate.js"></script> 
        <script src="js/app.js" type="text/javascript"></script>
        <script src="js/mui.enterfocus.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/mui.min.js"></script>
        <script src="../js/jquery1.42.min.js" type="text/javascript"></script>
<script type="text/javascript" charset="utf-8">
    lay('#version').html('-v' + laydate.v);

    //执行一个laydate实例
    laydate.render({
        elem: '#startlx', //指定元素
        format: 'yyyy-MM-dd',
        trigger: 'click'

    });

    laydate.render({
        elem: '#endlx', //指定元素
        format: 'yyyy-MM-dd',
        trigger: 'click'
    });
    laydate.render({
        elem: '#startqj', //指定元素
        format: 'yyyy-MM-dd',
        trigger: 'click'
    });
    laydate.render({
        elem: '#endqj', //指定元素
        format: 'yyyy-MM-dd',
        trigger: 'click'
    });
    laydate.render({
        elem: '#startxx', //指定元素
        format: 'yyyy-MM-dd',
        trigger: 'click'
    });
    laydate.render({
        elem: '#endxx', //指定元素
        format: 'yyyy-MM-dd',
        trigger: 'click'
    });
    laydate.render({
        elem: '#startcg', //指定元素
        format: 'yyyy-MM-dd',
        trigger: 'click'
    });
    laydate.render({
        elem: '#endcg', //指定元素
        format: 'yyyy-MM-dd',
        trigger: 'click'
    });
    //防汛
    function f_fsubmint(type) {
        mui.toast(type);
        var strzhan = $("#fzhanchang").val();
        if (strzhan == "") {
            mui.toast("请填写站场!");
            return;
        }
        var strweizhi = $("#fweizhi").val();
        if (strweizhi == "") {
            mui.toast("请填写行政位置!");
            return;
        }

        var strbuwei = $("#fbuwei").val();
        if (strbuwei == "") {
            mui.toast("请填写防汛重点部位名称!");
            return;
        }

        var strleixing = $("#fleixing").val();
        if (strleixing == "") {
            mui.toast("请填写防汛类型!");
            return;
        }

        var strsfxunxian = $("#fsfxunxian").val();
        if (strsfxunxian == "") {
            mui.toast("请填写本周巡线工是否每天巡检!是？否？");
            return;
        }

        var strxunxianjg = $("#fxunxianjg").val();
        if (strleixing == "") {
            mui.toast("请填写巡线巡线结果!");
            return;
        }

        var strglydengji = $("#fbenzhou").val();
        if (strglydengji == "") {
            mui.toast("本周巡线管理人员请填写巡检登记!");
            return;
        }

        var strglyjieguo = $("#fglyjieguo").val();
        if (strglyjieguo == "") {
            mui.toast("巡线管理人员请填写巡检结果!");
            return;
        }


        var strshuoming = $("#fshuoming").val();
        if (strshuoming == "") {
            mui.toast("巡线管理人员请填写发现异常情况详细说明!");
            return;
        }

        var strzzzx = $("#fzhizao").val();
        if (strzzzx == "") {
            mui.toast("请填写治早治小信息!");
            return;
        }

        var strweihu = $("#fweihu").val();
        if (strweihu == "") {
            mui.toast("请填写设施维护信息!");
            return;
        }

    }
    //高后果区
    function f_gsubmint(type) {
        // mui.toast(type);
        var strzhan = $("#gzhanchang").val();
        if (strzhan == "") {
            mui.toast("请填写站场!");
            return;
        }
        var strbianhao = $("#gbianhao").val();
        if (strbianhao == "") {
            mui.toast("请填写高果区编号!");
            return;
        }
        var strchangdu = $("#ghangdu").val();
        if (strchangdu == "") {
            mui.toast("请填写长度!");
            return;
        }

        var strquyuu = $("#gquyu").val();
        if (strquyuu == "") {
            mui.toast("请填写高后果区行政区域!");
            return;
        }

        var strshu = $("#gggqshu").val();
        if (strshu == "") {
            mui.toast("请填写高后果区数量!");
            return;
        }

        var strjcshu = $("#gjcshu").val();
        if (strjcshu == "") {
            ("请填写今日检查高后果区数量!");
            return;
        }
        var strzfshu = $("#gzoufang").val();
        mui.toast(strzfshu);
        if (strzfshu == "") {
            ("请填写宣传走访数量!");
            return;
        }
        var strzfrc = $("#gzoufangci").val();
        if (strzfrc == "") {
            ("请填写走访人次!");
            return;
        }

        var stryanlian = $("#gyanlian").val();
        if (stryanlian == "") {
            ("请填写演练情况!");
            return;
        }


        var strwenti = $("#gwenti").val();
        if (strwenti == "") {
            ("请填写发现问题!");
            return;
        }

        $.post("../it/it_submint.aspx?CMD=CURTGHGQ&FLAG=" + type + "&GZC=" +
         strzhan + "&GBH=" + strbianhao + "&GXZQY=" + strquyuu + "&GSL=" +
         strshu + "&GJRJCSL=" + strjcshu + "&GXCZF=" + strzfshu + "&GZFRC=" +
         strzfrc + "&GYLQK=" + stryanlian + "&GFXWT=" + strwenti + "&GCD=" + strchangdu, {}, function (data) {
             // alert(data);
             if (data == "1") {
                 mui.toast("提交成功!");
                 //f_LoginDesk();
             }
             if (data == "11") {
                 mui.toast("暂存成功!");
                 //f_LoginDesk();
             }
             if (data == "-1") {
                 mui.toast("提交操作失败，退出重试!");
                 //f_LoginDesk();

             }
             if (data == "-11") {
                 mui.toast("暂存操作失败，退出重试!");
                 //f_LoginDesk();

             } if (data == "0") {
                 mui.toast("已提交,不能修改!");
             }
         });
    }

    //请假
    function submint(type) {
        var strstart = $("#startqj").val();
        if (strstart == "") {
            mui.toast("请选择请假开始时间!");
            return;
        }
        var strend = $("#endqj").val();
        if (strend == "") {
            mui.toast("请选择请假结束时间!");
            return;
        }
        var strreason = $("#qjreason").val();
        if (strreason == "") {
            mui.toast("请填写请假事由!");
            return;
        }
        $.post("../it/it_submint.aspx?CMD=CURTQJ&FLAG=" + type + "&START=" + strstart + "&END=" + strend + "&REASON=" + strreason, {}, function (data) {
            // alert(data);
            if (data == "1") {
                mui.toast("提交成功!");
                //f_LoginDesk();
            }
            if (data == "-1") {
                mui.toast("提交失败，退出重试!");
                //f_LoginDesk();

            } if (data == "0") {
                mui.toast("已提交，请勿重复操作!");
            }
        });
    }
    //轮休
    function submintlx(type) {
        var strstart = $("#startlx").val();
        if (strstart == "") {
            mui.toast("请选择开始时间!");
            return;
        }
        var strend = $("#endlx").val();
        if (strend == "") {
            mui.toast("请选择结束时间!");
            return;
        }

        $.post("../it/it_submint.aspx?CMD=CURTLX&FLAG=" + type + "&START=" + strstart + "&END=" + strend, {}, function (data) {
            // alert(data);
            if (data == "1") {
                mui.toast("提交成功!");
                //f_LoginDesk();

            }
            if (data == "-1") {
                mui.toast("提交失败，退出重试!");
                //f_LoginDesk();

            } if (data == "0") {
                mui.toast("已提交，请勿重复操作!");
            }
        });
    }
    //学习培训
    function subxxpx(type) {
        var strstart = $("#startxx").val();
        if (strstart == "") {
            mui.toast("请选择开始时间!");
            return;
        }
        var strend = $("#endxx").val();
        if (strend == "") {
            mui.toast("请选择结束时间!");
            return;
        }
        var strreason = $("#bzxx").val();
        //        if (strreason == "") {
        //            mui.toast("请填写请假事由!");
        //            return;
        //        }
        $.post("../it/it_submint.aspx?CMD=CURTXXPX&FLAG=" + type + "&START=" + strstart + "&END=" + strend + "&REASON=" + strreason, {}, function (data) {
            // alert(data);
            if (data == "1") {
                mui.toast("提交成功!");
                //f_LoginDesk();

            }
            if (data == "-1") {
                mui.toast("提交失败，退出重试!");
                //f_LoginDesk();

            } if (data == "0") {
                mui.toast("已提交，请勿重复操作!");
            }
        });
    }

    function subcgxx(type) {
        var strstart = $("#startcg").val();
        if (strstart == "") {
            mui.toast("请选择开始时间!");
            return;
        }
        var strend = $("#endcg").val();
        if (strend == "") {
            mui.toast("请选择结束时间!");
            return;
        }
        var strreason = $("#cg").val();
        //        if (strreason == "") {
        //            mui.toast("请填写请假事由!");
        //            return;
        //        }
        $.post("../it/it_submint.aspx?CMD=CURTCG&FLAG=" + type + "&START=" + strstart + "&END=" + strend + "&REASON=" + strreason, {}, function (data) {
            // alert(data);
            if (data == "1") {
                mui.toast("提交成功!");
                //f_LoginDesk();

            }
            if (data == "-1") {
                mui.toast("提交失败，退出重试!");
                //f_LoginDesk();

            } if (data == "0") {
                mui.toast("已提交，请勿重复操作!");
            }
        });
    }
</script>
	
</html>

