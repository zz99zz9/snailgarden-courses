<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conn.asp"-->

<%
'类修改
key=request("key")
set oRs=Server.CreateObject("ADODB.Recordset")
oRs.Open "select * from [skey] ",conn,1,3

oRs.Addnew
oRs("key")=Trim(key)

ors("uptime")=now()

oRs.Update

oRs.close
set oRs=Nothing
 ' conn.execute("INSERT INTO [skey] (key) VALUES ('fjfk')")
%>
