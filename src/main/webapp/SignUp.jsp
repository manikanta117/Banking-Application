<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
font-family:'Poppins', sans-serif;
display: flex;
justify-content: center;
align-items: center;
height: 60vh;
margin :0;
}

.container{
display: flex;
width: 70%;
 justify-content: center;
    align-items: center;
}

.box{
display:flex;
border: 1px soild black;
padding:30px;
margin:10px;
text-align=center;
}

</style>
</head>
<body>
<div  class=box>
<form action="SignRegistration.jsp" method="post">
<h1>Sign-In</h1>
<h1>HERE</h1>
<table>
<tr>
<td>Name:</td>
<td><input type="text" name ="UserName"></td>
</tr>
<tr>
<td>Password:</td>
<td><input type="text" name ="Password"></td>
</tr>
<tr>
<td><input type="submit" value = "submit"></td>
</tr>
</table>
</form>
</div>

</body>
</html>