 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %> 
<%@page import="java.io.*" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>For result see the eclipse console</h1>
	<%
	String input1=request.getParameter("input_1");
	String input2=request.getParameter("input_2");
	
	// for data split
	String[] array1 = input1.split("\n");
	String[] array2 = input2.split("\n");
			
	// for the size of individual array of type string
	//System.out.println("The array1 size is "+array1.length);
	//System.out.println("The array2 size is "+array2.length);
			
	boolean elseflag = true; //for single line input edge case
			
	if(array1.length == 1 || array2.length == 1)
	{
		//if its empty it wont go else , like it affects the execution as empty array=> empty line also length 1
		int len1 = array1[0].length(),len2 = array2[0].length();
		if(len1 == 1 && len2 == 1)
		{
		    elseflag = false;
			System.out.println("0% matched");
		}
	}
	if(elseflag == true){
		int array1_size = array1.length;
		int array2_size = array2.length;
		for(int i=0;i<array1.length;i++)
		{
			if(array1[i].length() == 1)
				array1_size--;
		}
		for(int i=0;i<array2.length;i++)
		{
			if(array2[i].length() == 1)
				array2_size--;
		}
		
		if(array1_size == 0 || array2_size == 0)
		{
			System.out.println("0% matched");
			return;
		}
	
		//System.out.println("The array1_size is " + array1_size);
		//System.out.println("The array2_size is " + array2_size);
	
	
		int totalSize = array1_size + array2_size;
		
		
		//System.out.println("The total size of the arrays are " + totalSize);
		
		
	/*  for(int i=0;i<array1.length;i++)
		{
			System.out.println("size of "+i+" is "+array1[i].length());
		}
	*/
		float count = 0.0f,temp = 0.0f;
		for(int i=0;i<array1.length;i++)
		{
			int enterj=0;
			//for empty line size is 1 and for line we make strings as "" is 0 we can skip 
			if(array1[i].length() != 0 && array1[i].length() != 1)
			{
				//System.out.println(array1[i]);
				enterj = 1;
				int flag = 0;
				for(int j=0;j<array2.length;j++)
				{
					if(array2[j].length() != 0 && array2[j].length() != 1)
					{
						if(array1[i].equals(array2[j]))
						{
							flag = 1;
							count += 10;
							array2[j] = "";
							//System.out.println("Full Match " + j);
							break;
						}
						else{
							//System.out.println("inside else");
							float value = 0.0f;
							String str1 = array1[i],str2 = array2[j];
							int index_i=0,index_j=0,checkflag = 0;
							int maxlength = Math.max(str1.length(),str2.length());
							while(index_i < str1.length() && index_j < str2.length())
							{
								if(str1.charAt(index_i) != str2.charAt(index_j))
								{
									value = ((float)index_i/maxlength)/10;
									//System.out.println("The index_i "+index_i);
									//System.out.println("Maxlength "+maxlength);
									//System.out.println("The value "+value);
									checkflag = 1;
									break;
								}
								index_i++;
								index_j++;
							}
							if(checkflag == 0)
							{
								value = ((float)index_i/maxlength)*10;
								//System.out.println("The value "+value);
							}
							
							temp = Math.max(temp,value);
							//System.out.println("temp value "+temp);
						}
					}
				}
				if(flag == 0 && enterj == 1)
				{
					temp*=100;
					count+=temp;
					//System.out.println("Temp value"+temp);
					temp = 0.0f;
				}
			}
		} //end outer forloop
		
		
		count*=2.0f;
		float result = (count/totalSize*10);
		System.out.println(result + " % matching");
		
		
	}	
	%>
	
	
</body>
</html>