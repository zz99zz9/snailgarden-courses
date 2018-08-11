<!--#include file="inc/conn.asp"-->
<!--#include file="inc/Config.Asp"-->
<!--#include file="inc/Function.asp"-->
<!--#include file="inc/Inc.Asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<% key=request("key")%>
<title><%=t%></title>
	<meta name="keywords" content="<%=k%>" />
	<meta name="description" content="<%=d%>" />
<link rel="icon" href="icon.ico" type="image/x-icon"/>
<link rel="stylesheet" href="xgwl/css/lib/bootstrap.min.css" />
<link rel="stylesheet" href="xgwl/css/lib/animate.css"/>
<link rel="stylesheet" href="xgwl/css/lib/swiper-4.3.5.min.css"/>
<link rel="stylesheet" href="xgwl/css/xgwl.css"/>
<link rel="stylesheet" href="xgwl/css/list.css"/>
<link rel="stylesheet" href="xgwl/css/base.css"/>

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="xgwl/css/lib/html5shiv.min.js"></script>
      <script src="xgwl/css/lib/respond.min.js"></script>
    <![endif]-->

</head>

<body style="overflow-x:hidden;">
<!---->
<div class="zero-navbar">

    <div class="container ">
        <div class="row">
            <div class="col-xs-10">
                <div class=" input-group">
                    <input class="form-control s-key" value="<%=key%>">
                    <span class="input-group-btn">
                        <button class="btn s-btn" type="button"><i class="pico pico-magw "></i><!--搜索--></button>
                    </span>
                </div>
                <!--<img src="xgwl/img/snailgarden.png" class="pagetit">-->
            </div>
            <div class="col-xs-2">
                <a href="tel:13585759393" target="blank" class="tel"><img src="xgwl/img/menu4.png"></a>
            </div>

        </div>
    </div>
</div>

<!--搜索结果-->
<div class="part1">
    <div class="container ">
    <div class="row">
      <div class="col-md-12 col-xs-12 ctit wow fadeInUp animated">
        搜索“<%=key%>”的相关课程
      </div>
    </div>
    </div>
</div>
<div class="part2">
    <div class="container ">
    <div class="row">
    <%

	  set rsnew=Server.CreateObject("ADODB.Recordset")
	  sqlnew="select * from [Table_Product] where title like '%"&key&"%'"
'	  	if bid<>0 then
'			sqlnew = sqlnew+" and bigclassid="&bid
'		end if
	  sqlnew=sqlnew+" order by orderid desc,articleid desc"
rsnew.Open sqlnew,conn,1,1%>
  <%
        if rsnew.bof and rsnew.eof then
        response.write("&nbsp;&nbsp;&nbsp;&nbsp;没有搜索到任何内容，请尝试换其他关键词搜索")

        else
        rsnew.PageSize=1000 '设置页码
        pagecount=rsnew.PageCount '获取总页码
        page=int(request("page")) '接收页码
        if page<=0 then page=1 '判断
        if request("page")="" then page=1
        rsnew.AbsolutePage=page '设置本页页码
        i=0
        do while not rsnew.eof and i<rsnew.PageSize
        %>
       <a class="col-md-6 col-xs-6 cli wow fadeInUp animated" href="<%=rsnew("picalt")%>">
        <img src="<%=rsnew("DefaultPicUrl")%>" >
        <p class="ellipsis"><%=rsnew("enTitle")%></p>
       </a>
 <%rsnew.movenext
        	i=i+1
            loop
        	end if
     %>
    </div>
</div>
</div>
<!--底部菜单-->
<div class="footer">
    <a href="index.asp"><img src="/xgwl/img/menu1.png"><br>首页</a>
    <a href="https://xueban.vlearn.cn/mp/weike?f_t_id=0698885212201eb697e647beaa47648d7698a1f9#/"><img src="/xgwl/img/menu2.png"><br>分类</a>
    <a href="https://xueban.vlearn.cn/mp/weike?f_t_id=0698885212201eb697e647beaa47648d7698a1f9#/myself"><img src="/xgwl/img/menu3.png"><br>个人中心</a>
</div>
<script src="xgwl/js/lib/jquery.js"></script>
<script src="xgwl/js/lib/bootstrap.min.js"></script>
<script src="xgwl/js/lib/wow.min.js"></script>
<script src="xgwl/js/lib/swiper-4.3.5.min.js"></script>
<script>
if (!(/msie [6|7|8|9]/i.test(navigator.userAgent))){
	new WOW().init();
};
</script>

<script src="xgwl/js/base.js"></script>
</body>
</html>
