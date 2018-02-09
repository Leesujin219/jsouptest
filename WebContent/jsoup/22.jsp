<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="java.io.IOException"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<%  String url ="http://biz.heraldcorp.com/";
	String line="";
	try{
		Document doc;
		//html코드의 전체(document영역)를 긁어옴
		doc=Jsoup.connect(url).get();
		Elements media1=doc.select("div[class=con_left]>div[class=main]");
		Elements media2=doc.select("script");
		Elements media3=doc.select("link");
		for(Element src: media1){
			String templine=src.toString();
			line+=templine;
		}
		for(Element src: media2){
			String templine=src.toString();
			line+=templine;
		}
		for(Element src: media3){
			String templine=src.toString();
			line+=templine;
		}
		
	}catch(IOException e){
		e.printStackTrace();
	}



%>
<body><%=line %></body>

</html>