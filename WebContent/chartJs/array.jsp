<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//�� (String),��(int)�� array�� ����
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
