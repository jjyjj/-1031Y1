<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="xh_xunxiangong.aspx.cs" Inherits="MarketInfo.wd_dzrz._1xunhuaguanli.xh_xunxiangong" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title></title>
    <meta name="description" content="Draggabble Widget Boxes with Persistent Position and State" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
    <!-- bootstrap & fontawesome -->
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="../assets/font-awesome/4.5.0/css/font-awesome.min.css" />
    <!-- page specific plugin styles -->
    <link rel="stylesheet" href="../assets/css/jquery-ui.custom.min.css" />
    <!-- text fonts -->
    <link rel="stylesheet" href="../assets/css/fonts.googleapis.com.css" />
    <!-- ace styles -->
    <link rel="stylesheet" href="../assets/css/ace.min.css" class="ace-main-stylesheet"
        id="main-ace-style" />
    <!--[if lte IE 9]>
			<link rel="stylesheet" href="/assets/css/ace-part2.min.css" class="ace-main-stylesheet" />
		<![endif]-->
    <link rel="stylesheet" href="../assets/css/ace-skins.min.css" />
    <link rel="stylesheet" href="../lib/assets/css/ace-rtl.min.css" />
    <link href="../css/mui.min.css" rel="stylesheet" type="text/css" />
    <script src="../assets/js/ace-extra.min.js" type="text/javascript"></script>
    <style type="text/css">
    ul li{ list-style-type:none;}
    </style>
</head>
<body class="no-skin">
    <div class="main-container ace-save-state" id="main-container">
        <script type="text/javascript">
            try { ace.settings.loadState('main-container') } catch (e) { }
        </script>
        <div class="main-content">
            <div class="main-content-inner">
                <div class="page-content">

                    <div class="row">
                        <div class="col-xs-12">
                            <!-- PAGE CONTENT BEGINS -->
                            <div class="invisible" id="main-widget-container">
                                <div class="row"><!--wd_dzrz/wd_ywsb.aspx-->
                                 <h3 class="header smaller lighter blue"> <a class="btn btn-info" href="../xunhu.aspx"><i class="ace-icon fa fa-reply icon-only"></i>&nbsp;返回上级</a> </h3>
                                    <form id="Form1" runat="server">
                                     <input type="hidden" id="hideZid" value="" runat="server" />
										
                                     <input type="hidden" id="hideFid" value="" runat="server" />
                                    <!--添加-->
                                    <div class="col-xs-12 col-sm-4 Is_HS_ADD" style="display:none">
                                        <div class="widget-box">
                                            <div class="widget-header">
                                                <h4 class="widget-title">新增巡线工信息</h4>
                                                <span class="widget-toolbar">
                                                <a href="#" data-action="settings"><i class="ace-icon fa fa-cog"></i></a>
                                                <a href="#" data-action="reload"><i class="ace-icon fa fa-refresh"></i></a>
                                                <a href="#" data-action="collapse"><i class="ace-icon fa fa-chevron-up"></i></a> 
                                                <a href="#"  onclick="x_cancel22()" ><i class="ace-icon fa fa-times"></i></a></span>
                                           
                                            </div>
                                            <div class="widget-body">
                                                <div class="widget-main">
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">姓名: </span>
                                                            <input class="form-control input-mask-phone" type="text" id="xxname" placeholder="请输入"  runat="server" />
                                                        </div></div>
                                                    &nbsp;
                                                    <div><div class="input-group">
                                                            <span class="input-group-addon">年龄</span>
                                                            <input class="form-control input-mask-phone" type="text" id="xxnianling" placeholder="请输入"  runat="server" />
                                                        </div></div>
                                                    &nbsp;
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">身份证号 </span>
                                                            <input class="form-control input-mask-phone" type="text" id="xxshenfenzheng" placeholder="请输入"  runat="server" />
                                                        </div></div>
                                                    &nbsp;
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">电话 </span>
                                                            <input class="form-control input-mask-phone" type="text" id="xxtel" placeholder="请输入"  runat="server" />
                                                        </div></div>
                                                         &nbsp;
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">负责起点桩号: </span>
                                                            <input class="form-control input-mask-phone" type="text" id="xxqdzh" placeholder="请输入"  runat="server" />
                                                        </div></div>
                                                    &nbsp;
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">负责终点桩号: </span>
                                                            <input class="form-control input-mask-phone" type="text" id="xxzdzh" placeholder="请输入"  runat="server" />
                                                        </div></div>
                                                    &nbsp;
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">管理里程</span>
                                                            <input class="form-control input-mask-phone" type="text" id="licheng" placeholder="公里"  runat="server" />
                                                        </div></div>
                                                     &nbsp;
                                                    <div>
                                                    <ul>
                                                        <li>
                                                            <button class="btn btn-info" type="button" onclick="x_submint();">
                                                                <i class="ace-icon fa fa-check bigger-110"></i>保存
                                                            </button>
                                                           <%-- &nbsp;
                                                            <button class="btn" type="reset" onclick="x_submint('0');">
                                                                <i class="ace-icon fa fa-undo bigger-110"></i>取消
                                                            </button>--%>
                                                        </li></ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!--列表-->
                                    <div class="col-xs-12 col-sm-6 widget-container-col Is_HSaa" id="widget-container-col-244" style="display:none">
                                        <div class="widget-box widget-color-blue" id="widget-box-2">
                                            <div class="widget-header">
                                                <h5 class="widget-title bigger lighter">
                                                    <span style="color: #FFFFFF; font-weight: bolder;"><i class="ace-icon fa fa-table"></i>人员信息列表</span>
                                                   
												<span style="color: #FFFFFF; font-weight: bolder;" class="ace-icon glyphicon glyphicon-plus" onclick="f_add();"></span>
												
											
                                                </h5>
                                            </div>
                                            <div class="widget-body">
                                                <div class="widget-main no-padding">
                                                    <table class="table table-striped table-bordered table-hover">
                                                        <thead class="thin-border-bottom">
                                                            <tr>
                                                            <th class="input-group-addon">序号</th>
                                                              
                                                                <th class="input-group-addon">姓名</th> 
                                                                <th class="input-group-addon">起点</th> 
                                                                <th class="input-group-addon">终点</th> 
                                                                <th class="input-group-addon hidden-480">里程</th>                                                              
                                                                <%--<th class="input-group-addon">操作</th>--%>
                                                                <th class="input-group-addon hidden-480" >操作</th>
                                                                <th class="input-group-addon hidden-480">照片</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                        <% if (dt_1 != null) { for (int i = 0; i < dt_1.Rows.Count; i++) {  %>
                                                            <tr>    
                                                                <td class="input-group-addon"><%=i+1 %></td>
                                                                <td class="input-group-addon"><%=dt_1.Rows[i]["xx_name"]%></td> 
                                                                <td class="input-group-addon"><%=dt_1.Rows[i]["xx_qdzh"]%></td> 
                                                                <td class="input-group-addon"><%=dt_1.Rows[i]["xx_zdzh"]%></td> 
                                                               
                                                                <td class="input-group-addon hidden-480"><%=dt_1.Rows[i]["xx_licheng"]%></td>
                                                             
                                                               <%-- <td class="input-group-addon">
                                                                    <a href="xh_xunxiangonglist.aspx"  title="详情">详情</a>
                                                                                                                       
                                                                </td>--%>
                                                                 <td class="input-group-addon hidden-480">	
                                                                     <a href="javascript:;" title="编辑台账信息" onclick="x_update('<%=dt_1.Rows[i]["xx_id"]%>','<%=dt_1.Rows[i]["xx_name"]%>','<%=dt_1.Rows[i]["xx_qdzh"]%>','<%=dt_1.Rows[i]["xx_zdzh"]%>','<%=dt_1.Rows[i]["xx_licheng"]%>','<%=dt_1.Rows[i]["xx_shenfenhao"]%>','<%=dt_1.Rows[i]["xx_nianling"] %>','<%=dt_1.Rows[i]["xx_tel"] %>')">
                                                                   <i class="ace-icon fa fa-pencil-square-o"></i></a> 										
                                                                    <a href="javascript:;" title="分配人员" onclick="f_fenpei('<%=dt_1.Rows[i]["xx_id"]%>','<%=dt_1.Rows[i]["xx_name"]%>')">
                                                                  	<i class="ace-icon fa fa-external-link"></i></a>                                                             
                                                                                                                    
                                                                </td>
                                                                 <td class="input-group-addon hidden-480">
                                                                        <a  id="gritter-center" alt="点击去添加照片" class="ace-icon glyphicon glyphicon-plus" href="xh_addphoto.aspx?TID=<%=dt_1.Rows[i]["xx_id"] %>">
												<i class="ace-icon fa fa-camera"></i>
												
											</a>                                                            
                                                               
                                                                </td>
                                                            </tr>
                                                            <% } }%>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                          
                                        
                                         <!--巡线工信息完善--> 
                                    <div class="col-xs-12 col-sm-4 Is_HS_Up" style="display:none;">
                                        <div class="widget-box">
                                            <div class="widget-header">
                                                <h4 class="widget-title">完善台账信息</h4>
                                                <span class="widget-toolbar">
                                                <a href="#" data-action="settings"><i class="ace-icon fa fa-cog"></i></a>
                                                <a href="#" data-action="reload"><i class="ace-icon fa fa-refresh"></i></a>
                                                <a href="#" data-action="collapse"><i class="ace-icon fa fa-chevron-up"></i></a>
                                                <a href="#"  onclick="x_cancel()" ><i class="ace-icon fa fa-times"></i></a></span>
                                            </div>
                                            <div class="widget-body">
                                                <div class="widget-main">
                                                <input type="hidden" id="hide_id" value="" />
                                                
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">场站 </span>
                                                            <input class="form-control input-mask-phone" type="text" id="changzhan"   runat="server" readonly="readonly"/>
                                                        </div></div>
                                                    &nbsp;
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">姓名</span>
                                                            <input class="form-control input-mask-phone" type="text" id="xingming"   runat="server" readonly="readonly" />
                                                        </div></div>
                                                    &nbsp;
                                               <div>	
                                                        <label for="form-field-mask-2">
																家庭住址
																<small class="text-warning">填写详细的家庭住址</small>
															</label>
                                                            <div>
															<textarea class="form-control limited"  maxlength="50" placeholder="请输入家庭住址" runat="server" id="zhuzhi"></textarea>
														</div>							
															
														</div>
                                                    <div><div class="input-group">
                                                            <span class="input-group-addon">年龄</span>
                                                            <input class="form-control input-mask-phone" type="text" id="age" placeholder="请输入"  runat="server" />
                                                        </div></div>
                                                    &nbsp;
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">身份证号 </span>
                                                            <input class="form-control input-mask-phone" type="text" id="card" placeholder="请输入"  runat="server" />
                                                        </div></div>
                                                    &nbsp;
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">电话 </span>
                                                            <input class="form-control input-mask-phone" type="text" id="tel" placeholder="请输入"  runat="server" />
                                                        </div></div>
                                                         &nbsp;
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">负责起点桩号: </span>
                                                            <input class="form-control input-mask-phone" type="text" id="zhqd" placeholder="请输入"  runat="server" />
                                                        </div></div>
                                                    &nbsp;
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">负责终点桩号: </span>
                                                            <input class="form-control input-mask-phone" type="text" id="zhzd" placeholder="请输入"  runat="server" />
                                                        </div></div>
                                                    &nbsp;
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">管理里程</span>
                                                            <input class="form-control input-mask-phone" type="text" id="lc" placeholder="公里"  runat="server" />
                                                        </div></div>
                                                     &nbsp;
                                                       <div>	
                                                        <label for="form-field-mask-2">
																管辖区域
																<small class="text-warning">填写详细的管辖区域</small>
															</label>
                                                            <div>
															<textarea class="form-control limited"  maxlength="50" placeholder="若没有请输入无" runat="server" id="quyu"></textarea>
														</div>							
															
														</div>
                                                        
                                                    &nbsp;
                                                     <div>	
                                                        <label for="form-field-mask-2">
																人员变更信息
																<small class="text-warning">填写变更信息</small>
															</label>
                                                            <div>
															<textarea class="form-control limited"  maxlength="50" placeholder="若没有请输入无" runat="server" id="biangeng"></textarea>
														</div>							
															
														</div>
                                                     <div>	
                                                        <label for="form-field-mask-2">
																站内评价信息
																<small class="text-warning">填写详细的管辖区域</small>
															</label>
                                                            <div>
															<textarea class="form-control limited"  maxlength="50" placeholder="若没有请输入无" runat="server" id="zhanneipingjia"></textarea>
														</div>							
															
														</div>
                                                       
                                                    &nbsp;
                                                     <div>	
                                                        <label for="form-field-mask-2">
																其他
																<small class="text-warning">没有则填无</small>
															</label>
                                                            <div>
															<textarea class="form-control limited"  maxlength="50" placeholder="若没有请输入无" runat="server" id="qita"></textarea>
														</div>	
														</div>
                                                    <div>
                                                    <ul>
                                                        <li>
                                                            <button class="btn btn-info" type="button" onclick="x_saveup()"><i class="ace-icon fa fa-check bigger-110"></i>保存</button> 
                                                            <%-- &nbsp;
                                                            <button class="btn" type="reset" onclick="x_saveup();"><i class="ace-icon fa fa-undo bigger-110"></i>暂存</button>--%>
                                                        </li></ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                      <div class="col-xs-12 col-sm-4 Is_HS_UpF" style="display:none;">
                                        <div class="widget-box">
                                            <div class="widget-header">
                                                <h4 class="widget-title">人员分配</h4>
                                                <span class="widget-toolbar">
                                                <a href="#" data-action="settings"><i class="ace-icon fa fa-cog"></i></a>
                                                <a href="#" data-action="reload"><i class="ace-icon fa fa-refresh"></i></a>
                                                <a href="#" data-action="collapse"><i class="ace-icon fa fa-chevron-up"></i></a>
                                                <a href="#"  onclick="closes()" title="关闭"><i class="ace-icon fa fa-close"></i></a>
                                                </span>
                                            </div>
                                            <div class="widget-body">
                                                <div class="widget-main">
                                                 <input type="hidden" id="fpxxgid" value="" />
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">巡线工姓名</span>
                                                            <input class="form-control input-mask-phone" type="text" id="xxgname" placeholder="请输入"  runat="server" />
                                                        </div></div> &nbsp; 
                                                         <div><div class="input-group">
                                                            <span class="input-group-addon ">分配</span>
                                                            <span class="xxgname" type="text" id="Text1" ></span>
                                                        </div></div> &nbsp; 
                                                    <div>
                                                    <ul>
                                                        <li>
                                                            <button class="btn btn-info update_s" type="button" onclick="f_feipei()"><i class="ace-icon fa fa-check bigger-110"></i>保存</button> 
                                                            <button class="btn btn-info add_s" type="button" onclick="closes()"><i class="ace-icon fa fa-check bigger-110"></i>取消</button> 
                                                        </li>
                                                    </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div> 
                                    </form>
                                </div>
                                <!-- /.row -->
                            </div>
                        </div>
                         <div class="col-xs-12 Is_HS">
                                            <div class="table-header ">
                                            巡线工信息台账
                                              &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; <span style="color: #FFFFFF; font-weight: bolder;" class="ace-icon glyphicon glyphicon-plus" onclick="f_add();">添加巡线工</span>
												
                                            </div>

                                            <!-- div.table-responsive -->
                                            <!-- div.dataTables_borderWrap -->
                                            <div>
                                                <table id="dynamic-table" class="table table-striped table-bordered table-hover">
                                                    <thead>
                                                        <tr>
                                                            <th class="input-group-addon">
                                                                序号
                                                            </th>
                                                            <th class="input-group-addon">
                                                               姓名
                                                            </th>
                                                            <th class="input-group-addon hidden-480">
                                                                住址
                                                            </th>
                                                            <th class="input-group-addon hidden-480">
                                                                管辖区域
                                                            </th>
                                                            <th class="input-group-addon ">
                                                                起点
                                                            </th>
                                                            <th class="input-group-addon">
                                                                终点
                                                            </th>
                                                            <th class="input-group-addon hidden-480">
                                                              里程
                                                            </th>
                                                            <th class="input-group-addon  hidden-480">
                                                                电话
                                                            </th>
                                                            <th class="input-group-addon  hidden-480">
                                                               年龄                                                            </th>
                                                        <th class="input-group-addon  hidden-480">
                                                                身份证号
                                                            </th>
                                                            <th class="input-group-addon  hidden-480">
                                                                人员变更信息
                                                            </th>
                                                            <th class="input-group-addon  hidden-480">
                                                                站内评价
                                                            </th>
                                                            <th class="input-group-addon  hidden-480">
                                                               其他
                                                            </th>
                                                            <th class="input-group-addon  hidden-480">
                                                                照片
                                                            </th>
                                                             <th class="input-group-addon">
                                                                操作
                                                            </th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <% if (dt_1 != null)
                                                           {
                                                               for (int i = 0; i < dt_1.Rows.Count; i++)
                                                               {  %>
                                                    <tr>
														<td class="input-group-addon center">
															<%=i+1%>
														</td>
                                                       
                                                       
                                                        <td class="input-group-addon" >
															<%=dt_1.Rows[i]["xx_name"]%>
														</td>
                                                           													
														<td class="hidden-480" width="10%" style=" word-wrap:break-word;  font-size: 14px; background-color: #eee; color:#555;">
                                                            <%=dt_1.Rows[i]["xx_jiating_zh"]%></td>
														<td class="hidden-480"  width="10%" style=" word-wrap:break-word;  font-size: 14px; background-color: #eee; color:#555;"><%=dt_1.Rows[i]["xx_guanxia_qy"]%></td>
														<td class="input-group-addon"><span class="label label-sm label-warning">
                                                            <%=dt_1.Rows[i]["xx_qdzh"]%></span></td>

														<td class="input-group-addon ">
															<%=dt_1.Rows[i]["xx_zdzh"]%>
														</td>

														<td class="input-group-addon  hidden-480">
															<%=dt_1.Rows[i]["xx_licheng"]%></td>
                                                             <td class="input-group-addon hidden-480"><%=dt_1.Rows[i]["xx_tel"]%></td>
                                                        <td class="input-group-addon hidden-480">
                                                          <%=dt_1.Rows[i]["xx_nianling"]%></td>


                                                        <td class="hidden-480"  width="3%" style=" word-wrap:break-word;  font-size: 14px; background-color: #eee; color:#555;">
                                                            <%=dt_1.Rows[i]["xx_shenfenhao"]%></td>

                                                        <td class="hidden-480"  width="10%" style=" word-wrap:break-word;  font-size: 14px; background-color: #eee; color:#555;">
                                                           <%=dt_1.Rows[i]["xx_renyuan_bgxx"]%></td>

                                                        <td class="hidden-480"  width="10%" style=" word-wrap:break-word;  font-size: 14px; background-color: #eee; color:#555;">
                                                            <%=dt_1.Rows[i]["xx_zhennei_pj"]%></td>

                                                        <td class="hidden-480"  width="10%" style=" word-wrap:break-word;  font-size: 14px; background-color: #eee; color:#555;">
                                                            <%=dt_1.Rows[i]["xx_qita"]%></td>
                                                        <td class="input-group-addon hidden-480">
                                                        <%if (dt_1.Rows[i]["xx_photo"].ToString() == "0")
                                                            {%>
                                                             <a  id="gritter-center11" href="xh_addphoto.aspx?TID=<%=dt_1.Rows[i]["xx_id"] %>">
												<i class="ace-icon fa fa-camera"></i>
												
											</a>                        
                                                            <%}
                                                            else {%>
                                                            	<div class="user">
																<img width="50" height="50" alt="<%=dt_1.Rows[i]["xx_name"].ToString()%>" src="..\photo\<%=dt_1.Rows[i]["xx_photo"].ToString()%>" onclick="f_addphoto('<%=dt_1.Rows[i]["xx_id"] %>')">
															</div> 
                                                          <%  } %>												                                                   
                                                    </td>
                                                     <td  class="input-group-addon ">
                                                     <a href="javascript:;" title="编辑台账信息" onclick="x_update('<%=dt_1.Rows[i]["xx_id"]%>','<%=dt_1.Rows[i]["xx_name"]%>','<%=dt_1.Rows[i]["xx_qdzh"]%>','<%=dt_1.Rows[i]["xx_zdzh"]%>','<%=dt_1.Rows[i]["xx_licheng"]%>','<%=dt_1.Rows[i]["xx_shenfenhao"]%>','<%=dt_1.Rows[i]["xx_nianling"] %>','<%=dt_1.Rows[i]["xx_tel"] %>')">
                                                                   <i class="ace-icon fa fa-pencil-square-o"></i></a> 										
                                                                    <a href="javascript:;" title="分配人员" onclick="f_fenpei('<%=dt_1.Rows[i]["xx_id"]%>','<%=dt_1.Rows[i]["xx_name"]%>')">
                                                                  	<i class="ace-icon fa fa-external-link"></i></a>                                                             
                                                                       

                                                         </td>
													</tr>
                                                        <% }
                                                           }%>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                    </div>
                </div>
            </div>
        </div>
        <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse"><i class="ace-icon fa fa-angle-double-up icon-only bigger-110">
        </i></a>
    </div>

</body>
</html>
    <script src="../assets/js/jquery-2.1.4.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        if ('ontouchstart' in document.documentElement) document.write("<script src='../assets/js/jquery.mobile.custom.min.js'>" + "<" + "/script>");
    </script>
    <script src="../assets/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- page specific plugin scripts -->
    <script src="../assets/js/jquery-ui.custom.min.js" type="text/javascript"></script>
    <script src="../assets/js/jquery.ui.touch-punch.min.js" type="text/javascript"></script>
    <!-- ace scripts -->
    <script src="../assets/js/ace-elements.min.js" type="text/javascript"></script>
    <script src="../assets/js/ace.min.js" type="text/javascript"></script>
    <script src="../js/mui.enterfocus.js" type="text/javascript"></script>
    <script src="../js/mui.min.js" type="text/javascript"></script>
  
    <!-- inline scripts related to this page -->
	
<script type="text/javascript">
    $(function () {       
        XXGData()//首次数据绑定
    })
    //巡线工绑定<a href="itxunxianzhanzhang.ashx">itxunxianzhanzhang.ashx</a>
    function XXGData() {
        var txtzid = $('#hideZid').val();
       // alert(txtzid);
        $.post('itxunxianzhanzhang.ashx?TID=' + txtzid, {}, function (data) {
            if (data != "-1") {
                XXGBind(data);
            } else {
                mui.toast('数据读取失败');
            }

        })
    }
    //站区单位//遍历数据
    function XXGBind(data) {
        var op = '';
        for (var p in data) {
            op += '<option value="' + data[p].T_ID + '">' + data[p].T_UNAME + '</option>';
        }
        $('.xxgname').append('<select id="t_id" class="form-control input-mask-phone" style="border:1px solid #D5D5D5 !important">' + op + '</select>');
    }
    //修改
    function x_saveup() {
       // alert($('#hideFid').val());
        var txttid = $('#hideFid').val();
      //  $('#hide_id')
        var txtid = $('#hide_id').val();
        var txtxingming = $('#xingming').val();
        var txtage = $('#age').val();
        var txtcard = $('#card').val();
        var txttel = $('#tel').val();
        var txtzhqd = $('#zhqd').val();
        var txtzhzd = $('#zhzd').val();
        var txtlc = $('#lc').val();
        var txtzhuzhi = $('#zhuzhi').val();
        var txtquyu = $('#quyu').val();
        var txtzhanneipingjia = $('#zhanneipingjia').val();
       
        var txtqita = $('#qita').val();
        var txtbg = $('#biangeng').val();
        if (verification2(txtxingming, txtage, txtcard, txttel, txtzhqd, txtzhzd, txtlc, txtquyu, txtzhanneipingjia, txtqita, txtzhuzhi)) {
            var url = "../../it/UpdateXunXianGong.ashx";
            $.post(url, { id: txtid, txtxingming: txtxingming, age: txtage, card: txtcard, tel: txttel, zhqd: txtzhqd, zhzd: txtzhzd, lc: txtlc, quyu: txtquyu, zhanneipingjia: txtzhanneipingjia, qita: txtqita, tid: txttid, zhuzhi: txtzhuzhi, bg: txtbg }, function (data) {
                if (data == "0") {
                   
                    //location.reload();
                    mui.toast("修改成功!");
                    x_cancel();
                    //location.reload();
                } else {
                    mui.toast(data);
                }
            });

        } else {
            mui.toast("请输入完整的信息~");
        }
    }
    //取消修改
    function x_cancel() {
        $('.Is_HS').show(500);
        $('.Is_HS_Up').hide(500);
    }
    //取消新增
    function x_cancel22() {
        $('.Is_HS').show(500);
        $('.Is_HS_Up').hide(500);
        $('.Is_HS_ADD').hide(500);

    }
   // Is_HS
    //取消修改
    function closes() {
        $('.Is_HS').show(500);
        $('.Is_HS_UpF').hide(500);
    }
    function f_add() {
        $('.Is_HS_ADD').show(500);
        $('.Is_HS').hide(500);
    }
    //修改绑定数据
    function x_update(id,name) {
        $('.Is_HS').hide(500);
        $('.Is_HS_Up').show(500);
        $('.Is_HS_ADD').hide(500);
        $('#xingming').val(name);
        $('#hide_id').val(id);
          $.post("../it/getxunxiangonginfo.ashx", { id: id }, function (data) {
            JSons(data);
        });

    }
    function JSons(data) {
        if (data != null && data.length != 0) {
            
            $('#xingming').val(data[0].xx_name);
            $('#zhuzhi').val(data[0].xx_jiating_zh);
            $('#age').val(data[0].xx_nianling);
            $('#card').val(data[0].xx_shenfenhao);
            $('#tel').val(data[0].xx_tel);

            $('#zhqd').val(data[0].xx_qdzh);
            $('#zhzd').val(data[0].xx_zdzh);
            $('#lc').val(data[0].xx_licheng);
            $('#quyu').val(data[0].xx_guanxia_qy);
            $('#biangeng').val(data[0].xx_renyuan_bgxx);

            $('#zhanneipingjia').val(data[0].xx_zhennei_pj);
            $('#qita').val(data[0].xx_qita);



            //
        }
    }
     //修改绑定数据
     function f_fenpei(id,name) {
         $('.Is_HS').hide(500);
         $('.Is_HS_UpF').show(500);
         $('#xxgname').val(name);
         $('#fpxxgid').val(id);

     }
     function f_feipei() {
         var txtname = $('#xxgname').val();
         var txtid = $('#fpxxgid').val();
         var txtfenprid = $('#t_id').val(); 
         mui.confirm('是否确认分配' + txtname + '？', '保存', function (e) {
             if (e.index == 1) {
                 savefp(txtid,txtfenprid);
             } else {
                 mui.toast('已取消');
             }
         })

     }
     function savefp(id,pid) {
         $.post("itfenpei.ashx", { id: id, pid: pid }, function (data) {
             if (data == "0") {
                 mui.toast("提交成功!");
                 location.reload();
             } else {
                 mui.toast(data);
             }
         })
     }
    //由暂存转为保存
    function x_save(id) {
        mui.confirm('是否确认保存？', '保存', function (e) {
            if (e.index == 1) {
                save(1, id);
            } else {
                mui.toast('已取消');
            }
        })

    }
    //由暂存转为保存
    function save(fg, id) {
        $.post("../../it/XunXianGongUpdateFg.ashx", { fg: fg, id: id }, function (data) {
            if (data == "0") {
                mui.toast("提交成功!");
                location.reload();
            } else {
                mui.toast(data);
            }
        })
    }
    //保存
    function x_submint() {

        var txttid = $('#hideFid').val();
        //mui.toast(txttid);
        var xxname = $('#xxname').val();
        var xxqdzh = $('#xxqdzh').val();
        var xxzdzh = $('#xxzdzh').val();
        var licheng = $('#licheng').val();
        var xxnianling = $('#xxnianling').val();
        var xxshenfenzheng = $('#xxshenfenzheng').val();
        var xxtel = $('#xxtel').val();
        if (verification(xxname, xxqdzh, xxzdzh, licheng, xxnianling, xxshenfenzheng, xxtel)) {
            $.post("../../it/AddXUNXiangong.ashx", { tid: txttid, xxname: xxname, xxqdzh: xxqdzh, xxzdzh: xxzdzh, licheng: licheng, xxnianling: xxnianling, xxshenfenzheng: xxshenfenzheng, xxtel: xxtel }, function (data) {
                if (data == "0") {

                    mui.toast("提交成功!");
                     location.reload();

                } else {
                    mui.toast(data);
                }
            })
        } else {
            mui.toast("请输入完整的信息~");
        }

    }
    function f_addphoto(id) {
        location.href = " xh_addphoto.aspx?TID="+id;
    }
    //验证
    function verification(xxname, xxqdzh, xxzdzh, licheng, xxnianling, xxshenfenzheng, xxtel) {
        var res = true;
        if (xxname == null || xxname == "") {
            res = false;
        }
        if (xxqdzh == null || xxqdzh == "") {
            res = false;
        }
        if (xxzdzh == null || xxzdzh == "") {
            res = false;
        }
        if (licheng == null || licheng == "") {
            res = false;
        }
        if (xxnianling == null || xxnianling == "") {
            res = false;
        }
        if (xxshenfenzheng == null || xxshenfenzheng == "") {
            res = false;
        }
        if (xxtel == null || xxtel == "") {
            res = false;
        } 
        return res;
    }

    //验证                txtxingming, txtage, txtcard, txttel, txtzhqd, txtzhzd, txtlc, txtquyu, txtzhanneipingjia, txtqita, txtzhuzhi
    function verification2(txtxingming, txtage, txtcard, txttel, txtzhqd, txtzhzd, txtlc, txtquyu, txtzhanneipingjia, txtqita,txtzhuzhi) {

       // alert(txtxingming);
        var res = true;
        if (txtxingming == null || txtxingming == "") {
            res = false;
        }
        if (txtage == null || txtage == "") {
            res = false;
        }
        if (txtcard == null || txtcard == "") {
            res = false;
        }
        if (txttel == null || txttel == "") {
            res = false;
        }
        if (txtzhqd == null || txtzhqd == "") {
            res = false;
        }
        if (txtzhzd == null || txtzhzd == "") {
            res = false;
        }
        if (txtlc == null || txtlc == "") {
            res = false;
        }

        if (txtquyu == null || txtquyu == "") {
            res = false;
        } //, 
        if (txtzhanneipingjia == null || txtzhanneipingjia == "") {
            res = false;
        }
        if (txtqita == null || txtqita == "") {
            res = false;
        }
        if (txtzhuzhi == null || txtzhuzhi == "") {
            res = false;
        }
      txtzhuzhi
        return res;
    }      
</script>
	<script type="text/javascript">
			jQuery(function($) {
			
				$('#simple-colorpicker-1').ace_colorpicker({pull_right:true}).on('change', function(){
					var color_class = $(this).find('option:selected').data('class');
					var new_class = 'widget-box';
					if(color_class != 'default')  new_class += ' widget-color-'+color_class;
					$(this).closest('.widget-box').attr('class', new_class);
				});		
			
				// scrollables
				$('.scrollable').each(function () {
					var $this = $(this);
					$(this).ace_scroll({
						size: $this.attr('data-size') || 100,
						//styleClass: 'scroll-left scroll-margin scroll-thin scroll-dark scroll-light no-track scroll-visible'
					});
				});
				$('.scrollable-horizontal').each(function () {
					var $this = $(this);
					$(this).ace_scroll(
					  {
						horizontal: true,
						styleClass: 'scroll-top',//show the scrollbars on top(default is bottom)
						size: $this.attr('data-size') || 500,
						mouseWheelLock: true
					  }
					).css({'padding-top': 12});
				});
				
				$(window).on('resize.scroll_reset', function() {
					$('.scrollable-horizontal').ace_scroll('reset');
				});
			
				
				$('#id-checkbox-vertical').prop('checked', false).on('click', function() {
					$('#widget-toolbox-1').toggleClass('toolbox-vertical')
					.find('.btn-group').toggleClass('btn-group-vertical')
					.filter(':first').toggleClass('hidden')
					.parent().toggleClass('btn-toolbar')
				});
				// widget boxes
				// widget box drag & drop example
			    $('.widget-container-col').sortable({
			        connectWith: '.widget-container-col',
					items:'> .widget-box',
					handle: ace.vars['touch'] ? '.widget-title' : false,
					cancel: '.fullscreen',
					opacity:0.8,
					revert:true,
					forceHelperSize:true,
					placeholder: 'widget-placeholder',
					forcePlaceholderSize:true,
					tolerance:'pointer',
					start: function(event, ui) {
						//when an element is moved, it's parent becomes empty with almost zero height.
						//we set a min-height for it to be large enough so that later we can easily drop elements back onto it
						ui.item.parent().css({'min-height':ui.item.height()})
						//ui.sender.css({'min-height':ui.item.height() , 'background-color' : '#F5F5F5'})
					},
					update: function(event, ui) {
						ui.item.parent({'min-height':''})
						//p.style.removeProperty('background-color');
			
						
						//save widget positions
						var widget_order = {}
						$('.widget-container-col').each(function() {
							var container_id = $(this).attr('id');
							widget_order[container_id] = []
							
							
							$(this).find('> .widget-box').each(function() {
								var widget_id = $(this).attr('id');
								widget_order[container_id].push(widget_id);
								//now we know each container contains which widgets
							});
						});
						
						ace.data.set('demo', 'widget-order', widget_order, null, true);
					}
			    });
				(function() {
					//restore widget order
					var container_list = ace.data.get('demo', 'widget-order', true);
					if(container_list) {
						for(var container_id in container_list) if(container_list.hasOwnProperty(container_id)) {
			
							var widgets_inside_container = container_list[container_id];
							if(widgets_inside_container.length == 0) continue;
							
							for(var i = 0; i < widgets_inside_container.length; i++) {
								var widget = widgets_inside_container[i];
								$('#'+widget).appendTo('#'+container_id);
							}
			
						}
					}
					
					
					//restore widget state
					var widgets = ace.data.get('demo', 'widget-state', true);
					if(widgets != null) {
						for(var id in widgets) if(widgets.hasOwnProperty(id)) {
							var state = widgets[id];
							var widget = $('#'+id);
							if
							(
								(state == 'shown' && widget.hasClass('collapsed'))
								||
								(state == 'hidden' && !widget.hasClass('collapsed'))
							) 
							{
								widget.widget_box('toggleFast');
							}
							else if(state == 'closed') {
								widget.widget_box('closeFast');
							}
						}
					}
					
					
					$('#main-widget-container').removeClass('invisible');
					
					
					//reset saved positions and states
					$('#reset-widgets').on('click', function() {
						ace.data.remove('demo', 'widget-state');
						ace.data.remove('demo', 'widget-order');
						document.location.reload();
					});				
				})();			
			});
		</script>




































    <script type="text/javascript">
			jQuery(function($) {
			
				$('#simple-colorpicker-1').ace_colorpicker({pull_right:true}).on('change', function(){
					var color_class = $(this).find('option:selected').data('class');
					var new_class = 'widget-box';
					if(color_class != 'default')  new_class += ' widget-color-'+color_class;
					$(this).closest('.widget-box').attr('class', new_class);
				});
			
			
				// scrollables
				$('.scrollable').each(function () {
					var $this = $(this);
					$(this).ace_scroll({
						size: $this.attr('data-size') || 100,
						//styleClass: 'scroll-left scroll-margin scroll-thin scroll-dark scroll-light no-track scroll-visible'
					});
				});
				$('.scrollable-horizontal').each(function () {
					var $this = $(this);
					$(this).ace_scroll(
					  {
						horizontal: true,
						styleClass: 'scroll-top',//show the scrollbars on top(default is bottom)
						size: $this.attr('data-size') || 500,
						mouseWheelLock: true
					  }
					).css({'padding-top': 12});
				});
				
				$(window).on('resize.scroll_reset', function() {
					$('.scrollable-horizontal').ace_scroll('reset');
				});
			
				
				$('#id-checkbox-vertical').prop('checked', false).on('click', function() {
					$('#widget-toolbox-1').toggleClass('toolbox-vertical')
					.find('.btn-group').toggleClass('btn-group-vertical')
					.filter(':first').toggleClass('hidden')
					.parent().toggleClass('btn-toolbar')
				});
				// widget boxes
				// widget box drag & drop example
			    $('.widget-container-col').sortable({
			        connectWith: '.widget-container-col',
					items:'> .widget-box',
					handle: ace.vars['touch'] ? '.widget-title' : false,
					cancel: '.fullscreen',
					opacity:0.8,
					revert:true,
					forceHelperSize:true,
					placeholder: 'widget-placeholder',
					forcePlaceholderSize:true,
					tolerance:'pointer',
					start: function(event, ui) {
						//when an element is moved, it's parent becomes empty with almost zero height.
						//we set a min-height for it to be large enough so that later we can easily drop elements back onto it
						ui.item.parent().css({'min-height':ui.item.height()})
						//ui.sender.css({'min-height':ui.item.height() , 'background-color' : '#F5F5F5'})
					},
					update: function(event, ui) {
						ui.item.parent({'min-height':''})
						//p.style.removeProperty('background-color');
			
						
						//save widget positions
						var widget_order = {}
						$('.widget-container-col').each(function() {
							var container_id = $(this).attr('id');
							widget_order[container_id] = []
							
							
							$(this).find('> .widget-box').each(function() {
								var widget_id = $(this).attr('id');
								widget_order[container_id].push(widget_id);
								//now we know each container contains which widgets
							});
						});
						
						ace.data.set('demo', 'widget-order', widget_order, null, true);
					}
			    });
				(function() {
					//restore widget order
					var container_list = ace.data.get('demo', 'widget-order', true);
					if(container_list) {
						for(var container_id in container_list) if(container_list.hasOwnProperty(container_id)) {
			
							var widgets_inside_container = container_list[container_id];
							if(widgets_inside_container.length == 0) continue;
							
							for(var i = 0; i < widgets_inside_container.length; i++) {
								var widget = widgets_inside_container[i];
								$('#'+widget).appendTo('#'+container_id);
							}
			
						}
					}
					
					
					//restore widget state
					var widgets = ace.data.get('demo', 'widget-state', true);
					if(widgets != null) {
						for(var id in widgets) if(widgets.hasOwnProperty(id)) {
							var state = widgets[id];
							var widget = $('#'+id);
							if
							(
								(state == 'shown' && widget.hasClass('collapsed'))
								||
								(state == 'hidden' && !widget.hasClass('collapsed'))
							) 
							{
								widget.widget_box('toggleFast');
							}
							else if(state == 'closed') {
								widget.widget_box('closeFast');
							}
						}
					}
					
					
					$('#main-widget-container').removeClass('invisible');
					
					
					//reset saved positions and states
					$('#reset-widgets').on('click', function() {
						ace.data.remove('demo', 'widget-state');
						ace.data.remove('demo', 'widget-order');
						document.location.reload();
					});				
				})();			
			});
    </script>
     