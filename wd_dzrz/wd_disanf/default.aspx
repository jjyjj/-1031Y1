<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="MarketInfo.wd_dzrz.wd_disanf._default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>第三方</title>
    <meta name="description" content="Draggabble Widget Boxes with Persistent Position and State" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" /> 
    <link href="../assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="../assets/font-awesome/4.5.0/css/font-awesome.min.css" /> 
    <link rel="stylesheet" href="../assets/css/jquery-ui.custom.min.css" /> 
    <link rel="stylesheet" href="../assets/css/fonts.googleapis.com.css" /> 
    <link rel="stylesheet" href="../assets/css/ace.min.css" class="ace-main-stylesheet"  /> 
    <link rel="stylesheet" href="../assets/css/ace-skins.min.css" />
    <link rel="stylesheet" href="../lib/assets/css/ace-rtl.min.css" />
    <link href="../css/mui.min.css" rel="stylesheet" type="text/css" />
    <script src="../assets/js/ace-extra.min.js" type="text/javascript"></script>
    <style type="text/css">
    ul li{ list-style-type:none;}
    .OverHideTd{ word-break:break-all; font-size: 14px; color:#555; text-align: center; background-color: #eee;font-weight: 400;} 
    @media screen and (min-width: 480px){
    h3.centersa{text-align:center;}
    div.auto_list{margin: 1%  0 0 25%;}
    div.auto_add {margin: 1%  0 0 33.333%;}
    }
    div.row h3.header a.btn { margin-top:5px;}
    </style>
    <script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script> 
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
                            
                            <form id="Form1">
                                <input type="hidden" id="hidexxqd" value="" />
                                <input type="hidden" id="hidexzsg" value="" />
                                <input type="hidden" id="hidedsfsg" value="" />
                                <input type="hidden" id="hidejhd" value="" />
                                <input type="hidden" id="hidejrjc" value="" />
                                <input type="hidden" id="hidexxtj" value="" />
                            <!-- 信息渠道 -->
                            <div class="row"  style=" display:none;" >
                                <h3 class="header smaller lighter blue"> <a class="btn btn-info" href="../wd_ywsb.aspx"><i class="ace-icon fa fa-reply icon-only"></i>&nbsp;返回</a>
                                <a class="btn btn-info" href="javascript:;" onclick="xxqdadd()"><i class="ace-icon"></i>&nbsp;新增</a>
                                  <a class="btn btn-info" href="Disanf_histroy.aspx?tid=<%=Session["CUR_TID"] %>"><i class="ace-icon"></i>&nbsp;历史记录</a>
                                <a class="btn btn-info xyx_show" href="javascript:;" ><i class="ace-icon"></i>&nbsp;下一项</a>
                                 </h3>
                                    
                                        <h3 class="centersa">信息渠道</h3>
                                    <!--添加-->  
                                     <!--已保存的列表-->
                                     <div class="col-xs-12 col-sm-6 widget-container-col Is_Hilist auto_list"  >
                                        <div class="widget-box widget-color-blue" id="Div2">
                                            <div class="widget-header">
                                                <h5 class="widget-title bigger lighter">
                                                    <span style="color: #FFFFFF; font-weight: bolder;"><i class="ace-icon fa fa-table"></i>保存列表</span>
                                                </h5>
                                            </div>
                                            <div class="widget-body">
                                                <div class="widget-main no-padding">
                                                    <table class="table table-striped table-bordered table-hover" id="tb1">
                                                        <thead class="thin-border-bottom">
                                                            <tr>
                                                            <th class="input-group-addon"><i class="ace-icon fa fa-flag"></i>序号</th>
                                                                <th class="input-group-addon">名称</th>  
                                                                <th class="input-group-addon">操作</th>  
                                                            </tr>
                                                        </thead>                                                       
                                                        <tbody>  
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div> 
                                    <div class="col-xs-12 col-sm-4 Is_HS auto_add" style="">
                                        <div class="widget-box">
                                            <div class="widget-header">
                                                <h4 class="widget-title">信息渠道</h4>
                                                <span class="widget-toolbar">
                                                <a href="#" data-action="settings"><i class="ace-icon fa fa-cog"></i></a>
                                                <a href="#" data-action="reload"><i class="ace-icon fa fa-refresh"></i></a>
                                                <a href="#" data-action="collapse"><i class="ace-icon fa fa-chevron-up"></i></a>
                                                <a href="#"  onclick="closes()" title="关闭"><i class="ace-icon fa fa-close"></i></a>
                                                </span>
                                            </div>
                                            <div class="widget-body">
                                                <div class="widget-main">
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">名称</span>
                                                            <input class="form-control input-mask-phone" type="text" id="xxqdname" placeholder="请输入"  runat="server" />
                                                        </div></div> &nbsp; 
                                                    <div>
                                                    <ul>
                                                        <li>
                                                            <button class="btn btn-info update_s" type="button" onclick="update_xxqd()"><i class="ace-icon fa fa-check bigger-110"></i>保存</button> 
                                                            <button class="btn btn-info add_s" type="button" onclick="add_xxqd()"><i class="ace-icon fa fa-check bigger-110"></i>保存</button> 
                                                        </li>
                                                    </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div> 
                                    
                                </div>
                            <!-- /信息渠道 -->
                            <!-- 新增施工 -->
                            <div class="row">
                                <h3 class="header smaller lighter blue"> <a class="btn btn-info" href="../wd_ywsb.aspx"><i class="ace-icon fa fa-reply icon-only"></i>&nbsp;返回</a>
                                <a class="btn btn-info" href="javascript:;" onclick="xxqdadd()"><i class="ace-icon"></i>&nbsp;新增</a>
                                  <a class="btn btn-info" href="Disanf_histroy.aspx"><i class="ace-icon"></i>&nbsp;历史记录</a>
                                 <a class="btn btn-info xyx_hide" href="javascript:;" ><i class="ace-icon"></i>&nbsp;信息渠道维护</a>
                                <a class="btn btn-info xyx_show" href="javascript:;" ><i class="ace-icon"></i>&nbsp;下一项</a>
                                 </h3>
                                 <h3 class="centersa">新增施工</h3>
                                 <div class="col-xs-12 col-sm-6 widget-container-col Is_Hilist auto_list"  >
                                        <div class="widget-box widget-color-blue"   >
                                            <div class="widget-header">
                                                <h5 class="widget-title bigger lighter">
                                                    <span style="color: #FFFFFF; font-weight: bolder;"><i class="ace-icon fa fa-table"></i>保存列表</span>
                                                </h5>
                                            </div>
                                            <div class="widget-body">
                                                <div class="widget-main no-padding">
                                                    <table class="table table-striped table-bordered table-hover" id="tb2">
                                                        <thead class="thin-border-bottom">
                                                            <tr>
                                                            <th class="input-group-addon"><i class="ace-icon fa fa-flag"></i>序号</th>
                                                                <th class="input-group-addon">信息渠道</th>  
                                                                <th class="input-group-addon">第三方姓名</th>  
                                                                <th class="input-group-addon">施工类型</th>
                                                                <th class="input-group-addon">操作</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>  
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div> 
                                 <div class="col-xs-12 col-sm-4 Is_HS auto_add"   >
                                        <div class="widget-box">
                                            <div class="widget-header">
                                                <h4 class="widget-title">新增施工</h4>
                                                <span class="widget-toolbar">
                                                <a href="#" data-action="settings"><i class="ace-icon fa fa-cog"></i></a>
                                                <a href="#" data-action="reload"><i class="ace-icon fa fa-refresh"></i></a>
                                                <a href="#" data-action="collapse"><i class="ace-icon fa fa-chevron-up"></i></a>
                                                <a href="#"  onclick="closes()" title="关闭"><i class="ace-icon fa fa-close"></i></a>
                                                </span>
                                            </div>
                                            <div class="widget-body">
                                                <div class="widget-main">
                                                        <div><div class="input-group xzsg_zq_dw">
                                                            <span class="input-group-addon">站区/单位</span>    
                                                        </div></div> &nbsp;         
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">具体情况</span> 
                                                            <textarea class="form-control input-mask-phone" rows="3" id="xzsgcontent" placeholder="请输入"></textarea>
                                                        </div></div> &nbsp; 
                                                        <div><div class="input-group xxqdxlk">
                                                            <span class="input-group-addon">信息渠道</span>                                                                                                                 
                                                        </div></div> &nbsp; 
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">处理过程</span> 
                                                            <textarea class="form-control input-mask-phone" rows="3" id="xzsgclgc" placeholder="请输入"></textarea>
                                                        </div></div> &nbsp; 
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">第三方联系人姓名</span>
                                                            <input class="form-control input-mask-phone" type="text" id="xzsgsname" placeholder="请输入"  />
                                                        </div></div> &nbsp; 
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">第三方联系人电话</span>
                                                            <input class="form-control input-mask-phone" type="text" id="xzsgsphone" placeholder="请输入" />
                                                        </div></div> &nbsp; 
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">施工类型</span> 
                                                            <select id="xzsgtype" class="form-control input-mask-phone" style="border:1px solid #D5D5D5 !important">
                                                            <option value="0">双快一保</option>
                                                            <option value="1">大型施工</option>
                                                            </select>
                                                        </div></div> &nbsp; 
                                                    <div>
                                                    <ul class="save_hide">
                                                        <li>
                                                            <button class="btn btn-info update_s" type="button" onclick="update_xzsg()"><i class="ace-icon fa fa-check bigger-110"></i>保存</button> 
                                                            <button class="btn btn-info add_s" type="button" onclick="add_xzsg()"><i class="ace-icon fa fa-check bigger-110"></i>保存</button> 
                                                        </li>
                                                    </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div> 
                                </div>
                            <!-- /新增施工 -->
                            <!-- 第三方施工 -->
                             <div class="row"  style=" display:none;">
                                <h3 class="header smaller lighter blue"> <a class="btn btn-info" href="../wd_ywsb.aspx"><i class="ace-icon fa fa-reply icon-only"></i>&nbsp;返回</a>
                                <a class="btn btn-info" href="javascript:;" onclick="xxqdadd()"><i class="ace-icon"></i>&nbsp;新增</a>
                                  <a class="btn btn-info" href="Disanf_histroy.aspx"><i class="ace-icon"></i>&nbsp;历史记录</a>
                                <a class="btn btn-info xyx_hide" href="javascript:;" ><i class="ace-icon"></i>&nbsp;上一项</a>
                                <a class="btn btn-info xyx_show" href="javascript:;" ><i class="ace-icon"></i>&nbsp;下一项</a>
                                 </h3>         
                                 <h3 class="centersa">第三方施工</h3>                       
                                <div class="col-xs-12 col-sm-6 widget-container-col Is_Hilist auto_list"  >
                                        <div class="widget-box widget-color-blue"   >
                                            <div class="widget-header">
                                                <h5 class="widget-title bigger lighter">
                                                    <span style="color: #FFFFFF; font-weight: bolder;"><i class="ace-icon fa fa-table"></i>保存列表</span>
                                                </h5>
                                            </div>
                                            <div class="widget-body">
                                                <div class="widget-main no-padding">
                                                    <table class="table table-striped table-bordered table-hover" id="tb3">
                                                        <thead class="thin-border-bottom">
                                                            <tr>
                                                            <th class="input-group-addon"><i class="ace-icon fa fa-flag"></i>序号</th>
                                                                <th class="input-group-addon">项目名称</th>  
                                                                <th class="input-group-addon hidden-480">开始时间</th>  
                                                                <th class="input-group-addon">进度</th>
                                                                <th class="input-group-addon">操作</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>  
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                <div class="col-xs-12 col-sm-4 Is_HS auto_add"  >
                                        <div class="widget-box">
                                            <div class="widget-header">
                                                <h4 class="widget-title">第三方施工</h4>
                                                <span class="widget-toolbar">
                                                <a href="#" data-action="settings"><i class="ace-icon fa fa-cog"></i></a>
                                                <a href="#" data-action="reload"><i class="ace-icon fa fa-refresh"></i></a>
                                                <a href="#" data-action="collapse"><i class="ace-icon fa fa-chevron-up"></i></a>
                                                <a href="#"  onclick="closes()" title="关闭"><i class="ace-icon fa fa-close"></i></a>
                                                </span>
                                            </div>
                                            <div class="widget-body">
                                                <div class="widget-main"> 
                                                        <div><div class="input-group dsf_zq_dw">
                                                            <span class="input-group-addon">站区/单位</span>    
                                                        </div></div> &nbsp;      
                                                        <div><div class="input-group ">
                                                            <span class="input-group-addon">行政区域桩号</span>      
                                                            <textarea rows="2" class="form-control input-mask-phone" id="dsf_xzqyzh" placeholder="请输入" ></textarea>
                                                        </div></div> &nbsp;  
                                                    <div><div class="input-group ">
                                                            <span class="input-group-addon">桩号</span>   
                                                            <input type="text" class="form-control input-mask-phone" value="" id="dsf_zh" placeholder="请输入" />                                                                                                              
                                                        </div></div> &nbsp;
                                                        <div><div class="input-group ">
                                                            <span class="input-group-addon">工程名称</span>                                                                                                                 
                                                            <textarea rows="2" class="form-control input-mask-phone" id="dsf_gcmc" placeholder="请输入" ></textarea>
                                                        </div></div> &nbsp;  
                                                        <div><div class="input-group ">
                                                            <span class="input-group-addon">第三方工程信息</span>                      
                                                            <textarea rows="3" class="form-control input-mask-phone" id="dsf_ms" placeholder="请输入" ></textarea>                                                                                           
                                                        </div></div> &nbsp;  
                                                        <div><div class="input-group ">
                                                            <span class="input-group-addon">施工单位</span>
                                                            <textarea rows="2" class="form-control input-mask-phone" id="dsf_lxfs" placeholder="名称负责人联系方式"></textarea>
                                                        </div></div> &nbsp;  
                                                        <div><div class="input-group ">
                                                            <span class="input-group-addon">管道光缆埋深（m）</span>   
                                                            <input type="text" class="form-control input-mask-phone" value="" id="dsf_gdglsm" placeholder="请输入" />                                                                                                              
                                                        </div></div> &nbsp;  
                                                        <div><div class="input-group ">
                                                            <span class="input-group-addon">开工日期</span>   
                                                            <input id="dsf_startime" class="form-control input-mask-phone"  type="text" placeholder="请输入" onClick="WdatePicker()"/>                                                                                                            
                                                        </div></div> &nbsp;  
                                                        <div><div class="input-group ">
                                                            <span class="input-group-addon">施工进度</span> 
                                                            <select id="dsf_sgjd" class="form-control input-mask-phone" style="border:1px solid #D5D5D5 !important">
                                                            <option value="0">预控阶段</option>
                                                            <option value="1">安全告知</option>
                                                            <option value="2">开挖验证</option>
                                                            <option value="3">方案审查</option>
                                                            <option value="4">签订协议</option>
                                                            <option value="5">全程监护</option>
                                                            <option value="6">联合验收</option>
                                                            </select>                                                                                                                
                                                        </div></div> &nbsp;  
                                                        <div><div class="input-group ">
                                                            <span class="input-group-addon">是否有焊缝和防腐层的检测和修复资料</span>
                                                            <div class="col-xs-3" >
                                                                <label>
                                                                    <input name="switch-field-1" id="dsf_is_hfff_jc" class="ace ace-switch ace-switch-5" type="checkbox"/>
                                                                    <span class="lbl"></span>
                                                                </label>
                                                            </div>  
                                                        </div></div> &nbsp;  
                                                        <div><div class="input-group ">
                                                            <span class="input-group-addon">简要描述</span>     
                                                            <textarea rows="3" class="form-control input-mask-phone" id="dsf_gdms" placeholder="管道保护工程措施的类型及尺寸简要描述"></textarea>                                                                                                               
                                                        </div></div> &nbsp;  
                                                        <div><div class="input-group ">
                                                            <span class="input-group-addon">大型施工是否内审</span>  
                                                            <div class="col-xs-3"  >
                                                                <label>
                                                                    <input name="switch-field-1" class="ace ace-switch ace-switch-5" id="dsf_sg_isns" type="checkbox"/>
                                                                    <span class="lbl"></span>
                                                                </label>
                                                            </div>                                                                                                                                                                           
                                                        </div></div> &nbsp;  
                                                        <div><div class="input-group ">
                                                            <span class="input-group-addon">评审会主要结论</span>      
                                                            <textarea rows="3" class="form-control input-mask-phone" id="dsf_pshjl" placeholder="请输入"></textarea>                                                                                                              
                                                        </div></div> &nbsp;  
                                                        <div><div class="input-group ">
                                                            <span class="input-group-addon">是否结合实际进行现场施工交底</span>  
                                                            <div class="col-xs-3"  >
                                                                <label>
                                                                    <input name="switch-field-1" class="ace ace-switch ace-switch-5" id="dsf_is_jd" type="checkbox"/>
                                                                    <span class="lbl"></span>
                                                                </label>
                                                            </div>                                                                                                                                                                           
                                                        </div></div> &nbsp;  
                                                        <div><div class="input-group ">
                                                            <span class="input-group-addon">本周施工内容</span>   
                                                            <textarea rows="3" class="form-control input-mask-phone" id="dsf_bzsg" placeholder="本周主要施工内容（进度、进展）（上周五至本周四）" ></textarea>                                                                                                                 
                                                        </div></div> &nbsp;  
                                                        <div><div class="input-group ">
                                                            <span class="input-group-addon">下周施工计划</span>    
                                                            <textarea rows="3" class="form-control input-mask-phone" id="dsf_xzsg" placeholder="请输入"></textarea>                                                                                                                
                                                        </div></div> &nbsp;  
                                                        <div><div class="input-group ">
                                                            <span class="input-group-addon">站场现场负责人</span>
                                                            <input type="text" class="form-control input-mask-phone" value="" id="dsf_zcfzr" placeholder="请输入" />                                                                                                                   
                                                        </div></div> &nbsp;  
                                                        <div><div class="input-group ">
                                                            <span class="input-group-addon">其他</span>   
                                                            <textarea rows="3" class="form-control input-mask-phone" id="dsf_remark"></textarea>                                                                                                              
                                                        </div></div> &nbsp;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
                                                    <div>
                                                    <ul class="save_hide">
                                                        <li>
                                                            <button class="btn btn-info update_s" type="button" onclick="update_dsfsg()"><i class="ace-icon fa fa-check bigger-110"></i>保存</button> 
                                                            <button class="btn btn-info add_s" type="button" onclick="add_dsfsg()"><i class="ace-icon fa fa-check bigger-110"></i>保存</button> 
                                                        </li>
                                                    </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>  
                            </div>
                            <!-- /第三方施工 -->                 
                            <!--各站监护点统计表-->
                            <div class="row" style=" display:none;">
                                <h3 class="header smaller lighter blue"> <a class="btn btn-info" href="../wd_ywsb.aspx"><i class="ace-icon fa fa-reply icon-only"></i>&nbsp;返回</a>
                                <a class="btn btn-info" href="javascript:;" onclick="xxqdadd()"><i class="ace-icon"></i>&nbsp;新增</a>
                                  <a class="btn btn-info" href="Disanf_histroy.aspx"><i class="ace-icon"></i>&nbsp;历史记录</a>
                                 <a class="btn btn-info xyx_hide" href="javascript:;" ><i class="ace-icon"></i>&nbsp;上一项</a>
                                <a class="btn btn-info xyx_show" href="javascript:;" ><i class="ace-icon"></i>&nbsp;下一项</a>
                                 </h3>                 
                                 <h3 class="centersa">监护点统计</h3>            
                                 <div class="col-xs-12 col-sm-6 widget-container-col Is_Hilist auto_list"   >
                                        <div class="widget-box widget-color-blue"   >
                                            <div class="widget-header">
                                                <h5 class="widget-title bigger lighter">
                                                    <span style="color: #FFFFFF; font-weight: bolder;"><i class="ace-icon fa fa-table"></i>保存列表</span>
                                                </h5>
                                            </div>
                                            <div class="widget-body">
                                                <div class="widget-main no-padding">
                                                    <table class="table table-striped table-bordered table-hover" id="tb5">
                                                        <thead class="thin-border-bottom">
                                                            <tr>
                                                            <th class="input-group-addon"><i class="ace-icon fa fa-flag"></i>序号</th>
                                                                <th class="input-group-addon">监护点</th>  
                                                                <th class="input-group-addon">监护人姓名</th>  
                                                                <th class="input-group-addon hidden-480">监护人电话</th>
                                                                <th class="input-group-addon hidden-480">监护形式</th>
                                                                <th class="input-group-addon">进度</th>
                                                                <th class="input-group-addon">操作</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>  
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                 <div class="col-xs-12 col-sm-4 Is_HS auto_add">
                                        <div class="widget-box">
                                            <div class="widget-header">
                                                <h4 class="widget-title">监护点统计表</h4>
                                                <span class="widget-toolbar">
                                                <a href="#" data-action="settings"><i class="ace-icon fa fa-cog"></i></a>
                                                <a href="#" data-action="reload"><i class="ace-icon fa fa-refresh"></i></a>
                                                <a href="#" data-action="collapse"><i class="ace-icon fa fa-chevron-up"></i></a>
                                                <a href="#"  onclick="closes()" title="关闭"><i class="ace-icon fa fa-close"></i></a>
                                                </span>
                                            </div>
                                            <div class="widget-body">
                                              <div class="widget-main">

                                                        <div><div class="input-group jhd_zq_dw">
                                                            <span class="input-group-addon">站区/单位</span>                                                         
                                                        </div></div> &nbsp;                          
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">监护点</span> 
                                                            <textarea class="form-control input-mask-phone" rows="3" id="txtjhd" placeholder="请输入"></textarea>
                                                        </div></div> &nbsp; 
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">监护人姓名</span>                
                                                             <input class="form-control input-mask-phone" type="text" id="txtjhname" placeholder="请输入"  />                                                                                                 
                                                        </div></div> &nbsp; 
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">监护人电话</span> 
                                                             <input class="form-control input-mask-phone" type="text" id="txtjhphone" placeholder="请输入"  />
                                                        </div></div> &nbsp; 
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">监护形式</span> 
                                                            <select id="txtjhtype" class="form-control input-mask-phone" style="border:1px solid #D5D5D5 !important">
                                                            <option value="白天">白天</option>
                                                            <option value="二十四小时">二十四小时</option>
                                                            </select>
                                                        </div></div> &nbsp; 
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">进度</span>
                                                             <input class="form-control input-mask-phone" type="text" id="txtjd" placeholder="请输入"  />
                                                        </div></div> &nbsp;  
                                                    <div>
                                                    <ul class="save_hide">
                                                        <li>
                                                            <button class="btn btn-info update_s" type="button" onclick="update_jhd()"><i class="ace-icon fa fa-check bigger-110"></i>保存</button> 
                                                            <button class="btn btn-info add_s" type="button" onclick="add_jhd()"><i class="ace-icon fa fa-check bigger-110"></i>保存</button> 
                                                        </li>
                                                    </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                            </div>
                            <!--/各站监护点统计表-->
                            <!--写入检查项目-->
                            <div class="row"  style="display:none;">
                                <h3 class="header smaller lighter blue"> <a class="btn btn-info" href="../wd_ywsb.aspx"><i class="ace-icon fa fa-reply icon-only"></i>&nbsp;返回</a>
                                <a class="btn btn-info" href="javascript:;" onclick="xxqdadd()"><i class="ace-icon"></i>&nbsp;新增</a>
                                  <a class="btn btn-info" href="Disanf_histroy.aspx"><i class="ace-icon"></i>&nbsp;历史记录</a>
                                 <a class="btn btn-info xyx_hide" href="javascript:;" ><i class="ace-icon"></i>&nbsp;上一项</a> 
                                 <a class="btn btn-info xyx_show" href="javascript:;" ><i class="ace-icon"></i>&nbsp;下一项</a>
                                 </h3>                 
                                 <h3 class="centersa">今日检查项目</h3>   

                                 <div class="col-xs-12 col-sm-6 widget-container-col Is_Hilist auto_list">
                                        <div class="widget-box widget-color-blue"   >
                                            <div class="widget-header">
                                                <h5 class="widget-title bigger lighter">
                                                    <span style="color: #FFFFFF; font-weight: bolder;"><i class="ace-icon fa fa-table"></i>保存列表</span>
                                                </h5>
                                            </div>
                                            <div class="widget-body">
                                                <div class="widget-main no-padding">
                                                    <table class="table table-striped table-bordered table-hover" id="tb6">
                                                        <thead class="thin-border-bottom">
                                                            <tr>
                                                            <th class="input-group-addon"><i class="ace-icon fa fa-flag"></i>序号</th>
                                                                <th class="input-group-addon">今日检查</th>
                                                                <th class="input-group-addon">问题</th>
                                                                <th class="input-group-addon">整改</th>
                                                                <th class="input-group-addon">其他</th>
                                                                <th class="input-group-addon">操作</th>
                                                            </tr>

                                                        </thead>
                                                        <tbody>  
                                                           
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                 <div class="col-xs-12 col-sm-4  Is_HS auto_add" >
                                        <div class="widget-box">
                                            <div class="widget-header">
                                                <h4 class="widget-title">写入检查项目</h4>
                                                <span class="widget-toolbar">
                                                <a href="#" data-action="settings"><i class="ace-icon fa fa-cog"></i></a>
                                                <a href="#" data-action="reload"><i class="ace-icon fa fa-refresh"></i></a>
                                                <a href="#" data-action="collapse"><i class="ace-icon fa fa-chevron-up"></i></a>
                                                <a href="#"  onclick="closes()" title="关闭"><i class="ace-icon fa fa-close"></i></a>
                                                </span>
                                            </div>
                                            <div class="widget-body ">
                                                <div class="widget-main"> 
                                                        <div><div style="text-align:center;" class="add_jrjcxm">
                                                            <span class="input-group-addon">今日检查项目</span> 
                                                            <textarea class="form-control add_jrjcxms" rows="5" id="txtjrjcxm" placeholder="请输入" style=" margin:0;"></textarea> 
                                                        </div></div> &nbsp;  
                                                        <div><div class="input-group" class="add_jrjcxm" style=" display:none;">
                                                            <span class="input-group-addon">今日检查数量</span> 
                                                            <input id="txtNums" type="text" class="form-control input-mask-phone"  value=""  placeholder="请输入" onkeyup="value=value.replace(/[^\d]/g,'')" maxlength="5"  autocomplete="off" />
                                                        </div></div> &nbsp;  
<%--                                                        <div style="text-align:center; margin:0 ; padding:0;">
                                                            <button class="btn-info" type="button" onclick="Add_jcxm_textarea()"><i class="ace-icon glyphicon glyphicon-plus" style="padding: 0 0 3px 0;"></i></button> 
                                                            &nbsp;&nbsp;&nbsp;
                                                            <button class="btn-info" type="button" onclick="Del_jcxm_textarea()"><i class="ace-icon glyphicon  glyphicon-minus" style="padding: 0 0 3px 0;"></i></button> 
                                                            </div>&nbsp;--%>
                                                        <div><div class="input-group xrjcxm_zq_dw">
                                                            <span class="input-group-addon">站区/单位</span>    
                                                        </div></div> &nbsp;  
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">发现问题</span>                
                                                             <textarea class="form-control input-mask-phone" rows="3" id="txtfxwt" placeholder="请输入"></textarea>  
                                                        </div></div> &nbsp;  
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">问题整改跟踪</span>                
                                                             <textarea class="form-control input-mask-phone" rows="3" id="txtwtzg" placeholder="请输入"></textarea>
                                                        </div></div> &nbsp;  
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">其他</span>                
                                                             <textarea class="form-control input-mask-phone" rows="3" id="txtqt_xr" placeholder="请输入"></textarea>
                                                        </div></div> &nbsp;  
                                                    <div>
                                                    <ul class="save_hide">
                                                        <li style=" text-align:center;">
                                                        <button class="btn btn-info add_s" type="button" onclick="add_jcxm()"><i class="ace-icon fa fa-check bigger-110"></i>保存</button> 
                                                        <button class="btn btn-info update_s" type="button" onclick="update_jcxm()"><i class="ace-icon fa fa-check bigger-110"></i>保存</button> 
                                                        </li>
                                                    </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            </div>
                            <!--/写入检查项目-->
                            <!--第三方施工数据统计表-->
                            <div class="row"  style="display:none;"> 
                            <h3 class="header smaller lighter blue"> <a class="btn btn-info" href="../wd_ywsb.aspx"><i class="ace-icon fa fa-reply icon-only"></i>&nbsp;返回</a>
                                <a class="btn btn-info" href="javascript:;" onclick="xxqdadd()"><i class="ace-icon"></i>&nbsp;新增</a>
                                  <a class="btn btn-info" href="Disanf_histroy.aspx"><i class="ace-icon"></i>&nbsp;历史记录</a>
                                 <a class="btn btn-info  " href="javascript:;" onclick="refresh()" ><i class="ace-icon fa fa-refresh bigger-130"></i>&nbsp;更新数据</a>
                                 <a class="btn btn-info xyx_hide" href="javascript:;" ><i class="ace-icon"></i>&nbsp;上一项</a>                                 
                                 </h3>
                                 <h3 class="centersa">第三方施工数据统计表</h3>   
                                 <div class="col-xs-12 col-sm-6 widget-container-col Is_Hilist auto_list"  >
                                        <div class="widget-box widget-color-blue"   >
                                            <div class="widget-header">
                                                <h5 class="widget-title bigger lighter">
                                                    <span style="color: #FFFFFF; font-weight: bolder;"><i class="ace-icon fa fa-table"></i>保存列表</span>
                                                </h5>
                                            </div>
                                            <div class="widget-body">
                                                <div class="widget-main no-padding">
                                                    <table class="table table-striped table-bordered table-hover" id="tb7">
                                                        <thead class="thin-border-bottom">
                                                            <tr>
                                                            <th class="input-group-addon"><i class="ace-icon fa fa-flag"></i>序号</th>
                                                                <th class="input-group-addon">单位</th>
                                                                <th class="input-group-addon  hidden-480">新增</th>
                                                                <th class="input-group-addon  hidden-480">预控</th>
                                                                <th class="input-group-addon  hidden-480">监护</th>
                                                                <th class="input-group-addon">完工</th>
                                                                <th class="input-group-addon  hidden-480">大型</th>
                                                                <th class="input-group-addon  hidden-480">施工中</th>
                                                                <th class="input-group-addon  hidden-480">本日检查</th>
                                                                <th class="input-group-addon">累计施工</th>
                                                                <%--<th class="input-group-addon">累计点次</th>--%> 
                                                                <th class="input-group-addon">操作</th> 
                                                            </tr>

                                                        </thead>
                                                        <tbody>   
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div> 

                                 <div class="col-xs-12 col-sm-4  Is_HS auto_add" >
                                        <div class="widget-box">
                                            <div class="widget-header">
                                                <h4 class="widget-title">第三方施工数据统计表</h4>
                                                <span class="widget-toolbar">
                                                <a href="#" data-action="settings"><i class="ace-icon fa fa-cog"></i></a>
                                                <a href="#" data-action="reload"><i class="ace-icon fa fa-refresh"></i></a>
                                                <a href="#" data-action="collapse"><i class="ace-icon fa fa-chevron-up"></i></a>
                                                <a href="#"  onclick="closes()" title="关闭"><i class="ace-icon fa fa-close"></i></a>
                                                </span>
                                            </div>
                                            <div class="widget-body ">
                                                <div class="widget-main">
                                                        <div><div class="input-group num_zq_dw">
                                                            <span class="input-group-addon">站区/单位</span>    
                                                        </div></div> &nbsp;                                                 
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">已完工</span>  
                                                            <input id="txtywg" type="text" class="form-control input-mask-phone"  value=""  placeholder="请输入" onkeyup="value=value.replace(/[^\d]/g,'')" maxlength="5"  autocomplete="off" />
                                                        </div></div> &nbsp; 
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">正在施工</span>                
                                                             <input id="txtzzsg" type="text" class="form-control input-mask-phone"  value=""  placeholder="请输入" onkeyup="value=value.replace(/[^\d]/g,'')" maxlength="5"  autocomplete="off" />
                                                        </div></div> &nbsp;  
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">其中大型数量</span>
                                                             <input id="txtywg_dx" type="text" class="form-control input-mask-phone"  value=""  placeholder="请输入" onkeyup="value=value.replace(/[^\d]/g,'')" maxlength="5"  autocomplete="off" />
                                                        </div></div> &nbsp;  
                                                    <div>
                                                    <ul class="save_hide">
                                                        <li style=" text-align:center;">
                                                        <button class="btn btn-info add_s" type="button" onclick="add_xxtj()"><i class="ace-icon fa fa-check bigger-110"></i>保存</button> 
                                                        <button class="btn btn-info update_s" type="button" onclick="update_xxtj()"><i class="ace-icon fa fa-check bigger-110"></i>保存</button> 
                                                        </li>
                                                    </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                 <div class="col-xs-12 col-sm-4 Is_Hs_XXTJ auto_add" style="  display:none;">
                                        <div class="widget-box">
                                            <div class="widget-header">
                                                <h4 class="widget-title">第三方施工数据统计表</h4>
                                                <span class="widget-toolbar">
                                                <a href="#" data-action="settings"><i class="ace-icon fa fa-cog"></i></a>
                                                <a href="#" data-action="reload"><i class="ace-icon fa fa-refresh"></i></a>
                                                <a href="#" data-action="collapse"><i class="ace-icon fa fa-chevron-up"></i></a>
                                                <a href="#"  onclick="closes()" title="关闭"><i class="ace-icon fa fa-close"></i></a>
                                                </span>
                                            </div>
                                            <div class="widget-body ">
                                                <div class="widget-main">
                                                        <div><div class="input-group num_zq_dw1">
                                                            <span class="input-group-addon">站区/单位</span>    
                                                        </div></div> &nbsp;             
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">新增</span>
                                                            <input id="xz_" type="text" class="form-control input-mask-phone"  value=""  placeholder="请输入" onkeyup="value=value.replace(/[^\d]/g,'')" maxlength="5"  autocomplete="off" />
                                                        </div></div> &nbsp; 
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">预控</span>  
                                                            <input id="yk_" type="text" class="form-control input-mask-phone"  value=""  placeholder="" onkeyup="value=value.replace(/[^\d]/g,'')" maxlength="5"  autocomplete="off" />
                                                        </div></div> &nbsp; 
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">监护</span>  
                                                            <input id="jh_" type="text" class="form-control input-mask-phone"  value=""  placeholder="" onkeyup="value=value.replace(/[^\d]/g,'')" maxlength="5"  autocomplete="off" />
                                                        </div></div> &nbsp;                                                                                                                                                                                                            
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">已完工</span>  
                                                            <input id="ywg_" type="text" class="form-control input-mask-phone"  value=""  placeholder="" onkeyup="value=value.replace(/[^\d]/g,'')" maxlength="5"  autocomplete="off" />
                                                        </div></div> &nbsp; 
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">其中大型数量</span>
                                                             <input id="ywg_dx_" type="text" class="form-control input-mask-phone"  value=""  placeholder="" onkeyup="value=value.replace(/[^\d]/g,'')" maxlength="5"  autocomplete="off" />
                                                        </div></div> &nbsp; 
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">正在施工</span>                
                                                             <input id="zzsg_" type="text" class="form-control input-mask-phone"  value=""  placeholder="" onkeyup="value=value.replace(/[^\d]/g,'')" maxlength="5"  autocomplete="off" />
                                                        </div></div> &nbsp;  
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">本日站内检查</span>                
                                                             <input id="jrjc_" type="text" class="form-control input-mask-phone"  value=""  placeholder="" onkeyup="value=value.replace(/[^\d]/g,'')" maxlength="5"  autocomplete="off" />
                                                        </div></div> &nbsp;  
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">累计施工</span>                
                                                             <input id="ljsg_" type="text" class="form-control input-mask-phone"  value=""  placeholder="" onkeyup="value=value.replace(/[^\d]/g,'')" maxlength="5"  autocomplete="off" />
                                                        </div></div> &nbsp;  
                                                        <div><div class="input-group">
                                                            <span class="input-group-addon">累计点次</span>                
                                                             <input id="ljdc_" type="text" class="form-control input-mask-phone"  value=""  placeholder="" onkeyup="value=value.replace(/[^\d]/g,'')" maxlength="7"  autocomplete="off" />
                                                        </div></div> &nbsp;                                                                                                                                                                                                                                   
                                                    <div> 
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            </div>
                            <!--/第三方施工数据统计表-->
                            </form> 
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
<script src="../lib/assets/layer/layer.js" type="text/javascript"></script>
<!-- inline scripts related to this page --> 
<script src="disansg.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        $('.Is_HS').hide();
        $('.xyx_show').click(function () {//上一个
            $(this).parent().parent('.row').hide();
            $(this).parent().parent('.row').next().show();
        })
        $('.xyx_hide').click(function () {//下一个
            $(this).parent().parent('.row').hide();
            $(this).parent().parent('.row').prev().show();
        })
        DefaultBind()//首次数据绑定 
    })
</script>
<script src="JSS.js" type="text/javascript"></script>
 