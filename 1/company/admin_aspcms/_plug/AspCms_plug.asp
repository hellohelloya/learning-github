<!--#include file="AspCms_plugFun.asp" -->
<%
Sub NoCache
On Error Resume next
Response.CacheControl = "no-cache"
End Sub
NoCache
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3c.org/TR/1999/REC-html401-19991224/loose.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD><TITLE></TITLE>
<meta http-equiv=Content-Type content="text/html; charset=gbk" />
<meta http-equiv= "Expires" CONTENT= "0" />
<meta http-equiv= "Cache-Control" CONTENT="no-cache" />

<LINK href="../images/style.css" type=text/css rel=stylesheet>
</HEAD>
<SCRIPT>
function SelAll(theForm){
		for ( i = 0 ; i < theForm.elements.length ; i ++ )
		{
			if ( theForm.elements[i].type == "checkbox" && theForm.elements[i].name != "SELALL" )
			{
				theForm.elements[i].checked = ! theForm.elements[i].checked ;
			}
		}
}
</SCRIPT>
<style>

/*表格样式*/
.maintable {
	line-height: 2em;
}
.maintable td{
	line-height: 2.4em;
}
#stylemain .pic{ height:200px;}
#stylemain {}
.pic img{
margin:5px;
	padding:3px;
	border: 1px dashed #66CCCC;
}

#stylemain .desc{ text-align:left; padding:2px 10px;}

</style>
<BODY>
<form  method="post" name="form">

<DIV class=listzone>

	  
      
<table width="98%" border="0" align="center" cellpadding="0" id="stylemain">  
    <TR class=list>	
    <TD width="189" height=28 align="center" class=biaoti><span class="searchzone">名称</span></TD>
    <TD width=172 align="center" class=biaoti><span class="searchzone">版本</span></TD>
    <TD width=177 align="center" class=biaoti><span class="searchzone">版权</span></TD>
    <TD width=151 align="center" class=biaoti><span class="searchzone">目录</span></TD>

     <TD width=262 align="center" class=biaoti><span class="searchzone">操作</span></TD>
    </TR>  
              
			<%
			
			Dim folderArry,folderAttr,i,tempStr,whereStr,plugArray,MenuLinks,MenuLink
			
			folderArry=getFolderList("../../plug")
			if instr(folderArry(0),",")>0 then
				for i=0 to ubound(folderArry)
					folderAttr=split(folderArry(i),",")
					Dim xmlObj : Set xmlObj=new XmlClass
					if isExistFile(folderAttr(4)&"/plug.xml") then
						xmlObj.load folderAttr(4)&"/plug.xml","xmlfile"
						'die xmlObj.getNodeValue("plugkey",0)
						whereStr="where MenuKey='"& xmlObj.getNodeValue("plugkey",0)&"'"
						plugArray=conn.Exec("select * from {prefix}Menu "&whereStr&"","arr")
						if isarray(plugArray) then
						MenuLinks=split(xmlObj.getNodeValue("pagepath",0),"|")
						if isarray(MenuLinks) then
						MenuLink=MenuLinks(0)
						end if
						
						tempStr="<input type=""button"" style=""margin:10px 0px;"" value=""正在使用"" class=""button"" disabled/> <input type=""submit"" style=""margin:10px 0px;"" value=""卸载"" class=""button"" onclick=""form.action='?action=del&plugpath="&folderAttr(0)&"&plugkey="&xmlObj.getNodeValue("plugkey",0)&"'""/>  <input type=""button"" style=""margin:10px 0px;"" value=""设置"" class=""button"" onClick=""window.location.href='"&sitePath&"/plug" & "/"& folderAttr(0)&"/"&MenuLink&"'""/>"
						else
						tempStr="<input type=""submit"" style=""margin:10px 0px;"" value=""安装此模块"" class=""button"" onclick=""form.action='?action=add&plugkey="&xmlObj.getNodeValue("plugkey",0)&"&Menuname="&xmlObj.getNodeValue("pagename",0)&"&MenuLink="&xmlObj.getNodeValue("pagepath",0)&"&plugpath="&folderAttr(0)&"'""/>"
							
						end if
						echo"<tr>"&vbcrlf& _
							"<td bgcolor=""#FFFFFF"" align=""center"">"&xmlObj.getNodeValue("ScreenShot",0)&"</td>"&vbcrlf& _
							"<td bgcolor=""#FFFFFF"" align=""center"">"&xmlObj.getNodeValue("description",0)&"</td>"&vbcrlf& _
							"<td bgcolor=""#FFFFFF"" align=""center"">"&xmlObj.getNodeValue("powerdby",0)&"</td>"&vbcrlf& _
							"<td bgcolor=""#FFFFFF"" align=""center"">"&folderAttr(0)&"</td>"&vbcrlf& _
						"<TD width=240 align=""center""  valign=""middle"" >"&tempStr&" </TD>"&vbcrlf& _
						"</tr>"&vbcrlf
					end if
				next
			end if
			%>
           
    </table>           
      
</DIV>
<DIV class=piliang><div class="left" style="float:left;"><a href="http://www.aspcms.com/forum-76-1.html" target="_blank" style="color:#CD0000">更多应用下载</a>&nbsp;&nbsp;<a href="http://www.aspcms.com/article-25-1.html" style="color:#AAAAAA" target="_blank">应用使用帮助</a></div><div class="right"  style="float:right;"><a href="http://www.wangshidai.com" style="color:#CD0000">微信平台试用</a>&nbsp;&nbsp;<a href="http://www.21sms.com" style="color:#CD0000" target="_blank">短信群发购买</a>&nbsp;&nbsp;<a href="http://www.haoyuanma.com" target="_blank" style="color:#CD0000">精品源码资源下载</a></div>
<div style="clear:both; height:0px; line-height:0px;"></div>
</DIV>
</FORM>
</BODY></HTML>



