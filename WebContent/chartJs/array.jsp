<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//라벨 (String),값(int)의 array를 만듦
	String[] labels={"January","February","March","April","May","June","July","August","September"
				,"October","November","December"};
	int[] value1=new int[labels.length];
	int[] value2=new int[labels.length];
	int[] value3=new int[labels.length];
	
	for(int i=0;i<labels.length;i++){
		int temp=(int)(Math.random()*100);
		value1[i]=temp;
		temp=(int)(Math.random()*100);
		value2[i]=temp;
		temp=(int)(Math.random()*100);
		value3[i]=65;
	}

%>
