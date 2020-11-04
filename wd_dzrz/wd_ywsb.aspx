<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wd_ywsb.aspx.cs" Inherits="MarketInfo.wd_dzrz.wd_ywsb" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>管理处</title>
    <meta name="description" content="Draggabble Widget Boxes with Persistent Position and State" />
    <meta name="description" content="frequently asked questions using tabs and accordions" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/font-awesome/4.5.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="assets/css/jquery-ui.custom.min.css" />

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
    <script type="text/javascript" src="assets/js/ace-extra.min.js"></script>
    <!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->
    <!--[if lte IE 8]>
		<script src="assets/js/html5shiv.min.js"></script>
		<script src="assets/js/respond.min.js"></script>
		<![endif]-->
    <style type="text/css">
        .div_f {
            float: left;
            width: 90px;
            font-size: 13px;
            margin: 3px 0;
        }

        .fa-chanzi {
            background: url(../css/icon_chanzi.jpg) center -20px no-repeat;
            background-size: 53%;
            display: block;
            height: 50px;
        }

        .fa-wajueji {
            background: url(../css/icon_wjj.jpg) center -7px no-repeat;
            background-size: contain;
            display: block;
            height: 50px;
        }

        .f {
            width: 100%;
            line-height: 17px;
            font-size: 16px;
            border: 1px solid #D5D5D5;
            padding: 7px 7px 7px 7px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }
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
                            <h4>业务申报
								<small>
                                    <i class="ace-icon fa fa-angle-double-right"></i>
                                    业务信息申报填写
                                </small>
                            </h4>
                        </div>
                        <!-- /.page-header -->
                        <div class="row">
                            <div class="col-xs-12">
                                <!-- PAGE CONTENT BEGINS -->
                                <div class="tabbable">
                                    <ul class="nav nav-tabs padding-18 tab-size-bigger" id="myTab">
                                        <li class="active">
                                            <a data-toggle="tab" href="#faq-tab-3">
                                                <i class="orange ace-icon fa fa-credit-card bigger-90"></i>
                                                在岗
                                            </a>
                                        </li>
                                        <li class="dropdown">
                                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                                <i class="green ace-icon fa fa-user bigger-90"></i>
                                                休假
                                                <i class="ace-icon fa fa-caret-down"></i>
                                            </a>
                                            <ul class="dropdown-menu dropdown-lighter dropdown-90">
                                                <li>
                                                    <a data-toggle="tab" href="#faq-tab-qj">请假</a>
                                                </li>

                                                <li>
                                                    <a data-toggle="tab" href="#faq-tab-lunxiu">轮休</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="dropdown">
                                            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                                                <i class="purple ace-icon fa fa-magic bigger-90"></i>
                                                公出
												<i class="ace-icon fa fa-caret-down"></i>
                                            </a>
                                            <ul class="dropdown-menu dropdown-lighter dropdown-90">
                                                <li>
                                                    <a data-toggle="tab" href="#faq-tab-xuexi">学习培训</a>
                                                </li>
                                                <li>
                                                    <a data-toggle="tab" href="#faq-tab-4">参观交流</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <!-- /.dropdown -->
                                    </ul>
                                    <div class="tab-content no-border padding-24">

                                        <div id="faq-tab-2" class="tab-pane fade">
                                            <h4 class="blue">
                                                <i class="green ace-icon fa fa-user bigger-110"></i>
                                                Account Questions
                                            </h4>
                                            <div class="space-8"></div>
                                            <div id="faq-list-2" class="panel-group accordion-style1 accordion-style2">
                                                <div class="panel panel-default">
                                                    <div class="panel-heading">
                                                        <a href="#faq-2-1" data-parent="#faq-list-2" data-toggle="collapse" class="accordion-toggle collapsed">
                                                            <i class="ace-icon fa fa-chevron-right smaller-80" data-icon-hide="ace-icon fa fa-chevron-down align-top" data-icon-show="ace-icon fa fa-chevron-right"></i>&nbsp;
						Enim eiusmod high life accusamus terry richardson?
                                                        </a>
                                                    </div>
                                                    <div class="panel-collapse collapse" id="faq-2-1">
                                                        <div class="panel-body">
                                                            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="panel panel-default">
                                                    <div class="panel-heading">
                                                        <a href="#faq-2-2" data-parent="#faq-list-2" data-toggle="collapse" class="accordion-toggle collapsed">
                                                            <i class="ace-icon fa fa-chevron-right smaller-80" data-icon-hide="ace-icon fa fa-chevron-down align-top" data-icon-show="ace-icon fa fa-chevron-right"></i>&nbsp;
					  Single-origin coffee nulla assumenda shoreditch et?
                                                        </a>
                                                    </div>
                                                    <div class="panel-collapse collapse" id="faq-2-2">
                                                        <div class="panel-body">
                                                            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="panel panel-default">
                                                    <div class="panel-heading">
                                                        <a href="#faq-2-3" data-parent="#faq-list-2" data-toggle="collapse" class="accordion-toggle collapsed">
                                                            <i class="ace-icon fa fa-chevron-right middle smaller-80" data-icon-hide="ace-icon fa fa-chevron-down align-top" data-icon-show="ace-icon fa fa-chevron-right"></i>&nbsp;
					  Sunt aliqua put a bird on it squid?
                                                        </a>
                                                    </div>
                                                    <div class="panel-collapse collapse" id="faq-2-3">
                                                        <div class="panel-body">
                                                            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="panel panel-default">
                                                    <div class="panel-heading">
                                                        <a href="#faq-2-4" data-parent="#faq-list-2" data-toggle="collapse" class="accordion-toggle collapsed">
                                                            <i class="ace-icon fa fa-chevron-right smaller-80" data-icon-hide="ace-icon fa fa-chevron-down align-top" data-icon-show="ace-icon fa fa-chevron-right"></i>&nbsp;
					  Brunch 3 wolf moon tempor sunt aliqua put?
                                                        </a>
                                                    </div>
                                                    <div class="panel-collapse collapse" id="faq-2-4">
                                                        <div class="panel-body">
                                                            Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="faq-tab-3" class="tab-pane fade in active">
                                            <h4 class="blue">
                                                <i class="orange ace-icon fa fa-credit-card bigger-110"></i>
                                                在岗
                                            </h4>
                                            <div class="space-8"></div>
                                            <div id="faq-list-3" class="panel-group accordion-style1 accordion-style2">

                                                <div class="center" style="overflow: inherit;">
                                                    <div class="div_f">
                                                        <a class="btn btn-app btn-sm btn-grey no-hover" href="wd_dtfx/wd_dtfxlist.aspx" style="height: 60px;">
                                                            <i class="ace-icon fa  fa-square   fa-hand-paper-o  bigger-230"></i>
                                                        </a>
                                                        <span class="line-height-1 smaller-90">开挖作业 </span>
                                                    </div>
                                                    <%-- <div class="div_f">
												<a class="btn btn-app btn-sm btn-light no-hover" href="wd_disanf/default.aspx" style=" height:60px; ">		
                                                <i class="ace-icon fa fa-wajueji  bigger-230"></i>																							
												</a>
                                                <span class="line-height-1 smaller-90">第三方施工 </span>
                                                </div>--%>
                                                    <div class="div_f">
                                                        <a class="btn btn-app btn-sm btn-blue no-hover" href="wd_dier_shigong/wd_dier.aspx" style="height: 60px;">
                                                            <i class="ace-icon fa   fa-chanzi  bigger-230"></i>
                                                        </a>
                                                        <span class="line-height-1 smaller-90">第二方施工 </span>
                                                    </div>
                                                    <div class="div_f">
                                                        <a class="btn btn-app btn-sm btn-info  no-hover" href="wd_ghgq.aspx" style="height: 60px;">
                                                            <i class="ace-icon glyphicon glyphicon-th bigger-230"></i>
                                                        </a>
                                                        <span class="line-height-1 smaller-90">高后果区 </span>
                                                    </div>

                                                    <div style="" class="div_f">
                                                        <a class="btn btn-app btn-sm btn-yellow no-hover" href="xunhu.aspx" style="height: 60px;">
                                                            <i class="ace-icon glyphicon glyphicon-align-left bigger-230"></i>
                                                        </a>
                                                        <span class="line-height-1 smaller-90">巡护管理 </span>
                                                    </div>

                                                    <div class="div_f">
                                                        <a class="btn btn-app btn-sm btn-success no-hover" href="wd_zfxc/wd_zfxclist.aspx" style="height: 60px;">
                                                            <i class="ace-icon fa fa-comments-o bigger-230"></i>
                                                        </a>
                                                        <span class="line-height-1 smaller-90">宣传走访 </span>
                                                    </div>

                                                    <div class="div_f">
                                                        <a class="btn btn-app btn-sm btn-danger no-hover" href="wd_fushikz.aspx" style="height: 60px;">
                                                            <i class="ace-icon fa fa-bar-chart-o bigger-230"></i>
                                                        </a>
                                                        <span class="line-height-1 smaller-90">腐蚀控制 </span>
                                                    </div>
                                                    <div class="div_f">
                                                        <a class="btn btn-app btn-sm btn-warning no-hover" href="wd_jieduan.aspx" style="height: 60px;">
                                                            <i class="ace-icon fa  fa-book bigger-230"></i>
                                                        </a>
                                                        <span class="line-height-1 smaller-90">阶段性工作</span>
                                                    </div>
                                                    <%--  <div class="div_f">
												<a class="btn btn-app btn-sm btn-primary no-hover" href="wd_spjk.aspx" style=" height:60px; ">		
                                                <i class="ace-icon glyphicon glyphicon-facetime-video bigger-230"></i>																							
												</a>
                                                <span class="line-height-1 smaller-90">视频监控 </span>
                                                </div>--%>
                                                    <div class="div_f">
                                                        <a class="btn btn-app btn-sm btn-yellow  no-hover" href="wd_qitagz.aspx" style="height: 60px;">
                                                            <i class="ace-icon fa  fa-folder-open bigger-230"></i>
                                                        </a>
                                                        <span class="line-height-1 smaller-90">其他工作 </span>
                                                    </div>
                                                    <div class="div_f">
                                                        <a class="btn btn-app btn-sm btn-blue no-hover" href="wd_file/wd_sjxx.aspx" style="height: 60px;">
                                                            <i class="ace-icon fa fa-laptop bigger-230"></i>
                                                        </a>
                                                        <span class="line-height-1 smaller-90">事件学习 </span>
                                                    </div>
                                                    <div class="div_f">
                                                        <a class="btn btn-app btn-sm btn-light no-hover" href="wd_file/wd_ygtz.aspx" style="height: 60px;">
                                                            <i class="ace-icon fa fa-bullhorn bigger-230"></i>
                                                        </a>
                                                        <span class="line-height-1 smaller-90">有关通知 </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="faq-tab-qj" class="tab-pane fade">


                                            <%if (tb != null)
                                                {

                                            %>
                                            <div class="col-xs-6 col-sm-9" id="tbQj">
                                                <table class="table table-striped  table-bordered table-hover">
                                                    <thead class="thin-border-bottom">
                                                        <tr style="back">
                                                            <th class="input-group-addon  ">序号
                                                            </th>
                                                            <th class="input-group-addon ">开始-结束时间

                                                            </th>

                                                            <th class="input-group-addon hidden-480">休假天数</th>
                                                            <th class="input-group-addon hidden-480">变更时间</th>
                                                            <th class="input-group-addon ">状态</th>
                                                            <th class="input-group-addon">操作</th>
                                                        </tr>
                                                    </thead>

                                                    <tbody style="font-size: 8px">

                                                        <%if (tb != null)
                                                            {
                                                                for (int i = 0; i < tb.Rows.Count; i++)
                                                                {

                                                        %>
                                                        <tr>
                                                            <td class="input-group-addon"><%=i+1%></td>
                                                            <td class="input-group-addon">开始：<%=tb.Rows[i]["T_WSTART"].ToString()%><br />
                                                                结束：<%=tb.Rows[i]["T_WEND"].ToString()%></td>

                                                            <td class="hidden-480 input-group-addon">
                                                                <%=(Convert.ToDateTime(tb.Rows[i]["T_WEND"].ToString())-Convert.ToDateTime(tb.Rows[i]["T_WSTART"].ToString())).Days%>天
                                                            </td>
                                                            <td class="hidden-480 input-group-addon">开始：<%=tb.Rows[i]["T_NewStartTime"].ToString()%><br />
                                                                结束：<%=tb.Rows[i]["T_NewEndTime"].ToString()%></td>
                                                            <td class="input-group-addon" style="color: seagreen">


                                                                <%=state(tb.Rows[i]["T_FLAG"].ToString())%>
                                                            </td>

                                                            <td class="input-group-addon">
                                                                <a href="#"
                                                                    onclick="clickTj(<%=tb.Rows[i]["T_WID"].ToString()%>)"><%=Int32.Parse(tb.Rows[i]["T_FLAG"].ToString())==0?"提交":""%></a>
                                                                <a href="#"
                                                                    onclick="clickBg(<%=tb.Rows[i]["T_WID"].ToString()%>)"><%=Int32.Parse(tb.Rows[i]["T_FLAG"].ToString())!=0?"变更":""%></a>
                                                            </td>

                                                            <%
                                                                    }
                                                                }%>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <%

                                                }%>
                                            <div class="col-xs-6 col-sm-3 pricing-box">
                                                <div class="widget-box widget-color-orange">
                                                    <div class="widget-header">
                                                        <h5 class="widget-title bigger lighter" id="txtQj">请假</h5>
                                                        <span class="widget-toolbar">


                                                            <span class="exit" style="display: none" onclick="exit();">
                                                                <i class="ace-icon fa fa-times"></i>
                                                            </span>
                                                        </span>
                                                    </div>

                                                    <div class="widget-body">
                                                        <div class="widget-main">
                                                            <ul class="list-unstyled spaced2">
                                                                <li>
                                                                    <i class="ace-icon fa fa-check green"></i>
                                                                    <input type="text" class="demo-input"
                                                                        placeholder="开始日期" id="startqj" />
                                                                </li>
                                                                <li>
                                                                    <i class="ace-icon fa fa-check green"></i>
                                                                    <input type="text" class="demo-input"
                                                                        placeholder="结束日期" id="endqj" />
                                                                </li>
                                                                <li>
                                                                    <div class="form-group">
                                                                        <label
                                                                            class="col-sm-2 control-label no-padding-right">
                                                                            <i
                                                                                class="ace-icon fa fa-check green"></i>原因</label>
                                                                        <div class="col-sm-10">
                                                                            <span class="input-icon">
                                                                                <textarea class="form-control limited"
                                                                                    id="qjreason"
                                                                                    maxlength="40"></textarea>
                                                                            </span>

                                                                        </div>
                                                                        <input type="file" class="f" name="f" id="f" />
                                                                    </div>


                                                                </li>
                                                                <li>
                                                                    <i class="ace-icon fa fa-check green"></i>
                                                                    <hr />
                                                                </li>
                                                                <li>
                                                                    <button class="btn btn-info btn2"
                                                                        style="display: none" type="button"
                                                                        onclick="bg();">
                                                                        <i class="ace-icon fa fa-check bigger-110"></i>
                                                                        确认变更
                                                                    </button>
                                                                    &nbsp;
                                                                  <button class="btn btn-info btn1" type="button"
                                                                      onclick="submint('1');">
                                                                      <i class="ace-icon fa fa-check bigger-110"></i>
                                                                      提交
                                                                  </button>
                                                                    &nbsp;
                                                                  <button class="btn btn1" type="reset"
                                                                      onclick="submint('0');">
                                                                      <i class="ace-icon fa fa-undo bigger-110"></i>
                                                                      暂存
                                                                  </button>

                                                                </li>
                                                                <li></li>
                                                            </ul>
                                                            <hr />
                                                            <div class="price">
                                                            </div>
                                                        </div>

                                                    </div>
                                                </div>
                                            </div>

                                        </div>


                                        <div id="faq-tab-lunxiu" class="tab-pane fade">
                                            <div class="col-xs-6 col-sm-3 pricing-box">
                                                <div class="widget-box widget-color-blue">
                                                    <div class="widget-header">
                                                        <h5 class="widget-title bigger lighter"><span style="color: #FFFFFF; font-weight: bolder;">轮休</span></h5>
                                                    </div>
                                                    <div class="widget-body">
                                                        <div class="widget-main">
                                                            <ul class="list-unstyled spaced2">
                                                                <li>
                                                                    <i class="ace-icon fa fa-check blue"></i>
                                                                    <input type="text" class="demo-input" placeholder="开始日期" id="startlx" />
                                                                </li>
                                                                <li>
                                                                    <i class="ace-icon fa fa-check blue"></i>
                                                                    <input type="text" class="demo-input" placeholder="结束日期" id="endlx" />
                                                                </li>
                                                                <li>
                                                                    <%--  <input type="file" id="file1" name="file" accept="image/*,.pdf,.zip,.7z,.doc"   runat="server"/>
											                                                       
                                                                <label class="ace-file-input ace-file-multiple" >
                                                                <input type="file" id="file2" name="file" accept="image/*,.pdf,.zip,.7z,.doc"   runat="server"/>
                                                                <span class="ace-file-container" data-title="Drop files here or click to choose"  style=" display:none;">
                                                                <span class="ace-file-name" data-title="No File ..."><i class=" ace-icon ace-icon fa fa-cloud-upload"></i>
                                                                </span></span><a class="remove" href="#"><i class=" ace-icon fa fa-times"></i></a>
                                                                </label>--%>                                                         
                                                           			
                                                                </li>
                                                                <li>
                                                                    <button class="btn btn-info" type="button" onclick="submintlx('1');">
                                                                        <i class="ace-icon fa fa-check bigger-110"></i>
                                                                        提交
                                                                    </button>
                                                                    &nbsp; &nbsp; &nbsp;
											<button class="btn" type="reset" onclick="submintlx('0');">
                                                <i class="ace-icon fa fa-undo bigger-110"></i>
                                                暂存
                                            </button>
                                                                </li>
                                                            </ul>
                                                            <hr />
                                                        </div>
                                                        <div>
                                                            <a href="#" class="btn btn-block btn-primary">
                                                                <i class="ace-icon fa fa-shopping-cart bigger-110"></i>
                                                                <span></span>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="faq-tab-xuexi" class="tab-pane fade">
                                            <h4 class="blue">
                                                <i class="purple ace-icon fa fa-magic bigger-110"></i>
                                                学习培训
                                            </h4>
                                            <div class="space-8"></div>
                                            <div id="faq-list-4-xx" class="panel-group accordion-style1 accordion-style2">
                                                <div class="panel panel-default">
                                                    <div class="panel-heading">
                                                        <a href="#faq-4-1-xx" data-parent="#faq-list-4-xx" data-toggle="collapse" class="accordion-toggle collapsed">
                                                            <i class="ace-icon fa fa-hand-o-right" data-icon-hide="ace-icon fa fa-hand-o-down" data-icon-show="ace-icon fa fa-hand-o-right"></i>&nbsp;
						                               学习培训时间
                                                        </a>
                                                    </div>
                                                    <div class="panel-collapse collapse" id="faq-4-1-xx">
                                                        <div class="panel-body">
                                                            <input type="text" class="demo-input" placeholder="开始日期" id="startxx" />
                                                            ---<input type="text" class="demo-input" placeholder="结束日期" id="endxx" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="panel panel-default">
                                                    <div class="panel-heading">
                                                        <a href="#faq-4-3-xx" data-parent="#faq-list-4-xx" data-toggle="collapse" class="accordion-toggle collapsed">
                                                            <i class="ace-icon fa fa-plus smaller-80" data-icon-hide="ace-icon fa fa-minus" data-icon-show="ace-icon fa fa-plus"></i>&nbsp;
					                                添加备注
                                                        </a>
                                                    </div>
                                                    <div class="panel-collapse collapse" id="faq-4-3-xx">
                                                        <div class="panel-body">
                                                            <textarea class="form-control" id="bzxx" placeholder="备注信息"></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="panel panel-default">
                                                    <div class="panel-heading">
                                                        <button class="btn btn-info" type="button" onclick="subxxpx('1');">
                                                            <i class="ace-icon fa fa-check bigger-110"></i>
                                                            提交
                                                        </button>
                                                        &nbsp; &nbsp; &nbsp;
											<button class="btn" type="reset" onclick="subxxpx('0');">
                                                <i class="ace-icon fa fa-undo bigger-110"></i>
                                                暂存
                                            </button>
                                                    </div>
                                                    <%--<div class="panel-collapse collapse" id="faq-4-4">
														<div class="panel-body">
															Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.
														</div>
													</div>--%>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="faq-tab-4" class="tab-pane fade">
                                            <h4 class="blue">
                                                <i class="purple ace-icon fa fa-magic bigger-110"></i>
                                                参观交流
                                            </h4>
                                            <div class="space-8"></div>
                                            <div id="faq-list-4" class="panel-group accordion-style1 accordion-style2">
                                                <div class="panel panel-default">
                                                    <div class="panel-heading">
                                                        <a data-parent="#faq-list-4" data-toggle="collapse" class="accordion-toggle collapsed">
                                                            <i class="ace-icon fa fa-hand-o-right" data-icon-hide="ace-icon fa fa-hand-o-down" data-icon-show="ace-icon fa fa-hand-o-right"></i>&nbsp;
						      参观交流起止时间<input type="text" class="demo-input" placeholder="开始日期" id="startcg" />
                                                            ---<input type="text" class="demo-input" placeholder="结束日期" id="endcg" />

                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="panel panel-default">
                                                    <div class="panel-heading">
                                                        <a href="#faq-4-3" data-parent="#faq-list-4" data-toggle="collapse" class="accordion-toggle collapsed">
                                                            <i class="ace-icon fa fa-plus smaller-80" data-icon-hide="ace-icon fa fa-minus" data-icon-show="ace-icon fa fa-plus"></i>&nbsp;
					                                 添加备注
                                                        </a>
                                                    </div>
                                                    <div class="panel-collapse collapse" id="faq-4-3">
                                                        <div class="panel-body">
                                                            <textarea class="form-control" id="cg" placeholder="添加备注信息"></textarea>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="panel panel-default">
                                                    <div class="panel-heading">
                                                        <button class="btn btn-info" type="button" onclick="subcgxx('1');">
                                                            <i class="ace-icon fa fa-check bigger-110"></i>
                                                            提交
                                                        </button>
                                                        &nbsp; &nbsp; &nbsp;
											<button class="btn" type="reset" onclick="subcgxx('0');">
                                                <i class="ace-icon fa fa-undo bigger-110"></i>
                                                暂存
                                            </button>
                                                    </div>

                                                    <%--<div class="panel-collapse collapse" id="faq-4-4">
														<div class="panel-body">
															Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.
														</div>
													</div>--%>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- PAGE CONTENT ENDS -->
                            </div>
                            <!-- /.col -->
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.page-content -->
                </div>
            </div>
            <!-- /.main-content -->

        </div>
        <!-- /.main-container -->
        <!-- basic scripts -->
</body>
</form>
		<!--[if !IE]> -->
<script src="assets/js/ace-extra.min.js" type="text/javascript"></script>

<script type="text/javascript" src="assets/js/jquery-2.1.4.min.js"></script>
<!-- <![endif]-->

<!--[if IE]>
<script src="assets/js/jquery-1.11.3.min.js"></script>
<![endif]-->
<script type="text/javascript">
    if ('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
</script>
<script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/jquery-ui.custom.min.js" type="text/javascript"></script>
<script src="assets/js/jquery.ui.touch-punch.min.js" type="text/javascript"></script>
<!-- page specific plugin scripts -->

<!-- ace scripts -->
<script type="text/javascript" src="assets/js/ace-elements.min.js"></script>
<script type="text/javascript" src="assets/js/ace.min.js"></script>
<!-- inline scripts related to this page -->

<script type="text/javascript" src="laydate/laydate.js"></script>
<script src="js/app.js" type="text/javascript"></script>
<script src="js/mui.enterfocus.js" type="text/javascript"></script>
<script type="text/javascript" src="js/mui.min.js"></script>
<script src="../js/jquery1.42.min.js" type="text/javascript"></script>
<script src="../js/jquery-3.3.1.min.js"></script>
<script src="wd_disanf/JSS.js"></script>
<script src="js/file.js"></script>
<script src="js/layer/layer.js"></script>
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
        //保存文件
        var fd = new FormData();//新建formdata
        var a = $('#f')[0].files[0]; //获取第一个文件

        //添加判断是否有文件，否则不执行上传文件的方法
        if (a != undefined) {

            //判断文件大小
            console.log(a.size);
            if (a.size > 1024 * 1024) {
                mui.toast("文件大小超过1MB!");
                return;
            }

            var fileobj = a.name;
            //添加键对值
            fd.append("photo", a);
            console.log(fd.get('photo'));

            $.ajax({
                url: '../it/SaveQJ.ashx',
                type: 'post',
                processData: false,
                contentType: false,
                data: fd,
                success: function (data) {
                    console.log(data);


                }
            });
        }


        console.log(fileobj);
        //向数据库中添加数据
        $.post("../it/it_submint.aspx?CMD=CURTQJ&FLAG=" + type + "&START=" + strstart + "&END=" + strend + "&REASON=" + strreason + "&PATH=" + fileobj, {}, function (data) {
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
    //提交
    function clickTj(val) {
        mui.confirm('是否确认提交？', '保存', function (e) {
            if (e.index == 1) {
                $.ajax({
                    url: '../it/jjy/Tj.ashx',
                    type: 'post',
                    data: { T_WID: val },
                    success: function (data) {
                        mui.toast("提交成功!");
                        setInterval(function () {
                            location.reload();
                        }, 500)
                    }
                });
            } else {
                mui.toast('已撤销！');
            }
        })


    }
    var Id = -1;
    var filePath;
    //变更
    function clickBg(val) {
        $('#txtQj').text("请假变更")
        $("#tbQj").hide(500);
        $(".exit").show(500)
        $('.btn1').hide();
        $('.btn2').show()
        Id = val
        $.ajax({
            url: '../it/jjy/getXiuJiaInfo.ashx',
            type: 'post',
            data: { T_WID: val },
            success: function (data) {
                filePath = data[0].T_PATH;
            }
        });

    }
    function bg() {

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
        //保存文件
        var fd = new FormData();//新建formdata
        var a = $('#f')[0].files[0]; //获取第一个文件

        //添加判断是否有文件，否则不执行上传文件的方法
        if (a != undefined) {

            //判断文件大小
            console.log(a.size);
            if (a.size > 1024 * 1024) {
                mui.toast("文件大小超过1MB!");
                return;
            }

            var fileobj = a.name;
            //添加键对值
            fd.append("photo", a);


            $.ajax({
                url: '../it/SaveQJ.ashx',
                type: 'post',
                processData: false,
                contentType: false,
                data: fd,
                success: function (data) {



                }
            });
        }
        //../QJfile/新建文本文档.txt
        var index = filePath.lastIndexOf("/")
        filePath = filePath.substring(index + 1, filePath.length);
        if (fileobj == null) {
            fileobj = filePath
        }
        mui.confirm('是否确认变更？', '保存', function (e) {
            if (e.index == 1) {
                $.ajax({
                    url: '../it/jjy/xiuJiaBianGeng.ashx',
                    type: 'post',
                    data: {
                        T_WID: Id,
                        strstart: strstart,
                        strend: strend,
                        strreason: strreason,
                        path: fileobj
                    },
                    success: function (data) {

                        $("#qjreason").val("")
                        $("#startqj").val("")
                        $("#endqj").val("")
                        mui.toast(data);
                        setInterval(function () {
                            location.reload();
                        }, 500)
                    }
                });

            } else {
                mui.toast('已撤销！');
            }
        })


    }

    function exit() {
        $("#qjreason").val("")
        $("#startqj").val("")
        $("#endqj").val("")
        $('#txtQj').text("请假")
        $("#tbQj").show(500);
        $(".exit").hide(500)
        $('.btn1').show();
        $('.btn2').hide()

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
        //保存文件
        var fd = new FormData();//新建formdata
        var a = $('#f')[0].files[0]; //获取第一个文件

        //添加判断是否有文件，否则不执行上传文件的方法
        if (a != undefined) {

            //判断文件大小
            console.log(a.size);
            if (a.size > 1024 * 1024) {
                mui.toast("文件大小超过1MB!");
                return;
            }

            var fileobj = a.name;
            //添加键对值
            fd.append("photo", a);
            console.log(fd.get('photo'));

            $.ajax({
                url: '../it/SaveQJ.ashx',
                type: 'post',
                processData: false,
                contentType: false,
                data: fd,
                success: function (data) {
                    console.log(data);


                }
            });
        }


        console.log(fileobj);
        //向数据库中添加数据
        $.post("../it/it_submint.aspx?CMD=CURTQJ&FLAG=" + type + "&START=" + strstart + "&END=" + strend + "&REASON=" + strreason + "&PATH=" + fileobj, {}, function (data) {
            // alert(data);
            if (data == "1") {
                mui.toast("提交成功!");
                setInterval(function () {
                    location.reload();
                }, 500)
            }
            if (data == "-1") {
                mui.toast("提交失败，退出重试!");
                setInterval(function () {
                    location.reload();
                }, 500)

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
