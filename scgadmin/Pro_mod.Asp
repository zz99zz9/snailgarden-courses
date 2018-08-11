<!--#include file="inc/xgheader.asp"-->
      <!--sidebar start-->
<!--#include file="inc/xgmenu.asp"-->
      <!--sidebar end-->
      <!--main content start-->
      <section id="main-content">
          <section class="wrapper">
              <!-- page start -->
<%
dim rs
dim sql
dim count

set rs=server.createobject("adodb.recordset")
sql = "select * from [Table_ProSmallclass] order by orderid desc,SmallClassID desc"
rs.open sql,conn,1,1
%>
<script language = "JavaScript">
var onecount;
subcat = new Array();
        <%
        count = 0
        do while not rs.eof 
        %>
subcat[<%=count%>] = new Array("<%= trim(rs("SmallClassName"))%>","<%= trim(rs("BigClassName"))%>","<%= trim(rs("SmallClassName"))%>;<%= trim(rs("SmallClassId"))%>");
        <%
        count = count + 1
        rs.movenext
        loop
        rs.close
        %>
onecount=<%=count%>;

function changelocation(locationid)
    {
    document.myform.SmallClassName.length = 1; 
    var locationid=locationid.split(";")[0];
    var i;
    for (i=0;i < onecount; i++)
        {
            if (subcat[i][1] == locationid)
            { 
                document.myform.SmallClassName.options[document.myform.SmallClassName.length] = new Option(subcat[i][0], subcat[i][2]);
            }        
        }
    }  
	
	</script>
<%Dim ArticleID,zt
ArticleID=Trim(Request.QueryString("ArticleID"))
set oRs=Server.CreateObject("ADODB.Recordset")

if ArticleID="" then

oRs.Open "select * from [Table_Product] order by cg desc",conn,1,3
zt="display:block;"
else
oRs.Open "select * from [Table_Product] where ArticleID="&ArticleID,conn,1,3
zt="display:none;"
end if

 %>
<!--成功失败提示-->
<div class="alert" id="alert alert-success" style="<%=zt%>">
                                  <button class="close close-sm" type="button">
                                      <i class="icon-remove"></i>
                                  </button>
                                  <strong>操作成功！</strong> <span>已保存为草稿。</span>
                              </div>
 
                          <!----> 
 
                          <!----> 
              <div class="row ">
                  <div class="col-lg-12">
                      <section class="panel pb50">
                          <header class="panel-heading mb50">
                              项目修改
                          </header>
                          <%



if oRs.Eof then
'无数据
End if
if ors("clxid")="" then
clxid=0
else
clxid=ors("clxid")
end if
if ors("clbid")="" then
clbid=0
else
clbid=ors("clbid")
end if
if ors("ckfsid")="" then
ckfsid=0
else
ckfsid=ors("ckfsid")
end if
%>
                      <form name="myform" id="myform">    
                            <div class="form-group row">
    <label for="SiteName" class="col-sm-2 control-label text-right xglab">课程分类</label>
    <div class="col-sm-10 row">
    <div class="col-sm-3">
      <%
sql = "select * from [Table_ProBigClass] order by orderid desc,bigclassid desc"
rs.open sql,conn,1,1
if rs.eof and rs.bof then
	response.write "请先添加栏目。"
else
%>
<select name="BigClassName" id="BigClass" class="form-control" onChange="changelocation(document.myform.BigClassName.options[document.myform.BigClassName.selectedIndex].value)" size="1">

<%
dim selclass
	selclass=ors("BigClassName")

	do while not rs.eof
%>
            <option value="<%=trim(rs("BigClassName"))%>;<%=trim(rs("BigClassId"))%>" <%if trim(ors("BigClassId"))=trim(rs("BigClassId")) then%>selected<%end if%>><%=trim(rs("BigClassName"))%></option>
            <%
			rs.movenext
		loop
end if
	rs.close
%>
        </select></div><div class="col-sm-3">
          <select name="SmallClassName" id="SmallClass" class="form-control">
            <option value="" >不指定小类</option>
            <%
sql="select * from [Table_ProSmallclass] where BigClassName='" & selclass & "' order by orderid desc"
rs.open sql,conn,1,1
if not(rs.eof and rs.bof) then


do while not rs.eof

%>
            <option value="<%=rs("SmallClassName")%>;<%=rs("SmallClassId")%>" <%if ors("SmallClassId")=rs("SmallClassId") then%>selected<%end if%> ><%=rs("SmallClassName")%></option>
            <%
rs.movenext
loop
end if
rs.close

%>
      </select>
      </div>
    </div>
  </div>


    <div class="form-group row">
    <label for="Title" class="col-sm-2 control-label text-right xglab">课程名称</label>
    <div class="col-sm-10 row">
<!--    <div class="col-sm-4 input-group">
        <span class="input-group-addon">中文名</span>
          <input type="text" name="Title" class="form-control" id="Title" value="<%=ors("Title")%>" >
        </div>-->
    <div class="col-sm-4 input-group">
    <!--<span class="input-group-addon">英文名</span>-->
      <input type="text" name="enTitle" class="form-control" id="enTitle" value="<%=ors("EnTitle")%>" >
    </div>
    </div>
  </div>
<!-- -->   <div class="form-group row">
    <label for="Product_Id" class="col-sm-2 control-label text-right xglab">课程概述</label>
    <div class="col-sm-7">
      <textarea name="Product_Id" class="form-control" id="Product_Id"><%=ors("Product_Id")%></textarea>
    </div>
  </div>
      <div class="form-group row">
    <label for="DefaultPicUrl" class="col-sm-2 control-label text-right xglab">列表图片</label>
    <div class="col-sm-7 row">
      <div class="col-sm-7"><input name="DefaultPicUrl" type="text" id="DefaultPicUrl" class="form-control col-sm-6" value="<%=ors("DefaultPicUrl")%>"></div>
        <div class="col-sm-3"><input type="button" name="Submit12" value="上传图片" class="form-control col-sm-2" onClick="window.open('Yr_UpFile.Asp?formname=myform&editname=DefaultPicUrl&uppath=images/guanggao&filelx=jpg','','status=no,scrollbaRs=no,top=20,left=110,width=420,height=165')"></div>
    </div>
  </div>
        
        <div class="form-group row">
    <label for="picalt" class="col-sm-2 control-label text-right xglab">课程链接</label>
    <div class="col-sm-7">
      <input name="picalt" type="text" id="picalt" class="form-control col-sm-6" value="<%=ors("picalt")%>">
    </div>
  </div>
 
    <div class="form-group row">
  <label for="ctd" class="col-sm-2 control-label text-right xglab">首页分类</label>
   <div class="col-sm-7">
   <%

sql="select * from [class_td] order by oid desc"
rs.open sql,conn,1,1
if not(rs.eof and rs.bof) then

do while not rs.eof
%>
   		<input type="checkbox" style="vertical-align:text-bottom;" id="ctd" name="ctd" class="ctd" value="<%=rs("Cid")%>" <%if instr(ors("ctdid"),","&rs("Cid")&",") then%>checked<%end if%>> <span style="margin-right:10px" class=" xglab"><%=rs("CName")%></span> <%
rs.movenext
loop
end if
rs.close

%>
   </div>
   </div>

      <div class="form-group row">
    <label for="uptime" class="col-sm-2 control-label text-right xglab">更新时间</label>
    <div class="col-sm-10 row">
    <div class="col-sm-4 input-group">
      <input type="text" name="uptime" class="form-control" id="uptime" value="<%=ors("Updatetime")%>" >
    </div>
    </div>
  </div>
    <div class="form-group row">
    <label for="Orderid" class="col-sm-2 control-label text-right xglab">排序ID</label>
    <div class="col-sm-6 row">
    <div class="col-sm-2">
      <input type="text" name="Orderid" class="form-control" id="Orderid" value="<%=ors("Orderid")%>" placeholder="数字越大排序越靠前" >
      </div>
    </div>
  </div>
    <div class="form-group row">
    <label for="Passed" class="col-sm-2 control-label text-right xglab">是否审核</label>
    <div class="col-sm-6">
      <input name="Passed" type="checkbox" id="Passed" value="yes" checked>
    </div>
  </div>
    <div class="form-group row">
    <label for="Elite" class="col-sm-2 control-label text-right xglab">推荐显示</label>
    <div class="col-sm-6">
     	<input name="Elite" type="checkbox" id="Elite" value="yes" <%if ors("Elite")="True" then%>checked<%end if%>>
    </div>
  </div>
<div class="row">
<div class="col-lg-offset-2 col-lg-6">
<button class="btn btn-danger save" type="button" style="margin:15px auto;">发布信息</button>&nbsp;<button class="btn btn-info save2" type="button" style="margin:15px auto;">保存草稿</button>
<input id="action" value="mod" type="hidden">
<input id="pro_id" value="<%=ors("ArticleId")%>" type="hidden">
</div>
  </div>
</form>
<!--列表结束-->
                      </section>
                  </div>
              </div>

              <!--  page end  -->
          </section>
      </section>
      <!--main content end-->
  </section>
<%
ors.close
set ors=nothing
%>
<!--#include file="inc/xgfooter.asp"-->
<!--#include file="inc/windows.asp"-->
  <script type="text/javascript">
//导航菜单
$(".nav3").addClass('active');
$(".nav3-2").addClass('active');

</script>
<script type="text/javascript" src="ajax/pro.js"></script>
