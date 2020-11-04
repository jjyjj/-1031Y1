<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wd_dafault.aspx.cs" Inherits="MarketInfo.wd_dzrz.wd_dafault" %>

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
	</head>
<body>
    <form id="form1" runat="server">
    <div class="main-container ace-save-state" id="main-container">
			<script type="text/javascript">
			    try { ace.settings.loadState('main-container') } catch (e) { }
			</script>
			<div class="main-content">
				<div class="main-content-inner">
					<div class="page-content">						
						<div class="page-header">
							<h1>
								业务申报
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									业务信息申报填写
								</small>
							</h1>
						</div><!-- /.page-header -->

						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="tabbable">
									<ul class="nav nav-tabs padding-18 tab-size-bigger" id="myTab">
										
                                        <li  class="active">
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
										</li><!-- /.dropdown -->
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

										<div id="faq-tab-3"  class="tab-pane fade in active">
											<h4 class="blue">
												<i class="orange ace-icon fa fa-credit-card bigger-110"></i>
												在岗
											</h4>

											<div class="space-8"></div>

											<div id="faq-list-3" class="panel-group accordion-style1 accordion-style2">
												<div class="panel panel-default">
													<div class="panel-heading">
														<a href="#faq-3-1" data-parent="#faq-list-3" data-toggle="collapse" class="accordion-toggle collapsed">
															<i class="ace-icon fa fa-plus smaller-80" data-icon-hide="ace-icon fa fa-minus" data-icon-show="ace-icon fa fa-plus"></i>&nbsp;
						                    巡护情况
														</a>
													</div>

													<div class="panel-collapse collapse" id="faq-3-1">
														<div class="panel-body">





															<label for="form-field-8">  当日上线情况简述</label>

															<textarea class="form-control" id="xunhu" placeholder="当日上线情况简述"></textarea>
														
														</div>
                                                        <li>
															
															<button class="btn btn-info" type="button" onclick="submint('1');">
												<i class="ace-icon fa fa-check bigger-110"></i>
												提交
											</button>
                                            &nbsp;
															<button class="btn" type="reset" onclick="submint('0');">
												<i class="ace-icon fa fa-undo bigger-110"></i>
												暂存
											</button>
														</li>
													</div>
												</div>

												<div class="panel panel-default">
													<div class="panel-heading">
														<a href="#faq-3-2" data-parent="#faq-list-3" data-toggle="collapse" class="accordion-toggle collapsed">
															<i class="ace-icon fa fa-plus smaller-80" data-icon-hide="ace-icon fa fa-minus" data-icon-show="ace-icon fa fa-plus"></i>&nbsp;
					                             第三方施工
														</a>
													</div>

													<div class="panel-collapse collapse" id="faq-3-2">
														<div class="panel-body">
															
										                    <label class="col-sm-3 control-label no-padding-right" for="form-field-1">第三方施工数量</label>										                   
											                    <input type="text" id="form-field-1" placeholder="请输入" class="col-xs-10 col-sm-5" />								                  
														<label class="col-sm-3 control-label no-padding-right" for="form-field-1">项目名称</label>										                   
											                    <input type="text" id="Text1" placeholder="请输入" class="col-xs-10 col-sm-5" />								                  
														
                                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">作业位置</label>										                   
											                    <input type="text" id="Text2" placeholder="请输入" class="col-xs-10 col-sm-5" />	
                                                                
                                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1">今日新增数量</label>										                   
											                    <input type="text" id="Text3" placeholder="请输入" class="col-xs-10 col-sm-5" />
                                                                
                                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1">今日检查施工现场情况</label>										                   
											                    <input type="text" id="Text4" placeholder="请输入" class="col-xs-10 col-sm-5" />

                                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1">其他备注</label>
                                                               		<textarea class="form-control" id="Textarea1" placeholder="添加备注信息"></textarea>				                  
																						                  
																					                  
														
                                                        </div>
                                                        <li>
															
															<button class="btn btn-info" type="button" onclick="submint('1');">
												<i class="ace-icon fa fa-check bigger-110"></i>
												提交
											</button>
                                            &nbsp;
															<button class="btn" type="reset" onclick="submint('0');">
												<i class="ace-icon fa fa-undo bigger-110"></i>
												暂存
											</button>
														</li>
													</div>
												</div>

												<div class="panel panel-default">
													<div class="panel-heading">
														<a href="#faq-3-3" data-parent="#faq-list-3" data-toggle="collapse" class="accordion-toggle collapsed">
															<i class="ace-icon fa fa-plus smaller-80" data-icon-hide="ace-icon fa fa-minus" data-icon-show="ace-icon fa fa-plus"></i>&nbsp;
					                                      第二方施工
														</a>
													</div>

													<div class="panel-collapse collapse" id="faq-3-3">
														<div class="panel-body">
															<label class="col-sm-3 control-label no-padding-right" for="form-field-1">第二方施工数量</label>										                   
											                    <input type="text" id="Text5" placeholder="请输入" class="col-xs-10 col-sm-5" />								                  
														<label class="col-sm-3 control-label no-padding-right" for="form-field-1">项目名称</label>										                   
											                    <input type="text" id="Text6" placeholder="请输入" class="col-xs-10 col-sm-5" />								                  
														
                                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">作业位置</label>										                   
											                    <input type="text" id="Text7" placeholder="请输入" class="col-xs-10 col-sm-5" />	
                                                                 <label class="col-sm-3 control-label no-padding-right" for="form-field-1">作业进度</label>										                   
											                    <input type="text" id="Text10" placeholder="请输入" class="col-xs-10 col-sm-5" />	
                                                                
                                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1">今日新增作业数量</label>										                   
											                    <input type="text" id="Text8" placeholder="请输入" class="col-xs-10 col-sm-5" />
                                                                
                                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1">今日检查施工现场情况</label>										                   
											                    <input type="text" id="Text9" placeholder="请输入" class="col-xs-10 col-sm-5" />

                                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1">其他备注</label>
                                                               		<textarea class="form-control" id="Textarea2" placeholder="添加备注信息"></textarea>				                  
																						                  
																					                  
														
                                                        </div>
                                                        <li>
															
															<button class="btn btn-info" type="button" onclick="submint('1');">
												<i class="ace-icon fa fa-check bigger-110"></i>
												提交
											</button>
                                            &nbsp;
															<button class="btn" type="reset" onclick="submint('0');">
												<i class="ace-icon fa fa-undo bigger-110"></i>
												暂存
											</button>
														</li>
														</div>
													
												</div>

												<div class="panel panel-default">
													<div class="panel-heading">
														<a href="#faq-3-4" data-parent="#faq-list-3" data-toggle="collapse" class="accordion-toggle collapsed">
															<i class="ace-icon fa fa-plus smaller-80" data-icon-hide="ace-icon fa fa-minus" data-icon-show="ace-icon fa fa-plus"></i>&nbsp;
					                  自主维护作业
														</a>
													</div>

													<div class="panel-collapse collapse" id="faq-3-4">
														<div class="panel-body">
														 <label class="col-sm-3 control-label no-padding-right" for="form-field-1">开挖类作业</label>										                   
											                    <input type="text" id="Text11" placeholder="请输入" class="col-xs-10 col-sm-5" />
                                                                
                                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1">其他作业</label>										                   
											                    <input type="text" id="Text12" placeholder="请输入" class="col-xs-10 col-sm-5" />


														</div>

                                                      <li>
															
												  			<button class="btn btn-info" type="button" onclick="submint('1');">
												    <i class="ace-icon fa fa-check bigger-110"></i>
												           提交
											               </button>
                                            &nbsp;
															<button class="btn" type="reset" onclick="submint('0');">
												  <i class="ace-icon fa fa-undo bigger-110"></i>
												暂存
											                </button>
														</li>
													</div>
												</div>

                                                <div class="panel panel-default">
													<div class="panel-heading">
														<a href="#faq-3-43" data-parent="#faq-list-3" data-toggle="collapse" class="accordion-toggle collapsed">
															<i class="ace-icon fa fa-plus smaller-80" data-icon-hide="ace-icon fa fa-minus" data-icon-show="ace-icon fa fa-plus"></i>&nbsp;
					外部协调
														</a>
													</div>

													<div class="panel-collapse collapse" id="faq-3-43">
														<div class="panel-body">
															<label class="col-sm-3 control-label no-padding-right" for="form-field-1">走访部门</label>										                   
											                    <input type="text" id="Text13" placeholder="请输入" class="col-xs-10 col-sm-5" />
                                                                
                                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1">协调项目</label>										                   
											                    <input type="text" id="Text14" placeholder="请输入" class="col-xs-10 col-sm-5" />

                                                                
                                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1">其他作业</label>										                   
											                    <input type="text" id="Text15" placeholder="请输入" class="col-xs-10 col-sm-5" />
												</div>
                                                 <li>
															
												  			<button class="btn btn-info" type="button" onclick="submint('1');">
												    <i class="ace-icon fa fa-check bigger-110"></i>
												           提交
											               </button>
                                            &nbsp;
															<button class="btn" type="reset" onclick="submint('0');">
												  <i class="ace-icon fa fa-undo bigger-110"></i>
												暂存
											                </button>
														</li>
													</div>
												</div>

                                                <div class="panel panel-default">
													<div class="panel-heading">
														<a href="#faq-3-44" data-parent="#faq-list-3" data-toggle="collapse" class="accordion-toggle collapsed">
															<i class="ace-icon fa fa-plus smaller-80" data-icon-hide="ace-icon fa fa-minus" data-icon-show="ace-icon fa fa-plus"></i>&nbsp;
					                               视频监控
														</a>
													</div>

													<div class="panel-collapse collapse" id="faq-3-44">
														<div class="panel-body">
															<label class="col-sm-3 control-label no-padding-right" for="form-field-1">UID</label>										                   
											                    <input type="text" id="Text16" placeholder="请输入" class="col-xs-10 col-sm-5" />
                                                                
                                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1">所在位置</label>										                   
											                    <input type="text" id="Text17" placeholder="请输入" class="col-xs-10 col-sm-5" />

                                                                
                                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1">监控项目</label>										                   
											                    <input type="text" id="Text18" placeholder="请输入" class="col-xs-10 col-sm-5" />
																 <label class="col-sm-3 control-label no-padding-right" for="form-field-1">维护情况</label>										                   
											                    <input type="text" id="Text19" placeholder="请输入" class="col-xs-10 col-sm-5" />
														</div>
                                                         <li>
															
												  			<button class="btn btn-info" type="button" onclick="submint('1');">
												    <i class="ace-icon fa fa-check bigger-110"></i>
												           提交
											               </button>                                            &nbsp;
															<button class="btn" type="reset" onclick="submint('0');">
												  <i class="ace-icon fa fa-undo bigger-110"></i>
												           暂存
											                </button>
														</li>
													</div>
                                                   
												</div>


                                                <div class="panel panel-default">
													<div class="panel-heading">
														<a href="#faq-3-45" data-parent="#faq-list-3" data-toggle="collapse" class="accordion-toggle collapsed">
															<i class="ace-icon fa fa-plus smaller-80" data-icon-hide="ace-icon fa fa-minus" data-icon-show="ace-icon fa fa-plus"></i>&nbsp;
					                               腐蚀控制
														</a>
													</div>

													<div class="panel-collapse collapse" id="faq-3-45">
														<div class="panel-body">
															<label class="col-sm-3 control-label no-padding-right" for="form-field-1">故障处理</label>										                   
											                    <input type="text" id="Text20" placeholder="请输入" class="col-xs-10 col-sm-5" />
                                                                
                                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1">设备/参数调整</label>										                   
											                    <input type="text" id="Text21" placeholder="请输入" class="col-xs-10 col-sm-5" />

                                                                
                                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1">定期测试</label>										                   
											                    <input type="text" id="Text22" placeholder="请输入" class="col-xs-10 col-sm-5" />
														</div>
                                                         <li>
															
												  			<button class="btn btn-info" type="button" onclick="submint('1');">
												    <i class="ace-icon fa fa-check bigger-110"></i>
												           提交
											               </button>                                            &nbsp;
															<button class="btn" type="reset" onclick="submint('0');">
												  <i class="ace-icon fa fa-undo bigger-110"></i>
												           暂存
											                </button>
														</li>
													</div>
												</div>

                                                <div class="panel panel-default">
													<div class="panel-heading">
														<a href="#faq-3-46" data-parent="#faq-list-3" data-toggle="collapse" class="accordion-toggle collapsed">
															<i class="ace-icon fa fa-plus smaller-80" data-icon-hide="ace-icon fa fa-minus" data-icon-show="ace-icon fa fa-plus"></i>&nbsp;
					                              高后果区管理
														</a>
													</div>

													<div class="panel-collapse collapse" id="faq-3-46">
														<div class="panel-body">
                                                           <label class="col-sm-3 control-label no-padding-right" for="form-field-1">站场</label>										                   
											                    <input type="text" id="gzhanchang" placeholder="请输入" class="col-xs-10 col-sm-5" runat="server"/>
                                                                
                                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1">高后果区编号</label>										                   
											                    <input type="text" id="gbianhao" placeholder="请输入" class="col-xs-10 col-sm-5" runat="server"/>

                                                                
                                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1">高后果区长度</label>										                   
											                    <input type="text" id="ghangdu" placeholder="请输入" class="col-xs-10 col-sm-5" runat="server"/>	
                                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1">高后果区行政区域</label>										                   
											                    <input type="text" id="gquyu" placeholder="请输入" class="col-xs-10 col-sm-5" runat="server"/>
                                                                




															<label class="col-sm-3 control-label no-padding-right" for="form-field-1">辖区内高后果区数量</label>										                   
											                    <input type="text" id="gggqshu" placeholder="请输入" class="col-xs-10 col-sm-5" runat="server"/>
                                                                
                                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1">今日检查数量</label>										                   
											                    <input type="text" id="gjcshu" placeholder="请输入" class="col-xs-10 col-sm-5" runat="server"/>

                                                                
                                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1">宣传走访情况</label>										                   
											                    <input type="text" id="gzoufang" placeholder="请输入" class="col-xs-10 col-sm-5" runat="server"/>	
                                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1">走访人次</label>										                   
											                    <input type="text" id="gzoufangci" placeholder="请输入" class="col-xs-10 col-sm-5" runat="server"/>
                                                                
                                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1">演练情况</label>										                   
											                    <input type="text" id="gyanlian" placeholder="请输入" class="col-xs-10 col-sm-5" runat="server"/>
                                                                 <label class="col-sm-3 control-label no-padding-right" for="form-field-1">发现问题</label>										                   
											                    <input type="text" id="gwenti" placeholder="请输入" class="col-xs-10 col-sm-5" runat="server"/>

                                                                </div>
                                                                 <li>
															
												  			<button class="btn btn-info" type="button" onclick="f_gsubmint('1');">
												    <i class="ace-icon fa fa-check bigger-110"></i>
												           提交
											               </button>                                            &nbsp;
															<button class="btn" type="reset" onclick="f_gsubmint('0');">
												  <i class="ace-icon fa fa-undo bigger-110"></i>
												           暂存
											                </button>
														</li>
													</div>
												</div>
                                                 <div class="panel panel-default">
													<div class="panel-heading">
														<a href="#faq-3-47" data-parent="#faq-list-3" data-toggle="collapse" class="accordion-toggle collapsed">
															<i class="ace-icon fa fa-plus smaller-80" data-icon-hide="ace-icon fa fa-minus" data-icon-show="ace-icon fa fa-plus"></i>&nbsp;
					                              巡线工管理
														</a>
													</div>

													<div class="panel-collapse collapse" id="faq-3-47">
														<div class="panel-body">
															<label class="col-sm-3 control-label no-padding-right" for="form-field-1">辖区巡线工总数</label>										                   
											                    <input type="text" id="Text28" placeholder="请输入" class="col-xs-10 col-sm-5" />
                                                                
                                                                 <label class="col-sm-3 control-label no-padding-right" for="form-field-1">今日请假情况</label>										                   
											                    <input type="text" id="Text33" placeholder="请输入" class="col-xs-10 col-sm-5" />
                                                                
                                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1">今日检查数量</label>										                   
											                    <input type="text" id="Text29" placeholder="请输入" class="col-xs-10 col-sm-5" />

                                                                
                                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1">人员名称</label>										                   
											                    <input type="text" id="Text30" placeholder="请输入" class="col-xs-10 col-sm-5" />	
                                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1">发现问题</label>										                   
											                    <input type="text" id="Text31" placeholder="请输入" class="col-xs-10 col-sm-5" />
                                                                
                                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1">今日奖罚</label>										                   
											                    <input type="text" id="Text32" placeholder="请输入" class="col-xs-10 col-sm-5" />

													</div>
                                                     <li>
															
												  			<button class="btn btn-info" type="button" onclick="submint('1');">
												    <i class="ace-icon fa fa-check bigger-110"></i>
												           提交
											               </button>                                            &nbsp;
															<button class="btn" type="reset" onclick="submint('0');">
												  <i class="ace-icon fa fa-undo bigger-110"></i>
												           暂存
											                </button>
														</li>
													</div>
												</div>

                                                <div class="panel panel-default">
													<div class="panel-heading">
														<a href="#faq-3-48" data-parent="#faq-list-3" data-toggle="collapse" class="accordion-toggle collapsed">
															<i class="ace-icon fa fa-plus smaller-80" data-icon-hide="ace-icon fa fa-minus" data-icon-show="ace-icon fa fa-plus"></i>&nbsp;
					                              三桩费发放
														</a>
													</div>

													<div class="panel-collapse collapse" id="faq-3-48">
														<div class="panel-body">
															<label class="col-sm-3 control-label no-padding-right" for="form-field-1">辖区应发金额</label>										                   
											                    <input type="text" id="Text34" placeholder="请输入" class="col-xs-10 col-sm-5" />
                                                                
                                                                 <label class="col-sm-3 control-label no-padding-right" for="form-field-1">今日发放金额</label>										                   
											                    <input type="text" id="Text35" placeholder="请输入" class="col-xs-10 col-sm-5" />
                                                                </div>
                                                                 <li>
															
												  			<button class="btn btn-info" type="button" onclick="submint('1');">
												    <i class="ace-icon fa fa-check bigger-110"></i>
												           提交
											               </button>                                            &nbsp;
															<button class="btn" type="reset" onclick="submint('0');">
												  <i class="ace-icon fa fa-undo bigger-110"></i>
												           暂存
											                </button>
														</li>
													</div>
												</div>

                                                 <div class="panel panel-default">
													<div class="panel-heading">
														<a href="#faq-3-49" data-parent="#faq-list-3" data-toggle="collapse" class="accordion-toggle collapsed">
															<i class="ace-icon fa fa-plus smaller-80" data-icon-hide="ace-icon fa fa-minus" data-icon-show="ace-icon fa fa-plus"></i>&nbsp;
					                             管道光缆复测
														</a>
													</div>

													<div class="panel-collapse collapse" id="faq-3-49">
														<div class="panel-body">
															<label class="col-sm-3 control-label no-padding-right" for="form-field-1">辖区管道里程</label>										                   
											                    <input type="text" id="Text36" placeholder="请输入" class="col-xs-10 col-sm-5" />
                                                                
                                                                 <label class="col-sm-3 control-label no-padding-right" for="form-field-1">辖区光缆里程</label>										                   
											                    <input type="text" id="Text37" placeholder="请输入" class="col-xs-10 col-sm-5" />
                                                                
                                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1">今日复测管道里程</label>										                   
											                    <input type="text" id="Text38" placeholder="请输入" class="col-xs-10 col-sm-5" />

                                                                
                                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1">今日复测光缆里程</label>										                   
											                    <input type="text" id="Text39" placeholder="请输入" class="col-xs-10 col-sm-5" />	
                                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1">发现问题</label>										                   
											                    <input type="text" id="Text40" placeholder="请输入" class="col-xs-10 col-sm-5" />
                                                                
                                                      	</div>
                                                          <li>
															
												  			<button class="btn btn-info" type="button" onclick="submint('1');">
												    <i class="ace-icon fa fa-check bigger-110"></i>
												           提交
											               </button>                                            &nbsp;
															<button class="btn" type="reset" onclick="submint('0');">
												  <i class="ace-icon fa fa-undo bigger-110"></i>
												           暂存
											                </button>
														</li>
													</div>
												</div>

                                                <div class="panel panel-default">
													<div class="panel-heading">
														<a href="#faq-3-50" data-parent="#faq-list-3" data-toggle="collapse" class="accordion-toggle collapsed">
															<i class="ace-icon fa fa-plus smaller-80" data-icon-hide="ace-icon fa fa-minus" data-icon-show="ace-icon fa fa-plus"></i>&nbsp;
					                             宣传走访
														</a>
													</div>

													<div class="panel-collapse collapse" id="faq-3-50">
														<div class="panel-body">
                                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">县区级重点部门</label>										                   
											                    <input type="text" id="Text41" placeholder="请输入" class="col-xs-10 col-sm-5" />
                                                                
                                                                 <label class="col-sm-3 control-label no-padding-right" for="form-field-1">乡镇政府及部门派出机构</label>										                   
											                    <input type="text" id="Text42" placeholder="请输入" class="col-xs-10 col-sm-5" />
                                                                
                                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1">村委</label>										                   
											                    <input type="text" id="Text43" placeholder="请输入" class="col-xs-10 col-sm-5" />

                                                                
                                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1">机械手</label>										                   
											                    <input type="text" id="Text44" placeholder="请输入" class="col-xs-10 col-sm-5" />	
                                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1">信息员</label>										                   
											                    <input type="text" id="Text45" placeholder="请输入" class="col-xs-10 col-sm-5" />
                                                                


                                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1">农田户主</label>										                   
											                    <input type="text" id="Text46" placeholder="请输入" class="col-xs-10 col-sm-5" />
                                                                
                                                                 <label class="col-sm-3 control-label no-padding-right" for="form-field-1">应走访数量</label>										                   
											                    <input type="text" id="Text47" placeholder="请输入" class="col-xs-10 col-sm-5" />
                                                                
                                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1">今日走访量</label>										                   
											                    <input type="text" id="Text48" placeholder="请输入" class="col-xs-10 col-sm-5" />

                                                                
                                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1">走访数量</label>										                   
											                    <input type="text" id="Text49" placeholder="请输入" class="col-xs-10 col-sm-5" />	
                                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1">走访进度</label>										                   
											                    <input type="text" id="Text50" placeholder="请输入" class="col-xs-10 col-sm-5" />
                                                                
												    	</div>
                                                          <li>
															
												  			<button class="btn btn-info" type="button" onclick="submint('1');">
												    <i class="ace-icon fa fa-check bigger-110"></i>
												           提交
											               </button>                                            &nbsp;
															<button class="btn" type="reset" onclick="submint('0');">
												  <i class="ace-icon fa fa-undo bigger-110"></i>
												           暂存
											                </button>
														</li>
													</div>
												</div>
                                                  <div class="panel panel-default">
													<div class="panel-heading">
														<a href="#faq-311-4" data-parent="#faq-list-3" data-toggle="collapse" class="accordion-toggle collapsed">
															<i class="ace-icon fa fa-plus smaller-80" data-icon-hide="ace-icon fa fa-minus" data-icon-show="ace-icon fa fa-plus"></i>&nbsp;
					                             防汛管理
														</a>
													</div>

													<div class="panel-collapse collapse" id="faq-311-4">
														<div class="panel-body">
                                                        <label class="col-sm-3 control-label no-padding-right" for="form-field-1">站场</label>										                   
											                    <input type="text" id="fzhanchang" placeholder="请输入站场" class="col-xs-10 col-sm-5" runat="server"/>
                                                                
                                                                 <label class="col-sm-3 control-label no-padding-right" for="form-field-1">行政位置</label>										                   
											                    <input type="text" id="fweizhi" placeholder="请输入" class="col-xs-10 col-sm-5" runat="server"/>
                                                                 <label class="col-sm-3 control-label no-padding-right" for="form-field-1">防汛重点部位名称</label>										                   
											                    <input type="text" id="fbuwei" placeholder="请输入防汛重点部位名称" class="col-xs-10 col-sm-5" runat="server"/>
                                                                 <label class="col-sm-3 control-label no-padding-right" for="form-field-1">类型</label>										                   
											                    <input type="text" id="fleixing" placeholder="请输入" class="col-xs-10 col-sm-5" runat="server" />
                                                                 <label class="col-sm-3 control-label no-padding-right" for="form-field-1">本周巡线工是否每天巡检</label>										                   
											                    <input type="text" id="fsfxunxian" placeholder="请输入" class="col-xs-10 col-sm-5" runat="server"/>

                                                                 <label class="col-sm-3 control-label no-padding-right" for="form-field-1">巡线工巡检结果</label>										                   
											                    <input type="text" id="fxunxianjg" placeholder="请输入" class="col-xs-10 col-sm-5" runat="server"/>
                                                                
                                                                 <label class="col-sm-3 control-label no-padding-right" for="form-field-1">本周巡线管理人员巡检登记</label>										                   
											                    <input type="text" id="fbenzhou" placeholder="请输入" class="col-xs-10 col-sm-5" runat="server"/>
                                                                
                                                                 <label class="col-sm-3 control-label no-padding-right" for="form-field-1">巡线管理人员巡检结果</label>										                   
											                    <input type="text" id="fglyjieguo" placeholder="请输入" class="col-xs-10 col-sm-5" runat="server"/>
                                                                 <label class="col-sm-3 control-label no-padding-right" for="form-field-1">巡线工未完成每日巡检/发现异常情况详细说明</label>										                   
											                    <input type="text" id="fshuoming" placeholder="请输入" class="col-xs-10 col-sm-5" runat="server"/>

                                                               <label class="col-sm-3 control-label no-padding-right" for="form-field-1">治早治小</label>										                   
											                    <input type="text" id="fzhizao" placeholder="请输入" class="col-xs-10 col-sm-5" runat="server"/>
                                                                
                                                                 <label class="col-sm-3 control-label no-padding-right" for="form-field-1">设施维护</label>										                   
											                    <input type="text" id="fweihu" placeholder="请输入" class="col-xs-10 col-sm-5" runat="server"/>
                                                                
                                                                <label class="col-sm-3 control-label no-padding-right" for="form-field-1">其他</label>										                   
											                    <input type="text" id="fqt" placeholder="请输入" class="col-xs-10 col-sm-5" runat="server"/>

														    
                                                        </div>
                                                        <li>
															
												  			<button class="btn btn-info" type="button" onclick="f_fsubmint('1');">
												    <i class="ace-icon fa fa-check bigger-110"></i>
												           提交
											               </button>                                            &nbsp;
															<button class="btn" type="reset" onclick="f_fsubmint('0');">
												  <i class="ace-icon fa fa-undo bigger-110"></i>
												           暂存
											                </button>
														</li>
													</div>
												</div>
                                                 <div class="panel panel-default">
													<div class="panel-heading">
														<a href="#faq-3-51" data-parent="#faq-list-3" data-toggle="collapse" class="accordion-toggle collapsed">
															<i class="ace-icon fa fa-plus smaller-80" data-icon-hide="ace-icon fa fa-minus" data-icon-show="ace-icon fa fa-plus"></i>&nbsp;
					                             资料整理
														</a>
													</div>

													<div class="panel-collapse collapse" id="faq-3-51">
														<div class="panel-body">
															<label class="col-sm-3 control-label no-padding-right" for="form-field-1">其他</label>										                   
											                    <input type="text" id="Text54" placeholder="请输入" class="col-xs-10 col-sm-5" />
                                                         </div>
                                                          <li>
															
												  			<button class="btn btn-info" type="button" onclick="submint('1');">
												    <i class="ace-icon fa fa-check bigger-110"></i>
												           提交
											               </button>                                            &nbsp;
															<button class="btn" type="reset" onclick="submint('0');">
												  <i class="ace-icon fa fa-undo bigger-110"></i>
												           暂存
											                </button>
														</li>
													</div>
												</div>
                                                 <div class="panel panel-default">
													<div class="panel-heading">
														<a href="#faq-3-52" data-parent="#faq-list-3" data-toggle="collapse" class="accordion-toggle collapsed">
															<i class="ace-icon fa fa-plus smaller-80" data-icon-hide="ace-icon fa fa-minus" data-icon-show="ace-icon fa fa-plus"></i>&nbsp;
					                            其他工作
														</a>
													</div>

													<div class="panel-collapse collapse" id="faq-3-52">
														<div class="panel-body">
															<label class="col-sm-3 control-label no-padding-right" for="form-field-1">其他</label>										                   
											                    <input type="text" id="Text55" placeholder="请输入" class="col-xs-10 col-sm-5" />
                                                        </div>
                                                        <li>
															
												  			<button class="btn btn-info" type="button" onclick="submint('1');">
												    <i class="ace-icon fa fa-check bigger-110"></i>
												           提交
											               </button>                                            &nbsp;
															<button class="btn" type="reset" onclick="submint('0');">
												  <i class="ace-icon fa fa-undo bigger-110"></i>
												           暂存
											                </button>
														</li>
													</div>
												</div>
											</div>
										</div>
                                        <div id="faq-tab-qj" class="tab-pane fade">											
                                            <%--<h4 class="blue">
												<i class="ace-icon fa fa-check bigger-110"></i>
												请假
											</h4>
											<div class="space-8"></div>--%>
                                            <div class="col-xs-6 col-sm-3 pricing-box">
										<div class="widget-box widget-color-orange">
											<div class="widget-header">
												<h5 class="widget-title bigger lighter">请假</h5>
											</div>

											<div class="widget-body">
												<div class="widget-main">
													<ul class="list-unstyled spaced2">
														<li>
															<i class="ace-icon fa fa-check green"></i>
															<input type="text" class="demo-input" placeholder="开始日期" id="startqj" />
														</li>

														<li>
															<i class="ace-icon fa fa-check green"></i>
															<input type="text" class="demo-input" placeholder="结束日期" id="endqj" />
														</li>
                                                        <li>
                                                      
															<div class="form-group">
										<label class="col-sm-2 control-label no-padding-right"><i class="ace-icon fa fa-check green"></i>原因</label>
										<div class="col-sm-10">
											<span class="input-icon">
												<textarea class="form-control limited" id="qjreason" maxlength="40"></textarea>
												
											</span>
										</div>
									</div>
								</li>
                                <li>
															<i class="ace-icon fa fa-check green"></i>
                                <hr />
                                </li>
														<li>
															
															<button class="btn btn-info" type="button" onclick="submint('1');">
												<i class="ace-icon fa fa-check bigger-110"></i>
												提交
											</button>
                                            &nbsp;
															<button class="btn" type="reset" onclick="submint('0');">
												<i class="ace-icon fa fa-undo bigger-110"></i>
												暂存
											</button>
														</li>

														<li>
															
														</li>

														

														
													</ul>

													<hr />
													<div class="price">
														
														
													</div>
												</div>

												<div>
													<a href="#" class="btn btn-block btn-warning">
														<i class="ace-icon fa fa-shopping-cart bigger-110"></i>
														<span></span>
													</a>
												</div>
											</div>
										</div>
									</div>
                                       </div>
                                       <div id="faq-tab-lunxiu" class="tab-pane fade">
                                       	<div class="col-xs-6 col-sm-3 pricing-box">
										<div class="widget-box widget-color-blue">
											<div class="widget-header">
												<h5 class="widget-title bigger lighter">轮休</h5>
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
											<i class="ace-icon fa fa-check green"></i>				
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

												<%--<div class="panel panel-default">
													<div class="panel-heading">
														<a href="#faq-4-2-xx" data-parent="#faq-list-4-xx" data-toggle="collapse" class="accordion-toggle collapsed">
															<i class="ace-icon fa fa-frown-o bigger-120" data-icon-hide="ace-icon fa fa-smile-o" data-icon-show="ace-icon fa fa-frown-o"></i>&nbsp;
					  Single-origin coffee nulla assumenda shoreditch et?
														</a>
													</div>

													<div class="panel-collapse collapse" id="faq-4-2-xx">
														<div class="panel-body">
															Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute, non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid single-origin coffee nulla assumenda shoreditch et.
														</div>
													</div>
												</div>--%>

												<div class="panel panel-default">
													<div class="panel-heading">
														<a href="#faq-4-3-xx" data-parent="#faq-list-4-xx" data-toggle="collapse" class="accordion-toggle collapsed">
															<i class="ace-icon fa fa-plus smaller-80" data-icon-hide="ace-icon fa fa-minus" data-icon-show="ace-icon fa fa-plus"></i>&nbsp;
					                                添加备注
														</a>
													</div>

													<div class="panel-collapse collapse" id="faq-4-3-xx">
														<div class="panel-body">
															<textarea class="form-control" id="bzxx" placeholder="Default Text"></textarea>
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
														<a  data-parent="#faq-list-4" data-toggle="collapse" class="accordion-toggle collapsed">
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

    </form>
</body>
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

